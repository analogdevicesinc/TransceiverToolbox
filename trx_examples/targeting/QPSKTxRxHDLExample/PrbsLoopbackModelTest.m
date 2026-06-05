classdef PrbsLoopbackModelTest < matlab.unittest.TestCase
    %PrbsLoopbackModelTest  Hardware-independent verification of the ADRV9002
    %   PRBS digital-loopback design: the pure PRBS gen/check helpers, the
    %   stateful PRBSEngine through a modeled bit-exact loopback (lock + zero
    %   errors), fault detection (injected bit error, I/Q swap), and -- when
    %   commhdlPRBSLoopback.slx has been built -- a full Simulink sim.
    %
    %   Run: runtests('PrbsLoopbackModelTest')

    properties (Constant)
        NLOCK = 64;     % must match PRBSEngine N_LOCK
    end

    methods (TestMethodSetup)
        function clearEngineState(~)
            clear PRBSEngine %#ok<CLFUNC> wipe persistent state between tests
        end
    end

    methods (Test)
        % ---------- pure helpers ----------
        function testCleanLinkZeroErrors(tc)
            % Gen -> (bit-exact wire) -> Chk over many words: 0 errors once
            % the descramblers have self-synchronized.
            hG15 = uint16(32767); hG9 = uint16(511);
            hC15 = uint16(0);     hC9 = uint16(0);
            N = 500; warm = 2;
            totI = 0; totQ = 0;
            for k = 1:N
                [wI, hG15] = prbs15_gen16(hG15);
                [wQ, hG9]  = prbs9_gen16(hG9);
                [eI, hC15] = prbs15_chk16(hC15, wI);
                [eQ, hC9]  = prbs9_chk16(hC9, wQ);
                if k > warm
                    totI = totI + double(eI);
                    totQ = totQ + double(eQ);
                end
            end
            tc.verifyEqual(totI, 0, 'I-lane PRBS-15 must descramble to zero errors');
            tc.verifyEqual(totQ, 0, 'Q-lane PRBS-9 must descramble to zero errors');
        end

        function testSingleBitFlipDetected(tc)
            % Flip one received bit -> checker must report nonzero errors.
            hG15 = uint16(32767); hC15 = uint16(0);
            errBudget = 0;
            for k = 1:200
                [wI, hG15] = prbs15_gen16(hG15);
                if k == 100
                    wI = bitxor(wI, uint16(256));   % corrupt one bit in transit
                end
                [eI, hC15] = prbs15_chk16(hC15, wI);
                if k >= 100, errBudget = errBudget + double(eI); end
            end
            tc.verifyGreaterThan(errBudget, 0, ...
                'A single in-transit bit flip must be detected by the checker');
        end

        function testIQSwapDetected(tc)
            % A PRBS-15 stream fed into the PRBS-9 checker (an I/Q swap) must
            % NOT descramble to zero -- distinct polynomials make swap visible.
            hG15 = uint16(32767); hC9 = uint16(0);
            tot = 0;
            for k = 1:500
                [wI, hG15] = prbs15_gen16(hG15);
                [e, hC9]   = prbs9_chk16(hC9, wI);   % wrong lane on purpose
                if k > 2, tot = tot + double(e); end
            end
            tc.verifyGreaterThan(tot, 0, ...
                'I/Q swap (PRBS-15 into PRBS-9 checker) must produce errors');
        end

        % ---------- stateful engine through modeled loopback ----------
        function testEngineLocksZeroError(tc)
            % Drive PRBSEngine with its own Tx fed back after a 1-sample delay
            % (models the bit-exact ADRV9002 SSI loopback). Expect both lanes
            % locked and zero accumulated errors.
            [ls, eI, eQ, cnt] = tc.runLoopback(800, false, -1);
            tc.verifyEqual(ls, uint8(3), 'Both I and Q lanes must lock (lock_status==3)');
            tc.verifyEqual(double(eI), 0, 'I-lane must accumulate zero errors');
            tc.verifyEqual(double(eQ), 0, 'Q-lane must accumulate zero errors');
            tc.verifyGreaterThan(double(cnt), 0, 'sample_count must advance after lock');
        end

        function testEngineInjectErrorCounts(tc)
            % After lock, assert inject_error -> I-lane error count grows while
            % Q stays clean (only the I word is corrupted).
            [ls, eI, eQ, ~] = tc.runLoopback(800, true, 400);
            tc.verifyEqual(ls, uint8(3), 'Lanes must lock before/through injection');
            tc.verifyGreaterThan(double(eI), 0, 'inject_error must raise I-lane errors');
            tc.verifyEqual(double(eQ), 0, 'Q-lane must stay clean under I-only injection');
        end

        % ---------- full Simulink sim (only if the model is built) ----------
        function testModelSimulatesCleanLoopback(tc)
            tc.assumeTrue(exist('commhdlPRBSLoopback.slx', 'file') == 4 || ...
                          exist('commhdlPRBSLoopback', 'file') == 4, ...
                'commhdlPRBSLoopback.slx not built yet; run build_prbs_model first');
            so = sim('commhdlPRBSLoopback', 'StopTime', '3000', ...
                     'SaveOutput', 'on', 'SaveFormat', 'Array');
            y = so.yout;
            % outports order: o_sample_count, o_bit_errors_I, o_bit_errors_Q, o_lock_status
            lock  = y{4}.Values.Data(end);
            errI  = y{2}.Values.Data(end);
            errQ  = y{3}.Values.Data(end);
            tc.verifyEqual(double(lock), 3, 'Model sim must end with both lanes locked');
            tc.verifyEqual(double(errI), 0, 'Model sim I-lane errors must be zero');
            tc.verifyEqual(double(errQ), 0, 'Model sim Q-lane errors must be zero');
        end
    end

    methods
        function [ls, eI, eQ, cnt] = runLoopback(tc, nSamp, doInject, injectAt)
            % Software model of the DUT-in-loopback: adc[k] = tx[k-1].
            clear PRBSEngine %#ok<CLFUNC>
            GEN_EN = uint32(2);
            prevTxI = int16(0); prevTxQ = int16(0);
            ls = uint8(0); eI = uint32(0); eQ = uint32(0); cnt = uint32(0);
            for k = 1:nSamp
                ctrl = GEN_EN;
                if k == 1, ctrl = bitor(ctrl, uint32(1)); end          % reset pulse
                if doInject && k >= injectAt, ctrl = bitor(ctrl, uint32(4)); end
                [txI, txQ, ~, cnt, eI, eQ, ls] = ...
                    PRBSEngine(prevTxI, prevTxQ, true, ctrl);
                prevTxI = txI; prevTxQ = txQ;
            end
        end
    end
end
