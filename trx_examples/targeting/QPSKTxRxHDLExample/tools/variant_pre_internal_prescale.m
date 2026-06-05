% variant_pre_internal_prescale.m  --  composite_internal_zero_BER
%
% Insert a 0.25× Gain on the Tx-loopback branch INSIDE TxRxComposite,
% between REP_Tx*/1 and MUX_Rx*/3 (Switch input u3). The intent: pre-scale
% the loopback signal so AGC starts at steady-state (AGCReference = 0.25),
% bypassing the convergence transient that is suspected to cause part of
% the 0.39% internal-loopback BER. The DAC output line (REP_Tx*/1 ->
% tx_dataOutI/1) is unchanged, so cable-loopback Tx power is unaffected.
%
% Idempotent: re-running is safe; skips if already applied.

sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];

if ~isempty(find_system(loop,'SearchDepth',1,'Name','GAIN_LoopI'))
    fprintf('variant_pre_internal_prescale: FIX already applied, skipping.\n');
else
    % Delete current direct lines from REP_Tx* to MUX_Rx*/3 (loopback branch only)
    delete_line(loop, 'REP_TxI/1', 'MUX_RxI/3');
    delete_line(loop, 'REP_TxQ/1', 'MUX_RxQ/3');

    % Insert Gain blocks. 0.25× brings sfix16_En15 ±1.0 → ±0.25 (close to AGCReference).
    add_block('simulink/Math Operations/Gain', [loop '/GAIN_LoopI'], ...
        'Gain', '0.25', ...
        'OutDataTypeStr','fixdt(1,16,15)', ...
        'SaturateOnIntegerOverflow','on', ...
        'Position', [505 215 535 245]);
    add_block('simulink/Math Operations/Gain', [loop '/GAIN_LoopQ'], ...
        'Gain', '0.25', ...
        'OutDataTypeStr','fixdt(1,16,15)', ...
        'SaturateOnIntegerOverflow','on', ...
        'Position', [505 255 535 285]);

    % Re-wire: REP_Tx*/1 → GAIN_Loop*/1 → MUX_Rx*/3
    add_line(loop, 'REP_TxI/1',    'GAIN_LoopI/1',  'autorouting','on');
    add_line(loop, 'GAIN_LoopI/1', 'MUX_RxI/3',     'autorouting','on');
    add_line(loop, 'REP_TxQ/1',    'GAIN_LoopQ/1',  'autorouting','on');
    add_line(loop, 'GAIN_LoopQ/1', 'MUX_RxQ/3',     'autorouting','on');

    fprintf('variant_pre_internal_prescale: inserted 0.25× Gain blocks on internal loopback branch.\n');
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
