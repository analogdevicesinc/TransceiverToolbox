cd('/home/tcollins/dev/qpsk_ai/TransceiverToolbox'); run('setup.m'); addpath(pwd);
addpath('trx_examples/targeting/QPSKTxRxHDLExample');

srcSlx = 'trx_examples/targeting/QPSKTxRxHDLExample/commhdlQPSKTxRx.slx';
dstSlx = 'trx_examples/targeting/QPSKTxRxHDLExample/commhdlQPSKTxRxLoopback.slx';
if exist(dstSlx,'file'), delete(dstSlx); end
copyfile(srcSlx, dstSlx);
fprintf('cloned -> %s\n', dstSlx);

load_system('commhdlQPSKTxRxLoopback'); sys='commhdlQPSKTxRxLoopback';

% Leave Solver as original cloned setting (Fixed-step / FixedStepDiscrete /
% FixedStep='auto') -- Simulink picks the base sample time automatically.

% Remove any prior TxRxLoopback (in case of retry)
prev = find_system(sys,'SearchDepth',1,'Name','TxRxLoopback');
for k=1:numel(prev), delete_block(prev{k}); end

loop=[sys '/TxRxLoopback']; add_block('built-in/SubSystem', loop, 'Position',[100 600 280 800]);

% Composite Inports with specific data types + sample time. Inports for the
% reference design's ADC interface live at the FPGA clock (1/15.36e6); AXI
% control Inports inherit.
in_spec = {
  'validIn',       'boolean',     '1/15.36e6'; ...
  'dataInI',       'int16',       '1/15.36e6'; ...
  'dataInQ',       'int16',       '1/15.36e6'; ...
  'rstCS',         'boolean',     '-1'; ...
  'iq_debug_mux',  'uint32',      '-1'};
for k=1:size(in_spec,1)
  blk = [loop '/' in_spec{k,1}];
  add_block('built-in/Inport', blk, 'Port', num2str(k), 'Position', [30 30+40*k 60 50+40*k]);
  set_param(blk, 'OutDataTypeStr', in_spec{k,2}, 'SampleTime', in_spec{k,3});
end
out_names = {'count_out','packets_out','bit_errors_out','debugI','debugQ','debugValid','debugI1','debugQ1'};
for k=1:numel(out_names)
  add_block('built-in/Outport', [loop '/' out_names{k}], 'Port', num2str(k), 'Position', [800 30+40*k 830 50+40*k]);
end

% copy Transmitter and Receiver INTO composite
add_block([sys '/Transmitter'], [loop '/Transmitter'], 'CopyOption','duplicate', 'Position',[300 200 430 350]);
add_block([sys '/Receiver'],    [loop '/Receiver'],    'CopyOption','duplicate', 'Position',[600 200 730 400]);

% constants for Transmitter external inputs (mirror existing top-level constants
% INCLUDING the SampleTime/data type so the downstream Downsample blocks see a
% finite rate)
gp = @(nm,p) get_param([sys '/' nm], p);
% Compiled Debug constants in the original model run at 1/7.68e6 (=1.3e-7).
% Use that explicitly so the composite's Tx Downsample sees a finite input rate.
make_const = @(name, orig) add_block('built-in/Constant', [loop '/' name], ...
   'Value',          gp(orig,'Value'), ...
   'SampleTime',     '1/7.68e6', ...
   'OutDataTypeStr', gp(orig,'OutDataTypeStr'), ...
   'Position', [150 200 180 220]);
make_const('c_dbg',   'Debug');  set_param([loop '/c_dbg'],   'Position', [150 210 180 230]);
make_const('c_dataI', 'Debug1'); set_param([loop '/c_dataI'], 'Position', [150 240 180 260]);
make_const('c_dataQ', 'Debug2'); set_param([loop '/c_dataQ'], 'Position', [150 270 180 290]);
make_const('c_valid', 'Debug3'); set_param([loop '/c_valid'], 'Position', [150 300 180 320]);

% No Repeat block: route the Tx's alternative outputs dataOutI2/dataOutQ2
% (ports 8/7) which sit at the FPGA-clock rate directly into Receiver.
% No-op placeholder so subsequent add_line references stay sane.

