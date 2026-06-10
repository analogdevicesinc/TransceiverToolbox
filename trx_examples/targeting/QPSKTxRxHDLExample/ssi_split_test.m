% SSI-loopback split: chip TX SSI looped to RX SSI digitally (no RF).
% Host golden -> upack -> DUT MUX -> dac pins -> chip SSI loop -> adc pins ->
% capture + BIST. EVM~0.6 here => FPGA-side output pacing; clean => chip TX/RF path.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
rd=@(a) double(BistRegisters.read(a,8));
attr = adrv9002_ssi_loopback(true);
fprintf('ssi loopback attr: %s\n', attr);
wr('0x9D000118',1); wr('0x9D000114',1);   % host tx, cable(adc) rx
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
rx.SamplesPerFrame=2^18; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
y=[]; for k=1:12,[y,~]=rx(); end
iq=double(y)/2^14;
z=iq(abs(iq)>0);
fprintf('SSI-LOOP capture: rms=%.4f std(Q)/std(I)=%.3f circ=%.3f\n', rms(z), std(imag(z))/std(real(z)), abs(mean(z.^2))/mean(abs(z).^2));
[ber,nf,evm,info]=demodPlutoCapture(iq, fs);
fprintf('SSI-LOOP HOST DECODE: %s\n', info);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(10); p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('SSI-LOOP BIST: pkts/10s=%d errs=%d BER=%.4f%%\n', p1-p0, e1-e0, 100*(e1-e0)/max(1,(p1-p0)*120));
save('ssi_loop_capture.mat','iq');
adrv9002_ssi_loopback(false);
release(tx); release(rx);
