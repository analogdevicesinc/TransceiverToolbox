here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
pa='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction';
fprintf('=== Phase Ambiguity subsystems ===\n');
s=find_system(pa,'SearchDepth',2,'LookUnderMasks','all','FollowLinks','on','BlockType','SubSystem');
for i=1:numel(s), fprintf('  %s\n', strrep(s{i},[pa '/'],'')); end
fprintf('\n=== Estimator I/O + key blocks ===\n');
est=[pa '/Phase Ambiguity Estimator'];
pc=get_param(est,'PortConnectivity');
for k=1:numel(pc), if ~isempty(pc(k).SrcBlock)&&pc(k).SrcBlock~=-1, try,fprintf('  EST IN%d <- %s\n',k,get_param(pc(k).SrcBlock,'Name'));catch,end; end; end
% key params: any threshold/length/accumulator constants
fprintf('\n=== Estimator Constant/Gain/Compare values ===\n');
for bt={'Constant','Gain','RelationalOperator','Switch'}
  b=find_system(est,'LookUnderMasks','all','FollowLinks','on','BlockType',bt{1});
  for i=1:numel(b)
    try, v=get_param(b{i},'Value'); catch, try,v=get_param(b{i},'Gain');catch,v='';end; end
    if ~isempty(v)&&ischar(v), fprintf('  [%s] %s = %s\n', bt{1}, strrep(b{i},[est '/'],''), v); end
  end
end
% how the preamble length / accumulation is set
fprintf('\n=== params referencing preamble/length/avg in workspace ===\n');
