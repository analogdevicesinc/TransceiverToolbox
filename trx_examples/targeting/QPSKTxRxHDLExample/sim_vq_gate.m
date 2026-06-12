% Gate for the valid-qualified front-end: 30.72-rate stimulus, gap-2 valid,
% GARBAGE on off-beats (emulates LVDS pack half-shifted words). Must decode 0%.
addpath(pwd); addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
evalin('base', get_param(sys,'InitFcn'));
S=load('raw_golden_now.mat'); cap=S.iq(:);
ci=double(int16(real(cap)*2^14)); cq=double(int16(imag(cap)*2^14));
Nf=2*numel(cap); Tsf=1/30.72e6; t=(0:Nf-1)'*Tsf; Tstop=Nf*Tsf;
% interleave: beat0 = real sample (valid=1), beat1 = GARBAGE (valid=0)
g=2^13*(2*mod(17*(1:numel(cap))',7)/7-1);   % deterministic garbage
dI=zeros(Nf,1); dQ=zeros(Nf,1); v=false(Nf,1);
dI(1:2:end)=ci; dI(2:2:end)=g; dQ(1:2:end)=cq; dQ(2:2:end)=-g; v(1:2:end)=true;
h='vq_harness'; if bdIsLoaded(h), close_system(h,0); end
new_system(h);
add_block([sys '/TxRxComposite'], [h '/DUT'], 'Position',[400 80 650 560]);
inSpec={'adc_validIn','boolean','logical','1/30.72e6'; 'adc_dataInI','int16','int16','1/30.72e6'; ...
        'adc_dataInQ','int16','int16','1/30.72e6';    'rstCS','boolean','logical','1/15.36e6'; ...
        'iq_debug_mux','uint32','uint32','1/15.36e6'; 'rx_input_select','boolean','logical','1/15.36e6'; ...
        'host_txI','int16','int16','1/30.72e6';       'host_txQ','int16','int16','1/30.72e6'; ...
        'host_txValid','boolean','logical','1/30.72e6'; 'tx_source_select','uint32','uint32','1/15.36e6'};
% bytetx-overlay models grow byte ports (in 11..14, out 12 byte_ready);
% tie them off (generator mode, byte_first=false) so this gate still
% checks the stock path.
ph=get_param([h '/DUT'],'PortHandles');
nIn=numel(ph.Inport); nOut=numel(ph.Outport);
if nIn>=13
  inSpec=[inSpec; {'byte_data','uint64','uint64','1/30.72e6'; ...
    'byte_valid','boolean','logical','1/30.72e6'; ...
    'tx_data_source','uint32','uint32','1/15.36e6'}];
end
if nIn>=14
  inSpec=[inSpec; {'byte_first','boolean','logical','1/30.72e6'}];
end
for k=1:size(inSpec,1)
  blk=[h '/' inSpec{k,1}];
  add_block('built-in/Inport',blk,'Port',num2str(k),'Position',[100 40*k 130 40*k+20]);
  set_param(blk,'OutDataTypeStr',inSpec{k,2},'SampleTime',inSpec{k,4});
  add_line(h,[inSpec{k,1} '/1'],sprintf('DUT/%d',k),'autorouting','on');
end
outNames={'count_out','packets_out','bit_errors_out'};
for k=1:numel(outNames)
  add_block('built-in/Outport',[h '/' outNames{k}],'Port',num2str(k),'Position',[800 40*k 830 40*k+20]);
  add_line(h,sprintf('DUT/%d',k),[outNames{k} '/1'],'autorouting','on');
end
for k=numel(outNames)+1:nOut
  add_block('built-in/Terminator',sprintf('%s/T%d',h,k),'Position',[800 40*k+200 820 40*k+220]);
  add_line(h,sprintf('DUT/%d',k),sprintf('T%d/1',k),'autorouting','on');
end
set_param(h,'SolverType','Fixed-step','Solver','FixedStepDiscrete', ...
  'StopTime',num2str(Tstop),'SaveOutput','on','OutputSaveName','yout', ...
  'SaveFormat','Dataset','LoadExternalInput','on','ExternalInput','ds_ext','SignalLogging','off');
slow=@(val) timeseries(val*ones(ceil(Nf/2),1), (0:ceil(Nf/2)-1)'*(1/15.36e6));
ds=Simulink.SimulationData.Dataset;
ds=ds.addElement(timeseries(logical(v),t),'adc_validIn');
ds=ds.addElement(timeseries(int16(dI),t),'adc_dataInI');
ds=ds.addElement(timeseries(int16(dQ),t),'adc_dataInQ');
ds=ds.addElement(timeseries(false(ceil(Nf/2),1),(0:ceil(Nf/2)-1)'*(1/15.36e6)),'rstCS');
ds=ds.addElement(timeseries(uint32(zeros(ceil(Nf/2),1)),(0:ceil(Nf/2)-1)'*(1/15.36e6)),'iq_debug_mux');
ds=ds.addElement(timeseries(true(ceil(Nf/2),1),(0:ceil(Nf/2)-1)'*(1/15.36e6)),'rx_input_select');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txI');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txQ');
ds=ds.addElement(timeseries(true(Nf,1),t),'host_txValid');
ds=ds.addElement(timeseries(uint32(zeros(ceil(Nf/2),1)),(0:ceil(Nf/2)-1)'*(1/15.36e6)),'tx_source_select');
if nIn>=13
  ds=ds.addElement(timeseries(uint64(zeros(Nf,1)),t),'byte_data');
  ds=ds.addElement(timeseries(false(Nf,1),t),'byte_valid');
  ds=ds.addElement(timeseries(uint32(zeros(ceil(Nf/2),1)),(0:ceil(Nf/2)-1)'*(1/15.36e6)),'tx_data_source');
end
if nIn>=14
  ds=ds.addElement(timeseries(false(Nf,1),t),'byte_first');
end
assignin('base','ds_ext',ds);
so=sim(h);
y=so.yout;
pk=double(y{2}.Values.Data(end)); er=double(y{3}.Values.Data(end));
fprintf('VQ-GATE (gap-2 valid + off-beat GARBAGE): packets=%d errors=%d\n', pk, er);
assert(pk>3 && er==0, 'VQ gate failed');
fprintf('VQ GATE PASS\n');
close_system(h,0);
