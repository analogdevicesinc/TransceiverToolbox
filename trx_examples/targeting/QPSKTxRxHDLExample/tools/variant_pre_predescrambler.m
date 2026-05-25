% V18_predescrambler: capture 1024 contiguous Rx bits at the QPSK
% Demodulator output (pre-Descrambler), using the same V16 buffer idiom
% but tapping the wires INTO the HDL Data Descrambler instead of out of it.
% Host MATLAB then runs the Descrambler in software and compares to the
% BIST reference -- this isolates whether the Descrambler is amplifying
% errors (Wave 1 Branch A) or whether the BER enters upstream.
%
% Selector: iq_debug_mux (5 LSBs, 0..31) -> selects which 32-bit word
% Output:   capture_word_out, AXI4-Lite x"11C"

sys     = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop    = [sys '/TxRxLoopback'];
rx      = [loop '/Receiver'];
qpsk_rx = [rx '/QPSK Rx'];

% --- V3 scalar patches (same as V16/V15) ---
ic = get_param(sys,'InitFcn');
ic = regexprep(ic,'UpsamplesRx\s*=\s*\d+\s*;','UpsamplesRx = 1;');
ic = regexprep(ic,'UpsamplesTx\s*=\s*\d+\s*;','UpsamplesTx = 1;');
set_param(sys,'InitFcn',ic);
for c = {[sys '/Transmitter/Input Data'], [sys '/TxRxLoopback/Transmitter/Input Data']}
  try, set_param(c{1},'Rsym','3.84e6'); catch, end
end
for cp = { ...
    [sys '/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/HDL Counter'], ...
    [sys '/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/HDL Counter3'], ...
    [sys '/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/HDL Counter'], ...
    [sys '/TxRxLoopback/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/HDL Counter3']}
  b = cp{1};
  try
    wl = get_param(b,'CountWordLen');
    if ~startsWith(strtrim(wl),'max(1,'), set_param(b,'CountWordLen', sprintf('max(1,%s)', wl)); end
    cm = get_param(b,'CountMax');
    if ~startsWith(strtrim(cm),'max(1,'), set_param(b,'CountMax', sprintf('max(1,%s)', cm)); end
  catch, end
end

% --- Idempotency marker: skip everything if loopback capture_word_out exists ---
if ~isempty(find_system(loop,'SearchDepth',1,'BlockType','Outport','Name','capture_word_out'))
    fprintf('V18 already instrumented; skipping insertions.\n');
    save_system(sys,[],'OverwriteIfChangedOnDisk',true);
    return;
end

