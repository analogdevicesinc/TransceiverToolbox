% burst_poll -- distribution of bit_errors increments at ~packet granularity.
% Bimodal (0 and ~60) => per-packet wrong-rotation; steady small => uniform.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); gold=int16(txw*2^14);
wr('0x9D000118',1); wr('0x9D000114',1);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx();
wr('0x9D000000',1); pause(3);
% on-board tight poll: interleave reads of packets and errors, 12000 pairs
[~,out]=BistRegisters.sshExec(['yes | head -n 12000 | while read x; do ' ...
  'busybox devmem 0x9D000104; busybox devmem 0x9D000108; done'], 120);
release(tx); release(rx);
tok=regexp(out,'0x([0-9A-Fa-f]{8})','tokens'); v=cellfun(@(c) hex2dec(c{1}), tok).'; P=v(1:2:end-1); E=v(2:2:end);
n=min(numel(P),numel(E)); P=P(1:n); E=E(1:n);
fprintf('BP samples=%d pkts span=%d errs span=%d\n', n, P(end)-P(1), E(end)-E(1));
% per-packet error increments: resample E at each packet boundary
[Pu,iu]=unique(P,'first'); Eu=E(iu);
dP=diff(Pu); dE=diff(Eu);
save('burst_poll_raw.mat','P','E','Pu','Eu');
ok = dP>0 & dP<=30;
dPo=dP(ok); dEo=dE(ok);
fprintf('BP windows=%d  mean dP=%.1f  errs/pkt=%.3f\n', numel(dPo), mean(dPo), sum(dEo)/sum(dPo));
% dispersion of per-packet errors inferred from windowed sums:
% Var(dE) = dP*sigma2 (independent packets) => sigma2 = mean over windows
epp = dEo./dPo;
fprintf('BP errs-per-pkt across windows: mean=%.2f std=%.2f min=%.2f max=%.2f\n', mean(epp), std(epp), min(epp), max(epp));
sigma2 = mean((dEo - mean(epp)*dPo).^2 ./ dPo);
fprintf('BP inferred per-packet variance=%.1f  dispersion D=%.1f (uniform~1, bimodal{0,60}~52)\n', sigma2, sigma2/mean(epp));
z5 = nnz(dEo==0 & dPo>=5);
fprintf('BP zero-error windows with dP>=5: %d of %d (bimodal predicts >0, uniform predicts 0)\n', z5, nnz(dPo>=5));
edges=[0 1 5 10 20:20:200 1000];
hc=histcounts(dEo,edges);
for k=1:numel(hc), if hc(k)>0, fprintf('BP   dE in [%d,%d): %d\n', edges(k), edges(k+1), hc(k)); end; end
fprintf('BURST_POLL_DONE\n');
