% variant_pre_composite_postagc.m  --  composite_postagc_capture
%
% DIAG variant: add a 64-word capture buffer at AXI x"11C" wired to the
% post-AGC complex sample inside the composite Receiver. This lets the
% host read post-AGC IQ via AXI to compare against a MATLAB reference
% receiver -- pinpointing whether the 0.39% internal-loopback BER enters
% before or after the AGC.
%
% Selector: iq_debug_mux (6 LSBs, 0..63) selects which 32-bit word.
% Each word = {I[31:16], Q[15:0]} reinterpreted as uint16 from sfix16_En14.
% Adapted from tools/variant_pre_postagc_iq.m (V21) to the composite topology
% (TxRxComposite subsystem instead of TxRxLoopback).
%
% Idempotent.

sys     = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop    = [sys '/TxRxComposite'];
rx      = [loop '/Receiver'];
qpsk_rx = [rx '/QPSK Rx'];

% Idempotency check at composite level
if ~isempty(find_system(loop,'SearchDepth',1,'BlockType','Outport','Name','capture_word_out'))
    fprintf('variant_pre_composite_postagc: capture_word_out already present, skipping.\n');
    save_system(sys,[],'OverwriteIfChangedOnDisk',true);
    return;
end

% ---- Inside QPSK Rx: tap AGC output, expose as outports ----
if isempty(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport','Name','postagc_I_out'))
    agcBlk = [qpsk_rx '/Automatic Gain Control'];
    phAgc  = get_param(agcBlk, 'PortHandles');
    src_agc_data  = phAgc.Outport(1);   % complex IQ
    src_agc_valid = phAgc.Outport(2);   % validOut

    c2r = [qpsk_rx '/postAGC_C2R'];
    add_block('simulink/Math Operations/Complex to Real-Imag', c2r);
    add_line(qpsk_rx, src_agc_data, get_param(c2r,'PortHandles').Inport(1), 'autorouting','on');

    nQpskOut = numel(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport'));
    add_block('built-in/Outport', [qpsk_rx '/postagc_I_out'],     'Port', num2str(nQpskOut+1));
    add_block('built-in/Outport', [qpsk_rx '/postagc_Q_out'],     'Port', num2str(nQpskOut+2));
    add_block('built-in/Outport', [qpsk_rx '/postagc_valid_out'], 'Port', num2str(nQpskOut+3));
    phC2R = get_param(c2r,'PortHandles');
    add_line(qpsk_rx, phC2R.Outport(1), get_param([qpsk_rx '/postagc_I_out'],    'PortHandles').Inport(1), 'autorouting','on');
    add_line(qpsk_rx, phC2R.Outport(2), get_param([qpsk_rx '/postagc_Q_out'],    'PortHandles').Inport(1), 'autorouting','on');
    add_line(qpsk_rx, src_agc_valid,    get_param([qpsk_rx '/postagc_valid_out'],'PortHandles').Inport(1), 'autorouting','on');
    fprintf('variant_pre_composite_postagc: added 3 post-AGC outports to QPSK Rx.\n');
end

% ---- Receiver-level capture buffer ----
if isempty(find_system(rx,'SearchDepth',1,'Name','PostAGCCapture'))
    dtcI = [rx '/postagc_I_DTC'];
    dtcQ = [rx '/postagc_Q_DTC'];
    add_block('simulink/Signal Attributes/Data Type Conversion', dtcI);
    add_block('simulink/Signal Attributes/Data Type Conversion', dtcQ);
    set_param(dtcI, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');
    set_param(dtcQ, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');

    qpskBlks = find_system(rx,'SearchDepth',1,'BlockType','SubSystem','Name','QPSK Rx');
    qpskBlk  = qpskBlks{1};
    phQpsk   = get_param(qpskBlk,'PortHandles');
    idx_I=0; idx_Q=0; idx_V=0;
    qpskOutports = find_system(qpsk_rx, 'SearchDepth',1, 'LookUnderMasks','all','FollowLinks','on', 'BlockType','Outport');
    for kk=1:numel(qpskOutports)
        nm = get_param(qpskOutports{kk}, 'Name');
        pn = str2double(get_param(qpskOutports{kk}, 'Port'));
        switch nm
            case 'postagc_I_out',     idx_I = pn;
            case 'postagc_Q_out',     idx_Q = pn;
            case 'postagc_valid_out', idx_V = pn;
        end
    end
    assert(idx_I>0 && idx_Q>0 && idx_V>0, 'postagc_* outports missing from QPSK Rx');
    fprintf('variant_pre_composite_postagc: postagc outport indices I=%d Q=%d V=%d\n', idx_I, idx_Q, idx_V);
    src_postagc_I = phQpsk.Outport(idx_I);
    src_postagc_Q = phQpsk.Outport(idx_Q);
    src_postagc_V = phQpsk.Outport(idx_V);

    add_line(rx, src_postagc_I, get_param(dtcI,'PortHandles').Inport(1), 'autorouting','on');
    add_line(rx, src_postagc_Q, get_param(dtcQ,'PortHandles').Inport(1), 'autorouting','on');

    pac = [rx '/PostAGCCapture'];
    add_block('simulink/User-Defined Functions/MATLAB Function', pac);
    pacLines = { ...
        'function out_word = postAGCCap(valid, Iu, Qu, dstart, addr_sel)' ...
        '%#codegen' ...
        '% Capture 64 packed-IQ samples after first dstart pulse, then freeze.' ...
        'persistent buffer write_idx armed' ...
        'if isempty(buffer)' ...
        '    buffer = zeros(1,64,''uint32'');' ...
        '    write_idx = uint8(0);' ...
        '    armed = uint8(0);' ...
        'end' ...
        'if dstart && armed == uint8(0)' ...
        '    armed = uint8(1);' ...
        '    write_idx = uint8(0);' ...
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

    cdb = [rx '/Capture Data Bits'];
    phCdb = get_param(cdb,'PortHandles');
    srcDataSrt = get_param(get_param(phCdb.Inport(2),'Line'), 'SrcPortHandle');
    srcSel     = get_param([rx '/iq_debug_mux'],'PortHandles').Outport(1);

    add_line(rx, src_postagc_V,                            get_param(pac,'PortHandles').Inport(1), 'autorouting','on');
    add_line(rx, get_param(dtcI,'PortHandles').Outport(1), get_param(pac,'PortHandles').Inport(2), 'autorouting','on');
    add_line(rx, get_param(dtcQ,'PortHandles').Outport(1), get_param(pac,'PortHandles').Inport(3), 'autorouting','on');
    add_line(rx, srcDataSrt,                               get_param(pac,'PortHandles').Inport(4), 'autorouting','on');
    add_line(rx, srcSel,                                   get_param(pac,'PortHandles').Inport(5), 'autorouting','on');

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
    fprintf('variant_pre_composite_postagc: capture buffer wired to AXI x"11C".\n');
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
