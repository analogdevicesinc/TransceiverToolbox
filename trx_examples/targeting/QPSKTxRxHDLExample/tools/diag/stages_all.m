% Full staged verification on the single-clock-domain verif composite.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
% golden 8sps@15.36
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); gold=int16(txw*2^14);
N=2^15; tone=exp(1j*2*pi*(fs/8)/fs*(0:N-1)).'; tonei=complex(int16(real(tone)*2^14),int16(imag(tone)*2^14));

% ---------- INTERNAL control (regression guard) ----------
wr('0x9D000118',0); wr('0x9D000114',0);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16')));
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^14; [y,~]=rx(); pause(2);
a=rd('0x9D000104'); e0i=rd('0x9D000108'); pause(5); b=rd('0x9D000104'); e1i=rd('0x9D000108');
fprintf('INTERNAL: pkts/5s=%d errs=%d BER=%.3f%%\n', b-a, e1i-e0i, 100*(e1i-e0i)/max(1,(b-a)*120));
release(tx); release(rx);

% ---------- STAGE 0: host tone, capture IR ----------
wr('0x9D000118',1); wr('0x9D000114',1);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=N; tx(tonei);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^16; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
y=[]; for k=1:15,[y,~]=rx(); end
z=double(y); z=z(abs(z)>0); f0=fs/8;
Z=abs(fftshift(fft(z.*hann(numel(z))))).^2; fax=((0:numel(z)-1)/numel(z)-0.5)*fs;
pP=sum(Z(abs(fax-f0)<60e3)); pN=sum(Z(abs(fax+f0)<60e3)); ir=10*log10(pP/max(pN,eps));
fprintf('STAGE0: std(Q)/std(I)=%.3f IR=%.1f dB (gate>40)\n', std(imag(z))/std(real(z)), ir);
release(tx);

% ---------- STAGE 2: FPGA Tx -> host decode (uses live rx) ----------
wr('0x9D000118',0);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); pause(2);
rx.release(); rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^18; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
y=[]; for k=1:12,[y,~]=rx(); end
iq=double(y)/2^14;
[ber2,nf2,evm2,info2]=demodPlutoCapture(iq, fs);
fprintf('STAGE2: %s\n', info2);
save('stage2_capture_v2.mat','iq');
release(tx);

% ---------- STAGE 1: host golden -> HDL Rx BIST (held buffers) ----------
wr('0x9D000118',1);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0;
fprintf('STAGE1: pkts/30s=%d errors=%d BER=%.5f%% (gate <0.01, pkts>1000)\n', dp, de, 100*de/max(1,dp*120));
release(tx);

% ---------- STAGE 3: FPGA Tx -> HDL Rx BIST (success criterion) ----------
wr('0x9D000118',0);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0;
fprintf('STAGE3-PREVIEW: pkts/30s=%d errors=%d BER=%.5f%%\n', dp, de, 100*de/max(1,dp*120));
release(tx); release(rx);