% Terminators for unused ADC inputs
add_block('built-in/Terminator', [loop '/t_validIn'], 'Position',[120 70 140 90]);
add_block('built-in/Terminator', [loop '/t_dataInI'], 'Position',[120 110 140 130]);
add_block('built-in/Terminator', [loop '/t_dataInQ'], 'Position',[120 150 140 170]);

% --- wiring ---
% unused ADC inputs -> terminators
add_line(loop, 'validIn/1', 't_validIn/1');
add_line(loop, 'dataInI/1', 't_dataInI/1');
add_line(loop, 'dataInQ/1', 't_dataInQ/1');

% Transmitter inputs. validIn is driven by the composite Inport so the
% FPGA-clock rate (from the reference design) propagates THROUGH the Tx.
add_line(loop, 'c_dbg/1',   'Transmitter/1');
add_line(loop, 'c_dataI/1', 'Transmitter/2');
add_line(loop, 'c_dataQ/1', 'Transmitter/3');
add_line(loop, 'validIn/1', 'Transmitter/4');     % composite validIn -> Tx.validIn (rate source)
% drop the c_valid constant since validIn now comes from outside
delete_block([loop '/c_valid']);
% Terminator on the composite validIn now redundant
try, delete_block([loop '/t_validIn']); delete_line(loop, 'validIn/1', 't_validIn/1'); catch, end

% Use proper Repeat (N=UpsamplesRx=2) for interpolation, not naive Rate
% Transition. Tx Outports anchored at 1/7.68e6, Rx Inports anchored at
% 1/15.36e6, so Repeat correctly bridges them with sample replication
% (which the downstream RRC matched filter inside the Receiver expects).
add_block('dspsigops/Repeat', [loop '/RT_I'],     'FactorSource','Dialog parameter','N','UpsamplesRx','Nmax','16','InputProcessing','Elements as channels (sample based)','RateOptions','Allow multirate processing','ic','0', 'Position',[470 220 500 240]);
add_block('dspsigops/Repeat', [loop '/RT_Q'],     'FactorSource','Dialog parameter','N','UpsamplesRx','Nmax','16','InputProcessing','Elements as channels (sample based)','RateOptions','Allow multirate processing','ic','0', 'Position',[470 250 500 270]);
add_block('dspsigops/Repeat', [loop '/RT_valid'], 'FactorSource','Dialog parameter','N','UpsamplesRx','Nmax','16','InputProcessing','Elements as channels (sample based)','RateOptions','Allow multirate processing','ic','0', 'Position',[470 280 500 300]);
add_line(loop, 'Transmitter/4', 'RT_valid/1');     % validOut
add_line(loop, 'Transmitter/1', 'RT_I/1');         % dataOutI (RRC-shaped, what the original model wires to the data path)
add_line(loop, 'Transmitter/2', 'RT_Q/1');         % dataOutQ
add_line(loop, 'RT_valid/1', 'Receiver/1');
add_line(loop, 'RT_I/1',     'Receiver/2');
add_line(loop, 'RT_Q/1',     'Receiver/3');

% AXI controls
add_line(loop, 'rstCS/1',        'Receiver/4');
add_line(loop, 'iq_debug_mux/1', 'Receiver/5');

% Receiver outputs -> composite Outports
add_line(loop, 'Receiver/2', 'count_out/1');
add_line(loop, 'Receiver/3', 'packets_out/1');
add_line(loop, 'Receiver/4', 'bit_errors_out/1');
add_line(loop, 'Receiver/5', 'debugI/1');
add_line(loop, 'Receiver/6', 'debugQ/1');
add_line(loop, 'Receiver/7', 'debugValid/1');
add_line(loop, 'Receiver/8', 'debugI1/1');
add_line(loop, 'Receiver/9', 'debugQ1/1');

% delete sim-only logging blocks inside the COPIED Tx/Rx so they don't
% clash with the originals on the top level.
killtypes = {'ToFile','ToWorkspace','Scope','XYGraph','SpectrumAnalyzer','ConstellationDiagram'};
nkilled = 0;
for kt = killtypes
  bk = find_system(loop, 'LookUnderMasks','all', 'FollowLinks','on', 'BlockType', kt{1});
  for j=1:numel(bk), delete_block(bk{j}); nkilled=nkilled+1; end
end
fprintf('deleted %d sim-only logging blocks inside composite\n', nkilled);

save_system(sys);
close_system(sys);
fprintf('composite saved with explicit Rate Transitions on loopback path.\n');
