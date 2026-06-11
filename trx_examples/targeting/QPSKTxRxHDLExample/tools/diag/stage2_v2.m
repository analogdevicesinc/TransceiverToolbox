% stage2: FPGA Tx -> DAC -> cable -> ADC -> passthrough capture -> host golden decode.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
BistRegisters.sshExec('busybox devmem 0x9D000118 32 0',8);   % FPGA Tx
BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % cable
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16')));   % power chip Tx; FPGA Tx drives data
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^18; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
y=[]; for k=1:12,[y,~]=rx(); end
iq=double(y)/2^14;
z=iq(abs(iq)>0);
fprintf('capture: |z|rms=%.4f std(Q)/std(I)=%.3f circ=%.3f\n', rms(z), std(imag(z))/std(real(z)), abs(mean(z.^2))/mean(abs(z).^2));
[ber,nf,evm,info]=demodPlutoCapture(iq, fs);
fprintf('STAGE2 HOST DECODE of FPGA-Tx cable signal: %s\n', info);
save('stage2_capture.mat','iq');
release(tx); release(rx);
