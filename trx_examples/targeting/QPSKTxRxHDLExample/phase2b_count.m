% UpsamplesRx=2 build @ 15.36 default. Stream 8sps@15.36 golden via host Tx (NO profile load,
% NO rx object). Key: does count_out increment (HDL Rx gets data at matched rate)?
addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
uri='ip:10.0.0.146'; fc=2.4e9;
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); txint=int16(txw*2^14);   % 8 sps @ 15.36
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc; tx.AttenuationChannel0=-10;
tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=numel(txint); tx(txint);
fprintf('after tx setup: Tx SamplingRate=%g (want 1.536e7)\n', tx.SamplingRate);
rd=@(a) double(BistRegisters.read(a,8));
c0=rd('0x9D000100'); p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(6);
c1=rd('0x9D000100'); p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('HDL Rx BIST/6s: dcount=%d dpackets=%d derrors=%d  BIST-BER=%.4f%%\n', c1-c0, p1-p0, e1-e0, 100*(e1-e0)/max(1,(p1-p0)*120));
fprintf('  (dcount>0 = HDL Rx GETS DATA at matched 15.36 rate)\n');
release(tx);
