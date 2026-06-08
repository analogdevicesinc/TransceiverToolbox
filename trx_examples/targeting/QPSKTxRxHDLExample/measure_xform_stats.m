function measure_xform_stats()
% Statistical per-transform BER distribution (xformsweep bitstream). For each
% transform set BEFORE acquisition (fresh boot), record (pkts,BER) for EVERY boot
% that locks at all (>30 pkts), across many reboots. Settles whether swap(4)
% genuinely beats identity(0) or whether low BER is just a lucky-rotation outlier
% (phase-ambiguity random landing). swapiq's 3.71% was a WEAK lock, so record weak
% locks too. NO rstCS. Tx atten=0, Rx gain=30, +2 kHz CFO.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3; lab=containers.Map({0,4},{'id(I,Q)','swap(Q,I)'});
    function [dp,de,ber]=meas(dwell)
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8); pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
    end
    REBOOTS=14;   % per transform
    for xf=[0 4]
        bers=[]; pk=[];
        fprintf('\n=== xform=%d %s : %d fresh boots ===\n', xf, lab(xf), REBOOTS);
        for rb=1:REBOOTS
            BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
            for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
            BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);
            BistRegisters.sshExec(sprintf('busybox devmem 0x9D000118 32 %d',xf),8);
            tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
            tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
            try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
            rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+trim;
            try, rx.GainControlMode='spi'; catch, end
            try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
            try,setup(rx);catch,end; pause(6);
            [dp,de,ber]=meas(12);
            if dp>30
                fprintf('  boot %2d: pkts=%7d  BER=%8.4f%%\n', rb, dp, ber);
                bers(end+1)=ber; pk(end+1)=dp; %#ok
            else
                fprintf('  boot %2d: pkts=%7d  (no lock)\n', rb, dp);
            end
            release(tx); try,release(rx);catch,end
        end
        if isempty(bers)
            fprintf('  xform=%d %s: ZERO locks in %d boots\n', xf, lab(xf), REBOOTS);
        else
            fprintf('  >>> xform=%d %s: %d/%d locked | BER min=%.3f%% median=%.3f%% max=%.3f%% | best-pkts=%d\n', ...
                xf, lab(xf), numel(bers), REBOOTS, min(bers), median(bers), max(bers), max(pk));
        end
    end
end
