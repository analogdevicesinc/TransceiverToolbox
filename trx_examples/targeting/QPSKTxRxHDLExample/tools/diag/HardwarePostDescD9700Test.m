classdef HardwarePostDescD9700Test < matlab.unittest.TestCase
%HARDWAREPOSTDESCD9700TEST  Read the V24_postdesc_d100 1024-bit buffer
%   via AXI4-Lite. Tap is POST-Descrambler dataOut (same as V16/V23),
%   arm delayed to the 101st dstart pulse (~3 ms past boot, ~packet 100).
%   Bisects when the chain transitions from cold-start-perfect
%   (V16, V18, packet 0) to limit-cycle (V22, V23, packet ~10000).
%
%   Wave 3 hypothesis test:
%     - If V24 yields BIST data ("ADI Hello World" with V15-style ramp),
%       the transition happens between packet 100 and 10000 -> drop
%       the next threshold to 1000, 5000.
%     - If V24 already yields the V23 limit-cycle pattern, the
%       transition is earlier -> next threshold = 10.
%
%   Selector: iq_debug_mux @ 0x9D00010C (5 LSBs, 0..31)
%   Output:   capture_word_out @ 0x9D00011C (32-bit word, 32 = 1024 bits)

    properties (Constant)
        AxiCaptureWord = '0x9D00011C';
        AxiMuxSelect   = '0x9D00010C';
        SshTimeoutSec  = 5;
        SettleSec      = 6;
    end

    methods (TestClassSetup)
        function setupPath(testCase)
            here = fileparts(mfilename('fullpath'));
            addpath(here);
            tbxRoot = fileparts(fileparts(fileparts(here)));
            setupM = fullfile(tbxRoot, 'setup.m');
            if exist(setupM, 'file') == 2, run(setupM); end
        end
    end

    methods (Test, TestTags = {'Hardware'})
        function decodePostDescD9700(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, 'Jupiter at 10.0.0.146 not reachable');

            pause(testCase.SettleSec);

            words = zeros(1,32,'uint32');
            for i = 0:31
                BistRegisters.write(testCase.AxiMuxSelect, i, testCase.SshTimeoutSec);
                pause(0.02);
                words(i+1) = uint32(BistRegisters.read(testCase.AxiCaptureWord, testCase.SshTimeoutSec));
            end

            bits = false(1,1024);
            for i = 0:1023
                w = floor(i/32) + 1;
                b = mod(i,32);
                bits(i+1) = bitand(words(w), bitshift(uint32(1), b)) ~= 0;
            end

            % NOTE: tap is post-Descrambler, so bits ARE the BIST data
            % directly -- no MATLAB descrambling needed.
            refMsg = dec2bin('ADI Hello World', 8);
            refBits = logical(reshape((refMsg - '0').', 1, []));

            captured = bits;
            bestShift = 0; bestMatch = -inf;
            tgt = repmat(refBits, 1, ceil(1024/120));
            tgt = tgt(1:1024);
            for shift = 0:119
                rotated = [captured(shift+1:end) captured(1:shift)];
                m = sum(rotated == tgt);
                if m > bestMatch, bestMatch = m; bestShift = shift; end
            end

            aligned = [captured(bestShift+1:end) captured(1:bestShift)];

            nPackets = floor(1024/120);
            errMatrix = zeros(nPackets, 120, 'uint8');
            for p = 0:nPackets-1
                window = aligned(p*120+1 : (p+1)*120);
                errMatrix(p+1,:) = uint8(window ~= refBits);
            end

            fprintf('\n=== V24 post-Descrambler decode (~packet 100, early steady-state) ===\n');
            fprintf('Best alignment shift: %d bits\n', bestShift);
            fprintf('Total matches: %d / 1024 (%.2f%%)\n', bestMatch, 100*bestMatch/1024);
            fprintf('\nPer-packet errors:\n');
            for p = 0:nPackets-1
                fprintf('  pkt%d: %d / 120  (%.2f%%)\n', p, sum(errMatrix(p+1,:)), ...
                    100*sum(errMatrix(p+1,:))/120);
            end

            % Per-bit-position error count across packets (= V15-style)
            colSums = sum(errMatrix, 1);
            fprintf('\nPer-bit-position error count (across %d packets):\n', nPackets);
            for b = 0:119
                fprintf('  bit %3d (byte %2d:%d): %d\n', b, floor(b/8), mod(b,8), colSums(b+1));
            end

            pkt0 = aligned(1:120);
            bytes = zeros(1,15,'uint8');
            for k = 0:14
                v = uint8(0);
                for bit = 0:7
                    if pkt0(k*8 + bit + 1)
                        v = bitor(v, bitshift(uint8(1), 7-bit));
                    end
                end
                bytes(k+1) = v;
            end
            fprintf('\nRecovered packet 0 ASCII: ''%s''\n', char(bytes));

            outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
            if ~exist(outDir,'dir'), mkdir(outDir); end
            out = struct();
            out.rawWords      = double(words);
            out.bestShift     = bestShift;
            out.bestMatch     = bestMatch;
            out.errMatrix     = double(errMatrix);
            out.colSums       = double(colSums);
            out.perPacketErrs = double(sum(errMatrix, 2)');
            out.recoveredASCII = char(bytes);
            fid = fopen(fullfile(outDir,'postDescD9700.json'),'w');
            fprintf(fid, '%s', jsonencode(out));
            fclose(fid);

            testCase.verifyGreaterThan(bestMatch, 0, 'No bits matched -- buffer never armed?');
        end
    end
end
