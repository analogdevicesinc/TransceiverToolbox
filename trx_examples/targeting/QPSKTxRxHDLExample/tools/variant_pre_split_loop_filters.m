% V7_perbyte_diag: baseline (V3) + a parallel per-byte-position BIST inside
% Receiver that exposes the chosen byte's error count via a new AXI4-Lite
% register at x"11C". The selector is iq_debug_mux (4 LSBs, 0..14).
%
% Test usage from host:
%   for byte = 0..14:
%       write iq_debug_mux = byte
%       wait
%       read bit_errors_per_byte (x"11C")
%   The 15 reads give the per-byte-position error histogram.

sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxLoopback'];
rx   = [loop '/Receiver'];

% --- V3 scalar patches ---
ic = get_param(sys,'InitFcn');
ic = regexprep(ic,'UpsamplesRx\s*=\s*\d+\s*;','UpsamplesRx = 1;');
ic = regexprep(ic,'UpsamplesTx\s*=\s*\d+\s*;','UpsamplesTx = 1;');
set_param(sys,'InitFcn',ic);
for c = {[sys '/Transmitter/Input Data'], [sys '/TxRxLoopback/Transmitter/Input Data']}
  try, set_param(c{1},'Rsym','3.84e6'); catch, end
end

% HDL Counter mask safety (no-op at SPS=4)
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

% --- Add PerByteErrors MATLAB Function block inside Receiver (idempotent) ---
if isempty(find_system(rx,'SearchDepth',1,'Name','PerByteErrors'))
    fprintf('Inserting PerByteErrors block...\n');

    pbe = [rx '/PerByteErrors'];
    add_block('simulink/User-Defined Functions/MATLAB Function', pbe);

    % Set the function script via the Stateflow EMChart API
    pbeLines = { ...
        'function out = perByteErr(valid, datain, dstart, sel)' ...
        '%#codegen' ...
        '% Per-byte-position BIST counter. sel (0..14) selects which byte' ...
        '% to expose. Reference is 120 bits of ''ADI Hello World''.' ...
        'persistent count byteErrors' ...
        'if isempty(count)' ...
        '    count = uint32(0);' ...
        '    byteErrors = zeros(1,15,''uint32'');' ...
        'end' ...
        '% 120-bit ''ADI Hello World'' reference (hardcoded, HDL-friendly)' ...
        'msgbits = logical([ ...' ...
        '    0 1 0 0 0 0 0 1   0 1 0 0 0 1 0 0   0 1 0 0 1 0 0 1   ...' ...
        '    0 0 1 0 0 0 0 0   0 1 0 0 1 0 0 0   0 1 1 0 0 1 0 1   ...' ...
        '    0 1 1 0 1 1 0 0   0 1 1 0 1 1 0 0   0 1 1 0 1 1 1 1   ...' ...
        '    0 0 1 0 0 0 0 0   0 1 0 1 0 1 1 1   0 1 1 0 1 1 1 1   ...' ...
        '    0 1 1 1 0 0 1 0   0 1 1 0 1 1 0 0   0 1 1 0 0 1 0 0]);' ...
        'selU = uint32(sel);' ...
        'if valid' ...
        '    if dstart' ...
        '        count = uint32(1);' ...
        '    end' ...
        '    if count >= uint32(1) && count <= uint32(120)' ...
        '        byteIdx = idivide(count - uint32(1), uint32(8)) + uint32(1);' ...
        '        if datain ~= msgbits(count)' ...
        '            byteErrors(byteIdx) = byteErrors(byteIdx) + uint32(1);' ...
        '        end' ...
        '    end' ...
        '    if count <= uint32(130)' ...
        '        count = count + uint32(1);' ...
        '    end' ...
        'end' ...
        'if selU < uint32(15)' ...
        '    out = byteErrors(selU + uint32(1));' ...
        'else' ...
        '    out = uint32(0);' ...
        'end'};
    pbeScript = strjoin(pbeLines, sprintf('\n'));

    sfRoot = sfroot;
    emCharts = sfRoot.find('-isa','Stateflow.EMChart');
    found = false;
    for k = 1:numel(emCharts)
        if strcmp(emCharts(k).Path, pbe)
            emCharts(k).Script = pbeScript;
            found = true;
            break;
        end
    end
    if ~found, error('Could not find EMChart for new PerByteErrors block'); end

    % Wire inputs by tapping the same sources as Capture Data Bits:
    %   PerByteErrors/valid   <- Bus Selector2.valid  (Capture Data Bits/4)
    %   PerByteErrors/datain  <- QPSK Rx/dataOut      (Capture Data Bits/1)
    %   PerByteErrors/dstart  <- Bus Selector2.dataSrt(Capture Data Bits/2)
    %   PerByteErrors/sel     <- Receiver/iq_debug_mux Inport
    cdb = [rx '/Capture Data Bits'];
    phCdb = get_param(cdb, 'PortHandles');
    % cdb port 1: dataOut, 2: dataSrt, 3: dataEnd, 4: valid
    srcDataOut = get_param(get_param(phCdb.Inport(1),'Line'), 'SrcPortHandle');
    srcDataSrt = get_param(get_param(phCdb.Inport(2),'Line'), 'SrcPortHandle');
    srcValid   = get_param(get_param(phCdb.Inport(4),'Line'), 'SrcPortHandle');
    % iq_debug_mux Inport
    iqMuxBlk = [rx '/iq_debug_mux'];
    % Source for PerByteErrors/sel: the iq_debug_mux Inport's output (port 1)
    srcSel = get_param(iqMuxBlk, 'PortHandles'); srcSel = srcSel.Outport(1);

    % Now wire: connect each source to PerByteErrors input
    add_line(rx, srcValid,   get_param(pbe,'PortHandles').Inport(1), 'autorouting','on');
    add_line(rx, srcDataOut, get_param(pbe,'PortHandles').Inport(2), 'autorouting','on');
    add_line(rx, srcDataSrt, get_param(pbe,'PortHandles').Inport(3), 'autorouting','on');
    add_line(rx, srcSel,     get_param(pbe,'PortHandles').Inport(4), 'autorouting','on');

    % --- Add new outport "per_byte_errors_out" on Receiver ---
    rxNewOut = [rx '/per_byte_errors_out'];
    nExisting = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
    add_block('built-in/Outport', rxNewOut, 'Port', num2str(nExisting + 1));
    add_line(rx, get_param(pbe,'PortHandles').Outport(1), get_param(rxNewOut,'PortHandles').Inport(1), 'autorouting','on');

    % --- Add new outport "per_byte_errors_out" on TxRxLoopback ---
    % Find Receiver port handle for the new outport (which we just added)
    rxPort = numel(find_system(rx,'SearchDepth',1,'BlockType','Outport'));
    phRxLoopback = get_param([loop '/Receiver'], 'PortHandles');
    loopNewOut = [loop '/per_byte_errors_out'];
    nLoopExisting = numel(find_system(loop,'SearchDepth',1,'BlockType','Outport'));
    add_block('built-in/Outport', loopNewOut, 'Port', num2str(nLoopExisting + 1));
    add_line(loop, phRxLoopback.Outport(rxPort), get_param(loopNewOut,'PortHandles').Inport(1), 'autorouting','on');

    % --- AXI4-Lite mapping at x"11C" ---
    hdlset_param(loopNewOut, 'IOInterface', 'AXI4-Lite');
    hdlset_param(loopNewOut, 'IOInterfaceMapping', 'x"11C"');

    fprintf('Done. Added PerByteErrors with AXI register at x"11C".\n');
