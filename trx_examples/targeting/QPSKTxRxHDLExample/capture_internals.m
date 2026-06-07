function capture_internals()
% With rf_obs (dma_postagc) deployed, capture the Receiver's internal IQ taps
% over the cable via the Rx DMA and report what each stage sees. iq_debug_mux
% (AXI 0x9D00010C): 0=post-AGC, 1=post-SymSync, 2=post-CarrierSync, 3=constellation.
    here = fileparts(mfilename('fullpath')); addpath(here);
    addpath(fileparts(fileparts(fileparts(here))));
    uri = 'ip:10.0.0.146';

    BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &', 8); pause(10);
    for k=1:40, [rc,~]=BistRegisters.sshExec('true',5); if rc==0, break; end; pause(3); end
    pause(3);
    BistRegisters.sshExec('busybox devmem 0x9D000114 32 1', 8);   % cable

    tx = adi.ADRV9002.Tx('uri', uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
    tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
    try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx = adi.ADRV9002.Rx('uri', uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9;
    try, rx.GainControlMode='spi'; catch, end
    try, rx.GainChannel0=30; catch, try, rx.Gain=30; catch, end; end
    rx.SamplesPerFrame = 8192;
    try, setup(rx); catch ME, warning(ME.message); end
    pause(4);

    names = {'post-AGC','post-SymSync','post-CarrierSync','constellation'};
    for tap = 0:3
        BistRegisters.sshExec(sprintf('busybox devmem 0x9D00010C 32 %d', tap), 8);
        BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0', 8);
        pause(1);
        y = [];
        for r=1:3, try, y = rx(); catch, end; end
        if isempty(y), fprintf('  tap %d (%s): capture failed\n', tap, names{tap+1}); continue; end
        z = double(y)/2^14; z = z(abs(z)>0);
        if numel(z) < 100, fprintf('  tap %d (%s): rms=%.4f (mostly zero/no signal)\n', tap, names{tap+1}, rms(double(y)/2^14)); continue; end
        % normalize, measure EVM vs nearest QPSK point, and rotation/slip hints
        zn = z/sqrt(mean(abs(z).^2));
        d = pskdemod(zn,4,pi/4,'gray'); ref = pskmod(d,4,pi/4,'gray');
        evm = sqrt(mean(abs(zn-ref).^2))*100;
        ac1 = abs(mean(zn(1:end-1).*conj(zn(2:end))));   % lag-1 (timing/repeat hint)
        rot = angle(mean((zn.^4)))/4;                    % residual rotation
        fprintf('  tap %d (%-16s): n=%5d rms=%.3f EVM=%.1f%% rot=%.3frad lag1corr=%.2f\n', ...
            tap, names{tap+1}, numel(z), rms(z), evm, rot, ac1);
    end
    release(tx); try, release(rx); catch, end
end
