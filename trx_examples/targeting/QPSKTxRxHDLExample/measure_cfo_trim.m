function measure_cfo_trim()
% CFO-trim test (no rebuild): on the deployed baseline bitstream, sweep the Rx LO
% in small steps around 2.4 GHz and measure cable BER/lock at each offset.
% Hypothesis: if a particular manual CFO trim makes the cold-boot cable lock
% CONSISTENT (low BER, many packets), the random-48% failure is carrier-ACQUISITION
% of the residual Tx-vs-Rx LO offset -- and a static trim is a deployable workaround.
% NO rstCS pulse (it breaks cable re-acquisition). Tx atten=0, Rx gain=30 spi.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146';
    BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
    for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
    BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % cable, early
    tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
    tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
    try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9;
    try, rx.GainControlMode='spi'; catch, end
    try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
    try,setup(rx);catch ME,warning(ME.message);end; pause(5);
    function [dp,de,ber]=meas(dwell)
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8);
        pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
    end
    offs = [0 1 2 5 10 20 -1 -2 -5 -10 -20]*1e3;   % Hz around 2.4 GHz
    fprintf('\n=== CFO-trim sweep (baseline bitstream, cable, atten=0, Rx gain=30) ===\n');
    fprintf('  %8s  %8s  %8s  %10s\n','off(kHz)','pkts/6s','errors','BER%per120');
    best=struct('off',NaN,'ber',100,'pkts',0);
    for off = offs
        rx.CenterFrequencyChannel0 = 2.4e9 + off;
        pause(5);                       % let the (sluggish 2^15) coarse comp re-settle
        [dp,de,ber]=meas(6);
        fprintf('  %8.1f  %8d  %8d  %10.4f\n', off/1e3, dp, de, ber);
        if dp>200 && ber<best.ber, best.off=off; best.ber=ber; best.pkts=dp; end
    end
    fprintf('  >>> best: off=%.1f kHz  pkts=%d  BER=%.4f%%\n', best.off/1e3, best.pkts, best.ber);
    release(tx); try,release(rx);catch,end
end
