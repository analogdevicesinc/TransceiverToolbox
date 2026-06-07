% variant_pre_composite_postagc.m  --  composite_postagc_capture (v2)
%
% DIAG variant: add a 64-word capture buffer at AXI x"11C" that captures
% whatever debugI/debugQ/debugValid currently expose -- i.e., whatever
% iq_debug_mux selects in the existing 4-tap QPSK_Rx internal mux:
%     iq_debug_mux=0 -> post-AGC IQ
%     iq_debug_mux=1 -> post-Symbol-Sync IQ
%     iq_debug_mux=2 -> post-Carrier-Sync IQ
%     iq_debug_mux=3 -> constellation IQ
%
% Host procedure: write iq_debug_mux=<tap> before/at reboot, wait for the
% buffer to fill (it freezes after 64 samples), then write iq_debug_mux=0..63
% to read each word.  The QPSK_Rx internal mux is unaffected by the
% post-capture readout since the buffer is already frozen.
%
% This variant does NOT modify QPSK_Rx internals -- it only fans out the
% debugI/debugQ/debugValid lines that already exist inside the Receiver
% subsystem (where QPSK_Rx exposes outports 5,6,7).  That avoids the
% AGC/Delay3 data-integrity error the previous (V21-style) overlay hit.

sys     = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop    = [sys '/TxRxComposite'];
rx      = [loop '/Receiver'];

% Idempotency check at composite level.
if ~isempty(find_system(loop,'SearchDepth',1,'BlockType','Outport','Name','capture_word_out'))
    fprintf('variant_pre_composite_postagc: capture_word_out already present, skipping.\n');
    save_system(sys,[],'OverwriteIfChangedOnDisk',true);
    return;
end

