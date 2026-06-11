% errfreeze -- with the stream STOPPED, x108 (bit_errors) must freeze.
% If it climbs with no input, the readback is not the BIST error counter.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); g=int16(txw/rms(txw)*2^14);
wr('0x9D000118',1); wr('0x9D000114',1);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(g); tx(g);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx();
wr('0x9D000000',1); pause(3);
fprintf('EF running: ');
for k=1:4, fprintf('p=%d e=%d | ', rd('0x9D000104'), rd('0x9D000108')); pause(3); end
fprintf('\n');
release(tx); pause(2);
fprintf('EF stopped: ');
for k=1:4, fprintf('p=%d e=%d | ', rd('0x9D000104'), rd('0x9D000108')); pause(3); end
fprintf('\n');
release(rx);
fprintf('ERRFREEZE_DONE\n');
