function measure_cfo_fine()
% FINE CFO-trim around the strong-lock window (+2 kHz) found by measure_cfo_trim.
% Distinguishes the residual ~50% BER mechanism at strong lock:
%   - if BER DIPS at a sweet spot -> residual-CFO SPIN -> a faster (shorter-window)
%     Coarse Freq Estimator (cfc_a* builds) should null it.
%   - if BER stays flat ~50% across all fine trims -> STATIC rotation (phase ambiguity).
% NO rstCS. Tx atten=0, Rx gain=30 spi. Longer dwell for BER resolution.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146';
    BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
    for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
    BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);
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
    offs = [1.0 1.4 1.7 1.9 2.0 2.1 2.3 2.6 3.0]*1e3;
    fprintf('\n=== FINE CFO-trim around +2 kHz (cable, atten=0, Rx gain=30) ===\n');
    fprintf('  %9s  %9s  %9s  %11s\n','off(kHz)','pkts/8s','errors','BER%per120');
    best=struct('off',NaN,'ber',100,'pkts',0);
    for off = offs
        rx.CenterFrequencyChannel0 = 2.4e9 + off;
        pause(6);
        [dp,de,ber]=meas(8);
        fprintf('  %9.2f  %9d  %9d  %11.4f\n', off/1e3, dp, de, ber);
        if dp>500 && ber<best.ber, best.off=off; best.ber=ber; best.pkts=dp; end
    end
    fprintf('  >>> best(strong-lock): off=%.2f kHz  pkts=%d  BER=%.4f%%\n', best.off/1e3, best.pkts, best.ber);
    release(tx); try,release(rx);catch,end
end
