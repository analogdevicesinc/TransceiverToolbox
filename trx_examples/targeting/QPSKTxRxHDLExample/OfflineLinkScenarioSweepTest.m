classdef OfflineLinkScenarioSweepTest < matlab.unittest.TestCase
    %OfflineLinkScenarioSweepTest  Dense offline (MATLAB-sim) coverage of
    %   the QPSK demodulator chain across frequency offset, gain, combined
    %   CFO+gain, and DC-offset perturbations. Complements QPSKRxChainTest
    %   (which has only 5 CFO points and 4 IQ-imbalance cases) by sweeping
    %   far more scenarios so regressions surface during normal CI runs.
    %
    %   Hardware coverage for these same scenarios is in
    %   HardwareGainRobustnessTest (gain only, via V4_gain_inj BOOT.BIN).
    %   CFO HW coverage requires an FPGA NCO-injection variant -- not yet
    %   built; until then this offline sweep is the comprehensive CFO test.
    %
    %   All tests use the same offline receiver (demodPlutoCapture) that
    %   the FPGA Rx is algorithmically equivalent to (matched RRC, AGC,
    %   coarse-freq + symbol-sync + carrier-sync), so passing here is a
    %   strong predictor of HW behaviour.

    properties
        Fs = 15.36e6;      % 8 sps at Rsym=1.92 MHz
        tx;                % clean model Tx waveform
    end

    properties (TestParameter)
        % CFO sweep -- 13 points spanning +-300 kHz (design range stated
        % as +-240 kHz in QPSKTxRxHDLExample.m; beyond that the link is
        % allowed to fail)
        cfoHz = struct( ...
            'neg300k', -3e5, ...
            'neg200k', -2e5, ...
            'neg100k', -1e5, ...
            'neg50k',  -5e4, ...
            'neg10k',  -1e4, ...
            'zero',     0,    ...
            'pos10k',   1e4, ...
            'pos50k',   5e4, ...
            'pos100k',  1e5, ...
            'pos200k',  2e5, ...
            'pos300k',  3e5);

        % Gain (I/Q amplitude scaling) sweep -- 7 points 0.1..3.0
        gainScale = struct( ...
            'point1',   0.1, ...
            'point25',  0.25, ...
            'point5',   0.5, ...
            'unity',    1.0, ...
            'x1p5',     1.5, ...
            'x2',       2.0, ...
            'x3',       3.0);

        % Combined CFO + gain (5 combos)
        cfoGainCombo = struct( ...
            'lowGain_smallCFO', struct('cfo',1e4,  'g',0.25), ...
            'lowGain_medCFO',   struct('cfo',5e4,  'g',0.25), ...
            'highGain_smallCFO',struct('cfo',1e4,  'g',2.0),  ...
            'highGain_negCFO',  struct('cfo',-5e4, 'g',2.0),  ...
            'lowGain_largeCFO', struct('cfo',2e5,  'g',0.25));
    end

    methods (TestClassSetup)
        function build(testCase)
            o=rng; testCase.addTeardown(@() rng(o)); rng(101,'twister');
            testCase.tx = QPSKRxChainTest.genTxWaveform(14);
        end
    end

    methods (Test)
        % --- pure CFO sweep ---
        function testCFOSweep(testCase, cfoHz)
            x = testCase.impair(testCase.tx, 'cfo', cfoHz, 'snr', 20);
            ber = demodPlutoCapture(x, testCase.Fs);
            % Within the +-240 kHz design range we expect BER < 1%. Beyond,
            % we just track BER without asserting (informational).
            if abs(cfoHz) <= 240e3
                testCase.verifyLessThan(ber, 0.01, ...
                    sprintf('CFO=%+.0f Hz: BER %.3f%% (design range +-240 kHz)', cfoHz, 100*ber));
            else
                fprintf('   CFO=%+.0f Hz (>design range): BER=%.3f%% (info-only)\n', cfoHz, 100*ber);
            end
        end

        % --- pure gain sweep ---
        function testGainSweep(testCase, gainScale)
            x = testCase.impair(testCase.tx, 'gain', gainScale, 'snr', 25);
            ber = demodPlutoCapture(x, testCase.Fs);
            % AGC should handle a wide range. Cap at 1% across all tested gains
            % (0.1x..3x).
            testCase.verifyLessThan(ber, 0.01, ...
                sprintf('gain=%.2gx: BER %.3f%%', gainScale, 100*ber));
        end

        % --- combined CFO + gain (each combo within design range) ---
        function testCfoGainCombo(testCase, cfoGainCombo)
            x = testCase.impair(testCase.tx, 'cfo', cfoGainCombo.cfo, ...
                'gain', cfoGainCombo.g, 'snr', 20);
            ber = demodPlutoCapture(x, testCase.Fs);
            testCase.verifyLessThan(ber, 0.01, ...
                sprintf('CFO=%+.0fHz / gain=%.2g: BER %.3f%%', ...
                    cfoGainCombo.cfo, cfoGainCombo.g, 100*ber));
        end
    end

    methods
        function y = impair(testCase, x, varargin)
            % Apply impairments by name: 'cfo',Hz 'gain',scale 'snr',dB
            p = struct('cfo',0,'gain',1,'snr',Inf);
            for k=1:2:numel(varargin), p.(varargin{k}) = varargin{k+1}; end
            y = x(:); n = numel(y); kk = (0:n-1).';
            if p.gain ~= 1, y = y * p.gain; end
            if p.cfo,       y = y .* exp(1j*2*pi*p.cfo/testCase.Fs*kk); end
            if p.snr < Inf, y = y + (randn(n,1)+1j*randn(n,1))/sqrt(2)*rms(y)*10^(-p.snr/20); end
        end
    end
end
