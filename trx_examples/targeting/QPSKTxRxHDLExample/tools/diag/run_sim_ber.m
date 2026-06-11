here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
m='sim_internal_baseline_TB';
load_system(m);
% report the control constants (what mode the TB runs)
for c={'rx_input_select_const','iq_debug_mux_const','TxSourceControl','TxSourceControl1','rstCS_const'}
  try, fprintf('  %s = %s\n', c{1}, get_param([m '/' c{1}],'Value')); catch, end
end
fprintf('StopTime=%s\n', get_param(m,'StopTime'));
t0=tic; so=sim(m); fprintf('sim ran in %.1f s\n', toc(t0));
function v=lastval(so,nm)
  v=NaN;
  try, e=so.(nm); if isa(e,'timeseries'), v=double(e.Data(end)); else, v=double(e(end)); end; catch, end
end
p=lastval(so,'packets_out'); be=lastval(so,'bit_errors_out'); ct=lastval(so,'count_out');
fprintf('\n=== SIM BIST: packets=%g  bit_errors=%g  count=%g  BER(per120)=%.5f%%\n', p, be, ct, 100*be/max(1,p*120));
save('sim_baseline_out.mat','-struct','so');
who_so = fieldnames(so);
fprintf('logged vars: %s\n', strjoin(who_so', ', '));
