% V17b_postcs_iq_v2: capture 64 complex symbols at the Carrier Synchronizer
% output (post-CS, 1 SPS). Each sample = 32-bit word {I[15:0], Q[15:0]}
% where I/Q are sfix16_En14 reinterpreted as uint16 via Data Type
% Conversion (Stored Integer mode).
%
% V17b vs V17: arm trigger changed from post-Descrambler dstart (broken,
% wrong pipeline phase) to first post-CS valid pulse. Capture is no
% longer packet-aligned but the constellation question is unaffected.
%
% Host MATLAB then plots constellation + runs QPSK demod + descrambler +
% BIST compare. If constellation is tight and BER < 1%, the error enters
% downstream of the CS tap (QPSK Demod, Phase Ambiguity, or Descrambler).
% If constellation is smeared, the error enters upstream.
%
% Selector: iq_debug_mux (6 LSBs, 0..63) -> selects which 32-bit sample
% Output:   capture_word_out, AXI4-Lite x"11C"

sys     = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop    = [sys '/TxRxLoopback'];
rx      = [loop '/Receiver'];
qpsk_rx = [rx '/QPSK Rx'];

% --- V3 scalar patches ---
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

% --- Idempotency marker ---
if ~isempty(find_system(loop,'SearchDepth',1,'BlockType','Outport','Name','capture_word_out'))
    fprintf('V17b already instrumented; skipping insertions.\n');
    save_system(sys,[],'OverwriteIfChangedOnDisk',true);
    return;
end

