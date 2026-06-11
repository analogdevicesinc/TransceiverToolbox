classdef PhaseAmbiguityEstimatorTest < matlab.unittest.TestCase
    %PhaseAmbiguityEstimatorTest  Verify the QPSK Rx phase-ambiguity estimator/corrector.
    %
    %   Reconstructs the algorithm used by
    %   commhdlQPSKTxRx/.../Phase Ambiguity Estimation and Correction:
    %     * Estimator : Z = sum_k rxPre(k) * conj(refPre(k)) over the 8-symbol
    %                   unique word refPre = preambleSymbols(4:11).
    %     * Corrector : continuous rotation  dataOut = dataIn * conj(Z)/|Z|
    %                   (the deployed HDL uses Complex-to-Mag-Angle + Reciprocal +
    %                    conj + Product; NO 4-quadrant quantizer/round block).
    %
    %   Goal: confirm the estimator resolves the QPSK 0/90/180/270-deg ambiguity
    %   correctly, and find the conditions (noise, residual carrier-frequency
    %   offset, reference mismatch) under which it produces a wrong correction.
    %
    %   Run:  results = runtests('PhaseAmbiguityEstimatorTest')

    properties
        refPre   % 8-symbol reference unique word (preambleSymbols(4:11))
        payload  % a block of random QPSK payload symbols (the "data" to recover)
    end

    properties (TestParameter)
        % The four QPSK carrier-phase ambiguities plus the inter-quadrant
        % boundaries (where a *quantized* resolver would be fragile).
        rotationDeg = struct('a0',0,'a45',45,'a90',90,'a135',135, ...
                             'a180',180,'a225',225,'a270',270,'a315',315);
    end

    methods (TestMethodSetup)
        function seedAndBuild(testCase)
            originalRng = rng; testCase.addTeardown(@() rng(originalRng));
            rng(7,'twister');
            % Reference unique word, exactly as the model defines it.
            C = commhdlQPSKTxRxParameters;
            pre = C.Preamble(:);
            si = pre(1:2:end); sq = pre(2:2:end);
            ps = pskmod(si*2 + sq, 4, pi/4, 'gray');   % preambleSymbols
            testCase.refPre = ps(3+1:3+8);             % preambleSymbols(4:11)
            % Random QPSK payload (gray, pi/4) to recover after correction.
            bits = randi([0 1], 2*200, 1);
            testCase.payload = pskmod(bits(1:2:end)*2 + bits(2:2:end), 4, pi/4, 'gray');
        end
    end

    methods (Test)
        % ---- 1. Resolves an arbitrary static rotation (incl. the 4 ambiguities) ----
        function testResolvesRotation(testCase, rotationDeg)
            th = deg2rad(rotationDeg);
            rxPre  = testCase.refPre  .* exp(1j*th);     % rotated preamble (clean)
            rxData = testCase.payload .* exp(1j*th);     % rotated payload
            corr   = testCase.estimateCorrect(rxPre, rxData, testCase.refPre);
            % Corrected payload symbols must coincide with the transmitted payload.
            evm = max(abs(corr - testCase.payload));
            testCase.verifyLessThan(evm, 1e-6, ...
                sprintf('rotation %d deg not resolved (max EVM=%.3g)', rotationDeg, evm));
        end

        % ---- 2. BPSK-like preamble still resolves 180 deg unambiguously ----
        function testNo180Ambiguity(testCase)
            % refPre takes only +/-(0.707+0.707j); confirm 0 and 180 deg both resolve
            for th = [0 pi]
                rxPre  = testCase.refPre  .* exp(1j*th);
                rxData = testCase.payload .* exp(1j*th);
                corr   = testCase.estimateCorrect(rxPre, rxData, testCase.refPre);
                testCase.verifyLessThan(max(abs(corr - testCase.payload)), 1e-6, ...
                    sprintf('180-deg path failed at theta=%.0f deg', rad2deg(th)));
            end
        end

        % ---- 3. Noise: degrades gracefully, no discrete 90-deg flip ----
        function testNoiseDegradesGracefully(testCase)
            % At a moderate SNR the residual phase error should be small (<< 45 deg),
            % i.e. the estimator does NOT snap to a wrong quadrant.
            th = deg2rad(90);                      % a true ambiguity
            snr = 15;                              % dB, per-symbol
            n = 1/sqrt(2)*(randn(size(testCase.refPre)) + 1j*randn(size(testCase.refPre)))*10^(-snr/20);
            rxPre = testCase.refPre.*exp(1j*th) + n;
            Z = sum(rxPre .* conj(testCase.refPre));
            residualDeg = abs(rad2deg(angle(Z) - th));
            residualDeg = min(residualDeg, 360-residualDeg);
            testCase.verifyLessThan(residualDeg, 45, ...
                sprintf('at %d dB SNR the estimate is %.1f deg off -> risks a 90-deg quadrant flip', snr, residualDeg));
        end

        % ---- 4. Residual carrier FREQUENCY offset over the preamble window ----
        function testFrequencyOffsetBias(testCase)
            % A residual freq offset rotates the 8 preamble symbols during estimation,
            % biasing angle(Z). Find how large an offset the estimator tolerates before
            % the residual exceeds 45 deg (the point a downstream slicer flips a bit).
            C = commhdlQPSKTxRxParameters; Rsym = 1.92e6;
            k = (0:numel(testCase.refPre)-1).';
            offsets = [0 1e3 5e3 1e4 3e4 6e4 1e5];     % Hz residual after carrier sync
            residual = zeros(size(offsets));
            for i = 1:numel(offsets)
                f = offsets(i);
                rxPre = testCase.refPre .* exp(1j*2*pi*f/Rsym*k);   % no static ambiguity, pure freq
                Z = sum(rxPre .* conj(testCase.refPre));
                residual(i) = abs(rad2deg(angle(Z)));
            end
            % Document the sensitivity; the estimator is a static (single-shot) estimate,
            % so it cannot track frequency. Flag the offset that pushes it past 45 deg.
            firstBad = find(residual >= 45, 1);
            fprintf('\n[freq-offset sensitivity] residual angle(Z) vs offset:\n');
            for i=1:numel(offsets), fprintf('   %6.0f Hz -> %5.1f deg\n', offsets(i), residual(i)); end
            % With the carrier sync converged (<=3 kHz residual per the design doc),
            % the estimate must be well within 45 deg.
            idx3k = find(offsets<=3e3,1,'last');
            testCase.verifyLessThan(residual(idx3k), 45, ...
                'estimator already >45 deg off at the design''s 3 kHz residual freq -> would flip a quadrant');
            if ~isempty(firstBad)
                fprintf('   => crosses 45 deg (quadrant-flip risk) at ~%.0f Hz residual offset\n', offsets(firstBad));
            end
        end

        % ---- 5. Reference-mismatch bug mode (catches a wrong unique word) ----
        function testReferenceMismatchFails(testCase)
            % If the estimator's stored reference does not match the transmitted
            % preamble (e.g., wrong indices or a 90-deg-rotated reference), the
            % correction is wrong. This guards against that implementation bug.
            th = deg2rad(90);
            rxPre  = testCase.refPre  .* exp(1j*th);
            rxData = testCase.payload .* exp(1j*th);
            badRef = testCase.refPre .* exp(1j*pi/2);      % reference rotated 90 deg
            corr   = testCase.estimateCorrect(rxPre, rxData, badRef);
            testCase.verifyGreaterThan(max(abs(corr - testCase.payload)), 0.5, ...
                'a 90-deg reference mismatch should corrupt the correction (sanity of the test)');
        end
    end

    methods (Static)
        function dataOut = estimateCorrect(rxPre, rxData, refPre)
            % Reconstruction of the model's estimator + (continuous) corrector.
            Z = sum(rxPre .* conj(refPre));      % unique-word correlation
            rot = conj(Z) / abs(Z);              % = exp(-j*angle(Z))
            dataOut = rxData .* rot;             % continuous de-rotation
        end
    end
end
