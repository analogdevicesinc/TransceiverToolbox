% sim_verif_gate -- run from the verif kit dir. Two cases must decode 0% BER:
%   A: internal loopback (tx_source=0, rx_input_select=0)
%   B: host-injection   (tx_source=1, host_tx = golden 8sps, adc_dataIn = same
%      golden waveform, rx_input_select=1)  [simulates a perfect cable]
%
% The kit model commhdlQPSKTxRxLoopback has NO root-level inports: the
% TxRxComposite DUT sits unconnected at root (it is only the HDL Coder DUT).
% So this gate builds a throwaway in-memory harness model around a COPY of
% the DUT (kit model is never modified or saved), adds the 10 typed root
% inports + 3 BIST outports, and drives it via LoadExternalInput with a
% Dataset of correctly-typed timeseries.
addpath(pwd); addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
evalin('base', get_param(sys,'InitFcn'));  % model params used inside the DUT copy

Ts=1/15.36e6; Tstop=20e-3; N=round(Tstop/Ts); t=(0:N-1)'*Ts;

% golden 8sps@15.36 waveform, int16 scaled (same generator as phase2b_15p36.m)
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[];
% enough frames to cover the whole Tstop window (zero-padding the tail makes
% the Rx free-run on silence -> garbage decode crashes the sim print block)
nf=ceil(N/(((numel(pre)+DBPP)/2)*sps*2))+1;
for f=1:nf
  st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0));
  for i=1:numel(pay0), bb=mod(nnz(st(poly==1)),2); sc(i)=xor(pay0(i),bb); st=[st(2:7) bb]; end
  fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; %#ok<AGROW>
end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
g=resample(w4,2,1); g=g/rms(g); g16=double(int16(g*2^13));
g16(end+1:N)=0; g16=g16(1:N);

% --- throwaway harness around a copy of the DUT ---
h='verif_gate_harness';
if bdIsLoaded(h), close_system(h,0); end
new_system(h);
add_block([sys '/TxRxComposite'], [h '/DUT'], 'Position',[400 80 650 560]);
% inport order/type = DUT port order (build_composite_local.m + variant_pre.m)
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
for k=numel(outNames)+1:11   % terminate debug/tx passthrough outputs
  add_block('built-in/Terminator',sprintf('%s/T%d',h,k),'Position',[800 40*k+200 820 40*k+220]);
  add_line(h,sprintf('DUT/%d',k),sprintf('T%d/1',k),'autorouting','on');
end
set_param(h,'SolverType','Fixed-step','Solver','FixedStepDiscrete', ...
  'StopTime',num2str(Tstop),'SaveOutput','on','OutputSaveName','yout', ...
  'SaveFormat','Dataset','LoadExternalInput','on','ExternalInput','ds_ext', ...
  'SignalLogging','off');

for mode=['A','B']
  if mode=='A'
    ds=gate_mkds(t,zeros(N,1),zeros(N,1),0,zeros(N,1),zeros(N,1),0,inSpec);
  else
    ds=gate_mkds(t,real(g16),imag(g16),1,real(g16),imag(g16),1,inSpec);
  end
  assignin('base','ds_ext',ds);
  so=sim(h);
  y=so.yout;
  % Root-outport Dataset elements come back with EMPTY names here (only
  % BlockPath is set), so getElement-by-name fails. Fall back to port index.
  pk = double(gate_getval(y, 2, 'packets_out'));
  er = double(gate_getval(y, 3, 'bit_errors_out'));
  fprintf('mode %c: packets=%d errors=%d BER=%.4f%%\n', mode, pk, er, 100*er/max(1,pk*120));
  assert(pk>3, sprintf('mode %c: no packets', mode));
  assert(er==0, sprintf('mode %c: errors', mode));
end
fprintf('SIM GATE PASS\n');
close_system(h,0);

function ds=gate_mkds(t,adcI,adcQ,rxsel,hI,hQ,txsrc,inSpec)
  N=numel(t); o=ones(N,1); z=zeros(N,1);
  vals={o, adcI, adcQ, z, z, rxsel*o, hI, hQ, o, txsrc*o};
  ds=Simulink.SimulationData.Dataset;
  for k=1:numel(vals)
    ts=timeseries(cast(vals{k},inSpec{k,3}), t);
    ds=ds.addElement(ts, inSpec{k,1});
  end
end

function v=gate_getval(y, idx, nm)
  % Extract last sample of a Dataset element: by name if present, else by
  % outport index (root-outport elements may have empty Names).
  e=[];
  try, e=y.getElement(nm); catch, end
  if isempty(e) || ~isa(e,'Simulink.SimulationData.Signal'), e=y{idx}; end
  if isa(e,'Simulink.SimulationData.Signal'), d=e.Values.Data; else, d=e.Data; end
  v=d(end);
end
