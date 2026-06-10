here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
% run model init so workspace vars exist
load_system('commhdlQPSKTxRx');
try, commhdlQPSKTxRxParameters; catch ME, fprintf('params err: %s\n',ME.message); end
for v={'integAvgLen','normCoarseFreqEst','CoarseFreqAvgLen','SamplesPerSymbol'}
  try, x=evalin('base',v{1}); fprintf('  %s = %s\n', v{1}, mat2str(x)); catch, fprintf('  %s = <undef>\n',v{1}); end
end
cfe='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Coarse Frequency Estimator';
fprintf('\n=== Gain1 actual ===\n');
try, fprintf('  Gain1 = %s\n', get_param([cfe '/Gain1'],'Gain')); catch, end
fprintf('\n=== Integrator subsystem (the averaging accumulator) ===\n');
b=find_system([cfe '/Integrator'],'LookUnderMasks','all','FollowLinks','on','Type','block');
for i=1:numel(b)
  try,bt=get_param(b{i},'BlockType');catch,bt='?';end
  nm=strrep(b{i},[cfe '/Integrator/'],''); ex='';
  for pr={'Value','Gain','Operator','Function','SampleTime'}
    try,v=get_param(b{i},pr{1}); if ischar(v)&&~isempty(v), ex=[ex ' ' pr{1} '=' v]; end;catch,end
  end
  fprintf('  [%s] %s%s\n',bt,regexprep(nm,'\s+',' '),ex);
end
% Is integAvgLen referenced by a HDL counter reset / delay length anywhere in CFC?
fprintf('\n=== blocks whose params reference integAvgLen / CoarseFreq ===\n');
cfc='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator';
allb=find_system(cfc,'LookUnderMasks','all','FollowLinks','on','Type','block');
for i=1:numel(allb)
  pn=get_param(allb{i},'ObjectParameters'); fn=fieldnames(pn);
  for j=1:numel(fn)
    try, val=get_param(allb{i},fn{j}); catch, continue; end
    if ischar(val)&&~isempty(regexpi(val,'integAvgLen|CoarseFreq'))
      fprintf('  %s . %s = %s\n', strrep(allb{i},[cfc '/'],''), fn{j}, regexprep(val,'\s+',' '));
    end
  end
end
