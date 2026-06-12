% add_byte_tx_path -- one-shot model surgery on commhdlQPSKTxRx.slx: add the
% host->FPGA byte-transfer path into the Transmitter.
%
% ACTUAL Input Data wiring (introspected with PortConnectivity, NOT the XML
% guess): inside 'Transmitter/Input Data' the Message Generator subsystem
% boundary maps in1->'reset' Inport(Port=1)->chart input 2 (reset) and
% in2->'enable' Inport(Port=2)->chart input 1 (enable). Sources:
%   * MG in 2 (chart enable) <- 'enb' Input Data inport (the Transmitter-level
%     AND of the QPSK Tx pacing feedback)
%   * MG in 1 (chart reset)  <- Cast To Boolean <- Delay <- MG out 2 (chart
%     'stop') -- i.e. the reset is the DELAYED STOP feedback (the chart's
%     "-1 to eat the feedback delay" comment refers to this loop)
%   * the Input Data 'reset' inport (Port=2) is terminated (unused)
%   * MG out 3 = chart 'start' -> Terminator1 (we branch off it)
%   * MG out 1 = chart 'out'   -> txData outport (the wire the bit mux replaces)
%
% Additions (generator pacing untouched):
%   Transmitter inports  5..8: extWord (uint64), extWordAvail (boolean),
%                              extBitSel (boolean), extWordFirst (boolean);
%                              outport 9: extWordPop.
%   Input Data inports   3..6: same quartet; outport 4: extWordPop.
%   Input Data/ByteBitShifter: MATLAB Function wrapping qpskByteBitShifter
%     (unit-tested single source of truth) with persistent state. enable/reset
%     tap the SAME sources the chart receives ('enb' and Cast To Boolean);
%     start taps MG out 3. pop is exported as a TOGGLE (flips on each word
%     latch) so it survives the 7.68M->30.72M crossing; upstream edge-detects.
%   Input Data/BitMux: Switch (u2 ~= 0) -- u1 = shifter bit, u2 = extBitSel,
%     u3 = chart out; output replaces the chart-out wire into txData.
%   Top level: constants false/uint64(0) on the three new Transmitter inputs
%     and a Terminator on extWordPop so the source model still simulates.
sys = 'commhdlQPSKTxRx';
load_system(sys);
tx = [sys '/Transmitter'];
id = [tx '/Input Data'];

if ~isempty(find_system(id,'SearchDepth',1,'LookUnderMasks','all', ...
        'FollowLinks','on','Name','ByteBitShifter'))
    error('add_byte_tx_path: byte path already present -- one-shot script');
end

% --- (1) Input Data: new boundary ports ---
idin = { 'extWord','uint64',3; 'extWordAvail','boolean',4; ...
         'extBitSel','boolean',5; 'extWordFirst','boolean',6 };
for k = 1:size(idin,1)
    blk = [id '/' idin{k,1}];
    add_block('built-in/Inport', blk, 'Port', num2str(idin{k,3}), ...
        'Position', [40 300+40*k 70 320+40*k]);
    set_param(blk, 'OutDataTypeStr', idin{k,2});
end
add_block('built-in/Outport', [id '/extWordPop'], 'Port', '4', ...
    'Position', [620 480 650 500]);

% --- (2) Input Data: ByteBitShifter MATLAB Function block ---
add_block('simulink/User-Defined Functions/MATLAB Function', ...
    [id '/ByteBitShifter'], 'Position', [330 330 450 450]);
rt = sfroot;
ch = rt.find('-isa','Stateflow.EMChart','Path', [id '/ByteBitShifter']);
assert(~isempty(ch), 'ByteBitShifter chart not found');
ch.Script = sprintf([ ...
'function [bit, popToggle] = byteBitShifterBlk(enable, reset, start, extWord, extWordAvail, extWordFirst)\n' ...
'%% Block wrapper around qpskByteBitShifter (the unit-tested single source\n' ...
'%% of truth). Persistent state only; the effective enable matches the\n' ...
'%% Message Generator chart''s active condition (enable && ~reset) so the\n' ...
'%% shifter emits bits on exactly the generator''s bit steps. pop is\n' ...
'%% exported as a toggle (one flip per word latch OR discard) to survive\n' ...
'%% the slow->fast rate crossing; upstream edge-detects it into a pulse.\n' ...
'persistent state tog\n' ...
'if isempty(state)\n' ...
'    state = qpskByteBitShifter();\n' ...
'    tog = false;\n' ...
'end\n' ...
'en = logical(enable) && ~logical(reset);\n' ...
'[bit, pop, state] = qpskByteBitShifter(state, en, logical(start), ...\n' ...
'    uint64(extWord), logical(extWordAvail), logical(extWordFirst));\n' ...
'if pop\n' ...
'    tog = ~tog;\n' ...
'end\n' ...
'popToggle = tog;\n']);

