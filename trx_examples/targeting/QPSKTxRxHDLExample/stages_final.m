% stages_final -- post-Tx-content-fix verification, all with the CORRECT
% procedure: soft reset FIRST (clears regfile to defaults), THEN select mode.
% Expected if the content artifact is the whole story: INTERNAL ~0%,
% STAGE1 0% (regression), STAGE3 ~0% incl. sustained.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); gold=int16(txw/rms(txw)*2^14);

% buffers live throughout
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx(); pause(2);

% INTERNAL (reset defaults = internal)
wr('0x9D000000',1); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(20);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('FINAL INTERNAL: pkts/20s=%d errors=%d BER=%.6f%%\n', p1-p0, e1-e0, 100*(e1-e0)/max(1,(p1-p0)*120));

% STAGE 1: host golden -> HDL Rx over cable
wr('0x9D000000',1); pause(1); wr('0x9D000118',1); wr('0x9D000114',1); pause(2);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('FINAL STAGE1: pkts/30s=%d errors=%d BER=%.6f%%\n', p1-p0, e1-e0, 100*(e1-e0)/max(1,(p1-p0)*120));

% STAGE 3: FPGA Tx -> cable -> HDL Rx, sustained 5 min
wr('0x9D000000',1); pause(1); wr('0x9D000118',0); wr('0x9D000114',1); pause(2);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); t0=tic;
for m=1:10
    pause(30);
    p1=rd('0x9D000104'); e1=rd('0x9D000108');
    fprintf('FINAL STAGE3 t=%5.0fs pkts=%d errors=%d checkedBits=%d BER=%.6f%%\n', ...
        toc(t0), p1-p0, e1-e0, (p1-p0)*120, 100*(e1-e0)/max(1,(p1-p0)*120));
end
release(tx); release(rx);
fprintf('STAGES_FINAL_DONE\n');
