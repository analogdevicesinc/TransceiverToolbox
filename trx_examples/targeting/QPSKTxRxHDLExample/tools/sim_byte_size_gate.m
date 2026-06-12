% sim_byte_size_gate -- the configurable-packet-size verification: build
% the ENTIRE composite at a non-default size (QPSK_DBPP=1280 bits = 20
% words = 160 bytes) and run the full byte loopback in sim. PASS = the
% BIST syncs packets with zero errors (the generator's reference window is
% unchanged) AND the byte-rx stream reproduces the packed payload
% byte-exactly with wordLast every 20 words.
% size override: env QPSK_SIZE_GATE_DBPP (default 1280)
gateDbpp = str2double(getenv('QPSK_SIZE_GATE_DBPP'));
if isnan(gateDbpp) || isempty(gateDbpp), gateDbpp = 1280; end
fprintf('size gate DBPP=%d\n', gateDbpp);
setappdata(0, 'QPSK_DBPP', gateDbpp);
cleanupSize = onCleanup(@() rmappdata(0, 'QPSK_DBPP'));
addpath(pwd);
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
run('build_composite_local.m');
run('variant_pre.m');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
evalin('base', get_param(sys,'InitFcn'));
set_param(sys,'SimulationCommand','update');
fprintf('UPDATE_OK (DBPP=%d)\n', gateDbpp);

C = commhdlQPSKTxRxParameters;
assert(C.DataBitsPerPacket == gateDbpp, 'override did not take');
nBytes = gateDbpp/8; nWords = gateDbpp/64;
payload = zeros(nBytes,1,'uint8'); payload(1:15) = uint8('ADI Hello World');
words = ByteDmaRegisters.pack(payload);
assert(numel(words) == nWords);
assignin('base','byte_words', words);
assignin('base','byte_start_idx', uint32(1));

% sized for ~80 packets at DBPP=1280; scale with packet length
Nf=ceil(2*220000*gateDbpp/1280); Tsf=1/30.72e6; t=(0:Nf-1)'*Tsf;
v=false(Nf,1); v(1:2:end)=true;
h='size_harness'; if bdIsLoaded(h), close_system(h,0); end
new_system(h);
add_block([sys '/TxRxComposite'], [h '/DUT'], 'Position',[400 80 700 760]);
inSpec={'adc_validIn','boolean','1/30.72e6'; 'adc_dataInI','int16','1/30.72e6'; ...
        'adc_dataInQ','int16','1/30.72e6';  'rstCS','boolean','1/15.36e6'; ...
        'iq_debug_mux','uint32','1/15.36e6';'rx_input_select','boolean','1/15.36e6'; ...
        'host_txI','int16','1/30.72e6';     'host_txQ','int16','1/30.72e6'; ...
        'host_txValid','boolean','1/30.72e6'; 'tx_source_select','uint32','1/15.36e6'; ...
        'byte_valid_unused','boolean','1/30.72e6'; 'tx_data_source','uint32','1/15.36e6'};
for k=1:size(inSpec,1)
  if k==11, continue; end
  blk=[h '/' inSpec{k,1}];
  add_block('built-in/Inport',blk,'Port',num2str(k - (k>11)),'Position',[100 40*k 130 40*k+20]);
  set_param(blk,'OutDataTypeStr',inSpec{k,2},'SampleTime',inSpec{k,3});
end
add_block('simulink/User-Defined Functions/MATLAB Function', [h '/ByteSrc'], ...
    'Position',[150 470 230 530]);
ch = sfroot().find('-isa','Stateflow.EMChart','Path',[h '/ByteSrc']);
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
add_block('built-in/Constant', [h '/byte_rx_ready'], 'Value','true', ...
    'OutDataTypeStr','boolean', 'SampleTime','1/30.72e6', 'Position',[100 640 130 660]);
add_line(h,'adc_validIn/1','DUT/1'); add_line(h,'adc_dataInI/1','DUT/2');
add_line(h,'adc_dataInQ/1','DUT/3'); add_line(h,'rstCS/1','DUT/4');
add_line(h,'iq_debug_mux/1','DUT/5'); add_line(h,'rx_input_select/1','DUT/6');
add_line(h,'host_txI/1','DUT/7'); add_line(h,'host_txQ/1','DUT/8');
add_line(h,'host_txValid/1','DUT/9'); add_line(h,'tx_source_select/1','DUT/10');
add_line(h,'ByteSrc/1','DUT/11'); add_line(h,'ByteSrc/2','DUT/12');
add_line(h,'tx_data_source/1','DUT/13'); add_line(h,'ByteSrc/3','DUT/14');
add_line(h,'byte_rx_ready/1','DUT/15');
add_line(h,'DUT/12','ByteSrc/1');
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
ds=ds.addElement(timeseries(false(n15,1),ts15),'rx_input_select');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txI');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txQ');
ds=ds.addElement(timeseries(true(Nf,1),t),'host_txValid');
ds=ds.addElement(timeseries(uint32(zeros(n15,1)),ts15),'tx_source_select');
ds=ds.addElement(timeseries(uint32(ones(n15,1)),ts15),'tx_data_source');
assignin('base','ds_ext',ds);

so=sim(h);
y=so.yout;
pk=double(y{2}.Values.Data(end)); er=double(y{3}.Values.Data(end));
wData=uint64(y{4}.Values.Data(:)); wVal=logical(y{5}.Values.Data(:)); wLast=logical(y{6}.Values.Data(:));
rxWords=wData(wVal); rxLast=wLast(wVal);
fprintf('SIZE-GATE: packets=%d errors=%d rxWords=%d lasts=%d\n', pk, er, numel(rxWords), nnz(rxLast));
assert(pk>3 && er==0, sprintf('BIST failed at DBPP=%d', gateDbpp));
ends=find(rxLast); s0=1; nx=0;
for e=ends'
  p1=rxWords(s0:e); s0=e+1;
  if numel(p1)==nWords && isequal(p1(:),words), nx=nx+1; end
end
assert(nx>=3, sprintf('fewer than 3 byte-exact packets at DBPP=%d', gateDbpp));
fprintf('SIZE GATE PASS (%d byte-exact %d-word packets at DBPP=%d)\n', nx, nWords, gateDbpp);
close_system(h,0);
