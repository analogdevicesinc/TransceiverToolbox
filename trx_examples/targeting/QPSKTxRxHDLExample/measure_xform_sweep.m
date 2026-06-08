function measure_xform_sweep()
% On the deployed xformsweep bitstream: boot at rx_xform=0 (identity = baseline,
% which locks strongly at ~50%), get a strong cable lock via pre-set +2 kHz CFO,
% then sweep rx_xform 0..7 (AXI x"118") and measure BER at each. The transform
% that INVERTS the channel's static D4 transform drops BER toward 0.
% Map: 0 id(I,Q) 1 conj(I,-Q) 2 negI(-I,Q) 3 180(-I,-Q) 4 swap(Q,I) 5 270(Q,-I)
%      6 90(-Q,I) 7 (-Q,-I). NO rstCS. Tx atten=0, Rx gain=30 spi.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3; lab={'id(I,Q)','conj(I,-Q)','negI(-I,Q)','180(-I,-Q)','swap(Q,I)','270(Q,-I)','90(-Q,I)','(-Q,-I)'};
    tx=[]; locked=false;
    for att=1:6
        BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
        for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
        BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);          % cable
        BistRegisters.sshExec('busybox devmem 0x9D000118 32 0',8);          % xform=identity at boot
        tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
        tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
        try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
        rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+trim;
        try, rx.GainControlMode='spi'; catch, end
        try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
        try,setup(rx);catch,end; pause(6);
        p0=BistRegisters.read('0x9D000104',8); pause(5); p1=BistRegisters.read('0x9D000104',8);
        fprintf('  boot attempt %d: pkts/5s=%d\n', att, p1-p0);
        if (p1-p0)>600, locked=true; break; end
        release(tx); try,release(rx);catch,end; tx=[];
    end
    if ~locked, fprintf('No strong lock in 6 attempts; aborting sweep.\n'); return; end
    function [dp,de,ber]=meas(dwell)
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8); pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
    end
    fprintf('\n=== rx_xform sweep at strong lock (cable, +2kHz, atten=0, gain=30) ===\n');
    fprintf('  %3s  %-12s  %9s  %11s\n','xf','transform','pkts/6s','BER%per120');
    best=struct('xf',NaN,'ber',100,'pkts',0);
    for xf=0:7
        BistRegisters.sshExec(sprintf('busybox devmem 0x9D000118 32 %d',xf),8); pause(4);
        [dp,de,ber]=meas(6);
        fprintf('  %3d  %-12s  %9d  %11.4f\n', xf, lab{xf+1}, dp, ber);
        if dp>300 && ber<best.ber, best.xf=xf; best.ber=ber; best.pkts=dp; end
    end
    fprintf('  >>> best: xform=%d (%s)  pkts=%d  BER=%.4f%%\n', best.xf, lab{(best.xf>=0)*best.xf+1}, best.pkts, best.ber);
    release(tx); try,release(rx);catch,end
end
