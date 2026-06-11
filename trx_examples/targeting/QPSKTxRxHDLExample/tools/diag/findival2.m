here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
anc={'commhdlQPSKTxRx/Receiver', ...
 'commhdlQPSKTxRx/Receiver/QPSK Rx', ...
 'commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer', ...
 'commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator', ...
 'commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Coarse Frequency Estimator'};
for i=1:numel(anc)
  try, mi=get_param(anc{i},'MaskInitialization'); catch, mi=''; end
  if ~isempty(mi) && ~isempty(regexpi(mi,'integAvgLen'))
    fprintf('\n##### MaskInit on %s #####\n', strrep(anc{i},'commhdlQPSKTxRx/',''));
    lines=strsplit(mi,char(10));
    for L=1:numel(lines), if ~isempty(regexpi(lines{L},'integAvgLen|AvgLen|Coarse|freqRes|Rsym|fs')), fprintf('   %s\n', strtrim(lines{L})); end; end
  end
  try, mn=get_param(anc{i},'MaskNames'); catch, mn={}; end
  if ~isempty(mn), fprintf('  [%s] mask params: %s\n', strrep(anc{i},'commhdlQPSKTxRx/',''), strjoin(mn,', ')); end
end
% Also evaluate integAvgLen in the mask workspace of the CFE
cfe='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Coarse Frequency Estimator';
for blk={cfe, [cfe '/Gain1']}
  try, ws=get_param(blk{1},'MaskWSVariables'); 
    for k=1:numel(ws), if strcmp(ws(k).Name,'integAvgLen'), fprintf('  >> integAvgLen (mask ws of %s) = %s\n', strrep(blk{1},'commhdlQPSKTxRx/',''), mat2str(ws(k).Value)); end; end
  catch, end
end
