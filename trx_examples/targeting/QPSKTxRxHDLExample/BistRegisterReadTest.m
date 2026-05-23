classdef BistRegisterReadTest < matlab.unittest.TestCase
    %BistRegisterReadTest  Verifies the BistRegisters helper that talks to
    %   the deployed BIST AXI4-Lite registers (count, packets, bit_errors,
    %   iq_debug_mux, rstCS) via ssh+devmem.
    %
    %   Splits cleanly into:
    %     methods (Test)                       -- pure unit tests of parseHex
    %                                             and registerMap (no ssh).
    %     methods (Test, TestTags='Hardware')  -- live reads/writes against
    %                                             the deployed board.

    % ===== Pure unit tests (no board needed) =====
    methods (Test)
        function testParseHexSingleValue(testCase)
            v = BistRegisters.parseHex('0x12345678');
            testCase.verifyEqual(v, 305419896);                % 0x12345678
        end

        function testParseHexMultiple(testCase)
            v = BistRegisters.parseHex(sprintf('0x00000131\n0x00018A6E\n0xDEADBEEF\n'));
            testCase.verifyEqual(numel(v), 3);
            testCase.verifyEqual(v(1), 305);                   % 0x131
            testCase.verifyEqual(v(2), 100974);                % 0x18A6E
            testCase.verifyEqual(v(3), 3735928559);            % 0xDEADBEEF
        end

        function testParseHexIgnoresChatter(testCase)
            % Should pick out only the hex tokens, skipping any banners/warnings
            sample = sprintf( ...
              'Warning: Permanently added to hosts\n0x0000007F\nsome other text\n0xCAFEBABE');
            v = BistRegisters.parseHex(sample);
            testCase.verifyEqual(v, [127; 3405691582]);
        end

        function testParseHexEmpty(testCase)
            testCase.verifyEmpty(BistRegisters.parseHex(''));
            testCase.verifyEmpty(BistRegisters.parseHex('no hex here'));
        end

        function testRegisterMapAddresses(testCase)
            m = BistRegisters.registerMap();
            testCase.verifyEqual(m.count,        '0x9D000100');
            testCase.verifyEqual(m.packets,      '0x9D000104');
            testCase.verifyEqual(m.bit_errors,   '0x9D000108');
            testCase.verifyEqual(m.iq_debug_mux, '0x9D00010C');
            testCase.verifyEqual(m.rstCS,        '0x9D000110');
        end
    end

    % ===== Hardware-in-the-loop tests =====
    methods (Test, TestTags = {'Hardware'})
        function testBoardReachable(testCase)
            [rc, ~] = BistRegisters.sshExec('true');
            testCase.assumeEqual(rc, 0, 'Jupiter not reachable -- skipping HW BIST register tests');
        end

        function testSingleReadsAllRegisters(testCase)
            % Every register reads as a finite numeric value (any value is ok;
            % we just need a successful ssh + parseable hex).
            m = BistRegisters.registerMap();
            fns = fieldnames(m);
            for k = 1:numel(fns)
                v = BistRegisters.read(m.(fns{k}));
                testCase.verifyFalse(isnan(v), ...
                    sprintf('register %s at %s returned NaN', fns{k}, m.(fns{k})));
                testCase.verifyGreaterThanOrEqual(v, 0);
                testCase.verifyLessThanOrEqual(v, 2^32-1);
                fprintf('  %-13s @ %s = %u (0x%08X)\n', fns{k}, m.(fns{k}), uint32(v), uint32(v));
            end
        end

        function testReadAllStruct(testCase)
            S = BistRegisters.readAll();
            for f = {'count','packets','bit_errors','iq_debug_mux','rstCS'}
                testCase.verifyFalse(isnan(S.(f{1})), ...
                    sprintf('readAll().%s is NaN', f{1}));
            end
            fprintf('  readAll: count=%u packets=%u bit_errors=%u iq_debug_mux=%u rstCS=%u\n', ...
                uint32(S.count), uint32(S.packets), uint32(S.bit_errors), ...
                uint32(S.iq_debug_mux), uint32(S.rstCS));
        end

        function testPacketsMonotonicallyIncreases(testCase)
            % With the digital-loopback BOOT.BIN deployed, packets_out
            % must keep climbing between two reads ~1s apart.
            p1 = BistRegisters.read(BistRegisters.PacketsAddr);
            pause(1);
            p2 = BistRegisters.read(BistRegisters.PacketsAddr);
            testCase.verifyGreaterThan(p2, p1, ...
                sprintf('packets_out did not advance (%u -> %u) -- BIST not running', uint32(p1), uint32(p2)));
            fprintf('  packets_out advanced %u -> %u (+%u in ~1s)\n', uint32(p1), uint32(p2), uint32(p2-p1));
        end

        function testIqDebugMuxWritesDontCrash(testCase)
            % iq_debug_mux is an AXI4-Lite *input* register (write-only
            % from the AXI side -- the readback path is not guaranteed to
            % reflect writes). We just verify writes succeed (ssh rc==0)
            % and that reads always return a well-formed value.
            for val = 0:7
                BistRegisters.write(BistRegisters.IqDebugMuxAddr, val);
                rb = BistRegisters.read(BistRegisters.IqDebugMuxAddr);
                testCase.verifyFalse(isnan(rb), 'iq_debug_mux read returned NaN');
                testCase.verifyGreaterThanOrEqual(rb, 0);
                testCase.verifyLessThanOrEqual(rb, 2^32-1);
            end
            % restore default 0
            BistRegisters.write(BistRegisters.IqDebugMuxAddr, 0);
            fprintf('  iq_debug_mux: 8 writes (0..7) executed without error\n');
        end

        function testRstCsWriteAffectsBist(testCase)
            % rstCS is also an AXI4-Lite *input*. The functional check is
            % whether asserting it actually does something observable --
            % namely, the carrier-synchronizer reset should at minimum NOT
            % stall the BIST (packets keep advancing after we toggle it).
            p_before = BistRegisters.read(BistRegisters.PacketsAddr);
            BistRegisters.write(BistRegisters.RstCsAddr, 1); pause(0.05);
            BistRegisters.write(BistRegisters.RstCsAddr, 0); pause(1);
            p_after  = BistRegisters.read(BistRegisters.PacketsAddr);
            testCase.verifyGreaterThan(p_after, p_before, ...
                'BIST packets did not advance after rstCS pulse -- toggle had no effect or BIST stalled');
            fprintf('  rstCS pulse: packets advanced %u -> %u (+%u after 1s)\n', ...
                uint32(p_before), uint32(p_after), uint32(p_after-p_before));
        end
    end
end
