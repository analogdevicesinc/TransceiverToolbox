function result = run_prbs_loopback(varargin)
%RUN_PRBS_LOOPBACK  End-to-end ADRV9002 PRBS digital-loopback interface test.
%   RESULT = RUN_PRBS_LOOPBACK() runs the full hardware sequence against a
%   board flashed with the commhdlPRBSLoopback bitstream:
%     1. enable the ADRV9002 SSI digital loopback
%     2. reset + enable the FPGA PRBS generator/checker
%     3. poll until both lanes lock, then measure bit errors over a window
%     4. PASS/FAIL on (locked AND zero errors over >= MinSamples)
%     5. self-test: inject a Tx bit fault -> confirm the error counter ticks
%     6. sanity: disable chip loopback -> confirm lock is lost
%
%   Name/value options:
%     'LockTimeout'  (s)  default 10   max wait for lock
%     'DwellSec'     (s)  default 5    error-accumulation window after lock
%     'MinSamples'        default 1e6  minimum scored samples for a valid PASS
%     'ManageLoopback' (logical) default true  toggle chip loopback here
%
%   Requires PrbsLoopbackRegisters + adrv9002_ssi_loopback on the path and ssh
%   reachability to PrbsLoopbackRegisters.Host (root@10.0.0.146, pw 'analog').

    p = inputParser;
    p.addParameter('LockTimeout', 10);
    p.addParameter('DwellSec', 5);
    p.addParameter('MinSamples', 1e6);
    p.addParameter('ManageLoopback', true);
    p.parse(varargin{:});
    opt = p.Results;

    R = PrbsLoopbackRegisters;
    result = struct('pass', false, 'locked', false, 'bit_errors_I', NaN, ...
        'bit_errors_Q', NaN, 'sample_count', NaN, 'inject_detected', false, ...
        'lock_lost_on_disable', false, 'loopback_attr', '');

    fprintf('=== ADRV9002 PRBS digital-loopback interface test ===\n');

    % 1) chip SSI loopback on
    if opt.ManageLoopback
        result.loopback_attr = adrv9002_ssi_loopback(true);
        if isempty(result.loopback_attr)
            warning('run_prbs_loopback:loopback', ...
                ['SSI loopback attribute not auto-found. Enable it manually, ' ...
                 'or set ManageLoopback=false if it is already on.']);
        end
        pause(0.2);
    end

    % 2) reset + enable PRBS
    R.resetAndEnable();

    % 3) wait for lock
    t0 = tic; S = R.readAll();
    while toc(t0) < opt.LockTimeout && ~(isfield(S,'lock_status') && S.lock_status == 3)
        pause(0.25); S = R.readAll();
    end
    result.locked = isstruct(S) && isfield(S,'lock_status') && S.lock_status == 3;
    fprintf('lock_status=%g (I=%g Q=%g) after %.1fs\n', S.lock_status, ...
        S.I_locked, S.Q_locked, toc(t0));
    if ~result.locked
        fprintf('FAIL: lanes did not lock. Check loopback enable + bitstream.\n');
        return;
    end

    % re-zero counters and dwell to accumulate a clean window
    R.resetAndEnable();
    pause(opt.DwellSec);
    S = R.readAll();
    result.bit_errors_I = S.bit_errors_I;
    result.bit_errors_Q = S.bit_errors_Q;
    result.sample_count = S.sample_count;
    fprintf('after %.0fs: samples=%g  errI=%g  errQ=%g\n', opt.DwellSec, ...
        S.sample_count, S.bit_errors_I, S.bit_errors_Q);

    % 4) PASS/FAIL
    enoughSamples = S.sample_count >= opt.MinSamples;
    result.pass = result.locked && S.bit_errors_I == 0 && S.bit_errors_Q == 0 && enoughSamples;
    if ~enoughSamples
        warning('run_prbs_loopback:samples', ...
            'Only %g samples scored (< MinSamples=%g); PASS not asserted.', ...
            S.sample_count, opt.MinSamples);
    end
    fprintf('>>> DIGITAL INTERFACE: %s <<<\n', ternary(result.pass, 'PASS', 'FAIL'));

    % 5) self-test: inject a Tx bit fault, confirm the checker counts it
    before = R.readAll();
    R.injectError(true);  pause(0.5);
    R.injectError(false);
    after = R.readAll();
    result.inject_detected = after.bit_errors_I > before.bit_errors_I;
    fprintf('self-test inject: errI %g -> %g (%s)\n', before.bit_errors_I, ...
        after.bit_errors_I, ternary(result.inject_detected, 'counter works', 'NO CHANGE'));

    % 6) sanity: drop chip loopback, confirm lock is lost (proves path is under test)
    if opt.ManageLoopback && ~isempty(result.loopback_attr)
        R.resetAndEnable();
        adrv9002_ssi_loopback(false);
        pause(1);
        S = R.readAll();
        result.lock_lost_on_disable = S.lock_status ~= 3;
        fprintf('loopback OFF -> lock_status=%g (%s)\n', S.lock_status, ...
            ternary(result.lock_lost_on_disable, 'lock lost as expected', ...
                    'still locked -- loopback may not be controlling the path'));
        adrv9002_ssi_loopback(true);   % restore
    end
end

function s = ternary(c, a, b)
    if c, s = a; else, s = b; end
end
