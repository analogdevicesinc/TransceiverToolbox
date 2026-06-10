addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/streaming/adrv9002');  % profile files
uri='ip:10.0.0.146'; fc=2.4e9; ftone=1e6;
% Load a complex-baseband CMOS 7.68 MHz profile on the chip
rxp=adi.ADRV9002.Rx('uri',uri); rxp.EnableCustomProfile=true;
rxp.CustomProfileFileName='lte_5_cmos_api_48_8_7.json';
rxp.CustomStreamFileName='lte_5_cmos_api_48_8_7.stream';
try, rxp(); fprintf('profile loaded. SamplingRate=%g\n', rxp.SamplingRate); catch ME, fprintf('profile load ERR: %s\n',ME.message); end
release(rxp);
% DDS tone
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DDS';
tx.DDSFrequencies=[ftone ftone;0 0]; tx.DDSScales=[1 0;0 0]; tx.DDSPhases=[0 0;0 0]; tx();
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^16; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end;
y=[]; for k=1:15,[y,v]=rx(); end
z=double(y); z=z(abs(z)>0); fs=rx.SamplingRate; if isnan(fs)||fs<=0, fs=7.68e6; end
fprintf('=== DDS tone w/ lte_5_cmos profile, fs=%g ===\n', fs);
fprintf('  std(Q)/std(I)=%.3f  |E[z^2]|/E|z|^2=%.3f\n', std(imag(z))/std(real(z)), abs(mean(z.^2))/mean(abs(z).^2));
Z=abs(fftshift(fft(z.*hann(numel(z))))).^2; f=((0:numel(z)-1)/numel(z)-0.5)*fs;
[~,pk]=max(Z); fpk=f(pk);
pP=sum(Z(abs(f-abs(fpk))<50e3)); pN=sum(Z(abs(f+abs(fpk))<50e3));
fprintf('  peak %+.0f kHz | image-rejection=%.1f dB (high=clean I/Q; ~0=Q dead)\n', fpk/1e3, 10*log10(pP/max(pN,eps)));
release(tx); try,release(rx);catch,end
