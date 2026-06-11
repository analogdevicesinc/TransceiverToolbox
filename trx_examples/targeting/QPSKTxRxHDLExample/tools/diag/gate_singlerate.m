% gate_singlerate.m -- sim gates for the single-rate valid-gated Rx front-end.
% Run from a variant kit cwd (build_composite_local.m + variant_pre.m present).
% Rebuilds the composite + overlay, then drives the DUT with the real RF
% capture under FIVE valid-timing patterns. The Rx must decode all of them:
% silicon's valid beat placement is unobservable, so the design must be
% immune to it by construction.
addpath(pwd);
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');

run('build_composite_local.m');
run('variant_pre.m');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
evalin('base', get_param(sys,'InitFcn'));
set_param(sys,'SimulationCommand','update');
fprintf('UPDATE_OK\n');

S=load('raw_golden_now.mat'); cap=S.iq(:);
ci=int16(real(cap)*2^14); cq=int16(imag(cap)*2^14);
Ns=numel(cap);

% valid-position generators over a 30.72 timeline; each places Ns sample beats
pats = struct( ...
  'even',   @(N) 1:2:N, ...
  'odd',    @(N) 2:2:N, ...
  'burst2', @(N) sort([1:4:N, 2:4:N]), ...           % VV--VV--
  'jitter', @(N) jitter_pos(N));                     % irregular, 50% avg

names = fieldnames(pats); allpass = true;
for pi = 1:numel(names)+1
  internal = pi > numel(names);
  if internal
    label='INTERNAL'; vpos=1:2:2*Ns;     % gap-2 paces DS_TxValid; data unused
  else
    label=names{pi}; vpos=pats.(label)(2*Ns); vpos=vpos(1:min(Ns,numel(vpos)));
  end
  Nf=2*Ns; Tsf=1/30.72e6; t=(0:Nf-1)'*Tsf;
  g=int16(2^13*(2*mod(17*(1:Nf)',7)/7-1));           % deterministic garbage
  dI=g; dQ=-g; v=false(Nf,1);
  v(vpos)=true;
  if ~internal
    dI(vpos)=ci(1:numel(vpos)); dQ(vpos)=cq(1:numel(vpos));
  end
  h='sr_harness'; if bdIsLoaded(h), close_system(h,0); end
  new_system(h);
  add_block([sys '/TxRxComposite'], [h '/DUT'], 'Position',[400 80 650 560]);
  inSpec={'adc_validIn','boolean','1/30.72e6'; 'adc_dataInI','int16','1/30.72e6'; ...
          'adc_dataInQ','int16','1/30.72e6';  'rstCS','boolean','1/30.72e6'; ...
          'iq_debug_mux','uint32','1/30.72e6';'rx_input_select','boolean','1/30.72e6'; ...
          'host_txI','int16','1/30.72e6';     'host_txQ','int16','1/30.72e6'; ...
          'host_txValid','boolean','1/30.72e6'; 'tx_source_select','uint32','1/15.36e6'};
  for k=1:size(inSpec,1)
    blk=[h '/' inSpec{k,1}];
    add_block('built-in/Inport',blk,'Port',num2str(k),'Position',[100 40*k 130 40*k+20]);
    set_param(blk,'OutDataTypeStr',inSpec{k,2},'SampleTime',inSpec{k,3});
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
    'StopTime',num2str(Nf*Tsf),'SaveOutput','on','OutputSaveName','yout', ...
    'SaveFormat','Dataset','LoadExternalInput','on','ExternalInput','ds_ext','SignalLogging','off');
  ts15=(0:ceil(Nf/2)-1)'*(1/15.36e6); n15=numel(ts15);
  ds=Simulink.SimulationData.Dataset;
  ds=ds.addElement(timeseries(logical(v),t),'adc_validIn');
  ds=ds.addElement(timeseries(dI,t),'adc_dataInI');
  ds=ds.addElement(timeseries(dQ,t),'adc_dataInQ');
  ds=ds.addElement(timeseries(false(Nf,1),t),'rstCS');
  ds=ds.addElement(timeseries(uint32(zeros(Nf,1)),t),'iq_debug_mux');
  ds=ds.addElement(timeseries(true(Nf,1)&~internal,t),'rx_input_select');
  ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txI');
  ds=ds.addElement(timeseries(int16(zeros(Nf,1)),t),'host_txQ');
  ds=ds.addElement(timeseries(true(Nf,1),t),'host_txValid');
  ds=ds.addElement(timeseries(uint32(zeros(n15,1)),ts15),'tx_source_select');
  assignin('base','ds_ext',ds);
  so=sim(h);
  y=so.yout;
  pk=double(y{2}.Values.Data(end)); er=double(y{3}.Values.Data(end));
  ok = pk>3 && er==0;
  allpass = allpass && ok;
  fprintf('SR-GATE %-8s: packets=%d errors=%d %s\n', label, pk, er, ternary(ok,'PASS','FAIL'));
  close_system(h,0);
end
assert(allpass, 'single-rate gate FAILED');
fprintf('SR GATES ALL PASS\n');

function p = jitter_pos(N)
% irregular valid placement, exactly 8 per 16 cycles (15.36 Msps average):
% bursts of 1-3 and gaps up to 4 -- adversarial but rate-correct.
base = [1 2 6 7 9 12 14 15];                 % offsets within a 16-cycle frame
nfr  = floor(N/16);
p = reshape(base(:) + 16*(0:nfr-1), 1, []);
end
function s = ternary(c,a,b)
if c, s=a; else, s=b; end
end
