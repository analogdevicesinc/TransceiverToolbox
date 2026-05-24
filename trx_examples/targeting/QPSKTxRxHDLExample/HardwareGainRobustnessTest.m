classdef HardwareGainRobustnessTest < matlab.unittest.TestCase
    %HardwareGainRobustnessTest  Hardware-in-the-loop sweep of the inj_gain
    %   AXI4-Lite register (x"114") on the V4_gain_inj BOOT.BIN. inj_gain is
    %   a signed Q1.14 multiplier applied to both I and Q on the digital
    %   loopback path between Tx output and Rx input -- so this verifies
    %   how the deployed QPSK Rx (with its AGC) tolerates input-amplitude
    %   variations.
    %
    %   Characterised operating range (V4_gain_inj BOOT.BIN, deployed via
    %   /mnt/onetb/scratch/qpsk_variants/V4_gain_inj/ and md5 811a50cc...):
    %     inside  [0x1800 .. 0x7FFF]  -> link decodes, BER < 1%
    %     below   0x1000              -> link stalls (AGC floor exceeded)
    %   Test asserts both: working values must decode, below-floor values
    %   must NOT decode (verifying graceful degradation -- the BIST stops
    %   counting bad packets rather than reporting garbage).
    %
    %   inj_gain is a write-only AXI register (HDL Coder default for IP
    %   wrapper output ports). Readback returns 0 always. We probe by
    %   writing inj_gain=0 -> assert packets stop.
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
        % Gains expected to decode (inside the AGC operating range)
        passingGain = struct( ...
            'unity_1_0',  16384, ...   % 0x4000
            'x1p5',       24576, ...   % 0x6000
            'maxQ1p14',   32767, ...   % 0x7FFF (~2.0)
            'x0p75',      12288, ...   % 0x3000
            'half_0_5',    8192, ...   % 0x2000
            'x0p375',      6144);      % 0x1800 (near low edge of AGC range)

        % Gains below the AGC operating floor -- link is expected to stall
        % rather than decode garbage. Tests gracefulness.
        failingGain = struct( ...
            'x0p25',      4096, ...    % 0x1000
            'x0p125',     2048);       % 0x0800
    end

    methods (TestClassSetup)
        function checkBoardReachableAndV4(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping HW gain suite');
            % Behavioural probe: inj_gain is write-only -- write 0 and assert
            % BIST stops advancing within 1.5 s, confirming V4 deployment.
            % (The receiver auto-re-acquires when we restore unity gain; no
            % host-side rstCS pulse needed -- the AGC tracks the new
            % amplitude on its own given a few seconds settle time.)
            BistRegisters.write(testCase.InjGainAddr, 0, testCase.SshTimeoutSec);
            pause(0.2);
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(1.5);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dpZero = S1.packets - S0.packets;
            % Restore unity; receiver self-reacquires
            BistRegisters.write(testCase.InjGainAddr, testCase.UnityGain, testCase.SshTimeoutSec);
            pause(3);   % natural AGC + sync settle, no rstCS pulse
            testCase.assumeLessThan(dpZero, 100, ...
                sprintf(['inj_gain=0 did not stall the link (dp=%d in 1.5s); ' ...
                         'deployed BOOT.BIN does not appear to be V4_gain_inj'], dpZero));
        end

        function leaveUnityOnExit(testCase)
            testCase.addTeardown(@() ...
                BistRegisters.write(testCase.InjGainAddr, testCase.UnityGain, testCase.SshTimeoutSec));
        end
    end

    methods (Test, TestTags = {'Hardware'})

        % Gains inside the AGC operating range must decode at BER < 1%.
        function testPassingGainSweep(testCase, passingGain)
            BistRegisters.write(testCase.InjGainAddr, passingGain, testCase.SshTimeoutSec);
            pause(3);   % natural AGC + sync settle, no rstCS pulse
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(3);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets - S0.packets;
            de = S1.bit_errors - S0.bit_errors;
            bits = dp * testCase.DataBitsPerPacket;
            ber  = de / max(1, bits);
            fprintf('inj_gain Q1.14=%d (%.3fx): +pkts=%d bits=%d BER=%.4f%%\n', ...
                passingGain, passingGain/16384, dp, bits, 100*ber);
            testCase.assertGreaterThanOrEqual(bits, 1e6, ...
                sprintf('inj_gain=%d (~%.3fx): only %d bits in 3 s -- link stalled', ...
                    passingGain, passingGain/16384, bits));
            testCase.verifyLessThan(ber, testCase.BerThreshold);
        end

        % Gains below the AGC operating floor must STALL the link rather
        % than decode random garbage. Verifies graceful degradation: the
        % BIST stops advancing instead of accumulating spurious errors.
        function testBelowFloorGainStalls(testCase, failingGain)
            BistRegisters.write(testCase.InjGainAddr, failingGain, testCase.SshTimeoutSec);
            pause(3);   % give the receiver a chance to try -- and fail -- to lock
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(2);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets - S0.packets;
            fprintf('inj_gain Q1.14=%d (%.3fx) below floor: +pkts=%d (expect ~0)\n', ...
                failingGain, failingGain/16384, dp);
            testCase.verifyLessThan(dp, 100, ...
                sprintf(['inj_gain=%d (~%.3fx) should be below the AGC floor and ' ...
                         'stall the link, but +pkts=%d in 2 s'], failingGain, failingGain/16384, dp));
        end

        % Operating-range characterization: verify the link recovers from
        % a below-floor excursion. The receiver auto-re-acquires when the
        % amplitude is restored -- no host-side rstCS pulse needed.
        function testGainRecoveryFromFloor(testCase)
            % Drop to below-floor, verify stall (no rstCS)
            BistRegisters.write(testCase.InjGainAddr, 2048, testCase.SshTimeoutSec);   % 0x0800
            pause(3);
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(1.5);
            Smid = BistRegisters.readAll(testCase.SshTimeoutSec);
            stallDp = Smid.packets - S0.packets;
            % Now restore unity -- receiver auto-recovers (no rstCS)
            BistRegisters.write(testCase.InjGainAddr, testCase.UnityGain, testCase.SshTimeoutSec);
            pause(3);   % natural AGC + sync settle
            S2 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(2);
            S3 = BistRegisters.readAll(testCase.SshTimeoutSec);
            recoveredDp = S3.packets - S2.packets;
            fprintf('floor stall = +%d pkts/1.5s ; recovery = +%d pkts/2s (no rstCS)\n', stallDp, recoveredDp);
            testCase.verifyLessThan(stallDp, 100, ...
                'expected link to stall at gain=0x0800');
            testCase.verifyGreaterThan(recoveredDp, 5000, ...
                'expected link to auto-recover after restoring unity gain');
        end
    end
end
