classdef HardwareCompositeRFTest < matlab.unittest.TestCase
%HARDWARECOMPOSITERFTEST  Verify the composite (Tx + Rx in a single
%   subsystem, JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY) reference
%   design) reaches <1% BER over >= 50,000 packets on the real-RF path:
%       Tx HDL -> ADRV9002 DAC -> external cable -> ADRV9002 ADC -> Rx HDL.
%
%   AXI registers:
%     0x100 count_out
%     0x104 packets_out
%     0x108 bit_errors_out
%     0x10C iq_debug_mux
%     0x110 rstCS              (carrier sync reset, fire-and-forget)
%     0x114 rx_input_select    (0 = internal Tx-loopback, 1 = external ADC)
%
%   Prerequisite: composite BOOT.BIN on Jupiter; DAC->ADC cable in place;
%   ADRV9002 alive on libiio at the URI below.

    properties (Constant)
        AxiCount   = '0x9D000100';
        AxiPackets = '0x9D000104';
        AxiErrors  = '0x9D000108';
        AxiRxSel   = '0x9D000114';     % rx_input_select
        URI        = 'ip:10.0.0.146';
        SshTimeoutSec = 8;
        SettleSec  = 5;
        BerThreshold = 0.01;
        MinPackets   = 50000;
        BitsPerPacket = 2240;          % DataBitsPerPacket from Parameters.m
    end

    methods (TestClassSetup)
        function setupPath(testCase)
            here = fileparts(mfilename('fullpath'));
            addpath(here);
            tbxRoot = fileparts(fileparts(fileparts(here)));
            setupM = fullfile(tbxRoot, 'setup.m');
            if exist(setupM, 'file') == 2, run(setupM); end
        end
    end

    methods (Test, TestTags = {'Hardware'})
        function rfPathReachesGoal(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, 'Jupiter unreachable');

            % Configure ADRV9002 Tx + Rx at the same center freq so the
            % DAC->cable->ADC loop closes through the chip's own PLL.
            tx = adi.ADRV9002.Tx('uri', testCase.URI);
            tx.EnabledChannels = 1;
            tx.CenterFrequencyChannel0 = 2.4e9;
            % Our HDL Transmitter drives the DAC via the composite reference
            % design's IP Data 0/1 OUT routing. Initialize tx with a cyclic
            % zero buffer just to power up the chip's TX chain (PLL, attenuation,
            % profile); the actual data on the DAC comes from our HDL.
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            try
                tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));
            catch ME
                warning('Tx push raised %s; continuing.', ME.message);
            end

            rx = adi.ADRV9002.Rx('uri', testCase.URI);
            rx.EnabledChannels = 1;
            rx.CenterFrequencyChannel0 = 2.4e9;
            try
                setup(rx);
            catch ME
                warning('Rx setup raised %s; continuing.', ME.message);
            end

            pause(testCase.SettleSec);

            % Switch the FPGA's rx_input_select MUX to 1 (external ADC path)
            % AFTER the chip is configured, so the Receiver sees a settled
            % DAC->cable->ADC signal rather than zeros.
            cmd = sprintf('busybox devmem %s 32 1', strrep(testCase.AxiRxSel,'0x','0x'));
            [rcw,~] = BistRegisters.sshExec(cmd, testCase.SshTimeoutSec);
            testCase.assertEqual(rcw, 0, 'failed to set rx_input_select=1');
            pause(2.0);  % let preamble re-lock

            % Measure BER over a 16-second window (~50k+ packets at ~3.3 kpkt/s)
            p0 = uint64(BistRegisters.read(testCase.AxiPackets, testCase.SshTimeoutSec));
            e0 = uint64(BistRegisters.read(testCase.AxiErrors,  testCase.SshTimeoutSec));
            pause(16.0);
            p1 = uint64(BistRegisters.read(testCase.AxiPackets, testCase.SshTimeoutSec));
            e1 = uint64(BistRegisters.read(testCase.AxiErrors,  testCase.SshTimeoutSec));

            dp = double(p1 - p0);
            de = double(e1 - e0);
            bits = dp * testCase.BitsPerPacket;
            ber  = de / max(bits, 1);

            fprintf('\n=== Composite RF path BIST window (16 s, rx_input_select=1) ===\n');
            fprintf('  packets in window : %d  (min required %d)\n', dp, testCase.MinPackets);
            fprintf('  bit errors       : %d / %d bits\n', de, bits);
            fprintf('  BER              : %.4f%%  (threshold %.2f%%)\n', 100*ber, 100*testCase.BerThreshold);

            % Restore rx_input_select=0 (internal Tx-loopback) for next session
            try
                BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', testCase.AxiRxSel), testCase.SshTimeoutSec);
            catch
            end

            release(tx);
            try, release(rx); catch, end

            testCase.verifyGreaterThanOrEqual(dp, testCase.MinPackets, ...
                sprintf('Need >= %d packets in 2 s; got %d', testCase.MinPackets, dp));
            testCase.verifyLessThan(ber, testCase.BerThreshold, ...
                sprintf('BER %.4f%% exceeds %.2f%% threshold', 100*ber, 100*testCase.BerThreshold));
        end
    end
end
