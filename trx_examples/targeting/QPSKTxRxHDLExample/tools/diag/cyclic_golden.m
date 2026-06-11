% cyclic_golden -- A/B test: original golden (RRC discontinuity at the cyclic
% buffer wrap) vs cyclically-continuous golden (filter tiled, take middle).
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
mk=@(w) int16( (w/rms(w)) * 2^14 );
% (a) original: block-filtered, discontinuous at wrap
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
gA=mk(resample(w4,2,1));
% (b) cyclic: filter the 3x-tiled impulse train, take the middle copy; then
% polyphase-resample the tiled version too so edges are also continuous
N=numel(syms)*sps;
w3=zeros(3*N,1); w3(1:sps:end)=repmat(syms,3,1); w3=filter(C.RRCCoef,1,w3);
u3=resample(w3,2,1);
gB=mk(u3(2*N+1:2*N+2*N));
wr('0x9D000118',1); wr('0x9D000114',1);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx();
for mode={'A_orig','B_cyclic'}
    if strcmp(mode{1},'A_orig'), g=gA; else, g=gB; end
    tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
    tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
    tx.SamplesPerFrame=numel(g); tx(g);
    wr('0x9D000000',1); pause(3);
    p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(20);
    p1=rd('0x9D000104'); e1=rd('0x9D000108');
    dp=p1-p0; de=e1-e0;
    fprintf('CYC %-8s: pkts/20s=%d errors=%d BER=%.5f%%\n', mode{1}, dp, de, 100*de/max(1,dp*120));
    release(tx);
end
release(rx);
fprintf('CYCLIC_GOLDEN_DONE\n');