else
    fprintf('PerByteErrors block already exists, skipping insertion.\n');
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);

% --- V14: rename the Carrier Sync's Loop Filter subsystem to force HDL Coder
% to emit a separate module (currently it dedupes with the AGC's Loop Filter,
% inheriting the AGC's gain instead of using the CS gain).
hdlset_param(sys, 'ShareMultipliers', 'off');
hdlset_param(sys, 'ShareAdders', 'off');
for cs = { ...
    [sys '/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer'], ...
    [sys '/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer']}
    try
        oldPath = [cs{1} '/Loop Filter'];
        newPath = [cs{1} '/CS_Loop_Filter'];
        set_param(oldPath, 'Name', 'CS_Loop_Filter');
        fprintf('Renamed %s -> CS_Loop_Filter\n', oldPath);
        % Also try forcing separate instantiation
        try, hdlset_param(newPath, 'InstantiateFunctionsForSubsystem', 'on'); catch, end
    catch e
        fprintf('warn: rename failed: %s\n', e.message);
    end
end

% Also rename Symbol Sync's Loop Filter for similar separation
for ss = { ...
    [sys '/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer'], ...
    [sys '/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer']}
    try
        oldPath = [ss{1} '/Loop Filter'];
        newPath = [ss{1} '/SS_Loop_Filter'];
        set_param(oldPath, 'Name', 'SS_Loop_Filter');
        fprintf('Renamed %s -> SS_Loop_Filter\n', oldPath);
    catch e
        fprintf('warn: SS rename failed: %s\n', e.message);
    end
end
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
