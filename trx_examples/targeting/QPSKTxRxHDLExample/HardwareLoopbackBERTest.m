classdef HardwareLoopbackBERTest < matlab.unittest.TestCase
    %HardwareLoopbackBERTest  Hardware-in-the-loop check that the composite
    %   TxRxLoopback design deployed on Jupiter decodes the QPSK BIST under
    %   1% bit-error-rate over at least 1e6 decoded bits, with a hard timeout.
    %
    %   Polls the deployed AXI4-Lite BIST registers
    %     count_out      @ 0x9D000100
    %     packets_out    @ 0x9D000104
    %     bit_errors_out @ 0x9D000108
    %   via ssh+busybox devmem on root@10.0.0.146 and computes
    %     BER = bit_errors_out / (packets_out * DataBitsPerPacket).
    %
    %   Run:   runtests('HardwareLoopbackBERTest')

    properties (Constant)
        BoardHost          = 'root@10.0.0.146';
        AxiCount           = '0x9D000100';
        AxiPackets         = '0x9D000104';
        AxiBitErrors       = '0x9D000108';
        DataBitsPerPacket  = 2240;          % commhdlQPSKTxRxParameters
        MinDecodedBits     = 1e6;           % must accumulate >= this many bits
        BerThreshold       = 0.01;          % BER must be < 1%
        TotalTimeoutSec    = 30;            % hard cap so the test never hangs
        SshConnectTimeoutSec = 5;           % per ssh call
        PollIntervalSec    = 1.0;
    end

    methods (Test, TestTags = {'Hardware'})
        function testLoopbackBerUnder1pct(testCase)
            % 1. confirm the board is reachable; if not, skip cleanly
            [rc,~] = BistRegisters.sshExec('true', testCase.SshConnectTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping HW test');

            % 2. snapshot the BIST counters at t=0
            S0 = BistRegisters.readAll(testCase.SshConnectTimeoutSec);
            p0 = S0.packets; e0 = S0.bit_errors;
            fprintf('[t=0.0s] packets=%d bit_errors=%d\n', p0, e0);

            % 3. poll until >= MinDecodedBits decoded OR timeout
            t0 = tic;
            p1 = p0; e1 = e0;
            while toc(t0) < testCase.TotalTimeoutSec
                pause(testCase.PollIntervalSec);
                S = BistRegisters.readAll(testCase.SshConnectTimeoutSec);
                p1 = S.packets; e1 = S.bit_errors;
                dp = p1 - p0; de = e1 - e0;
                bits = dp * testCase.DataBitsPerPacket;
                ber  = de / max(1, bits);
                fprintf('[t=%.1fs] +packets=%d +bit_errors=%d bits=%d  BER=%.4f%%\n', ...
                    toc(t0), dp, de, bits, 100*ber);
                if bits >= testCase.MinDecodedBits, break; end
            end

            elapsed = toc(t0);
            dp = p1 - p0; de = e1 - e0;
            bits = dp * testCase.DataBitsPerPacket;
            ber  = de / max(1, bits);

            % 4. assertions
            testCase.assertGreaterThanOrEqual(bits, testCase.MinDecodedBits, ...
                sprintf(['decoded only %d bits in %.1fs (need >= %d) -- the ' ...
                'deployed BIST is not advancing fast enough; check that the ' ...
                'composite digital-loopback BOOT.BIN is deployed and FPGA is operating'], ...
                bits, elapsed, testCase.MinDecodedBits));
            testCase.verifyLessThan(ber, testCase.BerThreshold, ...
                sprintf('HW loopback BER = %.4f%% over %d bits (>= %.2f%% threshold)', ...
                100*ber, bits, 100*testCase.BerThreshold));
            fprintf('PASS: BER=%.4f%% over %d bits in %.1fs\n', 100*ber, bits, elapsed);
        end
    end

    % (ssh + devmem + parse plumbing factored out to BistRegisters.m and
    %  exercised separately by BistRegisterReadTest.m)
end
