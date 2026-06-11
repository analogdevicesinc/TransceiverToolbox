classdef PlutoCaptureBERTest < matlab.unittest.TestCase
    %PlutoCaptureBERTest  Hardware-in-the-loop: decode a Pluto capture of the
    %   Jupiter TX1 loopback and assert the QPSK link BER < 1%.
    %
    %   This isolates TX-vs-RX: the Pluto independently captures what Jupiter
    %   *transmits*, and the validated offline receiver (demodPlutoCapture)
    %   decodes it. If this passes (<1%) but the Jupiter FPGA BIST shows ~50%,
    %   the transmitted signal is good and the fault is in the FPGA receiver.
    %   If this also fails, the transmit/signal path corrupts the signal.
    %
    %   Capture the file first (TX must be running; LO matched to the Pluto):
    %     iio_readdev -u usb:<pluto> -b 1048576 -s 5000000 \
    %         cf-ad9361-lpc voltage0 voltage1 > /tmp/pluto_qpsk_capture.dat
    %
    %   Then:  runtests('PlutoCaptureBERTest')   (tagged 'Hardware')

    properties (Constant)
        CaptureFile = '/tmp/pluto_qpsk_capture.dat';
        CaptureFs   = 5e6;     % iio_readdev sample rate used for the capture
    end

    methods (Test, TestTags = {'Hardware'})
        function testCaptureDecodesUnder1pct(testCase)
            testCase.assumeTrue(isfile(PlutoCaptureBERTest.CaptureFile), ...
                ['No capture file ' PlutoCaptureBERTest.CaptureFile ' — capture the Jupiter TX on the Pluto first.']);
            fid = fopen(PlutoCaptureBERTest.CaptureFile,'r'); raw = fread(fid, Inf, 'int16'); fclose(fid);
            iq = raw(1:2:end) + 1j*raw(2:2:end);
            % Guard: a 'capture' that's only a tone/noise (the host TX-DMA
            % didn't stream) is not a meaningful BER test -- skip with a clear
            % diagnostic so it doesn't masquerade as a QPSK-decode failure.
            seg = iq(round(0.4*numel(iq)):min(end, round(0.4*numel(iq))+2^15-1));
            seg = seg - mean(seg); Y = abs(fftshift(fft(seg.*hann(numel(seg))))).^2;
            ff = (-numel(seg)/2:numel(seg)/2-1)/numel(seg)*PlutoCaptureBERTest.CaptureFs;
            cs = cumsum(Y)/sum(Y); bw = ff(find(cs>=0.95,1)) - ff(find(cs>=0.05,1));
            testCase.assumeGreaterThan(bw, 1e6, sprintf( ...
                'capture has BW=%.2f MHz < 1 MHz (only a tone/noise) — host TX-DMA did not stream the QPSK; not a QPSK-link failure', bw/1e6));
            [ber, nframes, evm, info] = demodPlutoCapture(iq, PlutoCaptureBERTest.CaptureFs);
            fprintf('\n[Pluto-capture decode] %s\n', info);
            testCase.verifyGreaterThan(nframes, 5, ...
                'fewer than 6 frames decoded — TX not streaming or wrong LO/freq');
            testCase.verifyLessThan(evm, 0.30, sprintf('constellation EVM %.2f too high', evm));
            testCase.verifyLessThan(ber, 0.01, ...
                sprintf('Pluto-captured link BER %.3f%% >= 1%% — transmit/signal path is corrupting it', 100*ber));
        end
    end

    methods (Test)
        % Always-runnable sanity: the offline receiver itself meets <1% on a
        % synthesized capture (guards demodPlutoCapture against regressions).
        function testOfflineReceiverSanity(testCase)
            o=rng; testCase.addTeardown(@() rng(o)); rng(202,'twister');
            tx = QPSKRxChainTest.genTxWaveform(14);
            sim = resample(tx, 125, 384);                 % ~5 MHz, Pluto-like
            k = (0:numel(sim)-1).'; sim = sim.*exp(1j*2*pi*15e3/5e6*k);
            sim = sim + (randn(size(sim))+1j*randn(size(sim)))/sqrt(2)*10^(-18/20);
            ber = demodPlutoCapture(sim, 5e6);
            testCase.verifyLessThan(ber, 0.01, sprintf('offline Rx sanity BER %.3f%%', 100*ber));
        end
    end
end
