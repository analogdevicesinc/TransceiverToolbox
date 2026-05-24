classdef OfflineFECAnalysisTest < matlab.unittest.TestCase
    %OfflineFECAnalysisTest  Quantifies the BER improvement two simple
    %   FEC schemes -- Repetition(3,1) and Hamming(7,4) -- would deliver
    %   on the deployed BIST channel's measured i.i.d. error rate
    %   (0.391% BER on V4 from HardwareEnduranceTest, 5.1 G bits).
    %
    %   The endurance evidence supports treating the errors as
    %   independent (per-window spread 0.005 pp across 30 windows, ~8.8
    %   errors per 2240-bit packet, evenly distributed), so the
    %   theoretical i.i.d. analysis is a reasonable predictor.
    %
    %   Treated as a regression test: confirms that the standard FEC
    %   decoders we'd consider for an FPGA implementation deliver the
    %   expected BER reductions on a 1e7-bit Monte Carlo at p=0.0039.
    %
    %   Run:  runtests('OfflineFECAnalysisTest')

    properties (Constant)
        ChannelBer = 0.003906;     % measured V4 BIST channel BER
        Nbits      = 1e7;          % Monte Carlo size
    end

    methods (TestClassSetup)
        function seed(testCase)
            o=rng; testCase.addTeardown(@() rng(o)); rng(7,'twister');
        end
    end

    methods (Test)
        function testRepetition3_1(testCase)
            % Repetition (3,1): triple each bit, majority-vote decode.
            % Theoretical post-FEC BER = 3 p^2 - 2 p^3 for the i.i.d. channel.
            pe = testCase.ChannelBer;
            u  = randi([0 1], testCase.Nbits, 1);
            c  = repmat(u.', 3, 1); c = c(:);
            crx = mod(c + (rand(size(c)) < pe), 2);
            crx = reshape(crx, 3, []).';
            uhat = double(sum(crx,2) >= 2);
            berFec = mean(uhat ~= u);
            berExp = 3*pe^2 - 2*pe^3;
            fprintf('Repetition(3,1)  measured=%.6f%%  expected=%.6f%%\n', ...
                100*berFec, 100*berExp);
            testCase.verifyLessThan(berFec, 0.02 * pe, ...
                'Repetition(3,1) should drop BER to < 2% of channel BER');
            testCase.verifyEqual(berFec, berExp, 'RelTol', 0.30, ...
                'measured Repetition BER far from theoretical');
        end

        function testHamming7_4(testCase)
            % Hamming(7,4): syndrome decoder, single-error correction.
            % Theoretical post-FEC BER ~ 21 p^2 / 4 for dominant 2-error term.
            pe = testCase.ChannelBer;
            G = [1 0 0 0 1 1 0; ...
                 0 1 0 0 0 1 1; ...
                 0 0 1 0 1 1 1; ...
                 0 0 0 1 1 0 1];
            H = [1 0 1 1 1 0 0; ...
                 1 1 1 0 0 1 0; ...
                 0 1 1 1 0 0 1];
            synLookup = zeros(8,1);
            for col = 1:7
                s = bi2de(H(:,col).', 'left-msb');
                synLookup(s+1) = col;
            end

            Nblocks = floor(testCase.Nbits / 4);
            u  = randi([0 1], Nblocks*4, 1);
            u4 = reshape(u, 4, Nblocks).';
            c7 = mod(u4 * G, 2);
            r7 = mod(c7 + (rand(size(c7)) < pe), 2);
            s  = mod(r7 * H.', 2);
            sIdx = s * [4; 2; 1] + 1;
            errPos = synLookup(sIdx);
            fix = zeros(size(r7));
            for k = 1:Nblocks
                p = errPos(k);
                if p > 0, fix(k, p) = 1; end
            end
            r7c = mod(r7 + fix, 2);
            uhat = reshape(r7c(:,1:4).', [], 1);
            berFec = mean(uhat ~= u);

            % Hamming(7,4) post-FEC BER on 4 user bits.  Each 2-channel-error
            % block triggers a miscorrect creating 3 errors in the 7-bit
            % block, of which on average 3*4/7 = 12/7 are user bits -> user
            % BER ~ 21 p^2 * (3/7) = 9 p^2. (Higher-order terms add ~10%.)
            berExpLower = 21 * pe^2 / 4;     % leading-order lower bound
            berExpUpper = 12 * pe^2;         % loose upper bound w/ higher orders
            fprintf('Hamming(7,4)     measured=%.6f%%  expected range [%.6f%%, %.6f%%]\n', ...
                100*berFec, 100*berExpLower, 100*berExpUpper);
            testCase.verifyLessThan(berFec, 0.1 * pe, ...
                'Hamming(7,4) should drop BER to < 10% of channel BER');
            testCase.verifyGreaterThanOrEqual(berFec, berExpLower, ...
                'measured Hamming BER below theoretical lower bound (sanity)');
            testCase.verifyLessThanOrEqual(berFec, berExpUpper, ...
                'measured Hamming BER above theoretical upper bound');
        end

        function testReportSummary(testCase)
            % Pure reporting test -- produces the summary table that
            % motivates the FEC variant build decision.
            pe = testCase.ChannelBer;
            fprintf('\n%-25s  %-12s  %-12s  %-8s\n', 'scheme', 'post-FEC BER', 'user rate', 'rate');
            fprintf('%-25s  %-12s  %-12s  %-8s\n', 'uncoded',         '0.391%',   '7.68 Mbps', '1');
            fprintf('%-25s  %-12s  %-12s  %-8s\n', 'Hamming(7,4)',    '0.014%',   '4.39 Mbps', '4/7');
            fprintf('%-25s  %-12s  %-12s  %-8s\n', 'Repetition(3,1)', '0.005%',   '2.56 Mbps', '1/3');
            testCase.verifyTrue(true); % placeholder so it shows up as a test
        end
    end
end
