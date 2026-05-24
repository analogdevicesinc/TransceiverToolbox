classdef HardwareRFLOCfoTest < matlab.unittest.TestCase
    %HardwareRFLOCfoTest  Real-RF CFO test by adjusting the ADRV9002 Tx
    %   and Rx LO frequencies independently. Streams a MATLAB-generated
    %   QPSK waveform out the FPGA DAC (via adi.ADRV9002.Tx), the signal
    %   propagates through the ADRV9002 analog chain (TX LO mixer ->
    %   amplifier -> external RF loopback cable -> Rx amplifier ->
    %   RX LO mixer -> ADC), and is captured (adi.ADRV9002.Rx). The
    %   delta between Tx and Rx LOs is a real RF carrier-frequency
    %   offset; the offline receiver decodes the capture and BER is
    %   asserted.
    %
    %   This is complementary to HardwareCFORobustnessTest (which
    %   characterises the FPGA-Rx tolerance via a digital NCO injection
    %   in the BIST design): this one characterises the *end-to-end
    %   real-RF link*, exercising the analog Tx/Rx chain plus the same
    %   offline demodulator the FPGA Rx is algorithmically equivalent
    %   to.
    %
    %   Hardware setup required:
    %     * A streaming-capable FPGA on Jupiter (any of V3/V4/V5 BOOT.BIN
    %       works -- they all include axi-adrv9002-{tx,rx}-lpc IPs).
    %     * **An RF cable (or attenuator) from TX1 port to RX1 port.**
    %       Without it the captured Rx sees only noise and the test
    %       will skip with a "no coherent signal" assumption.
    %
    %   Run:  runtests('HardwareRFLOCfoTest')

    properties (Constant)
        URI       = 'ip:10.0.0.146';
        BaseLO    = 2.4e9;       % Tx LO
        Fs_iio    = 30.72e6;     % ADRV9002 baseband rate from profile
        NSamples  = 2^17;        % capture length
        BerThreshold = 0.01;
    end

    properties (TestParameter)
        % LO offset (Hz) applied to Rx vs Tx. The QPSK Rx algorithm's
        % stated tolerance is +-240 kHz; we sweep within that range.
        loOffsetHz = struct( ...
            'zero',       0, ...
            'pos50k',     5e4, ...
            'neg50k',    -5e4, ...
            'pos100k',    1e5, ...
            'neg100k',   -1e5, ...
            'pos200k',    2e5);
    end

    properties (TestClassSetup)
        % Persistent Tx/Rx objects to avoid hammering libiio handshakes
    end

    properties
        Tx
        Rx
        TxWaveform
    end

    methods (TestClassSetup)
        function setup(testCase)
            % Probe the board first; skip if unreachable
            [rc,~] = BistRegisters.sshExec('true', 5);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping RF LO CFO suite');

            % Make +adi package visible (system objects live in repo root)
            import matlab.unittest.fixtures.PathFixture
            here = fileparts(mfilename('fullpath'));
            repoRoot = fullfile(here, '..', '..', '..');
            testCase.applyFixture(PathFixture(repoRoot));
            % Skip if the toolbox isn't actually available in the search path
            testCase.assumeTrue(~isempty(which('adi.ADRV9002.Tx')), ...
                'adi.ADRV9002.Tx not on path -- repo +adi package not visible');

            o=rng; testCase.addTeardown(@() rng(o)); rng(7,'twister');

            % Generate a QPSK Tx waveform at Fs_iio (ADRV9002 baseband
            % rate). Use QPSKRxChainTest.genTxWaveform (8 sps @ Rsym=1.92M
            % = 15.36 MHz), then resample to Fs_iio.
            txMat = QPSKRxChainTest.genTxWaveform(40);     % ~40 frames
            [p,q] = rat(testCase.Fs_iio / 15.36e6);
            txRs  = resample(txMat, p, q);
            % Scale to near full-scale int16 (signed 16-bit DAC)
            txRs = txRs / max(abs(txRs)) * (2^14);
            testCase.TxWaveform = complex(txRs);

            % Tx setup: cyclic transmission so the buffer repeats forever
            testCase.Tx = adi.ADRV9002.Tx('uri', testCase.URI);
            testCase.Tx.CenterFrequencyChannel0 = testCase.BaseLO;
            testCase.Tx.EnableCyclicBuffers = true;

            % Rx setup
            testCase.Rx = adi.ADRV9002.Rx('uri', testCase.URI);
            testCase.Rx.CenterFrequencyChannel0 = testCase.BaseLO;
            testCase.Rx.SamplesPerFrame = testCase.NSamples;
            testCase.Rx.kernelBuffersCount = 4;

            % Push initial Tx and prime Rx so calibration settles
            testCase.Tx(testCase.TxWaveform);
            for k=1:4, [~] = testCase.Rx(); end

            % --- Coherent-signal sanity: with LO_rx = LO_tx, the Rx
            %     capture should have BW > ~1 MHz (QPSK bandwidth) and
            %     SNR clearly above noise. If it doesn't, there is no
            %     Tx -> Rx coupling (RF cable missing).
            y = double(testCase.Rx());
            seg = y - mean(y); Y = abs(fftshift(fft(seg.*hann(numel(seg))))).^2;
            ff = (-numel(seg)/2:numel(seg)/2-1)/numel(seg)*testCase.Fs_iio;
            cs = cumsum(Y) / max(sum(Y), eps);
            i95 = find(cs>=0.95,1); i05 = find(cs>=0.05,1);
            if isempty(i95) || isempty(i05)
                bw = 0;
            else
                bw = ff(i95) - ff(i05);
            end
            peakToMed = 10*log10(max(Y) / max(median(Y), eps));
            fprintf('LO baseline: BW=%.3f MHz, peak/median=%.1f dB\n', bw/1e6, peakToMed);
            testCase.assumeGreaterThan(bw, 1e6, sprintf(...
                'no coherent Tx->Rx signal (BW=%.2f MHz < 1 MHz); connect TX1 to RX1 via RF cable', bw/1e6));
            testCase.assumeGreaterThan(peakToMed, 10, sprintf(...
                'no coherent Tx->Rx signal (peak/median=%.1f dB)', peakToMed));
        end

        function teardownRadios(testCase)
            testCase.addTeardown(@() releaseAll(testCase));
        end
    end

    methods (Test, TestTags = {'Hardware'})
        function testLoOffsetCFO(testCase, loOffsetHz)
            % Set Rx LO with offset, prime, capture, decode, BER assert
            testCase.Rx.CenterFrequencyChannel0 = testCase.BaseLO + loOffsetHz;
            for k=1:4, [~] = testCase.Rx(); end
            y = testCase.Rx();
            iq = double(y(:));

            [ber, nframes, evm, info] = demodPlutoCapture(iq, testCase.Fs_iio);
            fprintf('LO offset=%+.0f Hz: %s\n', loOffsetHz, info);
            testCase.verifyGreaterThan(nframes, 5, ...
                sprintf('LO offset=%+.0f Hz: only %d frames decoded -- Rx lost lock', loOffsetHz, nframes));
            testCase.verifyLessThan(evm, 0.35, ...
                sprintf('LO offset=%+.0f Hz: EVM=%.2f too high', loOffsetHz, evm));
            testCase.verifyLessThan(ber, testCase.BerThreshold, ...
                sprintf('LO offset=%+.0f Hz: BER %.3f%% >= %.0f%%', loOffsetHz, 100*ber, 100*testCase.BerThreshold));
        end
    end
end

function releaseAll(tc)
    try, release(tc.Tx); catch, end
    try, release(tc.Rx); catch, end
end
