cd('/home/tcollins/dev/qpsk_ai/TransceiverToolbox'); run('setup.m'); addpath(pwd);
addpath('trx_examples/targeting/QPSKTxRxHDLExample');

% build_composite.m -- construct commhdlQPSKTxRxLoopback.slx as the unified
% TxRxComposite subsystem (Phase A.1 of the clean-restart plan).
%
% Topology decisions:
%   - EVERY data port in/out of TxRxComposite is at 1/15.36e6 (FPGA clock).
%   - INSIDE the composite:
%       * Tx output is at 1/7.68e6 (synchronizer-native rate); Repeat by 2
%         brings it to 1/15.36e6 at the composite Tx-output Outport.
%       * ADC inputs at 1/15.36e6 feed the Receiver directly (Receiver's
%         internal Downsample by UpsamplesRx=2 brings its internal datapath
%         to 1/7.68e6).
%       * rx_input_select MUX swaps between internal Tx-loopback (Tx output
%         after Repeat) and the real-RF ADC inputs. Both MUX inputs are
%         at 1/15.36e6 -- the MUX output rate is unambiguous.
%   - All composite Inports have explicit SampleTime = 1/15.36e6 so HDL
%     Coder's rate propagation into child blocks works cleanly (no
%     -1 inheritance crossing subsystem walls).
%
% Channel block (sim-only, marked 'No HDL') and debug-tap MUX are added
% in a follow-up iteration after this base topology is verified in sim.

srcSlx = 'trx_examples/targeting/QPSKTxRxHDLExample/commhdlQPSKTxRx.slx';
dstSlx = 'trx_examples/targeting/QPSKTxRxHDLExample/commhdlQPSKTxRxLoopback.slx';
if exist(dstSlx,'file'), delete(dstSlx); end
copyfile(srcSlx, dstSlx);
fprintf('cloned -> %s\n', dstSlx);

load_system('commhdlQPSKTxRxLoopback'); sys='commhdlQPSKTxRxLoopback';
% Fire the InitFcn so UpsamplesRx/Tx are in base workspace before any
% rate-aware block parameter evaluations.
eval(get_param(sys,'InitFcn'));

% Remove any prior TxRxComposite / TxRxLoopback (in case of retry)
for n = {'TxRxComposite','TxRxLoopback'}
  prev = find_system(sys,'SearchDepth',1,'Name',n{1});
  for k=1:numel(prev), delete_block(prev{k}); end
end

loop = [sys '/TxRxComposite'];
add_block('built-in/SubSystem', loop, 'Position',[100 600 280 800]);

% ----- Composite Inports (ALL ports at 1/15.36e6) -----
% Originally the AXI4-Lite register Inports (rstCS, iq_debug_mux,
% rx_input_select) were inherited (-1). But iq_debug_mux feeds a
% Downsample block inside the Receiver (the Receiver downsamples the AXI
% register so the capture-buffer address is in the slow-rate domain).
% With -1 here, HDL Coder's static rate analyzer fails on that Downsample
% with "input rate cannot be zero or Inf". Explicit 1/15.36e6 on every
% composite Inport gives HDL Coder a definitive boundary rate.
in_spec = {
  'adc_validIn',      'boolean', '1/15.36e6'; ...
  'adc_dataInI',      'int16',   '1/15.36e6'; ...
  'adc_dataInQ',      'int16',   '1/15.36e6'; ...
  'rstCS',            'boolean', '1/15.36e6'; ...
  'iq_debug_mux',     'uint32',  '1/15.36e6'; ...
  'rx_input_select',  'boolean', '1/15.36e6'};
for k=1:size(in_spec,1)
  blk = [loop '/' in_spec{k,1}];
  add_block('built-in/Inport', blk, 'Port', num2str(k), ...
            'Position', [30 30+40*k 60 50+40*k]);
  set_param(blk, 'OutDataTypeStr', in_spec{k,2}, 'SampleTime', in_spec{k,3});
end

% ----- Composite Outports -----
% 1..3 BIST counters, 4..8 Receiver debug, 9..11 Tx external (DAC).
out_names = {'count_out','packets_out','bit_errors_out', ...
             'debugI','debugQ','debugValid','debugI1','debugQ1', ...
             'tx_dataOutI','tx_dataOutQ','tx_validOut'};
for k=1:numel(out_names)
  add_block('built-in/Outport', [loop '/' out_names{k}], ...
            'Port', num2str(k), 'Position', [800 30+40*k 830 50+40*k]);
end

% ----- Copy Transmitter and Receiver INTO composite -----
add_block([sys '/Transmitter'], [loop '/Transmitter'], 'CopyOption','duplicate', 'Position',[300 200 430 350]);
add_block([sys '/Receiver'],    [loop '/Receiver'],    'CopyOption','duplicate', 'Position',[600 200 730 400]);

