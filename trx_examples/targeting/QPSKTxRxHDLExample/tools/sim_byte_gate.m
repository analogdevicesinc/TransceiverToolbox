% sim_byte_gate -- model-level gate for the byte-TX path. Run from a kit
% cwd (build_composite_local.m + variant_pre.m = the bytetx overlay).
% Drives the composite's byte interface with the BIST-reference payload
% ("ADI Hello World" + zero pad, 35 x 64-bit words) through a
% handshake-reactive source, selects byte mode (tx_data_source=1) on the
% internal loopback, and requires the BIST to count packets.
%
% The gate runs TWICE:
%   * idx0 = 1  -- word-aligned stream (first-marked word at the head):
%     ZERO errors over the whole run (the bytes equal the BIST reference,
%     so the BIST is the checker).
%   * idx0 = 18 -- ROTATED stream (emulates the arbitrary cyclic-DMA word
%     phase): the shifter must converge via the in-band first-word marker.
%     The first packet(s) may be garbage, so the assertion is that
%     bit_errors stops increasing after the first 5 packets (sampled at
%     25%% and 100%% of sim time and required equal), with packets>3.
%
% The source also emits `first` (true when idx==1), modeling
% util_axis_byte_breakout's byte_first (registered from tlast).
addpath(pwd);
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
run('build_composite_local.m');
run('variant_pre.m');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
evalin('base', get_param(sys,'InitFcn'));
set_param(sys,'SimulationCommand','update');
fprintf('UPDATE_OK\n');

% BIST-reference payload as 35 words (LSB byte = first byte, per pack())
payload = zeros(280,1,'uint8'); payload(1:15) = uint8('ADI Hello World');
words = ByteDmaRegisters.pack(payload);
assignin('base','byte_words', words);

Nf=2*220000; Tsf=1/30.72e6; t=(0:Nf-1)'*Tsf;   % ~100 packets
v=false(Nf,1); v(1:2:end)=true;
h='byte_harness'; if bdIsLoaded(h), close_system(h,0); end
new_system(h);
add_block([sys '/TxRxComposite'], [h '/DUT'], 'Position',[400 80 700 700]);
inSpec={'adc_validIn','boolean','1/30.72e6'; 'adc_dataInI','int16','1/30.72e6'; ...
        'adc_dataInQ','int16','1/30.72e6';  'rstCS','boolean','1/15.36e6'; ...
        'iq_debug_mux','uint32','1/15.36e6';'rx_input_select','boolean','1/15.36e6'; ...
        'host_txI','int16','1/30.72e6';     'host_txQ','int16','1/30.72e6'; ...
        'host_txValid','boolean','1/30.72e6'; 'tx_source_select','uint32','1/15.36e6'; ...
        'byte_valid_unused','boolean','1/30.72e6'; 'tx_data_source','uint32','1/15.36e6'};
% ports 1..10 external timeseries; DUT 11 (byte_data), 12 (byte_valid) and
% 14 (byte_first) come from the reactive source; 13=tx_data_source external
for k=1:size(inSpec,1)
  if k==11, continue; end   % placeholder, byte feed wired separately
  blk=[h '/' inSpec{k,1}];
  add_block('built-in/Inport',blk,'Port',num2str(k - (k>11)),'Position',[100 40*k 130 40*k+20]);
  set_param(blk,'OutDataTypeStr',inSpec{k,2},'SampleTime',inSpec{k,3});
end
% handshake-reactive byte source: emits word(idx), advances on accept (AXIS:
% the beat where valid && ready), flags first=true on word 1 (the in-band
% marker the breakout derives from tlast). The 35-word payload and the
% start index arrive through Constant ports (base ws) -- no evalin inside
% compiled code; idx0 selects the stream rotation per run. Rate is
% inherited from the DUT's byte_ready (30.72M).
add_block('simulink/User-Defined Functions/MATLAB Function', [h '/ByteSrc'], ...
    'Position',[150 470 230 530]);
% configure the MATLAB Function code via Stateflow API
rt = sfroot;
ch = rt.find('-isa','Stateflow.EMChart','Path',[h '/ByteSrc']);
ch.Script = sprintf([ ...
'function [data, valid, first] = src(ready, words, idx0)\n' ...
'persistent idx\n' ...
'if isempty(idx), idx = uint32(idx0); end\n' ...
'data = words(idx);\n' ...
'valid = true;\n' ...
'first = (idx == uint32(1));\n' ...
'if ready\n' ...
'    idx = idx + 1;\n' ...
'    if idx > uint32(numel(words)), idx = uint32(1); end\n' ...
'end\n']);
add_block('built-in/Constant', [h '/WordsConst'], 'Value','byte_words', ...
    'OutDataTypeStr','uint64', 'Position',[60 540 100 560]);
