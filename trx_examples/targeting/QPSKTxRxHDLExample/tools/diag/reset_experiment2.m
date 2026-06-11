% reset_experiment2 -- discriminate WHICH stream decodes after soft reset:
% cable (host golden) or internal loop. Also probe whether the AXI register
% file survives the soft reset (x114 readback may be write-only).
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

wr('0x9D000118',1); wr('0x9D000114',1);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx(); pause(2);

% reproduce B: soft reset with cable+host latched
wr('0x9D000000',1); pause(3);
p0=rd('0x9D000104'); pause(10); p1=rd('0x9D000104');
r1=(p1-p0)/10; fprintf('E1 after soft reset            : %.0f pkts/s\n', r1);

% E2: re-assert x114/x118 (if regfile reset, this re-selects cable LIVE)
wr('0x9D000114',1); wr('0x9D000118',1); pause(2);
p0=rd('0x9D000104'); pause(10); p1=rd('0x9D000104');
fprintf('E2 after re-writing x114/x118  : %.0f pkts/s\n', (p1-p0)/10);

% E3: KILL the host golden stream -> cable packets must stop, internal would not
release(tx); pause(2);
p0=rd('0x9D000104'); pause(10); p1=rd('0x9D000104');
fprintf('E3 host Tx STOPPED             : %.0f pkts/s  (cable=>~0, internal=>unchanged)\n', (p1-p0)/10);

% E4: restart golden -> if cable, packets resume WITHOUT any reset?
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(10); p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('E4 host Tx restarted (no reset): %.0f pkts/s errs/10s=%d\n', (p1-p0)/10, e1-e0);

% E5: soft reset again with everything live: rate + BER
wr('0x9D000000',1); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(20); p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0;
fprintf('E5 soft reset again            : %.0f pkts/s BER=%.4f%%\n', dp/20, 100*de/max(1,dp*120));

release(tx); release(rx);
fprintf('RESET_EXPERIMENT2_DONE\n');