% --- Inside QPSK Rx: tap post-CS complex output of FreqTimeSync ---
if isempty(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport','Name','postcs_I_out'))
    ftsBlk = [qpsk_rx '/Frequency and Time Synchronizer'];
    phFts  = get_param(ftsBlk, 'PortHandles');
    % FreqTimeSync outputs: 1=dataOut,2=startOut,3=endOut,4=validOut,
    %                      5=postSymbolSync,6=postCarrierSync,7=nSynced,8=normCoarseFreqEst
    src_postcs = phFts.Outport(6);
    src_valid  = phFts.Outport(4);

    % Split the complex postCarrierSync into Re/Im using a new block
    c2r = [qpsk_rx '/postCS_C2R'];
    add_block('simulink/Math Operations/Complex to Real-Imag', c2r);
    add_line(qpsk_rx, src_postcs, get_param(c2r,'PortHandles').Inport(1), 'autorouting','on');

    % Expose Re/Im as separate sfix16_En14 outports + the validOut as 1-bit outport
    nQpskOut = numel(find_system(qpsk_rx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','Outport'));
    add_block('built-in/Outport', [qpsk_rx '/postcs_I_out'],     'Port', num2str(nQpskOut+1));
    add_block('built-in/Outport', [qpsk_rx '/postcs_Q_out'],     'Port', num2str(nQpskOut+2));
    add_block('built-in/Outport', [qpsk_rx '/postcs_valid_out'], 'Port', num2str(nQpskOut+3));
    phC2R = get_param(c2r,'PortHandles');
    add_line(qpsk_rx, phC2R.Outport(1), get_param([qpsk_rx '/postcs_I_out'],    'PortHandles').Inport(1), 'autorouting','on');
    add_line(qpsk_rx, phC2R.Outport(2), get_param([qpsk_rx '/postcs_Q_out'],    'PortHandles').Inport(1), 'autorouting','on');
    add_line(qpsk_rx, src_valid,        get_param([qpsk_rx '/postcs_valid_out'],'PortHandles').Inport(1), 'autorouting','on');
    fprintf('Added 3 post-CS outports to QPSK Rx.\n');
end

% --- Receiver-level capture buffer ---
if isempty(find_system(rx,'SearchDepth',1,'Name','PostCSCapture'))
    % Add 2 DTC blocks (sfix16_En14 -> uint16 via Stored Integer)
    dtcI = [rx '/postcs_I_DTC'];
    dtcQ = [rx '/postcs_Q_DTC'];
    add_block('simulink/Signal Attributes/Data Type Conversion', dtcI);
    add_block('simulink/Signal Attributes/Data Type Conversion', dtcQ);
    set_param(dtcI, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');
    set_param(dtcQ, 'OutDataTypeStr','uint16', 'ConvertRealWorld','Stored Integer (SI)');

    % Find the new QPSK Rx outports (indices = end-2, end-1, end)
    qpskOuts = find_system(rx,'SearchDepth',1,'BlockType','SubSystem','Name','QPSK Rx');
    qpskBlk  = qpskOuts{1};
    phQpsk   = get_param(qpskBlk,'PortHandles');
    idx_I=0; idx_Q=0; idx_V=0;
    qpskOutports = find_system(qpsk_rx, 'SearchDepth',1, 'LookUnderMasks','all','FollowLinks','on', 'BlockType','Outport');
    for kk=1:numel(qpskOutports)
        nm = get_param(qpskOutports{kk}, 'Name');
        pn = str2double(get_param(qpskOutports{kk}, 'Port'));
        switch nm
            case 'postcs_I_out',     idx_I = pn;
            case 'postcs_Q_out',     idx_Q = pn;
            case 'postcs_valid_out', idx_V = pn;
        end
    end
    assert(idx_I>0 && idx_Q>0 && idx_V>0, 'postcs_* outports missing from QPSK Rx');
    fprintf('V17b: postcs outport indices I=%d Q=%d V=%d\n', idx_I, idx_Q, idx_V);
    src_postcs_I  = phQpsk.Outport(idx_I);
    src_postcs_Q  = phQpsk.Outport(idx_Q);
    src_postcs_V  = phQpsk.Outport(idx_V);

    add_line(rx, src_postcs_I, get_param(dtcI,'PortHandles').Inport(1), 'autorouting','on');
    add_line(rx, src_postcs_Q, get_param(dtcQ,'PortHandles').Inport(1), 'autorouting','on');

    % MATLAB Function block PostCSCapture
    pcc = [rx '/PostCSCapture'];
    add_block('simulink/User-Defined Functions/MATLAB Function', pcc);
    pccLines = { ...
        'function out_word = postCSCap(valid, Iu, Qu, addr_sel)' ...
        '%#codegen' ...
        '% Capture 64 packed-IQ samples starting at the first valid pulse,' ...
        '% then freeze. No dstart -- avoids the cross-pipeline-phase issue' ...
        '% that broke V17 (post-Descrambler dstart arrived after the matching' ...
        '% post-CS valid bursts had already passed).' ...
        '% Iu, Qu are uint16 (reinterpreted from sfix16_En14 via SI DTC).' ...
        'persistent buffer write_idx armed' ...
        'if isempty(buffer)' ...
        '    buffer = zeros(1,64,''uint32'');' ...
        '    write_idx = uint8(0);' ...
        '    armed = uint8(0);' ...
        'end' ...
        'if valid && armed == uint8(0)' ...
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
    pccScript = strjoin(pccLines, sprintf('\n'));
    sfRoot = sfroot;
    emCharts = sfRoot.find('-isa','Stateflow.EMChart');
    found = false;
    for k=1:numel(emCharts)
        if strcmp(emCharts(k).Path, pcc), emCharts(k).Script = pccScript; found = true; break; end
    end
    if ~found, error('PostCSCapture EMChart not found'); end

    % No dstart input -- function arms on first post-CS valid pulse.
    srcSel = get_param([rx '/iq_debug_mux'],'PortHandles').Outport(1);

    add_line(rx, src_postcs_V,                             get_param(pcc,'PortHandles').Inport(1), 'autorouting','on');
    add_line(rx, get_param(dtcI,'PortHandles').Outport(1), get_param(pcc,'PortHandles').Inport(2), 'autorouting','on');
    add_line(rx, get_param(dtcQ,'PortHandles').Outport(1), get_param(pcc,'PortHandles').Inport(3), 'autorouting','on');
    add_line(rx, srcSel,                                   get_param(pcc,'PortHandles').Inport(4), 'autorouting','on');

    % Receiver -> Loopback -> AXI4-Lite outport
    nRxOut = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
    rxNewOut = [rx '/capture_word_out'];
    add_block('built-in/Outport', rxNewOut, 'Port', num2str(nRxOut+1));
    add_line(rx, get_param(pcc,'PortHandles').Outport(1), get_param(rxNewOut,'PortHandles').Inport(1), 'autorouting','on');
    rxPort = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
    phRxLoop = get_param([loop '/Receiver'],'PortHandles');
    loopNewOut = [loop '/capture_word_out'];
    nLoopOut = numel(find_system(loop,'SearchDepth',1,'BlockType','Outport'));
    add_block('built-in/Outport', loopNewOut, 'Port', num2str(nLoopOut+1));
    add_line(loop, phRxLoop.Outport(rxPort), get_param(loopNewOut,'PortHandles').Inport(1), 'autorouting','on');
    hdlset_param(loopNewOut, 'IOInterface', 'AXI4-Lite');
    hdlset_param(loopNewOut, 'IOInterfaceMapping', 'x"11C"');
    fprintf('V17b_postcs_iq_v2 insertion complete.\n');
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