% --- locate the existing Receiver outports for debugI / debugQ / debugValid ---
% In the composite Receiver these are outports named debugI, debugQ, debugValid
% (per build_composite_local.m's wiring).
rxOutPorts = find_system(rx,'SearchDepth',1,'BlockType','Outport');
namesToHandles = containers.Map();
for k=1:numel(rxOutPorts)
    nm = get_param(rxOutPorts{k},'Name');
    namesToHandles(nm) = rxOutPorts{k};
end
assert(namesToHandles.isKey('debugI') && namesToHandles.isKey('debugQ') && namesToHandles.isKey('debugValid'), ...
    'Receiver-level debugI/debugQ/debugValid outports not found');

% Their inport's source line (= the upstream signal from QPSK Rx outport mux).
srcDebugI = get_param(get_param(namesToHandles('debugI'),    'PortHandles').Inport(1), 'Line');
srcDebugQ = get_param(get_param(namesToHandles('debugQ'),    'PortHandles').Inport(1), 'Line');
srcDebugV = get_param(get_param(namesToHandles('debugValid'),'PortHandles').Inport(1), 'Line');
assert(all([srcDebugI srcDebugQ srcDebugV] ~= -1), 'debugI/debugQ/debugValid inport lines unconnected');
phI = get_param(srcDebugI, 'SrcPortHandle');
phQ = get_param(srcDebugQ, 'SrcPortHandle');
phV = get_param(srcDebugV, 'SrcPortHandle');

% --- type conversion (sfix16_En14 -> uint16 stored-integer) for packing ---
dtcI = [rx '/postagc_I_DTC'];
dtcQ = [rx '/postagc_Q_DTC'];
add_block('simulink/Signal Attributes/Data Type Conversion', dtcI);
add_block('simulink/Signal Attributes/Data Type Conversion', dtcQ);
set_param(dtcI, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');
set_param(dtcQ, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');

% Fan out debugI/Q into the DTCs (existing outport line is preserved).
add_line(rx, phI, get_param(dtcI,'PortHandles').Inport(1), 'autorouting','on');
add_line(rx, phQ, get_param(dtcQ,'PortHandles').Inport(1), 'autorouting','on');

% --- Rate Transition for iq_debug_mux ---
% iq_debug_mux Inport is at composite-boundary 1/15.36 MHz but the debug taps run
% at the QPSK-Rx internal rate (slower). Bridge with an explicit RateTransition
% so the MATLAB Function block sees all inputs at one rate (HDL Coder otherwise
% reports "Data integrity issue between PostAGCCapture and DTC").
rtSel = [rx '/iq_debug_mux_RT'];
add_block('built-in/RateTransition', rtSel, 'OutPortSampleTime','-1');

% --- capture buffer (64 samples, packed {I[31:16], Q[15:0]} per word) ---
% NOTE: signature deliberately omits dstart -- in the composite, dstart is at a
% different (slower) rate than the debug-IQ taps, and MATLAB Function blocks
% reject multirate inputs in HDL Coder. Buffer arms IMMEDIATELY at boot and
% freezes after 64 valid samples; the host reboots to recapture.
pac = [rx '/PostAGCCapture'];
add_block('simulink/User-Defined Functions/MATLAB Function', pac);
pacLines = { ...
    'function out_word = postAGCCap(valid, Iu, Qu, addr_sel)' ...
    '%#codegen' ...
    '% Wait ~1M clock-enable ticks (~65 ms at 15.36 MHz) for the Rx chain' ...
    '% to start producing real post-AGC IQ, THEN arm and capture 64 samples.' ...
    'persistent buffer write_idx armed wait_cnt' ...
    'if isempty(buffer)' ...
    '    buffer = zeros(1,64,''uint32'');' ...
    '    write_idx = uint8(0);' ...
    '    armed = uint8(0);' ...
    '    wait_cnt = uint32(0);' ...
    'end' ...
    'if armed == uint8(0)' ...
    '    if wait_cnt < uint32(1000000)' ...
    '        wait_cnt = wait_cnt + uint32(1);' ...
    '    else' ...
    '        armed = uint8(1);' ...
    '        write_idx = uint8(0);' ...
    '    end' ...
    'end' ...
    'word = bitor(bitshift(uint32(Iu), int8(16)), uint32(Qu));' ...
    'if armed == uint8(1) && valid && write_idx < uint8(64)' ...
    '    buffer(write_idx + uint8(1)) = word;' ...
    '    write_idx = write_idx + uint8(1);' ...
    '    if write_idx >= uint8(64)' ...
    '        armed = uint8(2);' ...
    '    end' ...
    'end' ...
    'addrU = uint32(addr_sel);' ...
    'if addrU < uint32(64)' ...
    '    out_word = buffer(addrU + uint32(1));' ...
    'else' ...
    '    out_word = uint32(0);' ...
    'end'};
pacScript = strjoin(pacLines, sprintf('\n'));
sfRoot = sfroot;
emCharts = sfRoot.find('-isa','Stateflow.EMChart');
found = false;
for k=1:numel(emCharts)
    if strcmp(emCharts(k).Path, pac), emCharts(k).Script = pacScript; found = true; break; end
end
if ~found, error('PostAGCCapture EMChart not found after add_block'); end

% --- wire capture-buffer inputs ---
% addr_sel comes from iq_debug_mux via the RateTransition (bridges composite
% 1/15.36 MHz boundary down to the debug-tap rate). No dstart input -- buffer
% arms immediately at boot (see MATLAB Function above).
srcSel = get_param([rx '/iq_debug_mux'],'PortHandles').Outport(1);
add_line(rx, srcSel, get_param(rtSel,'PortHandles').Inport(1), 'autorouting','on');

add_line(rx, phV,                                          get_param(pac,'PortHandles').Inport(1), 'autorouting','on');
add_line(rx, get_param(dtcI,'PortHandles').Outport(1),     get_param(pac,'PortHandles').Inport(2), 'autorouting','on');
add_line(rx, get_param(dtcQ,'PortHandles').Outport(1),     get_param(pac,'PortHandles').Inport(3), 'autorouting','on');
add_line(rx, get_param(rtSel,'PortHandles').Outport(1),    get_param(pac,'PortHandles').Inport(4), 'autorouting','on');

% --- new outport at Receiver-level, then again at composite level w/ AXI x"11C" ---
nRxOut   = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
rxNewOut = [rx '/capture_word_out'];
add_block('built-in/Outport', rxNewOut, 'Port', num2str(nRxOut+1));
add_line(rx, get_param(pac,'PortHandles').Outport(1), get_param(rxNewOut,'PortHandles').Inport(1), 'autorouting','on');

rxPort   = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
phRxLoop = get_param([loop '/Receiver'],'PortHandles');
loopNewOut = [loop '/capture_word_out'];
nLoopOut = numel(find_system(loop,'SearchDepth',1,'BlockType','Outport'));
add_block('built-in/Outport', loopNewOut, 'Port', num2str(nLoopOut+1));
add_line(loop, phRxLoop.Outport(rxPort), get_param(loopNewOut,'PortHandles').Inport(1), 'autorouting','on');
hdlset_param(loopNewOut, 'IOInterface', 'AXI4-Lite');
hdlset_param(loopNewOut, 'IOInterfaceMapping', 'x"11C"');

fprintf('variant_pre_composite_postagc (v2): capture buffer at x"11C", tapping existing debugI/Q/Valid.\n');
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
