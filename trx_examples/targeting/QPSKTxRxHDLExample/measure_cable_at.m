function res = measure_cable_at(label)
% Measure the deployed variant's cable lock-rate + BER. Tx atten=0, Rx manual
% gain swept; rx_sel=1 held from a fresh boot (toggling halts the Receiver).
    here = fileparts(mfilename('fullpath')); addpath(here);
    addpath(fileparts(fileparts(fileparts(here))));
    uri = 'ip:10.0.0.146';
    BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &', 8); pause(10);
    for k=1:40, [rc,~]=BistRegisters.sshExec('true',5); if rc==0, break; end; pause(3); end
    pause(3);
    BistRegisters.sshExec('busybox devmem 0x9D000114 32 1', 8);
    tx = adi.ADRV9002.Tx('uri', uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
    tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
    try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx = adi.ADRV9002.Rx('uri', uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9;
    try, rx.GainControlMode='spi'; catch, end
    try, setup(rx); catch ME, warning(ME.message); end
    pause(4);
    function [dp,ber] = m(dwell)
        BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0', 8); pause(2);
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8); pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; ber=100*(e1-e0)/max(1,dp*120);
    end
    res = struct('label',label,'best_ber',100,'best_gain',NaN,'best_pkts',0);
    fprintf('\n=== %s (cable, atten=0) ===\n', label);
    for g = [26 28 30 32 34]
        try, rx.GainControlModeChannel0='spi'; catch, end
        try, rx.GainChannel0 = g; catch, try, rx.Gain=g; catch, end; end
        pause(2.5); [dp,ber] = m(10);
        fprintf('  gain=%2d: pkts/10s=%6d  BER=%.4f%%\n', g, dp, ber);
        if dp > 200 && ber < res.best_ber, res.best_ber=ber; res.best_gain=g; res.best_pkts=dp; end
    end
    fprintf('  >>> %s best: gain=%g pkts=%d BER=%.4f%%\n', label, res.best_gain, res.best_pkts, res.best_ber);
    release(tx); try, release(rx); catch, end
end
