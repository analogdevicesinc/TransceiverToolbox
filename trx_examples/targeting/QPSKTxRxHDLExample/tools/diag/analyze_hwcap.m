addpath(pwd);
S=load('rx_capture_adrv9002_hdl.mat'); ts=S.inputData;
x=double(ts.Data); x=squeeze(x); if size(x,2)>1 && ~isreal(x(1)), end
x=x(:); 
% if stored as Nx2 real, combine
if isreal(x) && numel(x)>1
  S2=load('rx_capture_adrv9002_hdl.mat'); d=squeeze(S2.inputData.Data);
  if ndims(d)==2 && min(size(d))==2, d=d(:,1)+1j*d(:,2); x=d(:); end
end
t=ts.Time; Fs=1/median(diff(t));
fprintf('=== rx_capture_adrv9002_hdl.mat: N=%d  Fs=%.4g Hz  complex=%d ===\n', numel(x), Fs, ~isreal(x));
fprintf('  |x| mean=%.3g std/mean=%.3f   real[%.3g,%.3g] imag[%.3g,%.3g]\n', mean(abs(x)), std(abs(x))/mean(abs(x)), min(real(x)),max(real(x)),min(imag(x)),max(imag(x)));
% spectrum peak (carrier offset?)
X=abs(fftshift(fft(x.*hann(numel(x))))); f=((0:numel(x)-1)/numel(x)-0.5)*Fs;
[~,pk]=max(X); fprintf('  spectral peak at %.3g Hz (%.1f%% of Fs)\n', f(pk), 100*f(pk)/Fs);
% s^4 CFO ramp on the raw samples (if oversampled, decimate roughly)
xn=x/mean(abs(x));
p4=unwrap(angle(xn.^4)); n=(1:numel(p4))';
P=polyfit(n,p4,1);
fprintf('  s^4 phase slope=%.3g rad/samp => CFO ~ %.4g Hz (carrier)\n', P(1), P(1)/4/(2*pi)*Fs);
fprintf('  s^4 residual std after linear=%.3f rad\n', std(p4-polyval(P,n)));