% --- Expose pre-Descrambler signals as new outports of QPSK Rx ---
if isempty(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport','Name','predesc_data_out'))
    descBlk = [qpsk_rx '/HDL Data Descrambler'];
    phDesc  = get_param(descBlk, 'PortHandles');
    % HDL Data Descrambler inports: 1=dataIn, 2=startIn, 3=endIn, 4=validIn
    src_data  = get_param(get_param(phDesc.Inport(1),'Line'), 'SrcPortHandle');
    src_start = get_param(get_param(phDesc.Inport(2),'Line'), 'SrcPortHandle');
    src_valid = get_param(get_param(phDesc.Inport(4),'Line'), 'SrcPortHandle');

    nQpskOut = numel(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport'));
    add_block('built-in/Outport', [qpsk_rx '/predesc_data_out'],  'Port', num2str(nQpskOut+1));
    add_block('built-in/Outport', [qpsk_rx '/predesc_valid_out'], 'Port', num2str(nQpskOut+2));
    add_block('built-in/Outport', [qpsk_rx '/predesc_start_out'], 'Port', num2str(nQpskOut+3));
    add_line(qpsk_rx, src_data,  get_param([qpsk_rx '/predesc_data_out'], 'PortHandles').Inport(1),  'autorouting','on');
    add_line(qpsk_rx, src_valid, get_param([qpsk_rx '/predesc_valid_out'],'PortHandles').Inport(1),  'autorouting','on');
    add_line(qpsk_rx, src_start, get_param([qpsk_rx '/predesc_start_out'],'PortHandles').Inport(1),  'autorouting','on');
    fprintf('Added 3 predesc outports to QPSK Rx.\n');
end

% --- Insert BitCapture block at Receiver level (clone of V16) ---
if isempty(find_system(rx,'SearchDepth',1,'Name','BitCapture'))
    bc = [rx '/BitCapture'];
    add_block('simulink/User-Defined Functions/MATLAB Function', bc);
    bcLines = { ...
        'function out_word = bitCap(valid, datain, dstart, addr_sel)' ...
        '%#codegen' ...
        '% Capture 1024 bits into 32x32-bit buffer, dstart-armed, then freeze.' ...
        'persistent buffer write_idx armed' ...
        'if isempty(buffer)' ...
        '    buffer = zeros(1,32,''uint32'');' ...
        '    write_idx = uint16(0);' ...
        '    armed = uint8(0);' ...
        'end' ...
        'if dstart && armed == uint8(0)' ...
        '    armed = uint8(1);' ...
        '    write_idx = uint16(0);' ...
        'end' ...
        'if armed == uint8(1) && valid && write_idx < uint16(1024)' ...
        '    wordIdx = idivide(write_idx, uint16(32)) + uint16(1);' ...
        '    bitInWord = uint8(mod(write_idx, uint16(32)));' ...
        '    if datain' ...
        '        buffer(wordIdx) = bitor(buffer(wordIdx), bitshift(uint32(1), bitInWord));' ...
        '    end' ...
        '    write_idx = write_idx + uint16(1);' ...
        '    if write_idx >= uint16(1024)' ...
        '        armed = uint8(2);' ...
        '    end' ...
        'end' ...
        'addrU = uint32(addr_sel);' ...
        'if addrU < uint32(32)' ...
        '    out_word = buffer(addrU + uint32(1));' ...
        'else' ...
        '    out_word = uint32(0);' ...
        'end'};
    bcScript = strjoin(bcLines, sprintf('\n'));
    sfRoot = sfroot;
    emCharts = sfRoot.find('-isa','Stateflow.EMChart');
    found = false;
    for k=1:numel(emCharts)
        if strcmp(emCharts(k).Path, bc), emCharts(k).Script = bcScript; found = true; break; end
    end
    if ~found, error('BitCapture EMChart not found'); end

    % Resolve new QPSK Rx outports by NAME (Simulink may not place new
    % outports at the trailing port indices — observed in V17/V21 where
    % new ports landed at positions 1..3 with existing ports renumbered).
    qpskOuts = find_system(rx,'SearchDepth',1,'BlockType','SubSystem','Name','QPSK Rx');
    qpskBlk  = qpskOuts{1};
    phQpsk   = get_param(qpskBlk,'PortHandles');
    idx_data=0; idx_valid=0; idx_start=0;
    qpskOutports = find_system(qpsk_rx, 'SearchDepth',1, 'LookUnderMasks','all','FollowLinks','on', 'BlockType','Outport');
    for kk=1:numel(qpskOutports)
        nm = get_param(qpskOutports{kk}, 'Name');
        pn = str2double(get_param(qpskOutports{kk}, 'Port'));
        switch nm
            case 'predesc_data_out',  idx_data  = pn;
            case 'predesc_valid_out', idx_valid = pn;
            case 'predesc_start_out', idx_start = pn;
        end
    end
    assert(idx_data>0 && idx_valid>0 && idx_start>0, ...
        'predesc_* outports missing from QPSK Rx after instrumentation');
    fprintf('V18: predesc outport indices data=%d valid=%d start=%d\n', idx_data, idx_valid, idx_start);
    src_predesc_data  = phQpsk.Outport(idx_data);
    src_predesc_valid = phQpsk.Outport(idx_valid);
    src_predesc_start = phQpsk.Outport(idx_start);
    srcSel = get_param([rx '/iq_debug_mux'],'PortHandles').Outport(1);

    add_line(rx, src_predesc_valid, get_param(bc,'PortHandles').Inport(1), 'autorouting','on');
    add_line(rx, src_predesc_data,  get_param(bc,'PortHandles').Inport(2), 'autorouting','on');
    add_line(rx, src_predesc_start, get_param(bc,'PortHandles').Inport(3), 'autorouting','on');
    add_line(rx, srcSel,            get_param(bc,'PortHandles').Inport(4), 'autorouting','on');

    nRxOut = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
    rxNewOut = [rx '/capture_word_out'];
    add_block('built-in/Outport', rxNewOut, 'Port', num2str(nRxOut+1));
    add_line(rx, get_param(bc,'PortHandles').Outport(1), get_param(rxNewOut,'PortHandles').Inport(1), 'autorouting','on');

    rxPort = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
    phRxLoop = get_param([loop '/Receiver'],'PortHandles');
    loopNewOut = [loop '/capture_word_out'];
    nLoopOut = numel(find_system(loop,'SearchDepth',1,'BlockType','Outport'));
    add_block('built-in/Outport', loopNewOut, 'Port', num2str(nLoopOut+1));
    add_line(loop, phRxLoop.Outport(rxPort), get_param(loopNewOut,'PortHandles').Inport(1), 'autorouting','on');

    hdlset_param(loopNewOut, 'IOInterface', 'AXI4-Lite');
    hdlset_param(loopNewOut, 'IOInterfaceMapping', 'x"11C"');
    fprintf('V18_predescrambler insertion complete.\n');
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