add_line(h, 'WordsConst/1', 'ByteSrc/2');
add_block('built-in/Constant', [h '/StartIdxConst'], 'Value','byte_start_idx', ...
    'OutDataTypeStr','uint32', 'Position',[60 580 100 600]);
add_line(h, 'StartIdxConst/1', 'ByteSrc/3');
% DUT wiring
add_line(h,'adc_validIn/1','DUT/1'); add_line(h,'adc_dataInI/1','DUT/2');
add_line(h,'adc_dataInQ/1','DUT/3'); add_line(h,'rstCS/1','DUT/4');
add_line(h,'iq_debug_mux/1','DUT/5'); add_line(h,'rx_input_select/1','DUT/6');
add_line(h,'host_txI/1','DUT/7'); add_line(h,'host_txQ/1','DUT/8');
add_line(h,'host_txValid/1','DUT/9'); add_line(h,'tx_source_select/1','DUT/10');
add_line(h,'ByteSrc/1','DUT/11');                 % byte_data
add_line(h,'ByteSrc/2','DUT/12');                 % byte_valid
add_line(h,'tx_data_source/1','DUT/13');
add_line(h,'ByteSrc/3','DUT/14');                 % byte_first
% byte_ready (DUT outport 12) feeds back to the source
add_line(h,'DUT/12','ByteSrc/1');
outNames={'count_out','packets_out','bit_errors_out'};
for k=1:numel(outNames)
  add_block('built-in/Outport',[h '/' outNames{k}],'Port',num2str(k),'Position',[800 40*k 830 40*k+20]);
  add_line(h,sprintf('DUT/%d',k),[outNames{k} '/1'],'autorouting','on');
end
for k=numel(outNames)+1:11
  add_block('built-in/Terminator',sprintf('%s/T%d',h,k),'Position',[800 40*k+200 820 40*k+220]);
  add_line(h,sprintf('DUT/%d',k),sprintf('T%d/1',k),'autorouting','on');
end
set_param(h,'SolverType','Fixed-step','Solver','FixedStepDiscrete', ...
  'StopTime',num2str(Nf*Tsf),'SaveOutput','on','OutputSaveName','yout', ...
  'SaveFormat','Dataset','LoadExternalInput','on','ExternalInput','ds_ext','SignalLogging','off');
ts15=(0:ceil(Nf/2)-1)'*(1/15.36e6); n15=numel(ts15);
ds=Simulink.SimulationData.Dataset;
ds=ds.addElement(timeseries(logical(v),t),'adc_validIn');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'adc_dataInI');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'adc_dataInQ');
ds=ds.addElement(timeseries(false(n15,1),ts15),'rstCS');
ds=ds.addElement(timeseries(uint32(zeros(n15,1)),ts15),'iq_debug_mux');
ds=ds.addElement(timeseries(false(n15,1),ts15),'rx_input_select');   % INTERNAL
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txI');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txQ');
ds=ds.addElement(timeseries(true(Nf,1),t),'host_txValid');
ds=ds.addElement(timeseries(uint32(zeros(n15,1)),ts15),'tx_source_select');
ds=ds.addElement(timeseries(uint32(ones(n15,1)),ts15),'tx_data_source');  % BYTE MODE
assignin('base','ds_ext',ds);

% --- run 1: word-aligned stream (idx0 = 1) -> strict zero errors ---
assignin('base','byte_start_idx', uint32(1));
so=sim(h);
y=so.yout;
pk=double(y{2}.Values.Data(end)); er=double(y{3}.Values.Data(end));
fprintf('BYTE-GATE[idx0=1]: packets=%d errors=%d\n', pk, er);
assert(pk>3 && er==0, 'byte gate (aligned) failed');

% --- run 2: ROTATED stream (idx0 = 18) -> errors stop after early packets ---
assignin('base','byte_start_idx', uint32(18));
so=sim(h);
y=so.yout;
pk=double(y{2}.Values.Data(end));
erT=y{3}.Values.Time; erV=double(y{3}.Values.Data);
e25=erV(find(erT<=0.25*Nf*Tsf,1,'last')); eEnd=erV(end);
fprintf('BYTE-GATE[idx0=18]: packets=%d errors@25%%=%d errors@100%%=%d\n', pk, e25, eEnd);
assert(pk>3 && eEnd==e25, 'byte gate (rotated) failed: errors still increasing');

fprintf('BYTE GATE PASS (aligned + rotated)\n');
close_system(h,0);
