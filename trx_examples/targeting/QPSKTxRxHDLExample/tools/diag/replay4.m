addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
m='sim_internal_baseline_TB'; load_system(m);
for v={'Spectrum Analyzer','Spectrum Analyzer1','Time Scope'}, try, set_param([m '/' v{1}],'Commented','on'); catch, end; end
R={};
for src=[false true]
  set_param([m '/TxSourceControl'],'Value', mat2str(src));
  tag = ternary(src,'sim-Tx','HW-capture');
  crashed=false; nprint=0; cs=[];
  try
    out=evalc('so=sim(m);');
    nprint=numel(strfind(out,'ADI Hello World'));
    v=so.get('simAfterCS'); if isa(v,'timeseries'), d=double(squeeze(v.Data)); else, d=double(squeeze(v)); end
    if isreal(d)&&ndims(d)==2&&min(size(d))==2, if size(d,1)==2,d=d.';end; cs=d(:,1)+1j*d(:,2); else cs=d(:); end
  catch ME
    crashed=true; emsg=regexprep(ME.message,'\s+',' ');
  end
  if crashed
    fprintf('[%s] sim CRASHED (decode produced non-ASCII garbage) => signal NOT decodable. (%s)\n', tag, emsg(1:min(60,end)));
  else
    cs=cs(abs(cs)>0); xn=cs/mean(abs(cs)); p4=unwrap(angle(xn.^4)); n=(1:numel(p4))'; P=polyfit(n,p4,1);
    ev=sqrt(mean(abs(xn/sqrt(2)-(sign(real(xn))+1j*sign(imag(xn)))/sqrt(2)).^2));
    fprintf('[%s] OK: ADIprints=%d simAfterCS N=%d EVM=%.3f s4slope=%.3g resid_std=%.3f |s|cv=%.3f\n', ...
       tag, nprint, numel(cs), ev, P(1), std(p4-polyval(P,n)), std(abs(cs))/mean(abs(cs)));
    R.(matlab.lang.makeValidName(tag))=cs;
  end
end
save('replay_cs.mat','-struct','R');
function o=ternary(c,a,b), if c,o=a;else,o=b;end; end
