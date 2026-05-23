function p = qpskFindTxInputData(sys)
% Locate the "Input Data" block inside the Transmitter (which may be at the top
% level of the model OR nested inside a TxRxLoopback composite subsystem).
candidates = { ...
  [sys '/Transmitter/Input Data'], ...
  [sys '/TxRxLoopback/Transmitter/Input Data']};
for k=1:numel(candidates)
  try, get_param(candidates{k},'Name'); p = candidates{k}; return; catch, end
end
error('qpskFindTxInputData: cannot find Transmitter/Input Data under %s', sys);
end
