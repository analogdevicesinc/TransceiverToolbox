% Phase 2b v3: hold the 15.36 MHz LVDS profile on BOTH tx and rx (prior bug: rx reset it
% to 7.68). Send 8sps@15.36 golden -> HDL Receiver BIST.
addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
prof='/home/tcollins/dev/qpsk_ai/TransceiverToolbox/test/adrv9002_profiles'; addpath(prof);
uri='ip:10.0.0.146'; fc=2.4e9; pj='lte_10_lvds_nco_api_68_8_1.json'; ps='lte_10_lvds_nco_api_68_8_1.stream';
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); txint=int16(txw*2^14);
% Tx with profile held
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.EnableCustomProfile=true;
tx.CustomProfileFileName=pj; tx.CustomStreamFileName=ps;
tx.CenterFrequencyChannel0=fc; tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=numel(txint);
tx(txint);
fprintf('Tx SamplingRate=%g (want 1.536e7)\n', tx.SamplingRate);
% Rx with profile held (so it doesn't reset rate)
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.EnableCustomProfile=true;
rx.CustomProfileFileName=pj; rx.CustomStreamFileName=ps;
rx.CenterFrequencyChannel0=fc; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end;
try,setup(rx);catch ME,fprintf('rx setup: %s\n',ME.message);end; pause(3);
fprintf('Rx SamplingRate=%g\n', rx.SamplingRate);
rd=@(a) BistRegisters.read(a,8);
for trial={'no-rst','rst'}
  if strcmp(trial{1},'rst'), BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0',8); pause(2); end
  p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(6); p1=rd('0x9D000104'); e1=rd('0x9D000108');
  dp=double(p1-p0); de=double(e1-e0);
  fprintf('  [%s] packets/6s=%d errors=%d BIST-BER=%.4f%%\n', trial{1}, dp, de, 100*de/max(1,dp*120));
end
release(tx); try,release(rx);catch,end
