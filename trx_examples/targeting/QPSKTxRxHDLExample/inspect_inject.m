here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
m='sim_internal_baseline_TB'; load_system(m);
% StopTime + how packets_out etc are saved
fprintf('StopTime=%s  SaveFormat=%s  SaveOutput=%s SignalLogging=%s\n', get_param(m,'StopTime'), ...
  get_param(m,'SaveFormat'), get_param(m,'SaveOutput'), get_param(m,'SignalLogging'));
% The Switch + TxSourceControl: what selects Rx input source
fprintf('\n=== TxSourceControl / Switch / RxCaptureFromHW wiring ===\n');
for blk={'TxSourceControl','TxSourceControl1','Switch','RxCaptureFromHW','adc_dataInI_const','adc_dataInQ_const','rx_input_select_const'}
  p=[m '/' blk{1}];
  try
    bt=get_param(p,'BlockType'); v='';
    try v=get_param(p,'Value'); catch, end
    try v=[v ' file=' get_param(p,'FileName')]; catch, end
    pc=get_param(p,'PortConnectivity'); dst={};
    for k=1:numel(pc), if ~isempty(pc(k).DstBlock)&&isnumeric(pc(k).DstBlock), for d=1:numel(pc(k).DstBlock), try dst{end+1}=regexprep(get_param(pc(k).DstBlock(d),'Name'),'\s+',' '); catch, end; end; end; end
    src={};
    for k=1:numel(pc), if ~isempty(pc(k).SrcBlock)&&isnumeric(pc(k).SrcBlock)&&any(pc(k).SrcBlock~=-1), try src{end+1}=regexprep(get_param(pc(k).SrcBlock,'Name'),'\s+',' '); catch, end; end; end
    fprintf('  [%s] %s  val=%s\n     src={%s} dst={%s}\n', bt, blk{1}, v, strjoin(src,','), strjoin(dst,','));
  catch ME, fprintf('  %s: %s\n', blk{1}, ME.message); end
end
% how does TxRxComposite get its adc_dataIn / what feeds Receiver input in this TB?
fprintf('\n=== what feeds TxRxComposite inputs ===\n');
p=[m '/TxRxComposite']; pc=get_param(p,'PortConnectivity');
for k=1:numel(pc)
  if ~isempty(pc(k).SrcBlock)&&isnumeric(pc(k).SrcBlock)&&any(pc(k).SrcBlock~=-1)
    try fprintf('  in port %s <- %s\n', pc(k).Type, regexprep(get_param(pc(k).SrcBlock,'Name'),'\s+',' ')); catch, end
  end
end
