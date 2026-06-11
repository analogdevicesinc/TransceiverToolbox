% DDS tone capture: clean on-chip complex tone -> DAC -> cable -> ADC -> host.
% A balanced capture shows ONE spectral spike at +f; Q-collapse/imbalance shows a
% mirror image at -f. Decides: is the Rx capture path collapsing Q, or the Tx/signal?
addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
uri='ip:10.0.0.146'; fc=2.4e9; ftone=1e6;
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DDS';
tx.DDSFrequencies=[ftone ftone; 0 0]; tx.DDSScales=[1 0; 0 0]; tx.DDSPhases=[0 0;0 0];
tx();
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^16; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end;
y=[]; for k=1:15,[y,v]=rx(); end
z=double(y); z=z(abs(z)>0); I=real(z); Q=imag(z);
fs=7.68e6;
fprintf('=== DDS tone (%.1f MHz) capture ===\n', ftone/1e6);
fprintf('  std(Q)/std(I)=%.3f  |E[z^2]|/E|z|^2=%.3f  (balanced tone: ratio~1, circ~1 for single tone)\n', std(Q)/std(I), abs(mean(z.^2))/mean(abs(z).^2));
Z=abs(fftshift(fft(z.*hann(numel(z))))).^2; f=((0:numel(z)-1)/numel(z)-0.5)*fs;
[~,pk]=max(Z); fpk=f(pk);
% image rejection: power at +fpk vs -fpk
function p=bandpow(Z,f,fc,bw), p=sum(Z(abs(f-fc)<bw)); end
pP=bandpow(Z,f,abs(fpk),50e3); pN=bandpow(Z,f,-abs(fpk),50e3);
fprintf('  spectral peak at %+.0f kHz | power(+f)=%.3g power(-f image)=%.3g | image-rejection=%.1f dB\n', fpk/1e3, pP, pN, 10*log10(pP/max(pN,eps)));
fprintf('  (high image-rejection = clean Rx path; ~0 dB = Q collapsed/real -> capture path broken)\n');
release(tx); try,release(rx);catch,end
