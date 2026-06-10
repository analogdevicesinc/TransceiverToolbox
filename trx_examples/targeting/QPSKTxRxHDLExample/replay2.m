addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
m='sim_internal_baseline_TB'; load_system(m);
for v={'Spectrum Analyzer','Spectrum Analyzer1','Time Scope'}, try, set_param([m '/' v{1}],'Commented','on'); catch, end; end
% comment the crashy printer MATLAB Function (keep RxOut To Workspace)
pf=[m '/Receiver/Capture Data Bits/MATLAB Function'];
try, set_param(pf,'Commented','on'); fprintf('commented printer\n'); catch ME, fprintf('comment failed: %s\n',ME.message); end
runone=@(label) fprintf('[%s]\n',label);
function showcs(so, tag)
  try, v=so.get('simAfterCS'); d=v.Values.Data; d=double(squeeze(d)); if ~isreal(d(1)), x=d(:); else x=d(:,1)+1j*d(:,2); end
    x=x(abs(x)>0); xn=x/mean(abs(x)); p4=unwrap(angle(xn.^4)); n=(1:numel(p4))'; P=polyfit(n,p4,1);
    ev=sqrt(mean(abs(xn/sqrt(2)-(sign(real(xn))+1j*sign(imag(xn)))/sqrt(2)).^2));
    fprintf('  [%s] simAfterCS: N=%d EVM=%.3f s4slope=%.4g rad/sym resid_std=%.3f |s|std/mean=%.3f\n', ...
      tag, numel(x), ev, P(1), std(p4-polyval(P,n)), std(abs(x))/mean(abs(x)));
  catch ME, fprintf('  [%s] simAfterCS extract failed: %s\n', tag, ME.message); end
end
% (1) HW capture replay
set_param([m '/TxSourceControl'],'Value','false');
out=evalc('so=sim(m);'); showcs(so,'HW-capture');
% (2) sim Tx (good) for comparison
set_param([m '/TxSourceControl'],'Value','true');
out=evalc('so=sim(m);'); showcs(so,'sim-Tx');
