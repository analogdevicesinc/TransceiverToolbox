% SCRIPT (base workspace) -- sweep Channel impairments, measure channel-path BER
% via the standalone Receiver + QPSKTxRxVerification logic. Finds which impairment
% (and level) reproduces the HW deterministic ~50%.
here=fileparts('impair_sweep.m'); addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
m='sim_internal_baseline_TB'; load_system(m);
for v={'Spectrum Analyzer','Spectrum Analyzer1','Time Scope'}
  try, set_param([m '/' v{1}],'Commented','on'); catch, end
end
ch=[m '/Channel'];
% baseline mask values
base.CFO='1e3'; base.CPO='135'; base.fractionalTimingOffset='0.55';
base.timingFrequencyOffset='2'; base.EbN0dB='40';
setmask=@(nm,val) set_param(ch,'CFO',base.CFO,'CPO',base.CPO, ...
   'fractionalTimingOffset',base.fractionalTimingOffset, ...
   'timingFrequencyOffset',base.timingFrequencyOffset,'EbN0dB',base.EbN0dB);
% sweep list: {param, value}
sweep = {
  'CFO','1e3'; 'CFO','50e3'; 'CFO','100e3'; 'CFO','150e3'; 'CFO','200e3'; ...
  'timingFrequencyOffset','2'; 'timingFrequencyOffset','20'; 'timingFrequencyOffset','100'; 'timingFrequencyOffset','500'; ...
  'CPO','0'; 'CPO','45'; 'CPO','90' };
fprintf('\n%-22s %8s  %8s  %10s  %s\n','config','errBits','rxBits','BER%','BIST_be');
for i=1:size(sweep,1)
  setmask();                              % reset to baseline
  set_param(ch, sweep{i,1}, sweep{i,2});  % apply one change
  try
    so=sim(m);
    evalin('base','QPSKTxRxVerification;');  % populates nErrBits/nReceivedBits in base
    ne=evalin('base','nErrBits'); nr=evalin('base','nReceivedBits');
    try, be=evalin('base','bit_errors_out'); if ~isnumeric(be), be=be.Data(end); else be=be(end); end; catch, be=NaN; end
    fprintf('%-12s=%-9s %8g  %8g  %10.4f  %g\n', sweep{i,1}, sweep{i,2}, ne, nr, 100*ne/max(1,nr), be);
  catch ME
    fprintf('%-12s=%-9s  ERROR: %s\n', sweep{i,1}, sweep{i,2}, regexprep(ME.message,'\s+',' '));
  end
end
