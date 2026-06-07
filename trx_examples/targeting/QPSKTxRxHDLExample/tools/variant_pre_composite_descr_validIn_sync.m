% variant_pre_composite_descr_validIn_sync -- composite_descr_validIn_sync
%
% Per [[qpsk-descrambler-verilog-analysis]]:
% - HDL Data Descrambler LFSR shifts only when `Delay1_out1` (validIn registered)
%   is high.
% - If validIn has ANY glitch within a packet, Rx LFSR shifts a different number
%   of times than Tx scrambler did → position-dependent error ramp inside packet.
% - The op2 variant added InputPipeline=1 (1 extra register on all 4 inputs)
%   but didn't help — needs more aggressive synchronization specifically on validIn.
%
% Fix: insert 2 additional Delay blocks IN SERIES on the wire from
% QPSK Demodulator/validOut to HDL Data Descrambler/validIn. This adds 2
% register stages, allowing synth more slack on the validIn signal path and
% (combined with the existing internal Delay1) gives total 3 cycles of
% registering before validIn reaches the LFSR shift gate.

sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);

qpskRx = [sys '/TxRxComposite/Receiver/QPSK Rx'];
descr = [qpskRx '/HDL Data Descrambler'];
demod = [qpskRx '/QPSK Demodulator'];

% Idempotency check
try
    found = ~isempty(find_system([qpskRx '/validIn_sync1'], 'SearchDepth', 0));
catch
    found = false;
end
if found
    fprintf('variant_pre_composite_descr_validIn_sync: already instrumented, skipping.\n');
    return;
end

% Find the wire from Demodulator/validOut (outport 4) → Descrambler/validIn (inport 4)
demodPH = get_param(demod, 'PortHandles');
validOut_line = get_param(demodPH.Outport(4), 'Line');
assert(validOut_line ~= -1, 'Demodulator validOut not connected');

% Verify it goes to the descrambler's port 4
dst_blocks = get_param(validOut_line, 'DstBlockHandle');
dst_ports = get_param(validOut_line, 'DstPortHandle');
foundDescIdx = 0;
for k = 1:numel(dst_blocks)
    blk = get_param(dst_blocks(k), 'Name');
    portNum = get_param(dst_ports(k), 'PortNumber');
    if strcmp(blk, 'HDL Data Descrambler') && portNum == 4
        foundDescIdx = k;
        break;
    end
end
assert(foundDescIdx > 0, 'Demodulator validOut does not feed Descrambler/validIn');
fprintf('Found Demodulator/validOut → Descrambler/validIn line\n');

% Delete that specific line segment (validIn fanin to descrambler)
delete_line(qpskRx, 'QPSK Demodulator/4', 'HDL Data Descrambler/4');

% Add 2 Delay blocks (no reset, just register-delays)
sync1 = [qpskRx '/validIn_sync1'];
sync2 = [qpskRx '/validIn_sync2'];
add_block('simulink/Discrete/Delay', sync1, ...
    'DelayLength','1', ...
    'Position',[100 950 130 980]);
add_block('simulink/Discrete/Delay', sync2, ...
    'DelayLength','1', ...
    'Position',[160 950 190 980]);

% Wire: Demodulator/4 → sync1 → sync2 → Descrambler/4
add_line(qpskRx, 'QPSK Demodulator/4', 'validIn_sync1/1', 'autorouting','on');
add_line(qpskRx, 'validIn_sync1/1',    'validIn_sync2/1', 'autorouting','on');
add_line(qpskRx, 'validIn_sync2/1',    'HDL Data Descrambler/4', 'autorouting','on');

fprintf('Inserted 2-stage Delay synchronizer on validIn path:\n');
fprintf('  QPSK Demod/validOut → validIn_sync1 → validIn_sync2 → HDL Data Descrambler/validIn\n');

% Patch hdlworkflow_loopback.m for the IOInterface mappings (so DMA capture works)
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt, 'variant_pre_composite_descr_validIn_sync')
    patch = sprintf([ ...
        '%% --- variant_pre_composite_descr_validIn_sync: route taps to DMA ---\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
        '%% --- end variant_pre_composite_descr_validIn_sync ---\n'], sys, sys, sys, sys, sys, sys);
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
