% variant_pre_composite_descr_ip2 -- composite_descr_ip2
%
% Per [[qpsk-descr-validin-only-delay-breaks]]: delaying validIn alone breaks
% data/valid synchronization. Need balanced delays on all 4 descrambler inputs.
%
% Per [[qpsk-descr-pipeline-no-help]]: InputPipeline=1 was tried (op2) — no
% improvement. This variant tries InputPipeline=2 instead — 2 register stages
% on EACH of dataIn, startIn, endIn, validIn, keeping them aligned.

sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);

descr = [sys '/TxRxComposite/Receiver/QPSK Rx/HDL Data Descrambler'];

% Set InputPipeline=2 — 2 register stages on all 4 inputs (balanced delay)
hdlset_param(descr, 'InputPipeline', 2);
% Keep OutputPipeline=2 from op2 experiment (helps output timing)
hdlset_param(descr, 'OutputPipeline', 2);
fprintf('Set HDL Data Descrambler InputPipeline=2, OutputPipeline=2\n');

% Patch hdlworkflow_loopback.m for the IOInterface mappings
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt, 'variant_pre_composite_descr_ip2')
    patch = sprintf([ ...
        '%% --- variant_pre_composite_descr_ip2: route taps to DMA ---\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
        '%% --- end variant_pre_composite_descr_ip2 ---\n'], sys, sys, sys, sys, sys, sys);
    anchor = sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
    idx = strfind(wfTxt, anchor);
    assert(~isempty(idx), 'anchor not found in %s', wfFile);
    insertAt = idx(1) + numel(anchor);
    if insertAt <= numel(wfTxt) && wfTxt(insertAt) == newline, insertAt = insertAt + 1; end
    newTxt = [wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];
    fid = fopen(wfFile, 'w'); fwrite(fid, newTxt); fclose(fid);
    fprintf('Patched %s with IOInterface mappings\n', wfFile);
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
