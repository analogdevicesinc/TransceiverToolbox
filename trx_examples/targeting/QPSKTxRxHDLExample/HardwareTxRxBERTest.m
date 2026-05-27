classdef HardwareTxRxBERTest < matlab.unittest.TestCase
%HARDWARETXRXBERTEST  Verify the TxRx bitstream
%   (hdlworkflow_txrx.m, DUT=Receiver, JUPITER (TX & RX - TX IS FASTER ...)
%   reaches <1% BER over >= 50,000 packets on the real-RF path:
%     host MATLAB pushes QPSK waveform via DMA -> ADRV9002 DAC ->
%     external cable -> ADRV9002 ADC -> in-FPGA Receiver -> BIST.
%
%   This is the proven loopback_bist_check.m pattern, repackaged as a
%   matlab.unittest test with the 50k-packet pass criterion.

    properties (Constant)
        AxiCount      = '0x9D000100';
        AxiPackets    = '0x9D000104';
        AxiErrors     = '0x9D000108';
        URI           = 'ip:10.0.0.146';
        SshTimeoutSec = 8;
        RsymTarget    = 1.92e6;   % 1.92 MHz Rsym => 8 sps at 15.36 MHz radio
                                 % (matches Receiver's UpsamplesRx=2 which downsamples 8->4 sps internally)
        DwellSec      = 3.0;      % >50k packets at ~30 kpkt/s
        BerThreshold  = 0.01;     % 1%
        MinPackets    = 50000;
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

            % --- Build the QPSK waveform that the in-FPGA BIST expects --
            % Identical waveform construction to loopback_bist_check.m, but
            % with the SamplingRate hardcoded so the resample step is not
            % needed (Rsym=3.84e6 => SPS=4 matches the radio's 15.36 MHz).
            C = commhdlQPSKTxRxParameters;
            msg = 'ADI Hello World';
            mb = dec2bin(double(msg), 8).';  mb = mb(:) - '0';   % 120 bits
            Npk = 8;
            pre = C.Preamble(:);
            payload = repmat([mb; zeros(C.DataBitsPerPacket-numel(mb),1)], 1, Npk);
            bitsPk  = [repmat(pre,1,Npk); payload];
            allbits = bitsPk(:);
            si = allbits(1:2:end);
            sq = allbits(2:2:end);
            sym = pskmod(si*2 + sq, 4, pi/4, 'gray');
            w4 = zeros(numel(sym)*C.SamplesPerSymbol, 1);
            w4(1:C.SamplesPerSymbol:end) = sym;
            w4 = filter(C.RRCCoef, 1, w4);
            % SPS on the radio = 15.36 MHz / 1.92 MHz = 8 = 2*C.SamplesPerSymbol.
            % Upsample by 2 via zero-insertion + RRC filter would re-RRC-filter
            % the already-shaped pulse, which is wrong. Instead use a simple
            % zero-stuffing-and-FIR rate change. Easiest: just upsample by 2
            % (insert zeros) and let the Receiver's matched filter recover.
            % The Tx data is now 8 sps on the radio; Receiver downsamples by
            % UpsamplesRx=2 to its internal 4-sps QPSK demod.
            w = upsample(w4, 2);

            % --- Configure the ADRV9002 Tx; push the waveform cyclically -
            tx = adi.ADRV9002.Tx('uri', testCase.URI);
            tx.EnabledChannels = 1;
            tx.CenterFrequencyChannel0 = 2.4e9;
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            scale = @(x) int16(x ./ max(abs([real(w);imag(w)])) .* 2^14);
            tx(complex(scale(real(w)), scale(imag(w))));

            % --- BIST counter delta over a known dwell window ----------
            rd = @() readBistCounters(testCase);
            b0 = rd();
            pause(testCase.DwellSec);
            b1 = rd();
            release(tx);

            dp = double(b1.packets - b0.packets);
            de = double(b1.errors  - b0.errors);
            bits = dp * 120;
            ber  = de / max(bits, 1);

            fprintf('\n=== TxRx (real-RF) BIST window (%.1f s) ===\n', testCase.DwellSec);
            fprintf('  packets    : %d  (min required %d)\n', dp, testCase.MinPackets);
            fprintf('  bit errors : %d / %d bits\n', de, bits);
            fprintf('  BER        : %.4f%%  (threshold %.2f%%)\n', 100*ber, 100*testCase.BerThreshold);

            testCase.verifyGreaterThanOrEqual(dp, testCase.MinPackets, ...
                sprintf('Need >= %d packets in %.1f s; got %d', testCase.MinPackets, testCase.DwellSec, dp));
            testCase.verifyLessThan(ber, testCase.BerThreshold, ...
                sprintf('BER %.4f%% exceeds %.2f%% threshold', 100*ber, 100*testCase.BerThreshold));
        end
    end
end

function b = readBistCounters(testCase)
    b.count   = uint64(BistRegisters.read(testCase.AxiCount,   testCase.SshTimeoutSec));
    b.packets = uint64(BistRegisters.read(testCase.AxiPackets, testCase.SshTimeoutSec));
    b.errors  = uint64(BistRegisters.read(testCase.AxiErrors,  testCase.SshTimeoutSec));
end
