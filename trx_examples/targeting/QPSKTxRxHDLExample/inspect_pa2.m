here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
est='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator';
for sub={'Subsystem','Subsystem1'}
  p=[est '/' sub{1}];
  fprintf('\n===== %s =====\n',sub{1});
  b=find_system(p,'LookUnderMasks','all','FollowLinks','on','Type','block');
  for i=1:numel(b)
    try,bt=get_param(b{i},'BlockType');catch,bt='?';end
    nm=strrep(b{i},[p '/'],''); extra='';
    for pr={'Value','Gain','Operator','Function','Criteria','Constant','Inputs','LogicOp','Relop','OutDataTypeStr'}
      try, v=get_param(b{i},pr{1}); if ~isempty(v)&&ischar(v), extra=[extra ' ' pr{1} '=' v]; end; catch, end
    end
    fprintf('  [%s] %s%s\n',bt,nm,extra);
  end
end
% Compare block (estimator->corrector mapping) and Average Estimates reset length
fprintf('\n===== Compare-To-Constant (quantizer threshold) =====\n');
c=find_system(est,'LookUnderMasks','all','FollowLinks','on','BlockType','Constant');
for i=1:numel(c), try,fprintf('  %s = %s\n',strrep(c{i},[est '/'],''),get_param(c{i},'Value'));catch,end; end
