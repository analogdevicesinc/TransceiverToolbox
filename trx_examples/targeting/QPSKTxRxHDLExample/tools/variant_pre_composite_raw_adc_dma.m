% raw_adc_dma: route the RAW cable ADC (adc_dataInI/Q/validIn, pre-receiver) to the
% Rx DMA via the composite debug outports, so the host can capture the ACTUAL cable
% signal and (a) analyze it vs ideal QPSK (EVM/CFO/IQ-imbalance), (b) replay it through
% the sim receiver to settle receiver-vs-signal. Replaces the post-AGC tap feeding
% debugI/Q/Valid with the raw ADC inputs, then maps debug taps to IP Data 0/1 OUT.
sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];

% --- re-wire composite debug outports to the raw ADC inputs ---
% (base composite wires Receiver/5,6,7 -> debugI,debugQ,debugValid)
function rewire(loop, srcInport, dstOutport)
  % delete whatever currently feeds dstOutport, connect srcInport instead
  oc = get_param([loop '/' dstOutport],'PortConnectivity');
  if ~isempty(oc(1).SrcBlock) && isnumeric(oc(1).SrcBlock) && any(oc(1).SrcBlock~=-1)
    sn = get_param(oc(1).SrcBlock,'Name'); sp = oc(1).SrcPort + 1;
    try, delete_line(loop, sprintf('%s/%d', sn, sp), [dstOutport '/1']); catch, end
  end
  add_line(loop, [srcInport '/1'], [dstOutport '/1'], 'autorouting','on');
end
rewire(loop, 'adc_dataInI', 'debugI');
rewire(loop, 'adc_dataInQ', 'debugQ');
rewire(loop, 'adc_validIn', 'debugValid');
fprintf('raw_adc_dma: debugI/Q/Valid now carry raw adc_dataInI/Q/validIn\n');

% --- map debug taps to Rx DMA (same as dma_postagc) ---
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt, 'raw_adc_dma')
    patch = sprintf([ ...
        '%% --- raw_adc_dma: route raw-ADC debug taps to Rx DMA ---\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
        '%% --- end raw_adc_dma ---\n'], sys, sys, sys, sys, sys, sys);
    anchor = sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
    idx = strfind(wfTxt, anchor); assert(~isempty(idx), 'anchor not found');
    insertAt = idx(1) + numel(anchor);
    if insertAt <= numel(wfTxt) && wfTxt(insertAt) == newline, insertAt = insertAt + 1; end
    newTxt = [wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];
    fid = fopen(wfFile,'w'); fwrite(fid,newTxt); fclose(fid);
    fprintf('raw_adc_dma: patched hdlworkflow_loopback.m (debug taps -> Rx DMA)\n');
end
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
