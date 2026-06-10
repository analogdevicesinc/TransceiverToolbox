% Host COMPLEX tone via DMA -> definitive capture-path I/Q test (no DDS ambiguity).
addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
uri='ip:10.0.0.146'; fc=2.4e9;
rxq=adi.ADRV9002.Rx('uri',uri); rxq.EnabledChannels=1; fs=rxq.SamplingRate; release(rxq);
if isnan(fs)||fs<=0, fs=7.68e6; end
fprintf('stock design SamplingRate = %g Hz\n', fs);
f0=fs/8;                                   % complex tone at +fs/8
N=2^15; x=exp(1j*2*pi*f0/fs*(0:N-1)).';    % UNAMBIGUOUS complex exponential
xi=complex(int16(real(x)*2^14),int16(imag(x)*2^14));
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=N;
tx(xi);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^16; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end;
y=[]; for k=1:15,[y,v]=rx(); end
z=double(y); z=z(abs(z)>0);
fprintf('=== host complex tone @ +%.0f kHz ===\n', f0/1e3);
fprintf('  std(Q)/std(I)=%.3f  |E[z^2]|/E|z|^2=%.3f  (complex tone: ratio~1, circ~0)\n', std(imag(z))/std(real(z)), abs(mean(z.^2))/mean(abs(z).^2));
Z=abs(fftshift(fft(z.*hann(numel(z))))).^2; f=((0:numel(z)-1)/numel(z)-0.5)*fs;
pP=sum(Z(abs(f-f0)<60e3)); pN=sum(Z(abs(f+f0)<60e3));
[~,pk]=max(Z);
fprintf('  peak at %+.0f kHz | power(+f0)=%.3g power(-f0)=%.3g | IMAGE-REJECTION=%.1f dB\n', f(pk)/1e3, pP,pN, 10*log10(pP/max(pN,eps)));
ir=10*log10(pP/max(pN,eps)); if ir>15, fprintf('  >>> CLEAN complex Rx path (capture FIXED)\n'); else, fprintf('  >>> still real/imbalanced (ir=%.1f dB)\n',ir); end
release(tx); try,release(rx);catch,end
