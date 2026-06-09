function characterize_raw()
% Deeper characterization of the raw cable capture: clipping (amplitude histogram),
% spectrum shape (QPSK-RRC vs distorted), and compare against the IDEAL Tx waveform.
    addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
    S=load('raw_adc_cable.mat'); x=double(S.sel1); x=x(:); x=x(abs(x)>0);
    Fs=15.36e6;
    fprintf('=== raw cable capture: N=%d ===\n', numel(x));
    % 1) clipping check: amplitude histogram + max vs std
    a=abs(x); fprintf('  |s|: mean=%.0f std=%.0f max=%.0f  max/mean=%.2f  (int16 full=32767)\n', mean(a),std(a),max(a),max(a)/mean(a));
    fprintf('  real: min=%.0f max=%.0f  | imag: min=%.0f max=%.0f  (clip near +-32767?)\n', min(real(x)),max(real(x)),min(imag(x)),max(imag(x)));
    edges=linspace(0,max(a),11); h=histcounts(a,edges); fprintf('  |s| histogram (0..max in 10 bins): %s\n', mat2str(round(100*h/sum(h))));
    % 2) spectrum: is energy in a QPSK-RRC band (~Rsym=1.92M, occupied ~2.88MHz) or spread/aliased?
    X=abs(fftshift(fft(x.*hann(numel(x))))).^2; f=((0:numel(x)-1)/numel(x)-0.5)*Fs;
    Xn=X/max(X); occ=f(Xn>0.01); 
    fprintf('  spectrum: peak@%.0fkHz, energy>1%% spans [%.0f, %.0f] kHz (QPSK-RRC expect ~+-1440kHz)\n', f(X==max(X))/1e3, min(occ)/1e3, max(occ)/1e3);
    % fraction of energy within +-1.5MHz (the QPSK band) vs outside
    inband=sum(X(abs(f)<1.5e6))/sum(X); fprintf('  in-band (+-1.5MHz) energy fraction = %.3f (1.0=clean QPSK band, <<1 = spread/distorted)\n', inband);
    % 3) DC offset
    fprintf('  DC: mean(real)=%.1f mean(imag)=%.1f (relative to |s|mean %.0f)\n', mean(real(x)),mean(imag(x)),mean(a));
    % 4) does decimate-by-2 to 4sps (model rate) + model RRC give a better constellation? (rate-check)
    P=commhdlQPSKTxRxParameters();
    x4=resample(x,1,2); mf=conv(x4,P.RRCCoef,'same');
    bestE=inf;
    for ph=1:4, sym=mf(ph:4:end); sym=sym(abs(sym)>0); if numel(sym)<100,continue;end; sn=sym/mean(abs(sym)); sd=sn*exp(-1j*angle(mean(sn.^4))/4); ev=sqrt(mean(abs(sd/sqrt(2)-(sign(real(sd))+1j*sign(imag(sd)))/sqrt(2)).^2)); bestE=min(bestE,ev); end
    fprintf('  RATE-CHECK: decimate->4sps + model RRC best EVM=%.3f (if ~same 0.84, not a rate bug)\n', bestE);
