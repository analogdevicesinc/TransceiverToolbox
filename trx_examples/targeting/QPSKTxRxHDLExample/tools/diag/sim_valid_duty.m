% Emulate HW-style cable inputs in sim: data held 2 steps, valid alternating 1/0
% (50% duty). If BIST=0 packets here while full-duty decodes, the HW mechanism is
% the Receiver consuming a valid-gated HALF-rate stream on the cable branch.
addpath(pwd); addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
evalin('base', get_param(sys,'InitFcn'));
S=load('raw_golden_now.mat'); cap=S.iq(:);
capi=double(int16(real(cap)*2^14)); capq=double(int16(imag(cap)*2^14));
Ts=1/15.36e6; N=numel(cap); Tstop=N*Ts; t=(0:N-1)'*Ts;
h='verif_duty_harness';
if bdIsLoaded(h), close_system(h,0); end
new_system(h);
add_block([sys '/TxRxComposite'], [h '/DUT'], 'Position',[400 80 650 560]);
inSpec={'adc_validIn','boolean','logical'; 'adc_dataInI','int16','int16'; ...
        'adc_dataInQ','int16','int16';    'rstCS','boolean','logical'; ...
        'iq_debug_mux','uint32','uint32'; 'rx_input_select','boolean','logical'; ...
        'host_txI','int16','int16';       'host_txQ','int16','int16'; ...
        'host_txValid','boolean','logical'; 'tx_source_select','uint32','uint32'};
for k=1:size(inSpec,1)
  blk=[h '/' inSpec{k,1}];
  add_block('built-in/Inport',blk,'Port',num2str(k),'Position',[100 40*k 130 40*k+20]);
  set_param(blk,'OutDataTypeStr',inSpec{k,2},'SampleTime','1/15.36e6');
  add_line(h,[inSpec{k,1} '/1'],sprintf('DUT/%d',k),'autorouting','on');
end
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
  'StopTime',num2str(Tstop),'SaveOutput','on','OutputSaveName','yout', ...
  'SaveFormat','Dataset','LoadExternalInput','on','ExternalInput','ds_ext','SignalLogging','off');
% HW-style: hold each sample 2 steps, valid alternating
idx=floor((0:N-1)'/2)*2+1; dI=capi(idx); dQ=capq(idx);
valt=mod((0:N-1)',2)==0;
o=ones(N,1); z=zeros(N,1);
vals={valt, dI, dQ, z, z, o, z, z, o, z};
ds=Simulink.SimulationData.Dataset;
for k=1:numel(vals), ds=ds.addElement(timeseries(cast(vals{k},inSpec{k,3}),t), inSpec{k,1}); end
assignin('base','ds_ext',ds);
so=sim(h);
y=so.yout;
pk=double(y{2}.Values.Data(end)); er=double(y{3}.Values.Data(end));
fprintf('SIM 50%%-duty-valid (HW-style cable input): packets=%d errors=%d\n', pk, er);
close_system(h,0);
