classdef HardwareLinkRobustnessTest < matlab.unittest.TestCase
    %HardwareLinkRobustnessTest  Hardware-in-the-loop robustness coverage for
    %   the deployed QPSK BIST design on Jupiter (root@10.0.0.146). Goes
    %   beyond HardwareLoopbackBERTest by exercising the link over longer
    %   durations, under stress (high-rate AXI access to iq_debug_mux),
    %   across separate measurement windows, and through multiple carrier-
    %   sync resets.
    %
    %   These all run against whatever BOOT.BIN is currently deployed --
    %   they do NOT redeploy. They DO assume the deployed design has the
    %   BIST register interface at 0x9D000100..0x110.
    %
    %   Each test has a hard total-time cap so the suite cannot hang.
    %
    %   Run:  runtests('HardwareLinkRobustnessTest')

    properties (Constant)
        DataBitsPerPacket  = 2240;        % matches commhdlQPSKTxRxParameters
        BerThreshold       = 0.01;        % 1% BER ceiling
        SshTimeoutSec      = 5;
    end

    methods (TestClassSetup)
        function checkBoardReachable(testCase)
            % Single board-reach check at the start. Each test re-checks via
            % assumeEqual so individual failures still surface clearly, but
            % we don't burn ssh handshakes on dead boards.
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping HW robustness suite');
        end
    end

    methods (Test, TestTags = {'Hardware'})

        % ------------------------------------------------------------------
        function testBaselineBerOverShortWindow(testCase)
            % Snapshot, wait 3s, snapshot. Assert BER < 1% over the window.
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(3);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets    - S0.packets;
            de = S1.bit_errors - S0.bit_errors;
            bits = dp * testCase.DataBitsPerPacket;
            ber  = de / max(1, bits);
            fprintf('baseline 3s: +pkts=%d +errs=%d bits=%d BER=%.4f%%\n', ...
                dp, de, bits, 100*ber);
            testCase.assertGreaterThanOrEqual(bits, 1e6, ...
                sprintf('baseline window decoded only %d bits in 3s; deployed BIST not advancing', bits));
            testCase.verifyLessThan(ber, testCase.BerThreshold);
        end

        % ------------------------------------------------------------------
        function testLongDurationBer(testCase)
            % Decode over a longer window (15s) to surface any drift or
            % accumulating error rate the short test would miss.
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(15);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets    - S0.packets;
            de = S1.bit_errors - S0.bit_errors;
            bits = dp * testCase.DataBitsPerPacket;
            ber  = de / max(1, bits);
            fprintf('long-15s: +pkts=%d +errs=%d bits=%d BER=%.4f%%\n', ...
                dp, de, bits, 100*ber);
            testCase.assertGreaterThanOrEqual(bits, 50e6, ...
                'long-duration window should accumulate >= 50M bits');
            testCase.verifyLessThan(ber, testCase.BerThreshold);
        end

        % ------------------------------------------------------------------
        function testCounterMonotonicity(testCase)
            % Read packets/bit_errors every ~250ms for 5s. Both counters must
            % be strictly non-decreasing (32-bit wrap not expected at this rate
            % over 5s).
            N = 20;
            ps = zeros(N,1); es = zeros(N,1);
            for k = 1:N
                S = BistRegisters.readAll(testCase.SshTimeoutSec);
                ps(k) = S.packets; es(k) = S.bit_errors;
                pause(0.25);
            end
            dps = diff(ps); des = diff(es);
            testCase.verifyGreaterThanOrEqual(min(dps), 0, ...
                sprintf('packets_out went BACKWARDS at some sample: %s', mat2str(dps)));
            testCase.verifyGreaterThanOrEqual(min(des), 0, ...
                sprintf('bit_errors_out went BACKWARDS at some sample: %s', mat2str(des)));
            % And at least most intervals should be advancing -- the link
            % can't be stalled. (Allow a couple of zero deltas due to ssh
            % timing jitter.)
            nonzero = nnz(dps > 0);
            testCase.verifyGreaterThanOrEqual(nonzero, N-3, ...
                sprintf('packets_out stalled too often: %d/%d intervals advanced', nonzero, N-1));
        end

        % ------------------------------------------------------------------
        function testRstCsRecoversInBoundedTime(testCase)
            % Apply a rstCS pulse and verify the BIST resumes counting bits
            % within 1s. The carrier-sync reset shouldn't leave the link
            % stuck. (rstCS register is x"110".)
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.1);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(1.0);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets - S0.packets;
            fprintf('post-rstCS 1s: +packets=%d\n', dp);
            testCase.verifyGreaterThan(dp, 100, ...
                sprintf('after rstCS pulse, packets_out advanced only %d in 1s', dp));
        end

        % ------------------------------------------------------------------
        function testBerStableAcrossWindows(testCase)
            % Run three independent 3s BER measurement windows and assert all
            % are under 1% AND the spread between them is small. Catches
            % time-varying BER (e.g. periodic resync glitches).
            ber = zeros(3,1); bits = zeros(3,1);
            for k = 1:3
                S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
                pause(3);
                S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
                dp = S1.packets - S0.packets; de = S1.bit_errors - S0.bit_errors;
                bits(k) = dp * testCase.DataBitsPerPacket;
                ber(k)  = de / max(1, bits(k));
                fprintf('window %d: bits=%d BER=%.4f%%\n', k, bits(k), 100*ber(k));
            end
            testCase.verifyEqual(min(bits) > 0, true, 'all windows must accumulate bits');
            testCase.verifyLessThan(max(ber), testCase.BerThreshold, ...
                sprintf('worst window BER = %.4f%%', 100*max(ber)));
            % Spread shouldn't exceed 0.5 percentage points (loose -- catches
            % an order-of-magnitude time-variation, not jitter)
            testCase.verifyLessThan(max(ber) - min(ber), 0.005, ...
                sprintf('BER spread across windows = %.4f%% (max=%.4f, min=%.4f)', ...
                    100*(max(ber)-min(ber)), 100*max(ber), 100*min(ber)));
        end

        % ------------------------------------------------------------------
        function testIqDebugMuxToggleResilience(testCase)
            % Cycle iq_debug_mux through 0..7 while BIST is running. The mux
            % is a debug observability knob -- it must NOT disturb the BIST
            % path. Assert packets keep advancing across all 8 settings.
            origMux = BistRegisters.read(BistRegisters.IqDebugMuxAddr, testCase.SshTimeoutSec);
            cleanup = onCleanup(@() BistRegisters.write(BistRegisters.IqDebugMuxAddr, origMux, testCase.SshTimeoutSec));
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            for sel = 0:7
                BistRegisters.write(BistRegisters.IqDebugMuxAddr, sel, testCase.SshTimeoutSec);
                pause(0.2);
            end
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets - S0.packets;
            fprintf('iq_debug_mux 0..7 sweep: +packets=%d in ~1.6s\n', dp);
            testCase.verifyGreaterThan(dp, 1000, ...
                sprintf('iq_debug_mux toggle disturbed BIST: only +%d packets', dp));
        end

        % ------------------------------------------------------------------
        function testMultipleRstCsPulses(testCase)
            % Five rstCS pulses, each separated by ~300ms. After every pulse
            % the link must resume advancing within the next interval. This
            % catches "first reset works, second doesn't" type bugs.
            for k = 1:5
                BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
                pause(0.05);
                BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
                pause(0.05);
                S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
                pause(0.3);
                S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
                dp = S1.packets - S0.packets;
                fprintf('rstCS pulse #%d -> +packets=%d in 300ms\n', k, dp);
                testCase.verifyGreaterThan(dp, 100, ...
                    sprintf('after rstCS pulse #%d, packets advanced only +%d in 300ms', k, dp));
            end
        end

    end
end
