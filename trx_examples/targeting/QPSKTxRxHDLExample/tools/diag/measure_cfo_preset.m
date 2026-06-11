function measure_cfo_preset()
% Test whether PRE-SETTING the Rx LO trim to +2 kHz (to cancel the board's intrinsic
% ~-2 kHz Tx/Rx LO offset) BEFORE the cold-boot acquisition makes the cable lock
% CONSISTENT across reboots. measure_cfo_trim showed acquisition pull-in is narrow
% (~+-2 kHz) and the receiver locks only at COLD BOOT; if the boot-time net CFO sits
% at the edge of that window, lock is random. Centering it should fix acquisition.
% 3 reboots, each acquires with Rx LO = 2.402 GHz from the start. NO rstCS.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3;
    function [dp,de,ber]=meas(dwell)
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8);
        pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
    end
    fprintf('\n=== PRE-SET CFO trim +%.1f kHz, 3 reboots (cable, atten=0, gain=30) ===\n', trim/1e3);
    for rb=1:3
        BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
        for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
        BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);
        tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
        tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
        try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
        rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1;
        rx.CenterFrequencyChannel0=2.4e9+trim;            % <-- trim PRE-SET before first acquisition
        try, rx.GainControlMode='spi'; catch, end
        try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
        try,setup(rx);catch ME,warning(ME.message);end; pause(6);
        [dp,de,ber]=meas(10);
        fprintf('  reboot %d: pkts/10s=%7d errors=%8d  BER(per120)=%8.4f%%  BER(per2240)=%8.5f%%\n', ...
            rb, dp, de, ber, 100*de/max(1,dp*2240));
        release(tx); try,release(rx);catch,end
    end
end
