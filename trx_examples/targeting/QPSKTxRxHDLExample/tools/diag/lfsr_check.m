addpath(pwd);
S=load('descr_sel0.mat');
db = S.demod(S.vIn>0);  hd = S.hwDescr(S.vOut>0);
L=min(numel(db),numel(hd));
% find lag minimizing the period-127 autocorrelation structure of (hd xor db)
fprintf('Checking if hwDescr XOR demod is a period-127 LFSR sequence...\n');
for lag=[0 -15 -2 -1 1 2 15]
  if lag>=0, a=db(1:L-lag); b=hd(1+lag:L); else, a=db(1-lag:L); b=hd(1:L+lag); end
  x=double(xor(a,b)); x=x(1:min(end,20000)); x=2*x-1;  % +-1
  % autocorr at lag 127 (LFSR period) vs random
  n=numel(x); ac127 = mean(x(1:n-127).*x(128:n)); ac1=mean(x(1:n-1).*x(2:n));
  fprintf('  lag=%3d: XOR ones-fraction=%.3f  autocorr@127=%.3f  autocorr@1=%.3f\n', lag, mean(x>0), ac127, ac1);
end
fprintf('(LFSR period-127 seq: autocorr@127 ~ +1.0; random/noise: ~0). \n');
% sanity: is demod itself reasonable (not constant)?
fprintf('demod ones-fraction=%.3f (0.5=balanced bits)  hwDescr ones-fraction=%.3f\n', mean(db), mean(hd));
