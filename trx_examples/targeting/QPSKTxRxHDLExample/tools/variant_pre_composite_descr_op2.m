% variant_pre_composite_descr_op2 -- composite_descr_op2
%
% Hypothesis (from composite_postdemod findings):
% - QPSK Demod output is bit-perfect (autocorrelation 100% at packet period)
% - Therefore the 7.27% BIST baseline must come from the HDL Data Descrambler
% - Vivado WHS=6ps indicates extremely tight timing margins
% - The descrambler's LFSR path: 7 register stages + 2 XOR gates combinational
%   → likely metastability on the data path causing per-bit drift
%
% Fix attempt #1: tell HDL Coder to insert OutputPipeline registers around
% the HDL Data Descrambler and around its internal Synchronous delays.
% This breaks long combinational paths, giving synthesis more slack.

sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);

descr = [sys '/TxRxComposite/Receiver/QPSK Rx/HDL Data Descrambler'];

% Add output pipelining: 2 stages on the descrambler output.
% This re-times the data path between descrambler and BIST counter,
% giving the LFSR XOR→register path more slack to meet timing.
hdlset_param(descr, 'OutputPipeline', 2);
fprintf('Added OutputPipeline=2 to HDL Data Descrambler\n');

% Also add InputPipeline so all 4 inputs come in registered (matched delay).
hdlset_param(descr, 'InputPipeline', 1);
fprintf('Added InputPipeline=1 to HDL Data Descrambler\n');

% Pipeline the internal XOR gates as well.
xors = find_system(descr, 'LookUnderMasks','all','FollowLinks','on', ...
    'BlockType','Logic');
for k = 1:numel(xors)
    b = xors{k};
    n = get_param(b,'Name');
    if contains(lower(n),'xor')
        try
            hdlset_param(b, 'OutputPipeline', 1);
            fprintf('  Added OutputPipeline=1 to %s\n', b);
        catch err
            fprintf('  Skip %s (%s)\n', b, err.message);
        end
    end
end

% Patch hdlworkflow_loopback.m for the IOInterface mappings (so DMA capture works)
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt, 'variant_pre_composite_descr_op2')
    patch = sprintf([ ...
        '%% --- variant_pre_composite_descr_op2: route taps to DMA ---\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
        '%% --- end variant_pre_composite_descr_op2 ---\n'], sys, sys, sys, sys, sys, sys);
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
