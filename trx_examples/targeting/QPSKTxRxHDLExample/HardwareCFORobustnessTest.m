classdef HardwareCFORobustnessTest < matlab.unittest.TestCase
    %HardwareCFORobustnessTest  Hardware-in-the-loop sweep of the
    %   cfo_phase_inc AXI4-Lite register (x"118") on the V5_cfo_inj
    %   BOOT.BIN. cfo_phase_inc is a 16-bit unsigned value applied to a
    %   phase accumulator that drives an 8-bit-index LUT-based NCO. The
    %   NCO output (cos + j*sin) complex-multiplies the Tx samples before
    %   the Receiver, injecting a frequency offset of approximately
    %     f_offset = cfo_phase_inc * Fs / 2^16,  Fs = 15.36 MHz
    %              = cfo_phase_inc * 234.375 Hz.
    %   Negative CFO is achieved via two's-complement wrap: write
    %   65536 - |value| for negative frequencies.
    %
    %   Frequency -> register value reference:
    %                   0 Hz  -> 0
    %               +10 kHz   -> 43        -10 kHz -> 65493 (0xFFD5)
    %               +50 kHz   -> 213       -50 kHz -> 65323 (0xFF2B)
    %              +100 kHz   -> 427      -100 kHz -> 65109 (0xFE55)
    %              +200 kHz   -> 853      -200 kHz -> 64683 (0xFCAB)
    %              +240 kHz   -> 1024     -240 kHz -> 64512 (0xFC00)
    %              +300 kHz   -> 1280     -300 kHz -> 64256 (0xFB00)
    %              +500 kHz   -> 2133     -500 kHz -> 63403 (0xF7AB)
    %
    %   Tests assert BER < 1% within the stated +-240 kHz design range
    %   (carrier-sync acquisition window) and characterise (information-only)
    %   behaviour beyond that range. Also a recovery test: pull CFO to a
    %   value the link can't lock, restore zero, assert re-lock + decode.
    %
    %   cfo_phase_inc is write-only at the AXI level (HDL Coder default
    %   for IP wrapper inputs). Detection of V5 via behavioural probe:
    %   write a CFO value clearly outside lock range -> assert BIST stalls;
    %   then write 0 and verify recovery.
    %
    %   Run:  runtests('HardwareCFORobustnessTest')

    properties (Constant)
        CfoAddr            = '0x9D000118';
        Fs                 = 15.36e6;
        PhaseAccumBits     = 16;
        DataBitsPerPacket  = 2240;
        BerThreshold       = 0.01;
        SshTimeoutSec      = 5;
    end

    properties (TestParameter)
        % Frequencies (in Hz) inside the QPSK Rx carrier-sync acquisition
        % range, where the link should decode at BER < 1%.
        passingCFOHz = struct( ...
            'zero',       0,    ...
            'pos10k',     1e4,  ...
            'neg10k',    -1e4,  ...
            'pos50k',     5e4,  ...
            'neg50k',    -5e4,  ...
            'pos100k',    1e5,  ...
            'neg100k',   -1e5,  ...
            'pos200k',    2e5,  ...
            'neg200k',   -2e5);

        % Frequencies outside the stated design range -- behaviour
        % is informational. We just verify the FPGA doesn't crash (the
        % BIST counters keep responding to AXI reads even if no decode).
        characterizeCFOHz = struct( ...
            'pos300k',    3e5,  ...
            'pos500k',    5e5,  ...
            'pos1MHz',    1e6,  ...
            'neg300k',   -3e5,  ...
            'neg500k',   -5e5);
    end

    methods (Static)
        function val = hzToReg(hzOffset)
            % Convert frequency in Hz to the 16-bit cfo_phase_inc value
            % (two's-complement for negatives).
            Fs_local = 15.36e6;
            inc = round(hzOffset / Fs_local * 2^16);   % can be +/-
            val = mod(inc, 2^16);                       % wrap to 0..65535
        end

        function snapWait(testCase, secs)
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec); %#ok<NASGU>
        end
    end

    methods (TestClassSetup)
        function checkBoardReachableAndV5(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping HW CFO suite');

            % Behavioural probe for V5: write a large CFO well outside the
            % lock range (e.g. 1.5 MHz) and assert BIST packet rate falls
            % near zero. (Pure V3 / V4 BOOT.BINs ignore writes to 0x118 and
            % keep decoding -- so they FAIL this probe.)
            largeCfoReg = HardwareCFORobustnessTest.hzToReg(1.5e6);
            BistRegisters.write(testCase.CfoAddr, largeCfoReg, testCase.SshTimeoutSec);
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            pause(2);
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(1.5);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dpHi = S1.packets - S0.packets;
            % Restore zero CFO + re-acquire
            BistRegisters.write(testCase.CfoAddr, 0, testCase.SshTimeoutSec);
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            pause(2);
            testCase.assumeLessThan(dpHi, 500, ...
                sprintf(['1.5 MHz CFO did not stall the link (dp=%d in 1.5s); ' ...
                         'deployed BOOT.BIN does not appear to be V5_cfo_inj'], dpHi));
        end

        function leaveZeroOnExit(testCase)
            testCase.addTeardown(@() ...
                BistRegisters.write(testCase.CfoAddr, 0, testCase.SshTimeoutSec));
        end
    end

    methods (Test, TestTags = {'Hardware'})

        % --- inside-range: must decode at BER < 1% ---
        function testPassingCFOSweep(testCase, passingCFOHz)
            reg = HardwareCFORobustnessTest.hzToReg(passingCFOHz);
            BistRegisters.write(testCase.CfoAddr, reg, testCase.SshTimeoutSec);
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            pause(2);   % carrier-sync + AGC settle
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(3);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            dp = S1.packets - S0.packets;
            de = S1.bit_errors - S0.bit_errors;
            bits = dp * testCase.DataBitsPerPacket;
            ber  = de / max(1, bits);
            fprintf('cfo=%+.0f Hz (reg=0x%04X): +pkts=%d bits=%d BER=%.4f%%\n', ...
                passingCFOHz, reg, dp, bits, 100*ber);
            testCase.assertGreaterThanOrEqual(bits, 1e6, ...
                sprintf('cfo=%+.0f Hz: only %d bits in 3 s -- link stalled', passingCFOHz, bits));
            testCase.verifyLessThan(ber, testCase.BerThreshold);
        end

        % --- characterize beyond design range: report behaviour, but only
        %     assert that the FPGA continues to respond (BIST register
        %     reads still work, so the design hasn't crashed) ---
        function testBeyondRangeCharacterization(testCase, characterizeCFOHz)
            reg = HardwareCFORobustnessTest.hzToReg(characterizeCFOHz);
            BistRegisters.write(testCase.CfoAddr, reg, testCase.SshTimeoutSec);
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            pause(2);
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(2);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            % We can only assert that the AXI reads return sensible
            % (different) values -- the FPGA must still be alive.
            testCase.verifyFalse(isnan(S1.packets), ...
                sprintf('AXI read failed after writing cfo=%.0f Hz', characterizeCFOHz));
            dp = S1.packets - S0.packets;
            de = S1.bit_errors - S0.bit_errors;
            if dp > 0
                ber = de / (dp * testCase.DataBitsPerPacket);
                fprintf('cfo=%+.0f Hz (out-of-range): +pkts=%d BER=%.4f%% (info)\n', ...
                    characterizeCFOHz, dp, 100*ber);
            else
                fprintf('cfo=%+.0f Hz (out-of-range): link stalled (+pkts=0) (info)\n', characterizeCFOHz);
            end
        end

        % --- recovery: pull CFO to a value the link can't lock, then
        %     restore zero, assert recovery ---
        function testCFORecoveryAfterLockLoss(testCase)
            % First write a CFO that clearly exceeds lock range
            reg = HardwareCFORobustnessTest.hzToReg(1.5e6);
            BistRegisters.write(testCase.CfoAddr, reg, testCase.SshTimeoutSec);
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            pause(2);
            S0 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(1.5);
            S1 = BistRegisters.readAll(testCase.SshTimeoutSec);
            stallDp = S1.packets - S0.packets;
            % Restore zero CFO + rstCS for re-acquisition
            BistRegisters.write(testCase.CfoAddr, 0, testCase.SshTimeoutSec);
            BistRegisters.write(BistRegisters.RstCsAddr, 1, testCase.SshTimeoutSec);
            pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0, testCase.SshTimeoutSec);
            pause(2);
            S2 = BistRegisters.readAll(testCase.SshTimeoutSec);
            pause(2);
            S3 = BistRegisters.readAll(testCase.SshTimeoutSec);
            recoveredDp = S3.packets - S2.packets;
            fprintf('lock-lost stall=+%d/1.5s ; recovery=+%d/2s\n', stallDp, recoveredDp);
            testCase.verifyLessThan(stallDp, 500, ...
                'expected link to fail to lock at 1.5 MHz CFO');
            testCase.verifyGreaterThan(recoveredDp, 5000, ...
                'expected link to recover after restoring zero CFO + rstCS');
        end
    end
end
