% reset_experiment -- does the HDL Rx decode the cable stream when it starts
% FROM RESET with rx_input_select=1 already latched (the exact condition every
% passing RTL/netlist sim used), instead of switching the MUX live mid-stream?
% Soft reset: AXI word 0 (0x9D000000) bit0 is a one-cycle strobe resetting the
% DUT datapath only; the AXI register file (x114/x118) persists.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);

% golden 8sps@15.36 (same as stages_all)
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); gold=int16(txw*2^14);

% cable mode + host golden, buffers live
wr('0x9D000118',1); wr('0x9D000114',1);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx(); pause(2);

% A: live-switched baseline (the historical condition)
p0=rd('0x9D000104'); pause(8); p1=rd('0x9D000104');
fprintf('A LIVE-SWITCHED : pkts/8s=%d\n', p1-p0);

% B: soft reset WITH cable selected -> Receiver acquires from reset state
wr('0x9D000000',1); pause(3);
fprintf('  regs after soft reset: x114=%d x118=%d x4(enable)=%d\n', ...
    rd('0x9D000114'), rd('0x9D000118'), rd('0x9D000004'));
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0;
fprintf('B RESET-IN-CABLE: pkts/30s=%d errors=%d BER=%.5f%%\n', dp, de, 100*de/max(1,dp*120));

% C: repeatability of B
wr('0x9D000000',1); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(15);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('C RESET-IN-CABLE repeat: pkts/15s=%d errors=%d\n', p1-p0, e1-e0);

% D: internal after cable stint (state-corruption control)
wr('0x9D000114',0); wr('0x9D000118',0); pause(2);
p0=rd('0x9D000104'); pause(5); p1=rd('0x9D000104');
fprintf('D INTERNAL-AFTER-CABLE (live switch back): pkts/5s=%d\n', p1-p0);

release(tx); release(rx);
fprintf('RESET_EXPERIMENT_DONE\n');
