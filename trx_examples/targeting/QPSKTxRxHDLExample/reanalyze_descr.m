addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
S=load('descr_sel0.mat');
% reconstruct streams
db = S.demod(S.vIn>0); st = S.startIn(S.vIn>0);   % demod bits + start, in valid-in order
hd = S.hwDescr(S.vOut>0);                           % HW descrambled bits, in valid-out order
% SW descramble of demod (already in S.sw, valid-in order)
sw = S.sw;
fprintf('lengths: demod=%d hwDescr=%d sw=%d\n', numel(db), numel(hd), numel(sw));
% cross-correlate sw vs hd over small lags to find pipeline offset
L=min(numel(sw),numel(hd)); bestm=1; bestlag=0;
for lag=0:40
  a=sw(1:L-lag); b=hd(1+lag:L); m=mean(a~=b);
  if m<bestm, bestm=m; bestlag=lag; end
  a=sw(1+lag:L); b=hd(1:L-lag); m=mean(a~=b);
  if m<bestm, bestm=m; bestlag=-lag; end
end
fprintf('SW-descramble vs HW-descramble: best mismatch=%.4f%% at lag=%d (0%%=descrambler verified, my prev was alignment)\n', 100*bestm, bestlag);
% Also: does HW-descr match "ADI Hello World" per packet? build reference bits
msg='ADI Hello World';  bits=reshape(de2bi(double(msg),8,'left-msb')',[],1);  % rough 8-bit; BIST uses 120/packet
fprintf('('' ADI Hello World'' = %d chars; BIST checks 120 bits/packet)\n', numel(msg));
% demod-vs-expected: is the ERROR already in demod (upstream) or introduced by descrambler?
% compare demod bits to SW-SCRAMBLED reference is complex; instead report: if SW==HW (descrambler ok),
% then any payload BER is UPSTREAM of descrambler (demod/signal). That is the key localization.
