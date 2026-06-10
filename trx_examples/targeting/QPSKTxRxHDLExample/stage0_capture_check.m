% stage0_capture_check.m -- Verifiable Composite stage 0: capture-path validation.
% Host complex tone through the new host path (tx_source_select=1 -> IP Data IN ->
% DAC MUX -> DAC -> cable -> ADC), captured via the raw-ADC passthrough
% (debugI/Q -> IP Data 0/1 OUT -> Rx DMA). Image rejection must exceed 40 dB.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6; f0=fs/8; N=2^15;
BistRegisters.sshExec('busybox devmem 0x9D000118 32 1',8);   % tx_source = host
BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % rx = cable
x=exp(1j*2*pi*f0/fs*(0:N-1)).'; xi=complex(int16(real(x)*2^14),int16(imag(x)*2^14));
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=N; tx(xi);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^16; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
y=[]; for k=1:15,[y,~]=rx(); end
z=double(y); z=z(abs(z)>0);
Z=abs(fftshift(fft(z.*hann(numel(z))))).^2; f=((0:numel(z)-1)/numel(z)-0.5)*fs;
pP=sum(Z(abs(f-f0)<60e3)); pN=sum(Z(abs(f+f0)<60e3)); ir=10*log10(pP/max(pN,eps));
fprintf('stage0: N=%d  std(Q)/std(I)=%.3f  image-rejection=%.1f dB (gate: >40)\n', ...
    numel(z), std(imag(z))/std(real(z)), ir);
release(tx); try,release(rx);catch,end
assert(ir>40, 'capture path still corrupted'); fprintf('STAGE0 PASS\n');
