function analyze_raw()
% Analyze raw_adc_cable.mat (raw cable & internal ADC captures from raw_adc_dma).
% ADC=15.36MHz, model Rsym=1.92M -> 8 samp/sym. Matched-filter, 8-phase symbol-timing
% search, constellation EVM, CFO (s^4 slope), Barker-13 preamble correlation. Compares
% cable (sel1) vs internal (sel0). Tells us EXACTLY how the delivery chain corrupts the signal.
    addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
    P=commhdlQPSKTxRxParameters();
    sps=8; rrc=rcosdesign(0.5,4,sps);          % matched filter at ADC rate (8 sps)
    pre=P.preambleSymbols(:);                   % 26 preamble symbols (Barker-13 x2 I/Q)
    S=load('raw_adc_cable.mat'); flds=fieldnames(S);
    for fi=1:numel(flds)
        f=flds{fi}; raw=double(S.(f)); raw=raw(:);
        if isreal(raw), continue; end
        lab = strrep(strrep(f,'sel1','CABLE'),'sel0','INTERNAL');
        raw=raw(abs(raw)>0);
        fprintf('\n===== %s (%s): %d raw ADC samples @15.36MHz =====\n', lab, f, numel(raw));
        % matched filter
        mf=conv(raw,rrc,'same');
        % 8-phase symbol-timing search: pick phase minimizing EVM to nearest QPSK (after derotate)
        bestE=inf; bestPh=0; bestSym=[];
        for ph=1:sps
            sym=mf(ph:sps:end); sym=sym(abs(sym)>0); if numel(sym)<100, continue; end
            sn=sym/mean(abs(sym));
            rot=angle(mean(sn.^4))/4; sd=sn*exp(-1j*rot);  % derotate by mean phase
            ev=sqrt(mean(abs(sd/sqrt(2)-(sign(real(sd))+1j*sign(imag(sd)))/sqrt(2)).^2));
            if ev<bestE, bestE=ev; bestPh=ph; bestSym=sym; end
        end
        sym=bestSym; sn=sym/mean(abs(sym));
        p4=unwrap(angle(sn.^4)); n=(1:numel(p4))'; Pf=polyfit(n,p4,1);
        cfo_hz = Pf(1)/4/(2*pi)*(15.36e6/sps);
        fprintf('  best timing phase=%d/%d  EVM=%.3f  |s|cv=%.3f\n', bestPh, sps, bestE, std(abs(sym))/mean(abs(sym)));
        fprintf('  CFO (s^4 slope) = %.1f Hz/sym-equiv => %.0f Hz  | s^4 resid_std=%.3f rad\n', Pf(1), cfo_hz, std(p4-polyval(p4*0+Pf(1),n)));
        % preamble correlation: does the Barker-13 preamble appear? (rotation-invariant |corr|)
        c=abs(conv(sn, flip(conj(pre)),'valid'));
        c=c/median(c);
        [pk,loc]=findpeaks(c,'MinPeakHeight',5,'MinPeakDistance',1000);
        fprintf('  preamble corr: %d peaks > 5x median (max=%.1fx). packet-period peaks => decodable structure\n', numel(pk), max([c;0]));
        if numel(pk)>=2, fprintf('  -> peak spacing (sym): %s\n', mat2str(round(diff(loc(1:min(5,end))))')); end
    end
