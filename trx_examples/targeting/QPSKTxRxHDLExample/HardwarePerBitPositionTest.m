classdef HardwarePerBitPositionTest < matlab.unittest.TestCase
%HARDWAREPERBITPOSITIONTEST  Sweep the V15_perbit_diag BOOT.BIN's per-bit
%   error counters (120 counters, one per bit-position in the BIST window).
%   Successor to V7's HardwarePerBytePositionTest, which gave 15 bytes worth
%   of resolution; V15 gives 120 -- enough to see which BIT within each
%   byte is flipping the most.
%
%   Selector: iq_debug_mux @ 0x9D00010C (8 LSBs, 0..119)
%   Output:   per_bit_errors_out @ 0x9D00011C  (cumulative since boot)

    properties (Constant)
        AxiPerBit     = '0x9D00011C';
        AxiMuxSelect  = '0x9D00010C';
        AxiBitErrors  = '0x9D000108';
        AxiPackets    = '0x9D000104';
        AxiCount      = '0x9D000100';
        SshTimeoutSec = 5;
        SettleSec     = 8;
        DwellSec      = 1;   % seconds between mux write and counter read
    end

    methods (TestClassSetup)
        function setupPath(testCase)
            here = fileparts(mfilename('fullpath'));
            addpath(here);
            tbxRoot = fileparts(fileparts(fileparts(here)));
            setupM = fullfile(tbxRoot, 'setup.m');
            if exist(setupM, 'file') == 2
                run(setupM);
            end
        end
    end

    methods (Test, TestTags = {'Hardware'})
        function testPerBitHistogram(testCase)
            % Skip if board not reachable
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping V15 per-bit test');

            % V15 detection: pick a middle bit, read the per-bit reg.
            BistRegisters.write(testCase.AxiMuxSelect, 0, testCase.SshTimeoutSec);
            pause(testCase.SettleSec);
            probe = BistRegisters.read(testCase.AxiPerBit, testCase.SshTimeoutSec);
            testCase.assumeGreaterThan(probe, 0, ...
                sprintf(['per-bit counter at %s reads 0; deployed BOOT.BIN ' ...
                         'does not appear to be V15_perbit_diag'], testCase.AxiPerBit));

            % Snapshot global counters at the start
            startErr  = BistRegisters.read(testCase.AxiBitErrors, testCase.SshTimeoutSec);
            startPkts = BistRegisters.read(testCase.AxiPackets,   testCase.SshTimeoutSec);
            startCnt  = BistRegisters.read(testCase.AxiCount,     testCase.SshTimeoutSec);

            % Sweep all 120 bit-positions
            errsPerBit = zeros(120,1);
            for b = 0:119
                BistRegisters.write(testCase.AxiMuxSelect, b, testCase.SshTimeoutSec);
                pause(testCase.DwellSec);
                errsPerBit(b+1) = BistRegisters.read(testCase.AxiPerBit, testCase.SshTimeoutSec);
            end

            endErr  = BistRegisters.read(testCase.AxiBitErrors, testCase.SshTimeoutSec);
            endPkts = BistRegisters.read(testCase.AxiPackets,   testCase.SshTimeoutSec);
            endCnt  = BistRegisters.read(testCase.AxiCount,     testCase.SshTimeoutSec);

            dErr  = endErr  - startErr;
            dPkts = endPkts - startPkts;
            dCnt  = endCnt  - startCnt;
            globalBer = dErr / max(1,dCnt);

            % Per-bit normalised by total packets seen since boot (each
            % packet contributes at most one increment per bit-position)
            perBitRate = errsPerBit / max(1, endPkts);

            chars = 'ADI Hello World';
            fprintf('\n=== Per-bit-position error histogram (V15) ===\n');
            fprintf('Sweep window: dPkts=%d dCnt=%d dErr=%d  global_BER=%.4f%%\n', ...
                dPkts, dCnt, dErr, 100*globalBer);
            fprintf('  bit | byte:bit (chr) | errs       | rate/pkt\n');
            for b = 0:119
                byteI = floor(b/8);
                bitI  = mod(b,8);
                fprintf('  %3d |  %2d:%d (''%c'')  | %-10d | %.4f%%\n', ...
                    b, byteI, bitI, chars(byteI+1), errsPerBit(b+1), 100*perBitRate(b+1));
            end

            % Per-byte aggregation for sanity vs V7
            perByte = zeros(15,1);
            for B = 0:14
                perByte(B+1) = sum(errsPerBit(B*8+1 : B*8+8));
            end
            byteRate = perByte / max(1, endPkts);
            fprintf('\nByte aggregate (compare to V7):\n');
            for B = 0:14
                fprintf('  byte %2d (''%c''): errs=%d  rate=%.4f%%\n', ...
                    B, chars(B+1), perByte(B+1), 100*byteRate(B+1));
            end

            % Within-byte hottest bit
            fprintf('\nWithin-byte hottest bit (bitI is MSB-first within byte):\n');
            for B = 0:14
                seg = errsPerBit(B*8+1 : B*8+8);
                [~,bi] = max(seg);
                fprintf('  byte %2d (''%c''): hottest bitI=%d (errs=%d)\n', ...
                    B, chars(B+1), bi-1, seg(bi));
            end

            % Persist for offline analysis
            outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
            if ~exist(outDir,'dir'), mkdir(outDir); end
            s.errsPerBit = errsPerBit;
            s.perBitRate = perBitRate;
            s.perByte    = perByte;
            s.endPackets = endPkts;
            s.bitsChecked = dCnt;
            s.errorsInWindow = dErr;
            s.globalBER  = globalBer;
            fid = fopen(fullfile(outDir,'perBitHistogram.json'),'w');
            fprintf(fid, '%s', jsonencode(s));
            fclose(fid);

            % Assertions
            testCase.verifyTrue(sum(errsPerBit) > 0, ...
                'no errors at any bit position -- diagnostic block may be disconnected');
            testCase.verifyGreaterThan(std(errsPerBit)/mean(errsPerBit), 0.05, ...
                'errors exactly uniform across bits -- looks like instrumentation bug');
        end
    end
end