% shifter inputs: SAME enable source as the chart (enb inport), SAME reset
% source as the chart (Cast To Boolean = delayed stop), chart start (MG/3,
% branch off the terminated line), and the new external word ports.
add_line(id, 'enb/1',               'ByteBitShifter/1', 'autorouting','on');
add_line(id, 'Cast To Boolean/1',   'ByteBitShifter/2', 'autorouting','on');
add_line(id, 'Message Generator/3', 'ByteBitShifter/3', 'autorouting','on');
add_line(id, 'extWord/1',           'ByteBitShifter/4', 'autorouting','on');
add_line(id, 'extWordAvail/1',      'ByteBitShifter/5', 'autorouting','on');
add_line(id, 'extWordFirst/1',      'ByteBitShifter/6', 'autorouting','on');
add_line(id, 'ByteBitShifter/2',    'extWordPop/1',     'autorouting','on');

% --- (3) bit mux: Switch replaces the chart-out -> txData wire ---
delete_line(id, 'Message Generator/1', 'txData/1');
add_block('built-in/Switch', [id '/BitMux'], 'Criteria','u2 ~= 0', ...
    'Position', [500 330 530 370]);
add_line(id, 'ByteBitShifter/1',    'BitMux/1', 'autorouting','on');
add_line(id, 'extBitSel/1',         'BitMux/2', 'autorouting','on');
add_line(id, 'Message Generator/1', 'BitMux/3', 'autorouting','on');
add_line(id, 'BitMux/1', 'txData/1', 'autorouting','on');

% --- (4) Transmitter: new boundary ports, propagate to Input Data ---
txin = { 'extWord','uint64',5; 'extWordAvail','boolean',6; ...
         'extBitSel','boolean',7; 'extWordFirst','boolean',8 };
for k = 1:size(txin,1)
    blk = [tx '/' txin{k,1}];
    add_block('built-in/Inport', blk, 'Port', num2str(txin{k,3}), ...
        'Position', [30 700+40*k 60 720+40*k]);
    set_param(blk, 'OutDataTypeStr', txin{k,2});
end
add_block('built-in/Outport', [tx '/extWordPop'], 'Port', '9', ...
    'Position', [700 740 730 760]);
add_line(tx, 'extWord/1',      'Input Data/3', 'autorouting','on');
add_line(tx, 'extWordAvail/1', 'Input Data/4', 'autorouting','on');
add_line(tx, 'extBitSel/1',    'Input Data/5', 'autorouting','on');
add_line(tx, 'extWordFirst/1', 'Input Data/6', 'autorouting','on');
add_line(tx, 'Input Data/4',   'extWordPop/1', 'autorouting','on');

% --- (5) top level: tie-offs so the source model simulates standalone ---
constST = get_param([sys '/Debug'], 'SampleTime');
add_block('built-in/Constant', [sys '/ExtWordConst'], 'Value','0', ...
    'OutDataTypeStr','uint64', 'SampleTime',constST, 'Position',[40 900 80 920]);
add_block('built-in/Constant', [sys '/ExtAvailConst'], 'Value','false', ...
    'OutDataTypeStr','boolean', 'SampleTime',constST, 'Position',[40 940 80 960]);
add_block('built-in/Constant', [sys '/ExtSelConst'], 'Value','false', ...
    'OutDataTypeStr','boolean', 'SampleTime',constST, 'Position',[40 980 80 1000]);
add_block('built-in/Constant', [sys '/ExtFirstConst'], 'Value','false', ...
    'OutDataTypeStr','boolean', 'SampleTime',constST, 'Position',[40 1020 80 1040]);
add_line(sys, 'ExtWordConst/1',  'Transmitter/5', 'autorouting','on');
add_line(sys, 'ExtAvailConst/1', 'Transmitter/6', 'autorouting','on');
add_line(sys, 'ExtSelConst/1',   'Transmitter/7', 'autorouting','on');
add_line(sys, 'ExtFirstConst/1', 'Transmitter/8', 'autorouting','on');
add_block('built-in/Terminator', [sys '/T_extWordPop'], 'Position',[300 980 320 1000]);
add_line(sys, 'Transmitter/9', 'T_extWordPop/1', 'autorouting','on');

save_system(sys);
fprintf('ADD_BYTE_TX_PATH_OK\n');
