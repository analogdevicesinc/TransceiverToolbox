here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
cor='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector';
cm=[cor '/Complex to Magnitude-Angle'];
fprintf('=== Complex to Magnitude-Angle block ===\n');
try, fprintf('  System: %s\n', get_param(cm,'System')); catch, end
for pr={'OutputFormat','OutputDataType','Output','ApproximationMethod'}
  try,v=get_param(cm,pr{1}); if ischar(v), fprintf('  %s = %s\n',pr{1},v); end;catch,end
end
% which output port -> Terminator vs -> Delay10?
pc=get_param(cm,'PortConnectivity');
for k=1:numel(pc)
  if ~isempty(pc(k).DstBlock)
    for d=1:numel(pc(k).DstBlock)
      try, fprintf('  OUT port type=%s -> %s\n', pc(k).Type, regexprep(get_param(pc(k).DstBlock(d),'Name'),'\s+',' ')); catch, end
    end
  end
end
% Reciprocal subsystem guts
fprintf('\n=== Reciprocal subsystem ===\n');
rb=find_system([cor '/Reciprocal'],'LookUnderMasks','all','FollowLinks','on','Type','block');
for i=1:numel(rb)
  try,bt=get_param(rb{i},'BlockType');catch,bt='?';end
  if any(strcmp(bt,{'?','SubSystem'}))&&i>1, continue; end
  nm=strrep(rb{i},[cor '/Reciprocal/'],''); ex='';
  for pr={'Function','Operator','Value','Gain'}, try,v=get_param(rb{i},pr{1}); if ischar(v)&&~isempty(v),ex=[ex ' ' pr{1} '=' v];end;catch,end; end
  fprintf('  [%s] %s%s\n',bt,nm,ex);
end
% Multiport Switch1: the 4-fold selector?
fprintf('\n=== Multiport Switch1 ===\n');
ms=[cor '/Multiport Switch1'];
for pr={'Inputs','DataPortOrder','zeroidx','DataPortForDefault'}
  try,v=get_param(ms,pr{1}); if ischar(v),fprintf('  %s = %s\n',pr{1},v);end;catch,end
end
