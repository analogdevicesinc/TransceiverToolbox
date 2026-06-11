addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
m='sim_internal_baseline_TB'; load_system(m);
for v={'Spectrum Analyzer','Spectrum Analyzer1','Time Scope'}, try, set_param([m '/' v{1}],'Commented','on'); catch, end; end
ch=[m '/Channel'];
set_param(ch,'CFO','1e3','CPO','135','fractionalTimingOffset','0.55','timingFrequencyOffset','2','EbN0dB','40');
% Which path prints "ADI Hello World"? compare default vs huge CFO + huge timing drift
cfgs={'CFO','1e3'; 'CFO','200e3'; 'timingFrequencyOffset','2000'; 'EbN0dB','-5'};
base={'CFO','1e3';'CPO','135';'fractionalTimingOffset','0.55';'timingFrequencyOffset','2';'EbN0dB','40'};
for i=1:size(cfgs,1)
  for b=1:size(base,1), set_param(ch,base{b,1},base{b,2}); end
  set_param(ch,cfgs{i,1},cfgs{i,2});
  t0=tic; out=evalc('sim(m);'); dt=toc(t0);
  n=numel(strfind(out,'ADI Hello World'));
  % also read frames-synchronized Display + composite BIST
  fprintf('%-14s=%-8s : %2.0fs  ADIHelloWorld_prints=%d\n', cfgs{i,1}, cfgs{i,2}, dt, n);
end
