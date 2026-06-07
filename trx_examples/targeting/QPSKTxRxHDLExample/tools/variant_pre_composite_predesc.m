% variant_pre_composite_predesc.m  --  composite_predesc_capture
%
% Capture 1024 contiguous bits at the QPSK Demodulator output (pre-Descrambler).
% Adapted from V18_predescrambler to the composite topology (TxRxComposite
% subsystem, no dstart input, 1M-cycle warm-up).
%
% Goal: localize whether the 7.27% per-checked-bit BER originates AT the
% Demodulator (hard-decision quantization at decision boundaries) or in the
% HDL Data Descrambler (LFSR reset/state timing). Run a software descrambler
% on the captured pre-descrambler stream and compare to BIST reference.

sys     = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop    = [sys '/TxRxComposite'];
rx      = [loop '/Receiver'];
qpsk_rx = [rx '/QPSK Rx'];

if ~isempty(find_system(loop,'SearchDepth',1,'BlockType','Outport','Name','capture_word_out'))
    fprintf('variant_pre_composite_predesc: already instrumented, skipping.\n');
    save_system(sys,[],'OverwriteIfChangedOnDisk',true);
    return;
end

% --- Expose pre-Descrambler signals as new outports of QPSK Rx ---
if isempty(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport','Name','predesc_data_out'))
    descBlk = [qpsk_rx '/HDL Data Descrambler'];
    phDesc  = get_param(descBlk, 'PortHandles');
    % HDL Data Descrambler inports: 1=dataIn, 2=startIn, 3=endIn, 4=validIn
    src_data  = get_param(get_param(phDesc.Inport(1),'Line'), 'SrcPortHandle');
    src_valid = get_param(get_param(phDesc.Inport(4),'Line'), 'SrcPortHandle');

    nQpskOut = numel(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport'));
    add_block('built-in/Outport', [qpsk_rx '/predesc_data_out'],  'Port', num2str(nQpskOut+1));
    add_block('built-in/Outport', [qpsk_rx '/predesc_valid_out'], 'Port', num2str(nQpskOut+2));
    add_line(qpsk_rx, src_data,  get_param([qpsk_rx '/predesc_data_out'], 'PortHandles').Inport(1),  'autorouting','on');
    add_line(qpsk_rx, src_valid, get_param([qpsk_rx '/predesc_valid_out'],'PortHandles').Inport(1),  'autorouting','on');
    fprintf('Added 2 predesc outports to QPSK Rx (no dstart -- avoid multirate).\n');
end

% --- BitCapture at Receiver level (no dstart; 1M-cycle warm-up) ---
if isempty(find_system(rx,'SearchDepth',1,'Name','BitCapture'))
    bc = [rx '/BitCapture'];
    add_block('simulink/User-Defined Functions/MATLAB Function', bc);
    bcLines = { ...
        'function out_word = bitCap(valid, datain, addr_sel)' ...
        '%#codegen' ...
        '% 1M-cycle warm-up, then capture next 1024 valid bits into 32x32 buffer.' ...
        'persistent buffer write_idx armed wait_cnt' ...
        'if isempty(buffer)' ...
        '    buffer = zeros(1,32,''uint32'');' ...
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

    % Resolve QPSK Rx outports by name (Simulink may reorder).
    qpskBlks = find_system(rx,'SearchDepth',1,'BlockType','SubSystem','Name','QPSK Rx');
    qpskBlk  = qpskBlks{1};
    phQpsk   = get_param(qpskBlk,'PortHandles');
    idx_data=0; idx_valid=0;
    qpskOutports = find_system(qpsk_rx, 'SearchDepth',1, 'LookUnderMasks','all','FollowLinks','on', 'BlockType','Outport');
    for kk=1:numel(qpskOutports)
        nm = get_param(qpskOutports{kk}, 'Name');
        pn = str2double(get_param(qpskOutports{kk}, 'Port'));
        switch nm
            case 'predesc_data_out',  idx_data  = pn;
            case 'predesc_valid_out', idx_valid = pn;
        end
    end
    assert(idx_data>0 && idx_valid>0, 'predesc_* outports missing from QPSK Rx');
    fprintf('predesc outport indices data=%d valid=%d\n', idx_data, idx_valid);
    src_predesc_data  = phQpsk.Outport(idx_data);
    src_predesc_valid = phQpsk.Outport(idx_valid);
    srcSel = get_param([rx '/iq_debug_mux'],'PortHandles').Outport(1);

    % Rate-transition iq_debug_mux to match descrambler-rate (avoids multirate)
    rtSel = [rx '/iq_debug_mux_RT'];
    add_block('built-in/RateTransition', rtSel, 'OutPortSampleTime','-1');
    add_line(rx, srcSel, get_param(rtSel,'PortHandles').Inport(1), 'autorouting','on');

    add_line(rx, src_predesc_valid, get_param(bc,'PortHandles').Inport(1), 'autorouting','on');
    add_line(rx, src_predesc_data,  get_param(bc,'PortHandles').Inport(2), 'autorouting','on');
    add_line(rx, get_param(rtSel,'PortHandles').Outport(1), get_param(bc,'PortHandles').Inport(3), 'autorouting','on');

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
    fprintf('variant_pre_composite_predesc complete.\n');
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
