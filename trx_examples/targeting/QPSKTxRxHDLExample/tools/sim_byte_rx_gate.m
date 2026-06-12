% sim_byte_rx_gate -- model-level gate for the FULL byte loopback (host
% bytes -> Tx byte path -> QPSK modulation -> internal loopback -> Receiver
% -> ByteSerializer -> byte_rx_* AXIS ports). Run from a kit cwd
% (build_composite_local.m + variant_pre.m = the bytetx overlay).
%
% Drive: the Tx byte ports get a known 280-byte payload through the same
% handshake-reactive ByteSrc as sim_byte_gate.m (word-aligned, first marker
% on word 1), tx_data_source=1 (byte mode), rx_input_select=0 (internal
% loopback). Sink: byte_rx_ready is tied TRUE and byte_rx_data/valid/last
% are logged; with ready always true the BeatGate asserts byte_rx_valid for
% exactly ONE 30.72M cycle per serialized word, so the accepted words are
% simply the data samples on valid-high steps.
%
% PASS: the collected words, grouped per wordLast, reproduce
% ByteDmaRegisters.pack(payload) byte-exactly for at least 3 CONSECUTIVE
% packets (initial garbage packets before Rx lock are allowed), and every
% complete packet from the first match onward stays byte-exact.
addpath(pwd);
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
run('build_composite_local.m');
run('variant_pre.m');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
evalin('base', get_param(sys,'InitFcn'));
set_param(sys,'SimulationCommand','update');
fprintf('UPDATE_OK\n');

% known non-BIST payload (every byte distinct from the zero pad)
payload = uint8(mod(7*(1:280)' + 13, 256));
words = ByteDmaRegisters.pack(payload);
assert(numel(words)==35);
assignin('base','byte_words', words);
assignin('base','byte_start_idx', uint32(1));   % word-aligned Tx stream

Nf=2*220000; Tsf=1/30.72e6; t=(0:Nf-1)'*Tsf;   % ~48 packets of sim time
v=false(Nf,1); v(1:2:end)=true;
h='byterx_harness'; if bdIsLoaded(h), close_system(h,0); end
new_system(h);
add_block([sys '/TxRxComposite'], [h '/DUT'], 'Position',[400 80 700 760]);
inSpec={'adc_validIn','boolean','1/30.72e6'; 'adc_dataInI','int16','1/30.72e6'; ...
        'adc_dataInQ','int16','1/30.72e6';  'rstCS','boolean','1/15.36e6'; ...
        'iq_debug_mux','uint32','1/15.36e6';'rx_input_select','boolean','1/15.36e6'; ...
        'host_txI','int16','1/30.72e6';     'host_txQ','int16','1/30.72e6'; ...
        'host_txValid','boolean','1/30.72e6'; 'tx_source_select','uint32','1/15.36e6'; ...
        'byte_valid_unused','boolean','1/30.72e6'; 'tx_data_source','uint32','1/15.36e6'};
for k=1:size(inSpec,1)
  if k==11, continue; end   % placeholder, byte feed wired separately
  blk=[h '/' inSpec{k,1}];
  add_block('built-in/Inport',blk,'Port',num2str(k - (k>11)),'Position',[100 40*k 130 40*k+20]);
  set_param(blk,'OutDataTypeStr',inSpec{k,2},'SampleTime',inSpec{k,3});
end
% handshake-reactive byte source (same as sim_byte_gate.m)
add_block('simulink/User-Defined Functions/MATLAB Function', [h '/ByteSrc'], ...
    'Position',[150 470 230 530]);
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
% Rx-side ready: always true (drop path is unit-tested; this gate checks
% the byte-exact stream)
add_block('built-in/Constant', [h '/byte_rx_ready'], 'Value','true', ...
    'OutDataTypeStr','boolean', 'SampleTime','1/30.72e6', 'Position',[100 640 130 660]);
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
add_line(h,'byte_rx_ready/1','DUT/15');
add_line(h,'DUT/12','ByteSrc/1');                 % byte_ready feedback
% outports: BIST counters + the three byte_rx streams
outMap={'count_out',1; 'packets_out',2; 'bit_errors_out',3; ...
        'byte_rx_data',13; 'byte_rx_valid',14; 'byte_rx_last',15};
for k=1:size(outMap,1)
  add_block('built-in/Outport',[h '/' outMap{k,1}],'Port',num2str(k),'Position',[800 40*k 830 40*k+20]);
  add_line(h,sprintf('DUT/%d',outMap{k,2}),[outMap{k,1} '/1'],'autorouting','on');
end
done=[outMap{:,2}];
ph=get_param([h '/DUT'],'PortHandles');
for k=setdiff(1:numel(ph.Outport), done)
  add_block('built-in/Terminator',sprintf('%s/T%d',h,k),'Position',[860 40*k+200 880 40*k+220]);
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

so=sim(h);
y=so.yout;
pk=double(y{2}.Values.Data(end));
wData=uint64(y{4}.Values.Data(:));
wVal =logical(y{5}.Values.Data(:));
wLast=logical(y{6}.Values.Data(:));
rxWords=wData(wVal); rxLast=wLast(wVal);
fprintf('BYTE-RX-GATE: packets_out=%d, accepted words=%d (last flags=%d)\n', ...
    pk, numel(rxWords), nnz(rxLast));
assert(pk>3, 'Rx never synced packets');
assert(~isempty(rxWords), 'no byte_rx words emitted');
% group accepted words into packets ending at wordLast
ends=find(rxLast); pkts={}; s=1;
for e=ends'
  pkts{end+1}=rxWords(s:e); %#ok<AGROW>
  s=e+1;
end
match=cellfun(@(p) numel(p)==35 && isequal(p(:),words), pkts);
fprintf('BYTE-RX-GATE: %d complete packets, %d byte-exact\n', numel(match), nnz(match));
firstM=find(match,1);
assert(~isempty(firstM), 'no byte-exact packet recovered');
run=match(firstM:end);
assert(numel(run)>=3 && all(run), sprintf( ...
  'byte-rx gate failed: need >=3 consecutive byte-exact packets to the end (got %d, run=%s)', ...
  nnz(run), mat2str(double(run))));
fprintf('BYTE RX GATE PASS (%d consecutive byte-exact packets after %d garbage)\n', ...
    numel(run), firstM-1);
close_system(h,0);
