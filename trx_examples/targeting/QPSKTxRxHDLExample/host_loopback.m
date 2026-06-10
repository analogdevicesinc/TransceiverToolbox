function res = host_loopback(varargin)
%host_loopback  Phase 1: full host-side QPSK loopback over plain ADRV9002 streaming.
%   Generates the "ADI Hello World" waveform (4 sps @ 7.68 MHz), streams it out the
%   ADRV9002 DAC (cyclic DMA), captures the raw cable ADC on the host (RELIABLE
%   standard Rx DMA -- full visibility), and decodes with the validated golden
%   receiver demodPlutoCapture. Reports BER/EVM and directly characterizes the RF
%   impairment (EVM, residual CFO via s^4, I/Q gain/phase imbalance, DC offset).
%
%   res = host_loopback('atten',10,'rxgain',30,'nco',0,'fc',2.4e9,'fs',7.68e6,'nframes',20)
%
%   Requires a STOCK streaming bitstream on the board (plain axi-adrv9002-rx/tx DMA).
    p = inputParser;
    p.addParameter('uri','ip:10.0.0.146'); p.addParameter('atten',10);
    p.addParameter('rxgain',30); p.addParameter('nco',0); p.addParameter('fc',2.4e9);
    p.addParameter('fs',7.68e6); p.addParameter('nframes',20); p.addParameter('Nrx',2^18);
    p.parse(varargin{:}); a = p.Results;
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));

    % --- generate 4 sps @ 7.68 MHz "ADI Hello World" waveform (genTxWaveform w/o 2x resample) ---
    C = commhdlQPSKTxRxParameters; sps = C.SamplesPerSymbol; DBPP = C.DataBitsPerPacket;
    sA = dec2bin(double('ADI Hello World'),8); msg = double(reshape(sA.',1,[])-'0').';
    pay0 = [msg; zeros(DBPP-numel(msg),1)]; pre = C.Preamble(:); poly = [1 0 0 1 0 0 0];
    syms = [];
    for f = 1:a.nframes
        st = [1 0 1 1 1 0 1]; sc = zeros(size(pay0));
        for i = 1:numel(pay0), bb = mod(nnz(st(poly==1)),2); sc(i) = xor(pay0(i),bb); st = [st(2:7) bb]; end
        fb = [pre; sc]; s = pskmod(fb(1:2:end)*2 + fb(2:2:end), 4, pi/4, 'gray'); syms = [syms; s(:)];
    end
    w4 = zeros(numel(syms)*sps,1); w4(1:sps:end) = syms; w4 = filter(C.RRCCoef,1,w4);
    txw = w4 / rms(w4);                          % 4 sps @ 7.68 MHz, unit RMS
    txint = int16(txw * 2^14);

    % --- Tx (cyclic DMA) ---
    tx = adi.ADRV9002.Tx('uri',a.uri); tx.EnabledChannels=1;
    tx.CenterFrequencyChannel0 = a.fc; tx.AttenuationChannel0 = -abs(a.atten);
    tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true; tx.SamplesPerFrame = numel(txint);
    tx(txint);

    % --- Rx capture ---
    rx = adi.ADRV9002.Rx('uri',a.uri); rx.EnabledChannels=1;
    rx.CenterFrequencyChannel0 = a.fc + a.nco; rx.SamplesPerFrame = a.Nrx;
    try, rx.GainControlMode='spi'; catch, end
    try, rx.GainChannel0=a.rxgain; catch, try,rx.Gain=a.rxgain;catch,end; end
    y=[]; v=false; for k=1:20, [y,v]=rx(); if v, end; end
    iq = double(y)/2^14;

    % --- decode (golden receiver) ---
    [ber,nf,evm,info] = demodPlutoCapture(iq, a.fs);

    % --- characterize the captured RF signal ---
    z = iq(abs(iq)>0); I=real(z); Q=imag(z);
    gimb = std(Q)/std(I); circ = abs(mean(z.^2))/mean(abs(z).^2);
    dcI = mean(I)/rms(z); dcQ = mean(Q)/rms(z);
    fprintf('\n=== host_loopback: atten=%d rxgain=%d nco=%d Hz, %d Rx samples ===\n', a.atten,a.rxgain,a.nco,numel(y));
    fprintf('  rxValid=%d |iq|rms=%.4f  capture-balance: std(Q)/std(I)=%.3f |E[z^2]|/E|z|^2=%.3f (0=good) DC=[%.3f %.3f]\n',v,rms(z),gimb,circ,dcI,dcQ);
    fprintf('  DECODE: %s\n', info);
    fprintf('  >>> BER=%.4f%% (target <0.01%%)  EVM=%.3f  frames=%d\n', 100*ber, evm, nf);
    res = struct('ber',ber,'evm',evm,'nframes',nf,'gimb',gimb,'circ',circ,'info',info,'iq',{iq});
    release(tx); try,release(rx);catch,end
end
