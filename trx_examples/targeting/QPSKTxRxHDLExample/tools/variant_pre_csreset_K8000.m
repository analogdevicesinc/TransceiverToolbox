% V40_csreset_K8000: HDL watchdog that auto-pulses CS reset every K=8000
% packets. Inserts a WatchdogReset MATLAB Function block inside Receiver
% which counts ctrlOut.startOut pulses; every 8000th pulse asserts a
% one-cycle reset that is OR'd with the AXI-controlled rstCS and fed
% into QPSK Rx.rstCS.
%
% Goal: prevent the FreqTimeSync.startOut from stopping at ~packet 10000
% by force-re-acquiring CS before drift accumulates past lockable range.
% Predicted result: BER stays near 0% indefinitely.
%
% No new AXI registers; reuses existing rstCS path.

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
if ~isempty(find_system(rx,'SearchDepth',1,'Name','WatchdogReset'))
    fprintf('V40 already instrumented; skipping insertions.\n');
    save_system(sys,[],'OverwriteIfChangedOnDisk',true);
    return;
end

% Find QPSK Rx block and its rstCS Inport index
qpsk_rx = [rx '/QPSK Rx'];
ph_qpsk = get_param(qpsk_rx,'PortHandles');
qpsk_inports = find_system(qpsk_rx, 'SearchDepth',1, 'LookUnderMasks','all','FollowLinks','on', 'BlockType','Inport');
idx_rstCS = 0;
for kk = 1:numel(qpsk_inports)
    if strcmp(get_param(qpsk_inports{kk}, 'Name'), 'rstCS')
        idx_rstCS = str2double(get_param(qpsk_inports{kk}, 'Port'));
        break
    end
end
assert(idx_rstCS > 0, 'rstCS inport not found on QPSK Rx');
fprintf('V40: QPSK Rx rstCS inport index = %d\n', idx_rstCS);

% Get the current line/source driving QPSK Rx.rstCS
rstcs_inport_handle = ph_qpsk.Inport(idx_rstCS);
existing_line = get_param(rstcs_inport_handle, 'Line');
existing_src = get_param(existing_line, 'SrcPortHandle');
fprintf('V40: existing rstCS source handle = %g\n', existing_src);
% Delete the existing line so we can re-route through the OR
delete_line(existing_line);

% Add WatchdogReset MATLAB Function block
wd = [rx '/WatchdogReset'];
add_block('simulink/User-Defined Functions/MATLAB Function', wd);
wdLines = { ...
    'function rstpulse = wdReset(dstart)' ...
    '%#codegen' ...
    '% Pulse rstpulse HIGH once every K dstart pulses (K=8000).' ...
    '% K must be < the ~10000-packet point where the chain naturally' ...
    '% diverges. pktCount is uint16 (max 65535) -- no overflow concerns.' ...
    'persistent pktCount' ...
    'if isempty(pktCount)' ...
    '    pktCount = uint16(0);' ...
    'end' ...
    'rstpulse = false;' ...
    'if dstart' ...
    '    if pktCount >= uint16(8000)' ...
    '        rstpulse = true;' ...
    '        pktCount = uint16(0);' ...
    '    else' ...
    '        pktCount = pktCount + uint16(1);' ...
    '    end' ...
    'end'};
wdScript = strjoin(wdLines, sprintf('\n'));
sfRoot = sfroot;
emCharts = sfRoot.find('-isa','Stateflow.EMChart');
found = false;
for k=1:numel(emCharts)
    if strcmp(emCharts(k).Path, wd), emCharts(k).Script = wdScript; found = true; break; end
end
if ~found, error('WatchdogReset EMChart not found'); end

% Wire WatchdogReset input from the existing Capture Data Bits Inport(2)
% source (which is the post-Descrambler startOut signal -- same as V16/V18).
% This signal keeps pulsing in the failure state (Descrambler self-syncs)
% so it's a reliable packet-rate clock.
cdb = [rx '/Capture Data Bits'];
phCdb = get_param(cdb,'PortHandles');
src_dstart = get_param(get_param(phCdb.Inport(2),'Line'), 'SrcPortHandle');
add_line(rx, src_dstart, get_param(wd,'PortHandles').Inport(1), 'autorouting','on');

% Add Logical OR block to combine AXI-rstCS with watchdog
or_blk = [rx '/RstCSOR'];
add_block('simulink/Logic and Bit Operations/Logical Operator', or_blk);
set_param(or_blk, 'Operator','OR', 'Inputs','2', 'OutDataTypeStr','boolean');

add_line(rx, existing_src,                            get_param(or_blk,'PortHandles').Inport(1), 'autorouting','on');
add_line(rx, get_param(wd,'PortHandles').Outport(1),  get_param(or_blk,'PortHandles').Inport(2), 'autorouting','on');
add_line(rx, get_param(or_blk,'PortHandles').Outport(1), rstcs_inport_handle, 'autorouting','on');

fprintf('V40_csreset_K8000 insertion complete. K=8000.\n');

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
