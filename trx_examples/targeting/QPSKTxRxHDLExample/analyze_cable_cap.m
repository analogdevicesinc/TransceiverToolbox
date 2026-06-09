addpath(pwd);
s=load('capture_strong_lock.mat'); fn=fieldnames(s);
fprintf('capture_strong_lock.mat fields: %s\n', strjoin(fn',', '));
% prefer tap1 (post-SymSync, symbol-rate). fall back to any tap field.
tapf=''; for c={'tap1','tap0','tap2'}, if isfield(s,c{1}), tapf=c{1}; break; end; end
x=double(s.(tapf)); x=x(:); x=x(abs(x)>0);
fprintf('\n=== analyzing %s : %d samples ===\n', tapf, numel(x));
% normalize
xn=x/mean(abs(x));
% s^4 removes QPSK -> 4*carrier phase. unwrap to see CFO ramp vs noise vs jumps
p4=unwrap(angle(xn.^4));
n=(1:numel(p4))';
% linear fit = CFO slope
P=polyfit(n,p4,1); slope=P(1); resid=p4-polyval(P,n);
fprintf('  s^4 phase: linear slope=%.5f rad/sym (=> carrier %.5f rad/sym, %.4f deg/sym)\n', slope, slope/4, slope/4*180/pi);
fprintf('  residual after linear fit: std=%.4f rad  (small=clean CFO ramp; large=noise/slips)\n', std(resid));
% magnitude stability
fprintf('  |s| mean=%.0f std/mean=%.4f\n', mean(abs(x)), std(abs(x))/mean(abs(x)));
% per-symbol phase increments (detect discrete jumps/slips)
dph=diff(unwrap(angle(xn.^4)));
fprintf('  d(s^4phase): median=%.4f mean=%.4f std=%.4f  #|jump|>0.5rad=%d/%d\n', median(dph), mean(dph), std(dph), sum(abs(dph-median(dph))>0.5), numel(dph));
% quadrant occupancy (is constellation 4 clean clusters or smeared?)
q=sign(real(xn))+2*(sign(imag(xn))>0);
fprintf('  quadrant histogram (should be ~25%% each): ');
for k=unique(q'), fprintf('%d:%.0f%% ', k, 100*mean(q==k)); end; fprintf('\n');
% EVM to nearest ideal
ideal=(sign(real(xn))+1j*sign(imag(xn)))/sqrt(2);
fprintf('  EVM(unit-norm)=%.4f\n', sqrt(mean(abs(xn/sqrt(2)-ideal).^2)));
