classdef QPSKRxChainTest < matlab.unittest.TestCase
    %QPSKRxChainTest  Full QPSK Rx-chain integration test under hardware-like
    %   impairments, to narrow down the cause of the on-hardware 90-deg / 50%-BER.
    %
    %   Generates the model's "ADI Hello World" Tx waveform, applies one
    %   impairment at a time (CFO, static phase, I/Q gain/phase imbalance, DC
    %   offset, phase noise, AWGN), runs the validated offline receiver
    %   (demodPlutoCapture), and reports BER. The block-level suites already
    %   showed each block is individually correct; this finds which *channel*
    %   impairment breaks the end-to-end decode (i.e., what to look for on HW).
    %
    %   Run:  runtests('QPSKRxChainTest')

    properties
        Fs = 15.36e6;     % 8 sps at Rsym=1.92 MHz
        tx;               % clean model Tx waveform ("ADI Hello World")
    end

    properties (TestParameter)
        cfoHz       = struct('z0',0,'k10',1e4,'k50',5e4,'k100',1e5,'k200',2e5);
        staticDeg   = struct('a0',0,'a45',45,'a90',90,'a135',135,'a180',180,'a270',270);
    end

    methods (TestClassSetup)
        function build(testCase)
            o=rng; testCase.addTeardown(@() rng(o)); rng(101,'twister');
            testCase.tx = QPSKRxChainTest.genTxWaveform(14);
        end
    end

    methods (Test)
        % ---- 1. Clean: must decode 0% ----
        function testCleanDecode(testCase)
            x = testCase.tx + (randn(size(testCase.tx))+1j*randn(size(testCase.tx)))/sqrt(2)*10^(-25/20);
            ber = demodPlutoCapture(x, testCase.Fs);
            testCase.verifyLessThan(ber, 0.01, sprintf('clean BER=%.3f%%', 100*ber));
        end

        % ---- 2. CFO sweep: coarse-freq + carrier sync should handle <=~240 kHz ----
        function testCFO(testCase, cfoHz)
            x = testCase.impair(testCase.tx, 'cfo', cfoHz, 'snr', 20);
            ber = demodPlutoCapture(x, testCase.Fs);
            fprintf('   CFO %6.0f Hz -> BER %.3f%%\n', cfoHz, 100*ber);
            % within the +-240 kHz design range the link must stay under 1%
            testCase.verifyLessThan(ber, 0.01, sprintf('CFO %.0f Hz: BER %.3f%%', cfoHz, 100*ber));
        end

        % ---- 3. Static phase: the preamble corrector must resolve ANY rotation ----
        function testStaticPhase(testCase, staticDeg)
            x = testCase.impair(testCase.tx, 'cpo', deg2rad(staticDeg), 'snr', 20);
            ber = demodPlutoCapture(x, testCase.Fs);
            testCase.verifyLessThan(ber, 0.01, ...
                sprintf('static %d deg not resolved: BER %.3f%% (would be the 90-deg symptom)', staticDeg, 100*ber));
        end

        % ---- 4. I/Q imbalance (HW front-end): find the breaking point ----
        function testIQImbalance(testCase)
            fprintf('\n[I/Q imbalance sweep]\n');
            cases = {[0 0],[0.5 2],[1.0 5],[2.0 10]};   % [gain dB, phase deg]
            bers = zeros(1,numel(cases));
            for i=1:numel(cases)
                x = testCase.impair(testCase.tx, 'iq', cases{i}, 'snr', 25);
                bers(i) = demodPlutoCapture(x, testCase.Fs);
                fprintf('   gain %.1f dB / phase %2.0f deg -> BER %.3f%%\n', cases{i}(1), cases{i}(2), 100*bers(i));
            end
            % a small, realistic I/Q imbalance must not break decode
            testCase.verifyLessThan(bers(2), 0.05, 'modest I/Q imbalance (0.5dB/2deg) breaks decode');
        end

        % ---- 5. DC offset (HW LO leakage): find the breaking point ----
        function testDCOffset(testCase)
            fprintf('\n[DC-offset sweep]\n');
            fracs = [0 0.05 0.1 0.2 0.4];
            bers = zeros(1,numel(fracs));
            for i=1:numel(fracs)
                x = testCase.impair(testCase.tx, 'dc', fracs(i), 'snr', 25);
                bers(i) = demodPlutoCapture(x, testCase.Fs);
                fprintf('   DC %.2f x rms -> BER %.3f%%\n', fracs(i), 100*bers(i));
            end
            testCase.verifyLessThan(bers(2), 0.05, 'small DC offset (0.05) breaks decode');
        end

        % ---- 6. SNR threshold ----
        function testSNRThreshold(testCase)
            fprintf('\n[SNR sweep]\n');
            for snr = [15 10 6 3]
                ber = demodPlutoCapture(testCase.impair(testCase.tx,'snr',snr), testCase.Fs);
                fprintf('   %2d dB -> BER %.3f%%\n', snr, 100*ber);
            end
            testCase.verifyLessThan(demodPlutoCapture(testCase.impair(testCase.tx,'snr',10),testCase.Fs), 0.01, ...
                'BER > 1% at 10 dB SNR');
        end
    end

    methods
        function y = impair(testCase, x, varargin)
            % apply impairments by name: 'cfo',Hz 'cpo',rad 'iq',[gaindB phasedeg] 'dc',frac 'snr',dB
            p = struct('cfo',0,'cpo',0,'iq',[0 0],'dc',0,'snr',Inf);
            for k=1:2:numel(varargin), p.(varargin{k}) = varargin{k+1}; end
            y = x(:); n = numel(y); kk = (0:n-1).';
            if p.cpo, y = y*exp(1j*p.cpo); end
            if any(p.iq)                                  % I/Q gain/phase imbalance
                g = 10^(p.iq(1)/20); ph = deg2rad(p.iq(2));
                y = real(y) + 1j*(g*imag(y)*cos(ph) + g*real(y)*sin(ph));
            end
            if p.cfo, y = y.*exp(1j*2*pi*p.cfo/testCase.Fs*kk); end
            if p.dc,  y = y + p.dc*rms(y)*(1+1j); end
            if p.snr < Inf, y = y + (randn(n,1)+1j*randn(n,1))/sqrt(2)*rms(y)*10^(-p.snr/20); end
        end
    end

    methods (Static)
        function tx = genTxWaveform(nframes)
            C = commhdlQPSKTxRxParameters; sps = C.SamplesPerSymbol; DBPP = C.DataBitsPerPacket;
            sA = dec2bin(double('ADI Hello World'),8); msg = double(reshape(sA.',1,[])-'0').';
            pay0 = [msg; zeros(DBPP-numel(msg),1)]; pre = C.Preamble(:); poly = [1 0 0 1 0 0 0];
            syms = [];
            for f = 1:nframes
                st = [1 0 1 1 1 0 1]; sc = zeros(size(pay0));
                for i = 1:numel(pay0), bb = mod(nnz(st(poly==1)),2); sc(i) = xor(pay0(i),bb); st = [st(2:7) bb]; end
                fb = [pre; sc]; s = pskmod(fb(1:2:end)*2 + fb(2:2:end), 4, pi/4, 'gray');
                syms = [syms; s(:)]; %#ok<AGROW>
            end
            w4 = zeros(numel(syms)*sps,1); w4(1:sps:end) = syms; w4 = filter(C.RRCCoef,1,w4);
            tx = resample(w4, 2, 1);     % 8 sps @ 15.36 MHz, matches the deployed transmit
            tx = tx / rms(tx);
        end
    end
end
