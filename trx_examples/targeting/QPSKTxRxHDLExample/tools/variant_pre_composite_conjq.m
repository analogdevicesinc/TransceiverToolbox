% conjq: conjugate (negate Q of) the CABLE ADC path only -> tests/fixes the
% leading hypothesis for the deterministic static 50.43% BER at strong lock:
% a SPECTRAL INVERSION / conjugation in the ADRV9002 Rx path (high-side LO
% injection) that maps (I,Q)->(I,-Q), flipping the Q bit -> exactly ~50% BER,
% UNCORRECTABLE by the Phase Ambiguity block (which fixes rotation, not reflection).
% Insert Gain(-1) between adc_dataInQ and MUX_RxQ/1 (cable branch). The internal
% loopback branch (REP_TxQ -> MUX_RxQ/3) is left untouched (digital, no inversion).
sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];
muxq = [loop '/MUX_RxQ'];
assert(~isempty(find_system(loop,'SearchDepth',1,'Name','MUX_RxQ')),'MUX_RxQ not found');
% Re-route adc_dataInQ -> ConjQ(-1) -> MUX_RxQ/1
delete_line(loop, 'adc_dataInQ/1', 'MUX_RxQ/1');
add_block('built-in/Gain', [loop '/ConjQ'], ...
    'Gain','-1', 'OutDataTypeStr','int16', ...
    'SaturateOnIntegerOverflow','on', 'Position',[480 255 510 285]);
add_line(loop, 'adc_dataInQ/1', 'ConjQ/1',  'autorouting','on');
add_line(loop, 'ConjQ/1',       'MUX_RxQ/1', 'autorouting','on');
fprintf('conjq: inserted Gain(-1) on cable Q (adc_dataInQ -> ConjQ -> MUX_RxQ); internal path untouched\n');
