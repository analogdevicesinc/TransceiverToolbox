% variant_pre_cs_wider_loop.m -- composite_cs_wider_loop
%
% Widens the Carrier Synchronizer's loop bandwidth by 4× through directly
% modifying the Gain block expressions inside CS/Loop Filter. For a Type-2
% PLL: 4× wider BW with same damping requires K_p×4 and K_i×16.
%
% Hypothesis (from V15 per-bit data showing 2%→10% error ramp across the
% 120-bit BIST window): the current loop is too narrow to track the constant
% +5.6e-3 rad/sym residual produced by Symbol Sync's Gardner-TED quantization.
% Wider loop → faster integral lock → less accumulated phase by end of packet.

sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
cs_lf = [sys '/TxRxComposite/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer/Loop Filter'];

% Proportional path: scale K_p by 4
g_prop = [cs_lf '/Gain1'];
old_prop = get_param(g_prop, 'Gain');
if ~contains(old_prop, '/* scaled', 'IgnoreCase', true)
    new_prop = 'fi(4*CSLoopFilterPropGain/(2*pi),0,16,16)';
    set_param(g_prop, 'Gain', new_prop);
    fprintf('CS Loop Filter Gain1 (prop):   %s  →  %s\n', old_prop, new_prop);
else
    fprintf('CS Loop Filter Gain1 already scaled — skipping.\n');
end

% Integral path: scale K_i by 16
g_int = [cs_lf '/Gain'];
old_int = get_param(g_int, 'Gain');
if ~contains(old_int, '/* scaled', 'IgnoreCase', true)
    new_int = 'fi(16*CSLoopFilterIntegGain/(2*pi),0,16,16)';
    set_param(g_int, 'Gain', new_int);
    fprintf('CS Loop Filter Gain (integ):   %s  →  %s\n', old_int, new_int);
else
    fprintf('CS Loop Filter Gain (integ) already scaled — skipping.\n');
end

% Save and re-evaluate InitFcn so any compile-time expressions resolve fresh
eval(get_param(sys, 'InitFcn'));
save_system(sys, [], 'OverwriteIfChangedOnDisk', true);
fprintf('variant_pre_cs_wider_loop: done.\n');
