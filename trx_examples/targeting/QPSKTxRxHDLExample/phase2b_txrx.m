% Phase 2b: host Tx (golden waveform) -> cable -> HDL Receiver -> read its BIST.
% Tests whether the HDL Rx (6-round suspect) decodes a KNOWN-GOOD signal.
addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
uri='ip:10.0.0.146'; fc=2.4e9;
% probe rate
rxp=adi.ADRV9002.Rx('uri',uri); rxp.EnabledChannels=1; fs=rxp.SamplingRate; release(rxp);
if isnan(fs)||fs<=0, fs=7.68e6; end
fprintf('txrx design SamplingRate = %g Hz\n', fs);
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
% match design rate: 8 sps @ 15.36 needs 2x resample; 4 sps @ 7.68 uses w4
if fs>=12e6, txw=resample(w4,2,1); else, txw=w4; end
txw=txw/rms(txw); txint=int16(txw*2^14);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc; tx.AttenuationChannel0=-10;
tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=numel(txint); tx(txint);
% also power the Rx LO (HDL Rx uses the ADC) - set LO via a brief Rx config
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end; try,setup(rx);catch,end;
pause(3);
rd=@(a) BistRegisters.read(a,8);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(6); p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=double(p1-p0); de=double(e1-e0);
fprintf('=== Phase 2b: host Tx golden -> HDL Receiver BIST ===\n');
fprintf('  packets/6s=%d  errors=%d  BIST-BER(per120)=%.4f%%\n', dp, de, 100*de/max(1,dp*120));
release(tx); try,release(rx);catch,end
