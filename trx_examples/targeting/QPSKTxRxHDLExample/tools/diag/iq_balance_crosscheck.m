addpath(pwd);
function rep(x,tag)
  x=x(:); x=x(abs(x)>0); I=real(x); Q=imag(x);
  g=std(Q)/std(I); irr=abs(mean(x.^2))/mean(abs(x).^2);
  fprintf('  [%-28s] N=%6d  std(Q)/std(I)=%.3f  |E[x^2]|/E|x|^2=%.3f  realRange=[%.3g,%.3g] imagRange=[%.3g,%.3g]\n',...
    tag, numel(x), g, irr, min(I),max(I),min(Q),max(Q));
end
fprintf('=== I/Q balance cross-check across captures (same debug-DMA path?) ===\n');
% raw_adc_dma cable (debug-DMA, suspect)
S=load('raw_adc_cable.mat'); rep(double(S.sel1),'raw_adc_dma cable (debugDMA)');
% rf_obs post-AGC + post-SS (SAME debug-DMA mechanism)
C=load('capture_strong_lock.mat');
if isfield(C,'tap0'), rep(double(C.tap0),'rf_obs tap0 postAGC (debugDMA)'); end
if isfield(C,'tap1'), rep(double(C.tap1),'rf_obs tap1 postSS (debugDMA)'); end
% old HW capture (different path) - reference
H=load('rx_capture_adrv9002_hdl.mat'); d=squeeze(H.inputData.Data);
if isreal(d)&&min(size(d))==2, if size(d,1)==2,d=d.';end; d=d(:,1)+1j*d(:,2); end
rep(double(d(:)),'rx_capture_hdl (other path)');
