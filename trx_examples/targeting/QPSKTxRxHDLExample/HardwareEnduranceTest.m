classdef HardwareEnduranceTest < matlab.unittest.TestCase
    %HardwareEnduranceTest  Long-duration BER stability on the deployed
    %   BIST design (any V3+ BOOT.BIN). Samples the BIST counters every
    %   10 s for 5 minutes and asserts: (a) the link is always advancing
    %   (no stall in any window), (b) every per-window BER and the
    %   cumulative BER stay under 1%, (c) the per-window BER spread
    %   stays under 0.5 pp (catches slow drift / periodic glitches that
    %   the shorter HardwareLoopbackBERTest can miss).
    %
    %   Prints a per-window report to stdout for offline inspection.
    %
    %   Run:  runtests('HardwareEnduranceTest')

    properties (Constant)
        DataBitsPerPacket  = 2240;
        BerThreshold       = 0.01;       % 1% BER ceiling
        BerSpreadCap       = 0.005;      % max-min per-window BER spread
        WindowSec          = 10;         % sample interval
        NumWindows         = 30;         % 30 * 10s = 5 minutes
        SshTimeoutSec      = 5;
        MinBitsPerWindow   = 1e6;        % every window must accumulate >= this
    end

    methods (Test, TestTags = {'Hardware'})
        function testFiveMinuteEndurance(testCase)
            % Probe the board first
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping HW endurance test');

            N    = testCase.NumWindows;
            DBPP = testCase.DataBitsPerPacket;
            pkts = zeros(N+1, 1);
            errs = zeros(N+1, 1);
            ts   = zeros(N+1, 1);

            t0 = tic;
            S = BistRegisters.readAll(testCase.SshTimeoutSec);
            pkts(1) = S.packets; errs(1) = S.bit_errors; ts(1) = toc(t0);
            fprintf('endurance start: packets=%d errors=%d\n', pkts(1), errs(1));

            for k = 1:N
                pause(testCase.WindowSec);
                S = BistRegisters.readAll(testCase.SshTimeoutSec);
                pkts(k+1) = S.packets;
                errs(k+1) = S.bit_errors;
                ts(k+1)   = toc(t0);
            end

            % Per-window stats
            dp = diff(pkts);
            de = diff(errs);
            bits = dp * DBPP;
            ber  = de ./ max(bits, 1);

            fprintf('\nwindow | t(s) |     dp | dbits      | BER%%\n');
            for k = 1:N
                fprintf(' %5d | %4.0f | %6d | %10d | %.4f\n', ...
                    k, ts(k+1), dp(k), bits(k), 100*ber(k));
            end

            totalBits = sum(bits);
            totalErrs = sum(de);
            cumBer    = totalErrs / max(totalBits, 1);
            spread    = max(ber) - min(ber);
            stalls    = nnz(dp == 0);

            fprintf('\n--- 5-min endurance summary ---\n');
            fprintf('  windows : %d * %.0f s = %.0f s\n', N, testCase.WindowSec, ts(end));
            fprintf('  packets : %d   bits: %d   errors: %d\n', sum(dp), totalBits, totalErrs);
            fprintf('  cumBER  : %.4f%%\n', 100*cumBer);
            fprintf('  BER span: %.4f%% .. %.4f%% (spread %.4f pp)\n', ...
                100*min(ber), 100*max(ber), 100*spread);
            fprintf('  stalls  : %d\n', stalls);

            % Assertions
            testCase.verifyEqual(stalls, 0, ...
                sprintf('link stalled in %d of %d windows', stalls, N));
            testCase.verifyGreaterThanOrEqual(min(bits), testCase.MinBitsPerWindow, ...
                sprintf('worst window decoded only %d bits (need >= %d)', ...
                    min(bits), testCase.MinBitsPerWindow));
            testCase.verifyLessThan(max(ber), testCase.BerThreshold, ...
                sprintf('worst-window BER = %.4f%% exceeds 1%%', 100*max(ber)));
            testCase.verifyLessThan(cumBer, testCase.BerThreshold, ...
                sprintf('cumulative BER = %.4f%% exceeds 1%%', 100*cumBer));
            testCase.verifyLessThan(spread, testCase.BerSpreadCap, ...
                sprintf('BER spread across 5 min = %.4f%% (> %.4f%% cap)', ...
                    100*spread, 100*testCase.BerSpreadCap));
        end
    end
end
