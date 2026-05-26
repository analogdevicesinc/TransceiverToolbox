% V41_csreset_K8000v2: HDL watchdog with EXTENDED rstpulse (32-cycle hold)
% to guarantee the reset propagates through the enb domain crossing.
%
% V40 used a 1-cycle rstpulse which we hypothesize was gated out by the
% FPGA clock-enable (enb pulses every ~10 clocks for our SPS=4 design).
% V41 holds rstpulse HIGH for 32 cycles after the trigger -- guaranteed
% to catch multiple enb=1 cycles.
%
% Otherwise identical to V40: K=8000, OR'd with AXI rstCS, watchdog
% counter ticks on ctrlOut.startOut (post-Descrambler).

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
    fprintf('V41 already instrumented; skipping insertions.\n');
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
fprintf('V41: QPSK Rx rstCS inport index = %d\n', idx_rstCS);

% Get the current line/source driving QPSK Rx.rstCS
rstcs_inport_handle = ph_qpsk.Inport(idx_rstCS);
existing_line = get_param(rstcs_inport_handle, 'Line');
existing_src = get_param(existing_line, 'SrcPortHandle');
fprintf('V41: existing rstCS source handle = %g\n', existing_src);
delete_line(existing_line);

% WatchdogReset block -- now holds rstpulse for 32 cycles
wd = [rx '/WatchdogReset'];
add_block('simulink/User-Defined Functions/MATLAB Function', wd);
wdLines = { ...
    'function rstpulse = wdReset(dstart)' ...
    '%#codegen' ...
    '% Count dstart pulses; on every Kth (K=8000), assert rstpulse HIGH' ...
    '% for HOLD=32 clock cycles to ensure the reset propagates through' ...
    '% the FPGA enb gating to FreqTimeSync.rstCS.' ...
    'persistent pktCount holdCount' ...
    'if isempty(pktCount)' ...
    '    pktCount = uint16(0);' ...
    '    holdCount = uint8(0);' ...
    'end' ...
    '% If we are currently holding a reset, keep it high and count down' ...
    'if holdCount > uint8(0)' ...
    '    rstpulse = true;' ...
    '    holdCount = holdCount - uint8(1);' ...
    'else' ...
    '    rstpulse = false;' ...
    '    if dstart' ...
    '        if pktCount >= uint16(8000)' ...
    '            rstpulse = true;' ...
    '            holdCount = uint8(31);' ...
    '            pktCount = uint16(0);' ...
    '        else' ...
    '            pktCount = pktCount + uint16(1);' ...
    '        end' ...
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

% Wire dstart from existing post-Descrambler startOut
cdb = [rx '/Capture Data Bits'];
phCdb = get_param(cdb,'PortHandles');
src_dstart = get_param(get_param(phCdb.Inport(2),'Line'), 'SrcPortHandle');
add_line(rx, src_dstart, get_param(wd,'PortHandles').Inport(1), 'autorouting','on');

% OR with existing AXI rstCS
or_blk = [rx '/RstCSOR'];
add_block('simulink/Logic and Bit Operations/Logical Operator', or_blk);
set_param(or_blk, 'Operator','OR', 'Inputs','2', 'OutDataTypeStr','boolean');

add_line(rx, existing_src,                            get_param(or_blk,'PortHandles').Inport(1), 'autorouting','on');
add_line(rx, get_param(wd,'PortHandles').Outport(1),  get_param(or_blk,'PortHandles').Inport(2), 'autorouting','on');
add_line(rx, get_param(or_blk,'PortHandles').Outport(1), rstcs_inport_handle, 'autorouting','on');

fprintf('V41_csreset_K8000v2 insertion complete. K=8000, HOLD=32 cycles.\n');

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
