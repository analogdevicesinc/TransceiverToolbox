classdef HardwarePerBytePositionTest < matlab.unittest.TestCase
    %HardwarePerBytePositionTest  Sweeps the V7_perbyte_diag BOOT.BIN's
    %   per-byte-position diagnostic counter at x"11C" by writing
    %   iq_debug_mux=0..14 and reading the per-byte error count.
    %   Captures the histogram of where the FPGA's ~7% channel BER
    %   actually lands within each 120-bit BIST comparison window.
    %
    %   Discovered shape (V7 first-run, 30s of BIST):
    %       byte 0 ('A'):  6.18%       (boundary -- not dominant)
    %       byte 4 ('H'):  4.48%
    %       byte 6 ('l'): 11.06% (max)
    %       byte 8 ('o'):  8.28%
    %       byte13 ('l'):  4.25% (min)
    %       byte14 ('d'):  6.18%       (boundary -- not dominant)
    %
    %   The test asserts the SHAPE of the histogram so a future Rx fix
    %   that re-distributes the errors (or reduces them) is detected.
    %   Boundary alignment is rejected by checking byte0 / byte14 are
    %   within 1.5x of the mean. No single byte may dominate (> 20%).

    properties (Constant)
        AxiPerByte    = '0x9D00011C';
        AxiMuxSelect  = '0x9D00010C';   % iq_debug_mux (selector)
        SshTimeoutSec = 5;
    end

    methods (Test, TestTags = {'Hardware'})
        function testPerBytePositionHistogram(testCase)
            % Skip cleanly if board not reachable or V7 not deployed
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping V7 per-byte test');

            % Quick V7 detection: write iq_debug_mux=0, read x"11C". If V7
            % is deployed it returns a non-zero counter (errors accumulated
            % since boot). On non-V7 BOOT.BINs x"11C" is unmapped -> reads
            % return 0 (or AXI bus error).
            BistRegisters.write(testCase.AxiMuxSelect, 0, testCase.SshTimeoutSec);
            pause(0.1);
            probe = BistRegisters.read(testCase.AxiPerByte, testCase.SshTimeoutSec);
            testCase.assumeGreaterThan(probe, 0, ...
                sprintf(['per-byte counter at %s reads %d; deployed BOOT.BIN ' ...
                         'does not appear to be V7_perbyte_diag'], ...
                    testCase.AxiPerByte, probe));

            % Capture the 15-byte histogram
            errs = zeros(15,1);
            for b = 0:14
                BistRegisters.write(testCase.AxiMuxSelect, b, testCase.SshTimeoutSec);
                pause(0.05);
                errs(b+1) = BistRegisters.read(testCase.AxiPerByte, testCase.SshTimeoutSec);
            end
            total = sum(errs); m = mean(errs);
            frac = errs / total;
            relMean = errs / m;

            fprintf('\nbyte-position error histogram (V7):\n');
            chars = 'ADI Hello World';
            for b = 0:14
                fprintf('  %2d (''%c''): errs=%-8d frac=%.2f%%  relMean=%.2f\n', ...
                    b, chars(b+1), errs(b+1), 100*frac(b+1), relMean(b+1));
            end
            fprintf('  total=%d  mean=%.0f  std=%.0f  cv=%.2f\n', ...
                total, m, std(errs), std(errs)/m);

            % Assertions about the histogram SHAPE
            testCase.verifyTrue(all(errs > 0), 'every byte position has errors -- no fully clean byte');
            testCase.verifyLessThan(max(frac), 0.20, ...
                sprintf('worst byte holds %.1f%% of all errors -- looks boundary-dominated', 100*max(frac)));
            testCase.verifyLessThan(relMean(1), 1.5, ...
                sprintf('byte 0 (packet start) is %.2fx mean; would expect ~2-5x if boundary-aligned', relMean(1)));
            testCase.verifyLessThan(relMean(15), 1.5, ...
                sprintf('byte 14 (packet end) is %.2fx mean; would expect ~2-5x if boundary-aligned', relMean(15)));
            testCase.verifyGreaterThan(std(errs)/m, 0.05, ...
                'spread is *too* low -- errors look exactly i.i.d.; suggests an instrumentation bug');
        end
    end
end
