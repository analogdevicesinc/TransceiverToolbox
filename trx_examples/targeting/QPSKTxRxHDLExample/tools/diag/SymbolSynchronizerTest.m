classdef SymbolSynchronizerTest < matlab.unittest.TestCase
    %SymbolSynchronizerTest  Verify the QPSK Rx symbol synchronizer (timing recovery).
    %
    %   The model block (commhdlQPSKTxRx/.../Symbol Synchronizer) is a Gardner
    %   timing-error-detector loop: Gardner TED -> Loop Filter (PI) ->
    %   Interpolation Control (NCO) -> Interpolation Filter, decimating the
    %   SamplesPerSymbol=4 input to 1 sample/symbol at the optimal instant.
    %
    %   Tests:
    %     1. Gardner TED S-curve crosses zero at the correct timing with the right
    %        slope (the loop has a stable lock point).
    %     2. comm.SymbolSynchronizer (Gardner, the block's reference algorithm)
    %        recovers the symbols under a static fractional timing offset.
    %     3. Lock range vs a timing-clock frequency offset (TX/RX clock mismatch).
    %     4. Recovery under noise.
    %
    %   Run:  runtests('SymbolSynchronizerTest')

    properties
        sps = 4;
        rrc            % RRC matched-filter / pulse-shape (from the model Config)
        span = 10;     % RRC span used for the test pulse shaping
    end

    methods (TestMethodSetup)
        function build(testCase)
            o=rng; testCase.addTeardown(@() rng(o)); rng(31,'twister');
            try
                C = commhdlQPSKTxRxParameters; testCase.rrc = C.RRCCoef(:).';
            catch
                testCase.rrc = rcosdesign(0.5, testCase.span, testCase.sps);
            end
        end
    end

    methods (Test)
        % ---- 1. Gardner TED S-curve: zero at optimal timing, correct slope ----
        function testGardnerTEDSCurve(testCase)
            % Build a 2-sps RRC-shaped QPSK, sweep the sampling phase, and average
            % the Gardner error. It must be ~0 at offset 0 and change sign across it
            % (a single stable zero-crossing the loop converges to).
            sym = testCase.qpskSymbols(2000);
            os = 32;                                   % fine oversample as "continuous"
            wav = testCase.pulseShape(sym, os);
            offs = -0.5:0.05:0.5;                      % timing offsets in symbols
            scurve = zeros(size(offs));
            for i=1:numel(offs)
                scurve(i) = testCase.gardnerMeanError(wav, os, offs(i));
            end
            [~,iz] = min(abs(offs));
            fprintf('\n[Gardner TED S-curve] e(-0.25)=%+.3f  e(0)=%+.3f  e(+0.25)=%+.3f\n', ...
                scurve(offs==-0.25), scurve(iz), scurve(offs==0.25));
            testCase.verifyLessThan(abs(scurve(iz)), 0.05*max(abs(scurve)), ...
                'Gardner error not ~0 at the optimal timing');
            % monotonic sign change about zero => stable lock point
            testCase.verifyLessThan(scurve(offs==-0.25)*scurve(offs==0.25), 0, ...
                'TED S-curve does not change sign across the optimal timing (no stable lock)');
        end

        % ---- 2. Recovers symbols under a static fractional timing offset ----
        function testRecoversWithTimingOffset(testCase)
            sync = testCase.makeSync();
            for tau = [0.1 0.3 0.5]
                rx = testCase.makeRxSignal(numel_syms(), tau, 0, Inf);
                y = sync(rx); sync.reset();
                evm = testCase.symbolEVM(y);
                testCase.verifyLessThan(evm, 0.2, ...
                    sprintf('timing offset %.2f T: EVM %.2f after lock', tau, evm));
            end
        end

        % ---- 3. Lock range vs timing-clock frequency offset (ppm) ----
        function testTimingFreqOffsetLockRange(testCase)
            ppmList = [0 20 50 100 200];
            fprintf('\n[symbol-sync EVM vs timing clock offset]\n');
            evmv = zeros(size(ppmList));
            for i=1:numel(ppmList)
                sync = testCase.makeSync();
                rx = testCase.makeRxSignal(numel_syms(), 0.2, ppmList(i)*1e-6, Inf);
                y = sync(rx); sync.reset();
                evmv(i) = testCase.symbolEVM(y);
                fprintf('   %4d ppm -> EVM %.3f\n', ppmList(i), evmv(i));
            end
            % Within the design's small clock offset the synchronizer must hold lock.
            testCase.verifyLessThan(evmv(ppmList==50), 0.25, ...
                'symbol sync loses lock at 50 ppm clock offset');
        end

        % ---- 4. Recovers under realistic noise ----
        function testRecoversUnderNoise(testCase)
            % At 15 dB SNR the noise EVM floor is ~10^(-15/20)=0.178; a working
            % synchronizer adds little, so total EVM should stay under 0.25.
            sync = testCase.makeSync();
            rx = testCase.makeRxSignal(numel_syms(), 0.25, 0, 15);   % 15 dB SNR
            y = sync(rx); sync.reset();
            testCase.verifyLessThan(testCase.symbolEVM(y), 0.25, ...
                'symbol sync EVM exceeds the 15 dB noise floor + margin');
        end
    end

    methods
        function s = qpskSymbols(~, n)
            b = randi([0 1], 2*n, 1);
            s = pskmod(b(1:2:end)*2+b(2:2:end), 4, pi/4, 'gray'); s = s(:);
        end
        function w = pulseShape(testCase, sym, os)
            up = upsample(sym, os);
            h = rcosdesign(0.5, testCase.span, os);
            w = conv(up, h, 'same');
        end
        function sync = makeSync(testCase)
            sync = comm.SymbolSynchronizer( ...
                'TimingErrorDetector','Gardner (non-data-aided)', ...
                'SamplesPerSymbol', testCase.sps, ...
                'NormalizedLoopBandwidth', 0.01, 'DampingFactor', 1.0);
        end
        function rx = makeRxSignal(testCase, n, tauT, clkOffset, snrdB)
            % RRC-shaped QPSK at sps, with a static fractional delay tauT (symbols)
            % and a clock-frequency offset (accumulating delay), optional noise.
            sym = testCase.qpskSymbols(n);
            os = 16; sps = testCase.sps;
            w = testCase.pulseShape(sym, os);          % os samples/symbol
            % resample to sps with a (time-varying) timing offset
            L = floor(numel(w)/os) - testCase.span;
            idx = (0:L*sps-1).';
            t = idx/sps;                               % symbol time
            t = t + tauT + clkOffset*cumsum(ones(size(t)))/sps;   % offset + drift
            si = t*os + os*testCase.span/2 + 1;        % continuous index
            si = min(max(si,1), numel(w)-1);
            rx = interp1((1:numel(w)).', w, si, 'pchip');
            rx = rx(:);
            if snrdB < Inf
                rx = rx + (randn(size(rx))+1j*randn(size(rx)))/sqrt(2)*10^(-snrdB/20)*rms(rx);
            end
        end
        function evm = symbolEVM(~, y)
            y = y(:); y = y(round(0.5*end):end);       % after lock (discard transient)
            if isempty(y), evm = Inf; return; end
            y = y / sqrt(mean(abs(y).^2));             % normalize power
            ref = pskmod(pskdemod(y,4,pi/4,'gray'),4,pi/4,'gray');
            evm = sqrt(mean(abs(y-ref).^2));
        end
        function e = gardnerMeanError(testCase, w, os, offT)
            sps2 = 2;                                  % Gardner runs at 2 sps
            step = os/sps2;
            start = os*testCase.span/2 + 1 + round(offT*os);
            k = start:step:(numel(w)-step);
            s = interp1((1:numel(w)).', w, k, 'pchip'); s = s(:);
            % strobes: even = symbol points, odd = midpoints
            cur = s(3:2:end); prv = s(1:2:end-2); mid = s(2:2:end-1);
            L = min([numel(cur) numel(prv) numel(mid)]);
            e = mean(real(mid(1:L)).*(real(cur(1:L))-real(prv(1:L))) + ...
                     imag(mid(1:L)).*(imag(cur(1:L))-imag(prv(1:L))));
        end
    end
end

function n = numel_syms(); n = 4000; end
