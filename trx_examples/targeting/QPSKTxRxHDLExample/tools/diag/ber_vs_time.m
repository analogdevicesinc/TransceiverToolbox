% ber_vs_time -- (1) cable BER trajectory vs time-since-soft-reset (drift
% hypothesis: V16 showed first packets after reset are perfect, errors ramp).
% (2) stage-3 path: FPGA Tx -> cable -> HDL Rx with the soft-reset procedure.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);

C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); gold=int16(txw*2^14);

% ---- (1) cable golden, BER trajectory after soft reset ----
wr('0x9D000118',1); wr('0x9D000114',1);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx(); pause(2);
wr('0x9D000114',1); wr('0x9D000118',1);
wr('0x9D000000',1); pause(0.5);
pp=zeros(31,1); ee=zeros(31,1); tt=zeros(31,1); t0=tic;
for k=1:31
    pp(k)=rd('0x9D000104'); ee(k)=rd('0x9D000108'); tt(k)=toc(t0);
    if k<31, pause(2); end
end
fprintf('TRAJ t(s)  dPkts  dErrs  windowBER%%  cumBER%%\n');
for k=2:31
    dp=pp(k)-pp(k-1); de=ee(k)-ee(k-1);
    fprintf('TRAJ %5.1f %6d %6d  %8.4f  %8.4f\n', tt(k), dp, de, ...
        100*de/max(1,dp*120), 100*(ee(k)-ee(1))/max(1,(pp(k)-pp(1))*120));
end
release(tx);

% ---- (2) STAGE-3 path: FPGA Tx -> cable -> HDL Rx, with soft reset ----
wr('0x9D000118',0);  % FPGA Tx drives DAC
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); pause(2);
wr('0x9D000114',1); wr('0x9D000118',0);
wr('0x9D000000',1); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0;
fprintf('STAGE3-RESET: pkts/30s=%d errors=%d BER=%.5f%%\n', dp, de, 100*de/max(1,dp*120));
release(tx); release(rx);
fprintf('BER_VS_TIME_DONE\n');
