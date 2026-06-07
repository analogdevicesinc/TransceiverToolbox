% variant_pre_composite_bigbuf_postagc -- composite_bigbuf_postagc
%
% Same as composite_postagc_capture (DIAG v5) but with a 4096-sample buffer
% instead of 64 samples. Goal: capture enough HW data (~270 µs ≈ many symbols
% / several packets at post-AGC tap) to feed into a MATLAB-level Rx chain
% and reproduce the ~7% per-checked-bit hardware BER in simulation.

sys     = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop    = [sys '/TxRxComposite'];
rx      = [loop '/Receiver'];

% Idempotency
if ~isempty(find_system(loop,'SearchDepth',1,'BlockType','Outport','Name','capture_word_out'))
    fprintf('variant_pre_composite_bigbuf_postagc: already instrumented, skipping.\n');
    save_system(sys,[],'OverwriteIfChangedOnDisk',true);
    return;
end

% Locate existing debugI/debugQ/debugValid lines at Receiver level
rxOutPorts = find_system(rx,'SearchDepth',1,'BlockType','Outport');
namesToHandles = containers.Map();
for k=1:numel(rxOutPorts)
    namesToHandles(get_param(rxOutPorts{k},'Name')) = rxOutPorts{k};
end
assert(namesToHandles.isKey('debugI') && namesToHandles.isKey('debugQ') && namesToHandles.isKey('debugValid'));

srcDebugI = get_param(get_param(namesToHandles('debugI'),    'PortHandles').Inport(1), 'Line');
srcDebugQ = get_param(get_param(namesToHandles('debugQ'),    'PortHandles').Inport(1), 'Line');
srcDebugV = get_param(get_param(namesToHandles('debugValid'),'PortHandles').Inport(1), 'Line');
phI = get_param(srcDebugI, 'SrcPortHandle');
phQ = get_param(srcDebugQ, 'SrcPortHandle');
phV = get_param(srcDebugV, 'SrcPortHandle');

% DTCs
dtcI = [rx '/postagc_I_DTC']; dtcQ = [rx '/postagc_Q_DTC'];
add_block('simulink/Signal Attributes/Data Type Conversion', dtcI);
add_block('simulink/Signal Attributes/Data Type Conversion', dtcQ);
set_param(dtcI, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');
set_param(dtcQ, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');
add_line(rx, phI, get_param(dtcI,'PortHandles').Inport(1), 'autorouting','on');
add_line(rx, phQ, get_param(dtcQ,'PortHandles').Inport(1), 'autorouting','on');

% Rate-transition iq_debug_mux to match debug-tap rate
rtSel = [rx '/iq_debug_mux_RT'];
add_block('built-in/RateTransition', rtSel, 'OutPortSampleTime','-1');

% Capture buffer — 4096 entries, write_idx uint16, addr_sel uint32
pac = [rx '/PostAGCCapture'];
add_block('simulink/User-Defined Functions/MATLAB Function', pac);
pacLines = { ...
    'function out_word = postAGCCap(valid, Iu, Qu, addr_sel)' ...
    '%#codegen' ...
    '% 1M-cycle warm-up then capture 4096 packed IQ samples and freeze.' ...
    'persistent buffer write_idx armed wait_cnt' ...
    'if isempty(buffer)' ...
    '    buffer = zeros(1,4096,''uint32'');' ...
    '    write_idx = uint16(0);' ...
    '    armed = uint8(0);' ...
    '    wait_cnt = uint32(0);' ...
    'end' ...
    'if armed == uint8(0)' ...
    '    if wait_cnt < uint32(1000000)' ...
    '        wait_cnt = wait_cnt + uint32(1);' ...
    '    else' ...
    '        armed = uint8(1);' ...
    '        write_idx = uint16(0);' ...
    '    end' ...
    'end' ...
    'word = bitor(bitshift(uint32(Iu), int8(16)), uint32(Qu));' ...
    'if armed == uint8(1) && valid && write_idx < uint16(4096)' ...
    '    buffer(write_idx + uint16(1)) = word;' ...
    '    write_idx = write_idx + uint16(1);' ...
    '    if write_idx >= uint16(4096)' ...
    '        armed = uint8(2);' ...
    '    end' ...
    'end' ...
    'addrU = uint32(addr_sel);' ...
    'if addrU < uint32(4096)' ...
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
if ~found, error('PostAGCCapture EMChart not found'); end

% Wire inputs
srcSel = get_param([rx '/iq_debug_mux'],'PortHandles').Outport(1);
add_line(rx, srcSel, get_param(rtSel,'PortHandles').Inport(1), 'autorouting','on');
add_line(rx, phV,                                          get_param(pac,'PortHandles').Inport(1), 'autorouting','on');
add_line(rx, get_param(dtcI,'PortHandles').Outport(1),     get_param(pac,'PortHandles').Inport(2), 'autorouting','on');
add_line(rx, get_param(dtcQ,'PortHandles').Outport(1),     get_param(pac,'PortHandles').Inport(3), 'autorouting','on');
add_line(rx, get_param(rtSel,'PortHandles').Outport(1),    get_param(pac,'PortHandles').Inport(4), 'autorouting','on');

% Outport at Receiver and composite level w/ AXI x"11C"
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

% Tell HDL Coder to map the buffer's persistent variable to BRAM (not distributed flops).
% Without this the 4096*32-bit buffer is synthesized as ~131k flops, overflowing xczu3eg.
hdlset_param(pac, 'MapPersistentVarsToRAM', 'on');
fprintf('  MapPersistentVarsToRAM=on (use BRAM for buffer)\n');

fprintf('variant_pre_composite_bigbuf_postagc: 4096-sample buffer wired.\n');
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
