% stage1 acquisition protocol: golden live FIRST, then rstCS pulse; LO trim sweep.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
wr('0x9D000118',1); wr('0x9D000114',1);
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); gold=int16(txw*2^14);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
[y,~]=rx();   % live rx buffer held
pause(3);
for trim=[0 2000 -2000 1000 -1000 4000 -4000]
  BistRegisters.sshExec(sprintf('D=/sys/bus/iio/devices/iio:device2; echo %d > $D/out_altvoltage0_RX1_LO_frequency', 2400000000+trim),8);
  pause(1);
  BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0',8);  % rstCS w/ signal live
  pause(2);
  p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(6); p1=rd('0x9D000104'); e1=rd('0x9D000108');
  fprintf('trim=%+5d Hz: pkts/6s=%d errs=%d BER=%.4f%%\n', trim, p1-p0, e1-e0, 100*(e1-e0)/max(1,(p1-p0)*120));
end
BistRegisters.sshExec('D=/sys/bus/iio/devices/iio:device2; echo 2400000000 > $D/out_altvoltage0_RX1_LO_frequency',8);
release(tx); release(rx);
