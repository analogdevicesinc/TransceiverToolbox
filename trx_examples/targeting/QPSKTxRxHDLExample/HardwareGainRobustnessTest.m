classdef HardwareGainRobustnessTest < matlab.unittest.TestCase
    %HardwareGainRobustnessTest  Hardware-in-the-loop sweep of the inj_gain
    %   AXI4-Lite register (x"114") on the V4_gain_inj BOOT.BIN. inj_gain is
    %   a signed Q1.14 multiplier applied to both I and Q on the digital
    %   loopback path between Tx output and Rx input -- so this verifies
    %   how the deployed QPSK Rx (with its AGC) tolerates input-amplitude
    %   variations.
    %
    %   The test is parameterised by gain value (Q1.14):
    %     16384 = 1.0       (unity, baseline)
    %      8192 = 0.5
    %      4096 = 0.25
    %      2048 = 0.125
    %      1024 = 1/16
    %       512 = 1/32
    %
    %   For each gain we:
    %     1. write inj_gain
    %     2. pulse rstCS to re-acquire under the new amplitude
    %     3. wait 2 s for AGC + sync to settle
    %     4. measure BER over a 3 s window
    %     5. assert BER < 1% (AGC should compensate over a wide range)
    %
    %   This will SKIP at the assumeEqual board-reach gate if the V4 BOOT.BIN
    %   is not deployed; the test also assumes the deployed design exposes
    %   inj_gain @ x"114" (a feature only V4_gain_inj has).
    %
    %   Run:  runtests('HardwareGainRobustnessTest')

    properties (Constant)
        InjGainAddr        = '0x9D000114';
        DataBitsPerPacket  = 2240;
        BerThreshold       = 0.01;
        SshTimeoutSec      = 5;
        UnityGain          = 16384;  % Q1.14: 1.0
    end

    properties (TestParameter)
        % gain = (Q1.14 value, human-readable scale, expected BER ceiling)
        gain = struct( ...
            'unity_1_0',  {{16384,  '1.0',     0.01}}, ...
            'half_0_5',   {{ 8192,  '0.5',     0.01}}, ...
            'quart_0_25', {{ 4096,  '0.25',    0.01}}, ...
            'oneEighth',  {{ 2048,  '0.125',   0.01}}, ...
            'oneSixt',    {{ 1024,  '1/16',    0.05}}, ...   % may degrade
            'oneThirty',  {{  512,  '1/32',    0.10}}   ...   % may degrade
        );
    end

    methods (TestClassSetup)
        function checkBoardReachable(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping HW gain suite');
            % Probe inj_gain register: writing then reading back should round-trip
            BistRegisters.write(testCase.InjGainAddr, testCase.UnityGain, testCase.SshTimeoutSec);
            pause(0.1);
            rb = BistRegisters.read(testCase.InjGainAddr, testCase.SshTimeoutSec);
            testCase.assumeEqual(rb, testCase.UnityGain, ...
                sprintf(['inj_gain register at %s did not round-trip ' ...
                         '(wrote %d, read %d); deployed BOOT.BIN is not V4_gain_inj'], ...
                    testCase.InjGainAddr, testCase.UnityGain, rb));
        end

        function leaveUnityOnExit(testCase)
            % Restore unity gain even on test failure so subsequent tests have a
            % clean baseline.
            testCase.addTeardown(@() ...
                BistRegisters.write(testCase.InjGainAddr, testCase.UnityGain, testCase.SshTimeoutSec));
        end
    end

    methods (Test, TestTags = {'Hardware'})
        function testGainSweep(testCase, gain)
            val   = gain{1};
            label = gain{2};
            cap   = gain{3};

            % --- write gain, then pulse rstCS to force re-acquisition under
            %     the new amplitude
            BistRegisters.write(testCase.InjGainAddr, val, testCase.SshTimeoutSec);
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            pause(2);   % settle

            % --- measure BER over a 3 s window
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(3);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets    - S0.packets;
            de = S1.bit_errors - S0.bit_errors;
            bits = dp * testCase.DataBitsPerPacket;
            ber  = de / max(1, bits);
            fprintf('gain Q1.14=%d (%s): +pkts=%d +errs=%d bits=%d BER=%.4f%% (cap=%g%%)\n', ...
                val, label, dp, de, bits, 100*ber, 100*cap);

            testCase.assertGreaterThanOrEqual(bits, 1e6, ...
                sprintf('gain=%s: only %d bits decoded in 3s -- link stalled', label, bits));
            testCase.verifyLessThan(ber, cap, ...
                sprintf('gain=%s (Q1.14=%d): BER %.4f%% exceeds cap %.2f%%', ...
                    label, val, 100*ber, 100*cap));
        end
    end
end
