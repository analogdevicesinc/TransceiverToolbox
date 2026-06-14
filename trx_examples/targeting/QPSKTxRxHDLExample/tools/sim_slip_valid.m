% sim_slip_valid -- reproduce the Tx/Rx clock divergence with NO model edit.
% In internal loopback, adc_validIn paces ONLY the Transmitter (via DS_TxValid);
% the Receiver runs on IntValidConst. Dropping periodic adc_validIn pulses makes
% the Tx under-produce relative to the Rx -> the Rx sees repeated samples = the
% sample-slip the HW adc/dac ppm offset produces. One slip per SLIP_PER pulses.
addpath(pwd); addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
run('build_composite_local.m'); run('variant_pre.m');
sys='commhdlQPSKTxRxLoopback'; load_system(sys); top=[sys '/TxRxComposite'];
evalin('base', get_param(sys,'InitFcn')); set_param(sys,'SimulationCommand','update'); fprintf('UPDATE_OK\n');

Nf=2*220000; Tsf=1/30.72e6; t=(0:Nf-1)'*Tsf;
% baseline gap-2 valid, then DROP one pulse every SLIP_PER (Tx underproduces)
v=false(Nf,1); v(1:2:end)=true;
SLIP_PER=str2double(getenv('QPSK_SLIP_PER')); if isnan(SLIP_PER),SLIP_PER=0; end
ndrop=0;
if SLIP_PER>0
  vp=find(v); drop=vp(SLIP_PER:SLIP_PER:numel(vp)); v(drop)=false; ndrop=numel(drop);
end
fprintf('SLIP-VALID: SLIP_PER=%d dropped %d Tx-pace pulses\n', SLIP_PER, ndrop);

h='slv_h'; if bdIsLoaded(h), close_system(h,0); end; new_system(h);
add_block([top],[h '/DUT'],'Position',[400 80 650 560]);
ph=get_param([h '/DUT'],'PortHandles'); nIn=numel(ph.Inport); nOut=numel(ph.Outport);
inSpec={'adc_validIn','boolean','1/30.72e6';'adc_dataInI','int16','1/30.72e6';'adc_dataInQ','int16','1/30.72e6';...
 'rstCS','boolean','1/15.36e6';'iq_debug_mux','uint32','1/15.36e6';'rx_input_select','boolean','1/15.36e6';...
 'host_txI','int16','1/30.72e6';'host_txQ','int16','1/30.72e6';'host_txValid','boolean','1/30.72e6';'tx_source_select','uint32','1/15.36e6'};
if nIn>=13, inSpec=[inSpec;{'byte_data','uint64','1/30.72e6';'byte_valid','boolean','1/30.72e6';'tx_data_source','uint32','1/15.36e6'}]; end
if nIn>=14, inSpec=[inSpec;{'byte_first','boolean','1/30.72e6'}]; end
if nIn>=15, inSpec=[inSpec;{'byte_rx_ready','boolean','1/30.72e6'}]; end
for k=1:size(inSpec,1)
  blk=[h '/' inSpec{k,1}]; add_block('built-in/Inport',blk,'Port',num2str(k),'Position',[100 40*k 130 40*k+20]);
  set_param(blk,'OutDataTypeStr',inSpec{k,2},'SampleTime',inSpec{k,3}); add_line(h,[inSpec{k,1} '/1'],sprintf('DUT/%d',k),'autorouting','on');
end
outNames={'count_out','packets_out','bit_errors_out'};
for k=1:numel(outNames), add_block('built-in/Outport',[h '/' outNames{k}],'Port',num2str(k),'Position',[800 40*k 830 40*k+20]); add_line(h,sprintf('DUT/%d',k),[outNames{k} '/1'],'autorouting','on'); end
for k=numel(outNames)+1:nOut, add_block('built-in/Terminator',sprintf('%s/T%d',h,k),'Position',[800 40*k+200 820 40*k+220]); add_line(h,sprintf('DUT/%d',k),sprintf('T%d/1',k),'autorouting','on'); end
set_param(h,'SolverType','Fixed-step','Solver','FixedStepDiscrete','StopTime',num2str(Nf*Tsf),'SaveOutput','on','OutputSaveName','yout','SaveFormat','Dataset','LoadExternalInput','on','ExternalInput','ds_ext','SignalLogging','off');
ts15=(0:ceil(Nf/2)-1)'*(1/15.36e6); n15=numel(ts15); ds=Simulink.SimulationData.Dataset;
ds=ds.addElement(timeseries(logical(v),t),'adc_validIn');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'adc_dataInI');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'adc_dataInQ');
ds=ds.addElement(timeseries(false(n15,1),ts15),'rstCS');
ds=ds.addElement(timeseries(uint32(zeros(n15,1)),ts15),'iq_debug_mux');
ds=ds.addElement(timeseries(false(n15,1),ts15),'rx_input_select');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txI');
ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txQ');
ds=ds.addElement(timeseries(false(Nf,1),t),'host_txValid');
ds=ds.addElement(timeseries(uint32(zeros(n15,1)),ts15),'tx_source_select');
if nIn>=13, ds=ds.addElement(timeseries(uint64(zeros(Nf,1)),t),'byte_data'); ds=ds.addElement(timeseries(false(Nf,1),t),'byte_valid'); ds=ds.addElement(timeseries(uint32(zeros(n15,1)),ts15),'tx_data_source'); end
if nIn>=14, ds=ds.addElement(timeseries(false(Nf,1),t),'byte_first'); end
if nIn>=15, ds=ds.addElement(timeseries(true(Nf,1),t),'byte_rx_ready'); end
assignin('base','ds_ext',ds);
so=sim(h); y=so.yout;
cnt=max(double(y{1}.Values.Data)); pk=double(y{2}.Values.Data(end)); er=double(y{3}.Values.Data(end));
fprintf('SLIP-VALID RESULT: max_count=%d packets=%d total_errors=%d  (dropped %d Tx-pace pulses)\n', cnt, pk, er, ndrop);
close_system(h,0);
% GATE: the receiver must decode AND tolerate the injected clock-rate slips
assert(pk > 3, 'receiver did not sustain packet sync');
assert(er == 0, sprintf('SLIP GATE FAIL: %d errors under %d-pulse Tx/Rx clock offset', er, ndrop));
fprintf('SLIP GATE PASS (model tolerated %d clock-rate slips with 0 errors)\n', ndrop);
