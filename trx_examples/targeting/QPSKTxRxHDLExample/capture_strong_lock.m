function capture_strong_lock()
% On the currently-deployed rf_obs (dma_postagc) bitstream, get a STRONG cable
% lock via the reliable pre-set +2 kHz CFO method, then capture the debug-mux
% taps (0=post-AGC, 1=post-SymSync, 3=post-PhaseAmbig) over the Rx DMA. Saves IQ
% to capture_strong_lock.mat and prints per-tap stats so we can see whether tap3
% is clean-and-aligned (=> downstream bit/IQ-swap), rotated ~45 deg (=> phase-
% ambiguity miss), or spinning (=> residual CFO).
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3; N=2^16; tx=[];
    locked=false;
    for att=1:5
        BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
        for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
        BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);
        tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
        tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
        try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
        p0=BistRegisters.read('0x9D000104',8); pause(6); p1=BistRegisters.read('0x9D000104',8);
        dp=p1-p0; fprintf('  boot attempt %d: pkts/6s=%d\n', att, dp);
        if dp>800, locked=true; break; end
        release(tx); tx=[];
    end
    if ~locked, fprintf('No strong lock in 5 attempts; aborting capture.\n'); return; end
    rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+trim;
    try, rx.GainControlMode='spi'; catch, end
    try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
    rx.SamplesPerFrame=N; try,setup(rx);catch,end; pause(2);
    taps=[0 1 2 3]; nm={'post-AGC','post-SymSync','post-CarrierSync','post-PhaseAmbig'}; out=struct();
    for ti=1:numel(taps)
        BistRegisters.sshExec(sprintf('busybox devmem 0x9D00010C 32 %d',taps(ti)),8); pause(1.5);
        d=[]; for w=1:2, d=rx(); end                    % flush + grab
        s=double(d); s=s(abs(s)>0);                     % drop zero-fills
        if isempty(s), fprintf('  tap%d (%s): empty\n',taps(ti),nm{ti}); continue; end
        sn=s/mean(abs(s));
        ideal=(sign(real(sn))+1j*sign(imag(sn)))/sqrt(2);
        evm=sqrt(mean(abs(sn/sqrt(2)-ideal).^2));
        rot=angle(mean(sn.^4))/4;
        sp4=std(angle(sn.^4));
        fprintf('  tap%d (%-14s): Nsamp=%6d  mean|s|=%.1f  EVM=%.4f  rot=%+.3f rad (%+.1f deg)  s^4spread=%.3f\n', ...
            taps(ti), nm{ti}, numel(s), mean(abs(s)), evm, rot, rot*180/pi, sp4);
        out.(sprintf('tap%d',taps(ti)))=s;
    end
    save('capture_strong_lock.mat','-struct','out');
    fprintf('saved capture_strong_lock.mat\n');
    % BER in the SAME lock, to correlate constellation <-> BER
    p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8); pause(6);
    p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
    dp=p1-p0; de=e1-e0;
    fprintf('  SAME-LOCK BER: pkts/6s=%d  BER(per120)=%.4f%%\n', dp, 100*de/max(1,dp*120));
    try,release(rx);catch,end; try,release(tx);catch,end
end
