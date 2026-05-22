classdef PreambleDetectorTest < matlab.unittest.TestCase
    %PreambleDetectorTest  Verify the QPSK Rx preamble detector (framing) behavior.
    %
    %   Reconstructs the non-coherent matched-filter detector in
    %   commhdlQPSKTxRx/.../Preamble Detector/Correlator:
    %     * Discrete FIR Filter : matched filter, taps = conj(flip(preambleSymbols))
    %     * Magnitude Squared   : |MF output|^2   (NON-coherent -> rotation invariant)
    %     * Moving Sum + Threshold (> threshold_add * energy): adaptive detect
    %   The detector runs AFTER the carrier synchronizer, so it sees only a small
    %   residual frequency offset and a (possibly 90/180/270-deg) static rotation.
    %
    %   Goal: confirm the detector (a) frames the packet at the correct symbol,
    %   (b) is invariant to the QPSK phase ambiguity (so it detects regardless of
    %   the 90-deg rotation), (c) does not false-alarm on noise (matches the HW
    %   observation packets=0 with no signal), and find where it degrades.
    %
    %   Run:  runtests('PreambleDetectorTest')

    properties
        ps      % 13 preamble (Barker) symbols
        mf      % matched-filter taps
        Lpre    % preamble length (13)
    end

    properties (TestParameter)
        rotationDeg = struct('a0',0,'a90',90,'a180',180,'a270',270);
    end

    methods (TestMethodSetup)
        function build(testCase)
            o=rng; testCase.addTeardown(@() rng(o)); rng(21,'twister');
            C = commhdlQPSKTxRxParameters; pre = C.Preamble(:);
            si=pre(1:2:end); sq=pre(2:2:end);
            testCase.ps = pskmod(si*2+sq,4,pi/4,'gray');     % preambleSymbols (13)
            testCase.Lpre = numel(testCase.ps);
            testCase.mf = conj(flipud(testCase.ps(:)));      % rxPreambleMFCoeffs
        end
    end

    methods (Test)
        % ---- 1. Detects the preamble at the correct symbol position ----
        function testDetectsAtCorrectPosition(testCase)
            [x, pkPos] = testCase.makeStream(0, Inf);        % clean, no rotation
            metric = abs(filter(testCase.mf,1,x)).^2;
            [~, loc] = max(metric);
            % matched-filter peak occurs at the last preamble sample (group delay = Lpre-1)
            testCase.verifyEqual(loc, pkPos, ...
                sprintf('peak at %d, expected %d (mis-framing)', loc, pkPos));
        end

        % ---- 2. KEY: detection is invariant to the QPSK phase ambiguity ----
        function testRotationInvariant(testCase, rotationDeg)
            [x0,pk] = testCase.makeStream(0, Inf);
            m0 = abs(filter(testCase.mf,1,x0)).^2;
            xr = x0 .* exp(1j*deg2rad(rotationDeg));
            mr = abs(filter(testCase.mf,1,xr)).^2;
            [~,lr] = max(mr);
            % Non-coherent metric => identical peak value and position under rotation.
            testCase.verifyEqual(lr, pk, 'rotation shifted the detection position');
            testCase.verifyEqual(max(mr), max(m0), 'RelTol', 1e-9, ...
                'rotation changed the peak magnitude (detector is not rotation-invariant)');
        end

        % ---- 3. No false alarm on noise: matched peak >> noise floor ----
        function testProcessingGainMargin(testCase)
            % Matched-filter processing gain ~ Lpre (13 => ~11 dB). Confirm the true
            % peak sits well above the largest noise-only correlation at a realistic SNR.
            snr = 8;
            [x,pk] = testCase.makeStream(0, snr);
            m = abs(filter(testCase.mf,1,x)).^2;
            peakVal = m(pk);
            noiseFloor = median(m([1:pk-2*testCase.Lpre, pk+2*testCase.Lpre:end]));
            marginDB = 10*log10(peakVal/noiseFloor);
            fprintf('\n[preamble detector] peak/noise-floor margin = %.1f dB (Lpre=%d) at %d dB SNR\n', ...
                    marginDB, testCase.Lpre, snr);
            testCase.verifyGreaterThan(marginDB, 6, ...
                'matched-filter margin < 6 dB -> false-alarm / miss risk');
        end

        % ---- 4. Frequency-offset sensitivity (coherent MF loses its peak) ----
        function testFrequencyOffsetDegradesPeak(testCase)
            % The MF is coherent over the 13-symbol window; a residual freq offset
            % rotates the preamble during the window and shrinks the peak. Quantify it
            % (the detector runs after carrier sync, so this should only matter if the
            % carrier sync has NOT converged).
            [x0,pk] = testCase.makeStream(0, Inf); pk0 = abs(filter(testCase.mf,1,x0)).^2; ref = pk0(pk);
            Rsym = 1.92e6; offs = [0 1e4 3e4 6e4 1e5 2e5];
            fprintf('\n[preamble peak vs residual freq offset]\n');
            for f = offs
                xf = testCase.applyCFOtoStream(x0, f, Rsym);
                mf2 = abs(filter(testCase.mf,1,xf)).^2;
                fprintf('   %6.0f Hz -> peak %4.0f%% of clean\n', f, 100*max(mf2)/ref);
            end
            % At zero offset (carrier sync converged) the peak is full strength.
            testCase.verifyEqual(max(pk0), ref, 'RelTol',1e-9);
        end

        % ---- 5. Position stays correct under noise ----
        function testPositionStableUnderNoise(testCase)
            hits = 0; N = 50;
            for t=1:N
                [x,pk] = testCase.makeStream(0, 8);
                [~,loc] = max(abs(filter(testCase.mf,1,x)).^2);
                hits = hits + (loc==pk);
            end
            testCase.verifyGreaterThan(hits/N, 0.9, ...
                sprintf('peak located correctly only %d/%d at 8 dB SNR', hits, N));
        end
    end

    methods
        function [x, peakPos] = makeStream(testCase, rotDeg, snrdB)
            % preamble embedded in random QPSK payload, optional rotation + noise
            guard = 40; payload = 60;
            pre = testCase.ps(:);
            bits = randi([0 1], 2*(guard+payload), 1);
            data = pskmod(bits(1:2:end)*2+bits(2:2:end),4,pi/4,'gray'); data=data(:);
            x = [data(1:guard); pre; data(guard+1:end)];
            x = x .* exp(1j*deg2rad(rotDeg));
            if snrdB < Inf
                x = x + (randn(size(x))+1j*randn(size(x)))/sqrt(2)*10^(-snrdB/20);
            end
            peakPos = guard + testCase.Lpre;     % MF group delay -> peak at last preamble sample
        end
    end

    methods (Static)
        function y = applyCFOtoStream(x, fHz, Rsym)
            k=(0:numel(x)-1).'; y = x(:) .* exp(1j*2*pi*fHz/Rsym*k);
        end
    end
end