% Transmitter constant inputs (debug, dataI, dataQ -- same as original top-level constants).
gp = @(nm,p) get_param([sys '/' nm], p);
make_const = @(name, orig) add_block('built-in/Constant', [loop '/' name], ...
   'Value',          gp(orig,'Value'), ...
   'SampleTime',     '1/7.68e6', ...
   'OutDataTypeStr', gp(orig,'OutDataTypeStr'), ...
   'Position', [150 200 180 220]);
make_const('c_dbg',   'Debug');  set_param([loop '/c_dbg'],   'Position', [150 210 180 230]);
make_const('c_dataI', 'Debug1'); set_param([loop '/c_dataI'], 'Position', [150 240 180 260]);
make_const('c_dataQ', 'Debug2'); set_param([loop '/c_dataQ'], 'Position', [150 270 180 290]);

% Wire Transmitter inputs.
% validIn drives the Tx pipeline -- composite adc_validIn is at 1/15.36e6
% but Tx expects 1/7.68e6 for its internal logic. We Downsample by 2 before
% feeding Tx (the Tx then runs at 1/7.68e6 internally).
add_block('dspsigops/Downsample', [loop '/DS_TxValid'], ...
          'N', '2', ...
          'InputProcessing','Elements as channels (sample based)', ...
          'RateOptions','Allow multirate processing', ...
          'Position',[200 280 230 320]);
add_line(loop, 'adc_validIn/1', 'DS_TxValid/1');
add_line(loop, 'c_dbg/1',       'Transmitter/1');
add_line(loop, 'c_dataI/1',     'Transmitter/2');
add_line(loop, 'c_dataQ/1',     'Transmitter/3');
add_line(loop, 'DS_TxValid/1',  'Transmitter/4');     % Tx.validIn at 1/7.68e6

% Byte-TX path tie-offs (generator-mode defaults). The Transmitter's byte
% ports (5..7 in, 9 out -- see tools/add_byte_tx_path.m) are inert here so
% EXISTING variants build unchanged; the bytetx overlay replaces these
% constants/terminator with the real ByteWordBuffer plumbing.
add_block('built-in/Constant', [loop '/c_extWord'], 'Value','0', ...
   'OutDataTypeStr','uint64', 'SampleTime','1/7.68e6', 'Position',[150 310 180 330]);
add_block('built-in/Constant', [loop '/c_extAvail'], 'Value','false', ...
   'OutDataTypeStr','boolean', 'SampleTime','1/7.68e6', 'Position',[150 340 180 360]);
add_block('built-in/Constant', [loop '/c_extSel'], 'Value','false', ...
   'OutDataTypeStr','boolean', 'SampleTime','1/7.68e6', 'Position',[150 370 180 390]);
add_block('built-in/Constant', [loop '/c_extFirst'], 'Value','false', ...
   'OutDataTypeStr','boolean', 'SampleTime','1/7.68e6', 'Position',[150 400 180 420]);
add_line(loop, 'c_extWord/1',  'Transmitter/5');
add_line(loop, 'c_extAvail/1', 'Transmitter/6');
add_line(loop, 'c_extSel/1',   'Transmitter/7');
add_line(loop, 'c_extFirst/1', 'Transmitter/8');
add_block('built-in/Terminator', [loop '/T_extPop'], 'Position',[450 380 470 400]);
add_line(loop, 'Transmitter/9', 'T_extPop/1');

% ----- Tx output bridge to 1/15.36e6 (for DAC outputs AND for internal loopback MUX input) -----
% Use Repeat (N=2) blocks: 1/7.68e6 -> 1/15.36e6.
add_block('dspsigops/Repeat', [loop '/REP_TxI'], ...
          'FactorSource','Dialog parameter','N','2', 'Nmax','16', ...
          'InputProcessing','Elements as channels (sample based)', ...
          'RateOptions','Allow multirate processing','ic','0', ...
          'Position',[470 220 500 240]);
add_block('dspsigops/Repeat', [loop '/REP_TxQ'], ...
          'FactorSource','Dialog parameter','N','2', 'Nmax','16', ...
          'InputProcessing','Elements as channels (sample based)', ...
          'RateOptions','Allow multirate processing','ic','0', ...
          'Position',[470 260 500 280]);
add_block('dspsigops/Repeat', [loop '/REP_TxValid'], ...
          'FactorSource','Dialog parameter','N','2', 'Nmax','16', ...
          'InputProcessing','Elements as channels (sample based)', ...
          'RateOptions','Allow multirate processing','ic','0', ...
          'Position',[470 300 500 320]);
% Tx outputs at 1/7.68e6 -> Repeat -> 1/15.36e6
add_line(loop, 'Transmitter/1', 'REP_TxI/1');      % dataOutI (RRC-shaped, port 1)
add_line(loop, 'Transmitter/2', 'REP_TxQ/1');      % dataOutQ (port 2)
add_line(loop, 'Transmitter/4', 'REP_TxValid/1');  % validOut (port 4)

