% swapiq: swap I<->Q on the CABLE ADC path only. Tests/fixes the leading remaining
% hypothesis for the deterministic static 50.43% BER at strong lock: a physical
% I/Q LANE SWAP in the ADRV9002 SSI / DAC<->ADC mapping. conjq (negate Q) gave 46%
% (NOT fixed) -> not a pure conjugation/spectral inversion; an I/Q swap is the other
% structural reflection and the most common lane-mapping defect. Re-route so the
% cable I and Q feeding the MUX are exchanged. Internal loopback branch untouched.
sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];
assert(~isempty(find_system(loop,'SearchDepth',1,'Name','MUX_RxI')),'MUX_RxI not found');
assert(~isempty(find_system(loop,'SearchDepth',1,'Name','MUX_RxQ')),'MUX_RxQ not found');
delete_line(loop, 'adc_dataInI/1', 'MUX_RxI/1');
delete_line(loop, 'adc_dataInQ/1', 'MUX_RxQ/1');
add_line(loop, 'adc_dataInQ/1', 'MUX_RxI/1', 'autorouting','on');   % Q -> I lane
add_line(loop, 'adc_dataInI/1', 'MUX_RxQ/1', 'autorouting','on');   % I -> Q lane
fprintf('swapiq: swapped cable I<->Q (adc_dataInI->MUX_RxQ, adc_dataInQ->MUX_RxI); internal untouched\n');
