% Diagnose the 0-packets: (1) does host Rx capture see a decodable cable signal on
% the txrx build (verifies host Tx -> DAC -> cable)? (2) is the HDL Rx getting any
% data (count_out 0x100)? Localizes whether host Tx, ADC->HDL-Rx, or HDL-Rx lock is the issue.
addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=7.68e6;
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4); txw=w4/rms(w4); txint=int16(txw*2^14);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc; tx.AttenuationChannel0=-10;
tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=numel(txint); tx(txint);
% (1) try host Rx capture on the txrx build
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc; rx.SamplesPerFrame=2^18;
try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end;
y=[]; for k=1:12,[y,v]=rx(); end
z=double(y); nz=z(abs(z)>0);
fprintf('host Rx on txrx: %d samples, |s|rms=%.1f nonzero=%d\n', numel(z), rms(double(nz)), numel(nz));
if rms(double(nz))>1
  iq=double(y)/2^14; [ber,nf,evm]=demodPlutoCapture(iq,fs);
  fprintf('  host-Rx decode of txrx-Tx signal: %d frames EVM=%.3f BER=%.4f%%  (verifies host Tx path)\n', nf, evm, 100*ber);
end
release(rx);
% (2) HDL Rx BIST counters: count_out(0x100) total bits, packets(0x104), errors(0x108)
rd=@(a) double(BistRegisters.read(a,8));
c0=rd('0x9D000100'); p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(6);
c1=rd('0x9D000100'); p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('HDL Rx BIST/6s: dcount=%d dpackets=%d derrors=%d\n', c1-c0, p1-p0, e1-e0);
fprintf('  (dcount>0 => HDL Rx IS getting ADC data but not locking; dcount=0 => ADC->HDL-Rx path dead)\n');
release(tx);
