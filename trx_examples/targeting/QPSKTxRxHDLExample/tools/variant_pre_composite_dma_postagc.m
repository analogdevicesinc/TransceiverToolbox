% variant_pre_composite_dma_postagc -- composite_dma_postagc
%
% Maps the existing TxRxComposite debug outports (debugI, debugQ, debugValid)
% to the Jupiter reference design's Rx DMA path (IP Data 0 OUT, IP Data 1 OUT,
% IP Data Valid OUT). This makes the post-AGC IQ tap available to libiio via
% adi.ADRV9002.Rx — no hand-rolled AXI register buffer, no devmem polling.
%
% The composite already has debugI / debugQ / debugValid wired to the source
% line that feeds the Receiver's existing 4-tap iq_debug_mux (mux=0 = post-AGC
% by default). Build_composite.m adds the outports but hdlworkflow_loopback.m
% has empty "Set Outport HDL parameters" stubs for them — that's why libiio
% Rx DMA returned zeros: the ports were unmapped, synthesized as floating top-
% level signals that the reference design tied off.
%
% This overlay patches hdlworkflow_loopback.m in cwd (a copy made by
% make_composite_variant_kit.sh) by inserting the three missing
% hdlset_param IOInterface calls into the empty stub area.

sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);

% Idempotency: skip if our marker is already present.
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if contains(wfTxt, 'variant_pre_composite_dma_postagc')
    fprintf('variant_pre_composite_dma_postagc: hdlworkflow already patched, skipping.\n');
    return;
end

% Reference-design Rx DMA wiring + IIO device tree:
% On-board `iio_attr` reports `axi-adrv9002-rx-lpc` exposes voltage0_i at
% index 0 and voltage0_q at index 1 (consecutive slots). So util_adc_1_pack
% packs the DMA stream as (slot0=I, slot1=Q) — not (slot0=I, slot2=Q) as the
% ports.json input-direction mapping would suggest.
% Therefore:
%   debugI    -> IP Data 0 OUT  (lands on data_out_rx_0 -> pack slot 0 -> voltage0_i)
%   debugQ    -> IP Data 1 OUT  (lands on data_out_rx_1 -> pack slot 1 -> voltage0_q)
%   debugI1/Q1 -> slots 2/3 (libiio channel 1; voltage1_* doesn't exist on this build)
patch = sprintf([ ...
    '%% --- variant_pre_composite_dma_postagc: route post-AGC debug taps to Rx DMA ---\n' ...
    '%% util_adc_1_pack packs (I=slot0, Q=slot1) consecutively per IIO device tree\n' ...
    '%% (axi-adrv9002-rx-lpc exposes voltage0_i index 0 + voltage0_q index 1).\n' ...
    'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
    '%% debugI1/Q1 land on the second-channel slots; libiio chan 1 unused on this build.\n' ...
    'hdlset_param(''%s/TxRxComposite/debugI1'',    ''IOInterface'', ''IP Data 2 OUT [0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugI1'',    ''IOInterfaceMapping'', ''[0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugQ1'',    ''IOInterface'', ''IP Data 3 OUT [0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugQ1'',    ''IOInterfaceMapping'', ''[0:15]'');\n' ...
    '%% --- end variant_pre_composite_dma_postagc ---\n'], ...
    sys, sys, sys, sys, sys, sys, sys, sys, sys, sys);

% Insert immediately after the bit_errors_out mapping (a safe anchor that
% the build_composite stub always emits).
anchor = sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
idx = strfind(wfTxt, anchor);
assert(~isempty(idx), 'anchor not found in %s', wfFile);
insertAt = idx(1) + numel(anchor);
% Skip the trailing newline of the anchor line
if insertAt <= numel(wfTxt) && wfTxt(insertAt) == newline
    insertAt = insertAt + 1;
end
newTxt = [wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];

% Write back.
fid = fopen(wfFile, 'w');
assert(fid > 0, 'cannot write %s', wfFile);
fwrite(fid, newTxt);
fclose(fid);
fprintf('variant_pre_composite_dma_postagc: patched %s (added %d-char IOInterface stub for debug taps)\n', ...
        wfFile, numel(patch));

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
