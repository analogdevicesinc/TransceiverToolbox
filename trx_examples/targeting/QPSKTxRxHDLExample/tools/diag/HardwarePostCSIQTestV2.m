classdef HardwarePostCSIQTestV2 < matlab.unittest.TestCase
%HARDWAREPOSTCSIQTESTV2  Read 64 complex post-Carrier-Sync symbols captured
%   by V17b_postcs_iq_v2 BOOT.BIN. V17b arms on the first post-CS valid
%   pulse (V17 arming on post-Descrambler dstart was broken -- pipeline
%   phase mismatch).
%
%   The capture is NOT packet-aligned -- it's the first 64 post-CS valid
%   symbols after reset. For the constellation/EVM question this is fine.
%
%   Wave 2 outcome:
%     - Tight constellation (low angSpread, |s| ~ 1) + low BER over best
%       sliding window: post-CS clean -> defect downstream (Branch G.1).
%     - Smeared / rotated constellation or high BER: defect upstream
%       of CS (Branch G.2).
%
%   Selector: iq_debug_mux @ 0x9D00010C (6 LSBs, 0..63)
%   Output:   capture_word_out @ 0x9D00011C (32-bit word {I[31:16],Q[15:0]})

    properties (Constant)
        AxiCaptureWord = '0x9D00011C';
        AxiMuxSelect   = '0x9D00010C';
        SshTimeoutSec  = 5;
        SettleSec      = 6;
        NSamples       = 64;
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
        function decodePostCSV2(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, 'Jupiter at 10.0.0.146 not reachable');

            pause(testCase.SettleSec);

            words = zeros(1, testCase.NSamples, 'uint32');
            for i = 0:testCase.NSamples-1
                BistRegisters.write(testCase.AxiMuxSelect, i, testCase.SshTimeoutSec);
                pause(0.02);
                words(i+1) = uint32(BistRegisters.read(testCase.AxiCaptureWord, testCase.SshTimeoutSec));
            end

            Iu = uint16(bitshift(words, -16));
            Qu = uint16(bitand(words, uint32(65535)));
            Ii = typecast(Iu, 'int16');
            Qi = typecast(Qu, 'int16');
            I  = double(Ii) / 2^14;
            Q  = double(Qi) / 2^14;
            sym = complex(I, Q);

            fprintf('\n=== V17b post-CS samples (first 8) ===\n');
            for k=1:min(8, numel(sym))
                fprintf('  sym[%2d]: %+.4f %+.4fj   |sym|=%.4f angle=%+.3f rad\n', ...
                    k-1, real(sym(k)), imag(sym(k)), abs(sym(k)), angle(sym(k)));
            end

            % QPSK hard decision (Gray, pi/4 reference)
            b = pskdemod(sym(:), 4, pi/4, 'gray');
            bits = zeros(2*numel(b), 1);
            bits(1:2:end) = floor(b/2);
            bits(2:2:end) = mod(b, 2);
            bits = logical(bits(:)');

            % MATLAB self-synchronizing descrambler
            poly = [1 0 0 1 0 0 0]; st = [1 0 1 1 1 0 1];
            descrambled = false(size(bits));
            for i = 1:numel(bits)
                bb = mod(nnz(st(poly==1)),2);
                descrambled(i) = xor(bits(i), bb);
                st = [st(2:7) bb];
            end

            refMsg = dec2bin('ADI Hello World', 8);
            refBits = logical(reshape((refMsg - '0').', 1, []));

            % Sliding-window search (capture is not packet-aligned)
            bestShift = 0; bestMatch = -inf;
            for shift = 0:min(119, numel(descrambled)-120)
                m = sum(descrambled(shift+1:shift+120) == refBits);
                if m > bestMatch
                    bestMatch = m;
                    bestShift = shift;
                end
            end
            aligned = descrambled(bestShift+1:end);

            nFullPackets = floor(numel(aligned)/120);
            perPacketErrs = zeros(1, nFullPackets);
            for p = 0:nFullPackets-1
                window = aligned(p*120+1 : (p+1)*120);
                perPacketErrs(p+1) = sum(window ~= refBits);
            end
            if nFullPackets > 0
                ber = sum(perPacketErrs) / (nFullPackets*120);
            else
                ber = NaN;
            end

            fprintf('\n=== V17b post-CS MATLAB-decoded ===\n');
            fprintf('Best shift: %d   best-window match: %d/120\n', bestShift, bestMatch);
            for p = 0:nFullPackets-1
                fprintf('  pkt%d: %d / 120  (%.2f%%)\n', p, perPacketErrs(p+1), ...
                    100*perPacketErrs(p+1)/120);
            end
            fprintf('Aggregate BER (%d packets): %.4f%%\n', nFullPackets, 100*ber);

            absMean = mean(abs(sym));
            absStd  = std(abs(sym));
            angSpread = std(mod(angle(sym) - pi/4, pi/2));
            fprintf('Constellation: |s| mean=%.4f std=%.4f   angle-mod90 std=%.3f rad\n', ...
                absMean, absStd, angSpread);

            outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
            if ~exist(outDir,'dir'), mkdir(outDir); end
            out = struct();
            out.rawWords     = double(words);
            out.I            = I;
            out.Q            = Q;
            out.bestShift    = bestShift;
            out.bestWindowMatch = bestMatch;
            out.perPacketErrs= perPacketErrs;
            out.ber          = ber;
            out.absMean      = absMean;
            out.absStd       = absStd;
            out.angSpread    = angSpread;
            fid = fopen(fullfile(outDir,'postCSIQ_v2.json'),'w');
            fprintf(fid, '%s', jsonencode(out));
            fclose(fid);

            testCase.verifyGreaterThan(absMean, 0, 'Captured |s| is zero -- buffer never armed?');
        end
    end
end
