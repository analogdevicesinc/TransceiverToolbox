% Confirm reproducibility + accumulate enough bits to certify BER<0.01%.
addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=7.68e6;
% build 4sps@7.68MHz waveform once
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4); txw=w4/rms(w4); txint=int16(txw*2^14);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc; tx.AttenuationChannel0=-10;
tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=numel(txint); tx(txint);
totbits=0; toterr=0; evms=[];
for rep=1:5
  rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc; rx.SamplesPerFrame=2^18;
  try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end;
  y=[]; for k=1:12,[y,v]=rx(); end; release(rx);
  iq=double(y)/2^14;
  [ber,nf,evm]=demodPlutoCapture(iq,fs);
  if nf>0, bits=nf*120; err=round(ber*bits); totbits=totbits+bits; toterr=toterr+err; evms(end+1)=evm;
    fprintf('  rep %d: %d frames  EVM=%.3f  BER=%.4f%%  (errs=%d/%d)\n', rep, nf, evm, 100*ber, err, bits); end
end
fprintf('\n>>> CUMULATIVE: %d errors / %d checked bits  BER=%.5f%%  (target <0.01%%)  mean EVM=%.3f\n', toterr, totbits, 100*toterr/max(1,totbits), mean(evms));
release(tx);
