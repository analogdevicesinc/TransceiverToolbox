% add_byte_rx_path -- one-shot model surgery on commhdlQPSKTxRx.slx: tap the
% Receiver's recovered (descrambled) payload bit stream for the FPGA->host
% byte-RX path.
%
% ACTUAL wiring (introspected with PortConnectivity, NOT guessed): inside
% the Receiver, the 'Capture Data Bits' subsystem (the msgdec chart:
% msgdec(valid, datain, start, stop)) receives:
%   port 1 'dataOut' <- 'QPSK Rx' outport 1      (descrambled payload bit)
%   port 2 'dataSrt' <- 'Bus Selector2' port 1   (frame start flag)
%   port 3 'dataEnd' <- 'Bus Selector2' port 2   (frame stop flag -- unused here)
%   port 4 'valid'   <- 'Bus Selector2' port 3   (bit valid)
%
% Additions (Receiver decode path untouched -- pure signal branches):
%   Receiver outports 10..12: recBit (the payload bit), recBitValid,
%   recStart. They tap the SAME wires feeding Capture Data Bits, so what
%   the BIST checks is exactly what the byte-RX serializer sees.
%   Top level: Terminators on the three new Receiver outputs so the source
%   model still simulates standalone (build_composite terminates them in
%   the composite; the bytetx overlay rewires them into ByteSerializer).
sys = 'commhdlQPSKTxRx';
load_system(sys);
rx = [sys '/Receiver'];

if ~isempty(find_system(rx,'SearchDepth',1,'Name','recBit'))
    error('add_byte_rx_path: byte-RX tap already present -- one-shot script');
end

% --- (1) introspect the Capture Data Bits sources (assert, don't assume) ---
cdb = [rx '/Capture Data Bits'];
pc = get_param(cdb, 'PortConnectivity');
src = struct('blk', {}, 'port', {});
for k = 1:4   % inputs come FIRST in PortConnectivity (then the outputs,
              % whose Type labels collide with the inputs' '1'..'3')
    p = pc(k);
    assert(strcmp(p.Type, num2str(k)) && ~isempty(p.SrcBlock) && ...
        all(p.SrcBlock ~= -1), 'Capture Data Bits port %d has no source', k);
    src(k).blk  = p.SrcBlock;            % numeric handle (names contain newlines)
    src(k).port = p.SrcPort + 1;
end
assert(contains(get_param(src(1).blk,'Name'), 'QPSK Rx'), ...
    'dataOut source is %s, expected QPSK Rx', get_param(src(1).blk,'Name'));
assert(contains(get_param(src(2).blk,'Name'), 'Selector2'), ...
    'dataSrt source is %s, expected Bus Selector2', get_param(src(2).blk,'Name'));
assert(contains(get_param(src(4).blk,'Name'), 'Selector2'), ...
    'valid source is %s, expected Bus Selector2', get_param(src(4).blk,'Name'));

% --- (2) Receiver outports 10..12 wired off the same sources ---
% taps: recBit <- dataOut source, recBitValid <- valid source, recStart <-
% dataSrt source. Wire via port handles (source block names contain
% literal newlines, so string line specs are fragile).
taps = { 'recBit', 1, 10; 'recBitValid', 4, 11; 'recStart', 2, 12 };
for k = 1:size(taps,1)
    blk = [rx '/' taps{k,1}];
    add_block('built-in/Outport', blk, 'Port', num2str(taps{k,3}), ...
        'Position', [900 700+40*k 930 720+40*k]);
    s  = src(taps{k,2});
    sph = get_param(s.blk, 'PortHandles');
    dph = get_param(blk, 'PortHandles');
    add_line(rx, sph.Outport(s.port), dph.Inport(1), 'autorouting','on');
end

% --- (3) top level: terminate the new Receiver outputs ---
for k = 10:12
    tb = sprintf('%s/T_byteRx%d', sys, k);
    add_block('built-in/Terminator', tb, 'Position', [1500 700+40*k 1520 720+40*k]);
    add_line(sys, sprintf('Receiver/%d', k), sprintf('T_byteRx%d/1', k), ...
        'autorouting','on');
end

save_system(sys);
fprintf('ADD_BYTE_RX_PATH_OK\n');
