addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
m='sim_internal_baseline_TB'; load_system(m);
for v={'Spectrum Analyzer','Spectrum Analyzer1','Time Scope'}, try, set_param([m '/' v{1}],'Commented','on'); catch, end; end
set_param([m '/Receiver/Capture Data Bits/MATLAB Function'],'Commented','on');
function x=getsig(so,nm)
  x=[]; try, v=so.get(nm); catch, try, v=evalin('base',nm); catch, return; end; end
  if isa(v,'timeseries'), d=v.Data; elseif isa(v,'Simulink.SimulationData.Dataset'), d=v{1}.Values.Data; else, d=v; end
  d=double(squeeze(d));
  if isreal(d) && ndims(d)==2 && min(size(d))==2
    if size(d,1)==2, d=d.'; end; x=d(:,1)+1j*d(:,2);
  else, x=d(:); end
end
function rep(so,tag)
  x=getsig(so,'simAfterCS'); x=x(abs(x)>0);
  if isempty(x), fprintf('  [%s] simAfterCS empty\n',tag); return; end
  xn=x/mean(abs(x)); p4=unwrap(angle(xn.^4)); n=(1:numel(p4))'; P=polyfit(n,p4,1);
  ev=sqrt(mean(abs(xn/sqrt(2)-(sign(real(xn))+1j*sign(imag(xn)))/sqrt(2)).^2));
  fprintf('  [%-10s] simAfterCS N=%d EVM=%.3f  s4slope=%.4g rad/sym  resid_std=%.3f  |s|cv=%.3f\n', ...
     tag, numel(x), ev, P(1), std(p4-polyval(P,n)), std(abs(x))/mean(abs(x)));
end
set_param([m '/TxSourceControl'],'Value','false'); so=sim(m); rep(so,'HW-capture');
set_param([m '/TxSourceControl'],'Value','true');  so=sim(m); rep(so,'sim-Tx');
