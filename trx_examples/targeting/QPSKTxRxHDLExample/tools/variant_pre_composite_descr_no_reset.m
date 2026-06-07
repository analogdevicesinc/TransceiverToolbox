% variant_pre_composite_descr_no_reset -- composite_descr_no_reset
%
% Test hypothesis: the 7.27% BER is from descrambler reset firing at wrong
% cycle. If we force startIn=0 (no reset), and the descrambler is genuinely
% multiplicative/self-synchronizing, BER should drop to ~0 after the first
% K bits of each packet (K=7 for x^7+x^3+1 multiplicative descrambler).
% If additive (state-based), BER goes to ~50%.

sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);

descr = [sys '/TxRxComposite/Receiver/QPSK Rx/HDL Data Descrambler'];

% Find the wire feeding the descrambler's startIn input (port 2).
descrPH = get_param(descr, 'PortHandles');
startIn_line = get_param(descrPH.Inport(2), 'Line');
assert(startIn_line ~= -1, 'startIn not connected');
src = get_param(startIn_line, 'SrcBlockHandle');
fprintf('startIn currently driven by: %s\n', get_param(src, 'Name'));

% Delete the existing connection
delete_line(startIn_line);

% Add a Constant block emitting boolean(0) and connect it to startIn.
% (Resettable Synchronous delays require boolean reset; Ground emits double.)
gndPath = [sys '/TxRxComposite/Receiver/QPSK Rx/descr_startIn_gnd'];
add_block('built-in/Constant', gndPath, 'Value','false', ...
    'OutDataTypeStr','boolean', 'SampleTime','-1', ...
    'Position', [50 900 90 920]);
add_line([sys '/TxRxComposite/Receiver/QPSK Rx'], 'descr_startIn_gnd/1', 'HDL Data Descrambler/2', 'autorouting','on');
fprintf('Forced HDL Data Descrambler/startIn = boolean(false) (no LFSR reset).\n');

% Patch hdlworkflow_loopback.m for the IOInterface mappings (so DMA capture works)
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt, 'variant_pre_composite_descr_no_reset')
    patch = sprintf([ ...
        '%% --- variant_pre_composite_descr_no_reset: route taps to DMA ---\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
        '%% --- end variant_pre_composite_descr_no_reset ---\n'], sys, sys, sys, sys, sys, sys);
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
