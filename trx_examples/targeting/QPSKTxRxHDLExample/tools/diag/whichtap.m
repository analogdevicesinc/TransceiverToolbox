addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
load_system('commhdlQPSKTxRx');
rec='commhdlQPSKTxRx/Receiver';
pc=get_param(rec,'PortConnectivity');
% find the Receiver subsystem's outports 8 and 9 internal sources
op=find_system(rec,'SearchDepth',1,'BlockType','Outport');
for i=1:numel(op)
  pn=str2double(get_param(op{i},'Port'));
  if pn>=7
    oc=get_param(op{i},'PortConnectivity');
    src='?'; if ~isempty(oc(1).SrcBlock)&&isnumeric(oc(1).SrcBlock)&&any(oc(1).SrcBlock~=-1), src=get_param(oc(1).SrcBlock,'Name'); end
    fprintf('Receiver outport %d (%s) <- %s\n', pn, get_param(op{i},'Name'), regexprep(src,'\s+',' '));
  end
end