% Tx outputs to external DAC (sync_output ports)
add_line(loop, 'REP_TxI/1',     'tx_dataOutI/1');
add_line(loop, 'REP_TxQ/1',     'tx_dataOutQ/1');
add_line(loop, 'REP_TxValid/1', 'tx_validOut/1');

% ----- rx_input_select MUX (Switch blocks for I, Q, valid) -----
% Inputs at 1/15.36e6 (both ADC and REP_Tx outputs are at that rate).
% Criteria: u2 ~= 0 -> select Input 1 (top, ADC); else Input 3 (bottom, REP_Tx).
add_block('built-in/Switch', [loop '/MUX_RxI'],     'Criteria','u2 ~= 0', 'Position',[540 215 570 245]);
add_block('built-in/Switch', [loop '/MUX_RxQ'],     'Criteria','u2 ~= 0', 'Position',[540 255 570 285]);
add_block('built-in/Switch', [loop '/MUX_RxValid'], 'Criteria','u2 ~= 0', 'Position',[540 295 570 325]);

% MUX wiring: u1=ADC, u2=rx_input_select, u3=Tx-loopback
add_line(loop, 'adc_dataInI/1',     'MUX_RxI/1');
add_line(loop, 'rx_input_select/1', 'MUX_RxI/2');
add_line(loop, 'REP_TxI/1',         'MUX_RxI/3');
add_line(loop, 'adc_dataInQ/1',     'MUX_RxQ/1');
add_line(loop, 'rx_input_select/1', 'MUX_RxQ/2');
add_line(loop, 'REP_TxQ/1',         'MUX_RxQ/3');
add_line(loop, 'adc_validIn/1',     'MUX_RxValid/1');
add_line(loop, 'rx_input_select/1', 'MUX_RxValid/2');
add_line(loop, 'REP_TxValid/1',     'MUX_RxValid/3');

% MUX outputs at 1/15.36e6 -> Rate Transition blocks (explicit
% OutPortSampleTime=1/15.36e6) -> Receiver Inports. Rate Transition is the
% escape hatch: Simulink runtime-rate propagation works (sim decodes), but
% HDL Coder's static rate analyzer fails on the Receiver's internal
% Downsample blocks. Rate Transition declares the rate explicitly, which
% HDL Coder picks up as a definitive boundary.
add_block('built-in/RateTransition', [loop '/RT_RxValid'], ...
          'OutPortSampleTime', '1/15.36e6', ...
          'Position',[590 295 620 325]);
add_block('built-in/RateTransition', [loop '/RT_RxI'], ...
          'OutPortSampleTime', '1/15.36e6', ...
          'Position',[590 215 620 245]);
add_block('built-in/RateTransition', [loop '/RT_RxQ'], ...
          'OutPortSampleTime', '1/15.36e6', ...
          'Position',[590 255 620 285]);
add_line(loop, 'MUX_RxValid/1', 'RT_RxValid/1');
add_line(loop, 'MUX_RxI/1',     'RT_RxI/1');
add_line(loop, 'MUX_RxQ/1',     'RT_RxQ/1');
add_line(loop, 'RT_RxValid/1', 'Receiver/1');
add_line(loop, 'RT_RxI/1',     'Receiver/2');
add_line(loop, 'RT_RxQ/1',     'Receiver/3');

% AXI controls into Receiver
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

% Byte-RX tap tie-offs: Receiver outports 10..12 (recBit/recBitValid/
% recStart -- see tools/add_byte_rx_path.m) are terminated here so existing
% variants build unchanged; the bytetx overlay rewires them into the
% ByteSerializer.
for k = 10:12
  add_block('built-in/Terminator', sprintf('%s/T_rec%d', loop, k), ...
      'Position', [770 130+30*k 790 150+30*k]);
  add_line(loop, sprintf('Receiver/%d', k), sprintf('T_rec%d/1', k));
end

% Delete sim-only logging blocks inside the COPIED Tx/Rx so they don't
% clash with the originals on the top level.
killtypes = {'ToFile','ToWorkspace','Scope','XYGraph','SpectrumAnalyzer','ConstellationDiagram'};
nkilled = 0;
for kt = killtypes
  bk = find_system(loop, 'LookUnderMasks','all', 'FollowLinks','on', 'BlockType', kt{1});
  for j=1:numel(bk), delete_block(bk{j}); nkilled=nkilled+1; end
end
fprintf('deleted %d sim-only logging blocks inside composite\n', nkilled);

% Make TxRxComposite the HDL DUT.
hdlset_param(sys, 'HDLSubsystem', loop);

save_system(sys);
close_system(sys);
fprintf('TxRxComposite saved: all data ports at 1/15.36e6, rx_input_select MUX at 1/15.36e6.\n');
