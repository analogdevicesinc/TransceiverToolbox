here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
m='sim_internal_baseline_TB'; load_system(m);
% disable viz blocks for speed
for v={'Spectrum Analyzer','Spectrum Analyzer1','Time Scope'}
  try, set_param([m '/' v{1}],'Commented','on'); catch, end
end
ch=[m '/Channel'];
function ber=run_and_ber(m,tag)
  t0=tic; so=sim(m); dt=toc(t0);
  els=so.who; 
  function v=lv(nm), v=NaN; try, x=so.get(nm); if isa(x,'timeseries'), v=double(x.Data(end)); elseif isa(x,'Simulink.SimulationData.Dataset'), v=double(x{1}.Values.Data(end)); else v=double(x(end)); end; catch, end; end
  p=lv('packets_out'); be=lv('bit_errors_out'); ct=lv('count_out');
  fprintf('[%s] %.0fs | packets=%g bit_errors=%g count=%g  BER120=%.4f%%\n', tag, dt, p, be, ct, 100*be/max(1,p*120));
  ber=100*be/max(1,p*120);
end
% default channel
fprintf('Channel default: CFO=%s CPO=%s\n', get_param(ch,'CFO'), get_param(ch,'CPO'));
run_and_ber(m,'default');
% extreme CFO
set_param(ch,'CFO','150e3'); run_and_ber(m,'CFO=150k');
set_param(ch,'CFO','1e3');
% list all output element names once
so=sim(m); fprintf('OUTPUT ELEMENTS: %s\n', strjoin(so.who,', '));
