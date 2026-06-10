% stage1 diagnostic battery on the verif composite
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
% golden tx (host)
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); txint=int16(txw*2^14);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(txint); tx(txint); pause(3);
function r=meas(rd,dur), c0=rd('0x9D000100'); p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(dur);
  c1=rd('0x9D000100'); p1=rd('0x9D000104'); e1=rd('0x9D000108');
  r=struct('dc',c1-c0,'dp',p1-p0,'de',e1-e0); end
% (1) cable: is data flowing? (count_out)
wr('0x9D000118',1); wr('0x9D000114',1); pause(2);
r=meas(rd,6); fprintf('D1 cable host-tx   : dcount=%-8d dpkts=%-6d derr=%d\n', r.dc, r.dp, r.de);
% (2) internal regression (tx_source=0, rx_sel=0)
wr('0x9D000118',0); wr('0x9D000114',0); pause(2);
r=meas(rd,6); fprintf('D2 internal        : dcount=%-8d dpkts=%-6d derr=%d  BER=%.3f%%\n', r.dc, r.dp, r.de, 100*r.de/max(1,r.dp*120));
% (3) cable again + rstCS pulse with Tx LIVE
wr('0x9D000118',1); wr('0x9D000114',1); pause(2);
BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0',8); pause(2);
r=meas(rd,6); fprintf('D3 cable + rstCS   : dcount=%-8d dpkts=%-6d derr=%d  BER=%.3f%%\n', r.dc, r.dp, r.de, 100*r.de/max(1,r.dp*120));
% (4) +2kHz Rx LO trim (board-side) + rstCS
BistRegisters.sshExec('D=/sys/bus/iio/devices/iio:device2; echo 2400002000 > $D/out_altvoltage0_RX1_LO_frequency',8); pause(2);
BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0',8); pause(2);
r=meas(rd,6); fprintf('D4 cable+trim+rstCS: dcount=%-8d dpkts=%-6d derr=%d  BER=%.3f%%\n', r.dc, r.dp, r.de, 100*r.de/max(1,r.dp*120));
BistRegisters.sshExec('D=/sys/bus/iio/devices/iio:device2; echo 2400000000 > $D/out_altvoltage0_RX1_LO_frequency',8);
release(tx);
