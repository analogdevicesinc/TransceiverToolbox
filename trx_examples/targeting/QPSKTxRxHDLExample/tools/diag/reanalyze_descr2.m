addpath(pwd);
S=load('descr_sel0.mat');
db = S.demod(S.vIn>0); st = S.startIn(S.vIn>0);
hd = S.hwDescr(S.vOut>0);
% CORRECT additive descramble matching reference scramble(): bit=xor(state(1),state(4)); state=[state(2:7) bit]
sw=zeros(size(db)); state=[1 0 1 1 1 0 1];
for i=1:numel(db)
  if st(i), state=[1 0 1 1 1 0 1]; end
  bit = xor(state(1),state(4));
  sw(i)=xor(db(i),bit);
  state=[state(2:7) bit];
end
L=min(numel(sw),numel(hd)); bestm=1; bl=0;
for lag=-40:40
  if lag>=0, a=sw(1:L-lag); b=hd(1+lag:L); else, a=sw(1-lag:L); b=hd(1:L+lag); end
  m=mean(a~=b); if m<bestm,bestm=m;bl=lag;end
end
fprintf('CORRECTED descramble: best SW-vs-HW mismatch=%.4f%% at lag=%d\n', 100*bestm, bl);
% also try the OTHER tap convention (state(7),state(4)) and feeding direction, to be sure
sw2=zeros(size(db)); state=[1 0 1 1 1 0 1];
for i=1:numel(db)
  if st(i), state=[1 0 1 1 1 0 1]; end
  bit=xor(state(7),state(4)); sw2(i)=xor(db(i),bit); state=[bit state(1:6)];
end
bm2=1; for lag=-40:40, if lag>=0,a=sw2(1:L-lag);b=hd(1+lag:L);else,a=sw2(1-lag:L);b=hd(1:L+lag);end; bm2=min(bm2,mean(a~=b)); end
fprintf('alt-convention mismatch=%.4f%%\n', 100*bm2);
fprintf('=> if either ~0%%: HW descrambler VERIFIED correct (internal); payload BER is UPSTREAM (demod/signal)\n');
