function iq_imbalance_check()
% Rigorously quantify I/Q imbalance in the raw cable capture and test correctability.
    addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
    P=commhdlQPSKTxRxParameters();
    S=load('raw_adc_cable.mat'); x=double(S.sel1); x=x(:); x=x(abs(x)>0);
    I=real(x); Q=imag(x);
    fprintf('=== I/Q imbalance analysis (raw cable, N=%d) ===\n', numel(x));
    g = std(Q)/std(I);
    rho = mean((I-mean(I)).*(Q-mean(Q)))/(std(I)*std(Q));   % phase-skew proxy (0=orthogonal)
    fprintf('  gain imbalance std(Q)/std(I) = %.3f  (1.0=balanced; %.1fx attenuation)\n', g, 1/g);
    fprintf('  I/Q correlation (phase skew) = %.3f  (0=orthogonal)\n', rho);
    % image rejection ratio: complementary second moment E[x^2] (nonzero <=> imbalance)
    irr = abs(mean(x.^2))/mean(abs(x).^2);
    fprintf('  |E[x^2]|/E[|x|^2] = %.3f  (0=balanced circular; large=strong imbalance/real-ish)\n', irr);
    function ev=evm8(z)
      rrc=rcosdesign(0.5,4,8); mf=conv(z,rrc,'same'); bestE=inf;
      for ph=1:8, sym=mf(ph:8:end); sym=sym(abs(sym)>0); if numel(sym)<100,continue;end
        sn=sym/mean(abs(sym)); sd=sn*exp(-1j*angle(mean(sn.^4))/4);
        e=sqrt(mean(abs(sd/sqrt(2)-(sign(real(sd))+1j*sign(imag(sd)))/sqrt(2)).^2)); bestE=min(bestE,e); end
      ev=bestE;
    end
    fprintf('\n  EVM raw (no correction)          = %.3f\n', evm8(x));
    % correction 1: gain only
    xc1 = I + 1j*(Q/g);
    fprintf('  EVM after GAIN correction (Q/%.2f)= %.3f\n', g, evm8(xc1));
    % correction 2: gain + phase (Gram-Schmidt orthogonalization)
    Qc = (Q - rho*std(Q)/std(I)*I); Qc = Qc/std(Qc)*std(I);
    xc2 = I + 1j*Qc;
    fprintf('  EVM after GAIN+PHASE correction  = %.3f\n', evm8(xc2));
    % correction 3: full widely-linear (remove conjugate image): x_corr = x - alpha*conj(x)
    alpha = mean(x.^2)/mean(abs(x).^2);
    xc3 = x - alpha*conj(x);
    fprintf('  EVM after WIDELY-LINEAR (image removal alpha=%.2f%+.2fi) = %.3f\n', real(alpha),imag(alpha), evm8(xc3));

end
