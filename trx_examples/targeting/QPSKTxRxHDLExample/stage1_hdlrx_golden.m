% stage1_hdlrx_golden.m -- Verifiable Composite stage i: host Tx golden -> cable ->
% deployed HDL Receiver BIST. Gate: pkts>1000 in 30 s AND BER < 0.01% per checked bit.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
BistRegisters.sshExec('busybox devmem 0x9D000118 32 1',8);   % tx_source = host
BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % rx = cable
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[];
for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0));
  for i=1:numel(pay0), bb=mod(nnz(st(poly==1)),2); sc(i)=xor(pay0(i),bb); st=[st(2:7) bb]; end
  fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; %#ok<AGROW>
end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); txint=int16(txw*2^14);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(txint); tx(txint);
fprintf('Tx rate=%g (want 1.536e7)\n', tx.SamplingRate); pause(5);
rd=@(a) double(BistRegisters.read(a,8));
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
fprintf('STAGE1: pkts/30s=%d errors=%d BER=%.5f%% (gate <0.01, pkts>1000)\n', dp, de, ber);
release(tx);
assert(dp>1000 && ber<0.01, 'stage 1 gate failed'); fprintf('STAGE1 PASS\n');
