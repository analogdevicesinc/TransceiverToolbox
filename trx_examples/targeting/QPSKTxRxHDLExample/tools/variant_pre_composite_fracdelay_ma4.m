% variant_pre_composite_fracdelay_ma4 -- insert a half-sample delay / smoothing FIR
% [1 1 1 1]/4 on the INTERNAL-loopback branch only (REP_Tx -> MUX inputs 3), to
% emulate the cable path's analog fractional delay. The in-FPGA Tx output is
% clean QPSK (ILA), so the internal Rx receives a PERFECTLY sample-aligned signal
% (mu at the 0/1 boundary -> symbol-sync rate-handle FIFO slips -> 7%). A 0.5-sample
% delay moves mu to mid-interval -> no boundary slip. The DAC/cable path
% (tx_dataOut = REP_Tx directly) is UNAFFECTED.
sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];
if ~isempty(find_system(sys,'SearchDepth',inf,'Name','FRAC4_I'))
  fprintf('variant_pre_composite_fracdelay_ma4: already instrumented, skipping.\n'); return;
end

% Insert [1 1 1 1]/4 FIR on REP_TxI/Q -> MUX_RxI/Q input 3 (the internal-loopback path).
pairs = {'REP_TxI','MUX_RxI','FRAC4_I'; 'REP_TxQ','MUX_RxQ','FRAC4_Q'};
for k=1:size(pairs,1)
  src=pairs{k,1}; mux=pairs{k,2}; frac=pairs{k,3};
  srcblk=[loop '/' src]; muxblk=[loop '/' mux]; fracblk=[loop '/' frac];
  % delete the existing line src/1 -> mux/3
  muxPH=get_param(muxblk,'PortHandles');
  l=get_param(muxPH.Inport(3),'Line');
  assert(l~=-1, '%s input 3 not connected', mux);
  delete_line(l);
  % add Discrete FIR Filter [1 1 1 1]/4 (full precision) + Data Type Conversion -> int16
  add_block('simulink/Discrete/Discrete FIR Filter', fracblk, ...
     'Coefficients','[1 1 1 1]/4', 'Position',[505 215+40*(k-1) 535 245+40*(k-1)]);
  convblk=[loop '/' frac 'c'];
  add_block('simulink/Signal Attributes/Data Type Conversion', convblk, ...
     'OutDataTypeStr','int16', 'Position',[550 215+40*(k-1) 580 245+40*(k-1)]);
  % wire src -> frac -> conv -> mux/3
  add_line(loop, [src '/1'],   [frac '/1'],   'autorouting','on');
  add_line(loop, [frac '/1'],  [frac 'c/1'],  'autorouting','on');
  add_line(loop, [frac 'c/1'], [mux '/3'],    'autorouting','on');
  fprintf('inserted %s [1 1 1 1]/4 FIR + int16 conv on %s -> %s input 3\n', frac, src, mux);
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
fprintf('variant_pre_composite_fracdelay_ma4: done (internal-loopback fractional delay).\n');
