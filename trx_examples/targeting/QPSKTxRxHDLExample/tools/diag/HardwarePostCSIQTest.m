classdef HardwarePostCSIQTest < matlab.unittest.TestCase
%HARDWAREPOSTCSIQTEST  Read 64 complex post-Carrier-Sync symbols captured
%   by V17_postcs_iq BOOT.BIN, plot the constellation, run the MATLAB QPSK
%   demod + Descrambler, and compute BER against ADI Hello World.
%
%   Wave 1 hypothesis test: if MATLAB-decoded BER < 1%, errors enter
%   DOWNSTREAM of the CS tap (Phase Ambiguity, QPSK Demod, or Descrambler
%   -- Wave 1 Branch B). If constellation is smeared / high BER, error
%   enters UPSTREAM of the CS tap (Wave 1 Branch C).
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
        function decodePostCS(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, 'Jupiter at 10.0.0.146 not reachable');

            pause(testCase.SettleSec);

            % Read NSamples packed-IQ words
            words = zeros(1, testCase.NSamples, 'uint32');
            for i = 0:testCase.NSamples-1
                BistRegisters.write(testCase.AxiMuxSelect, i, testCase.SshTimeoutSec);
                pause(0.02);
                words(i+1) = uint32(BistRegisters.read(testCase.AxiCaptureWord, testCase.SshTimeoutSec));
            end

            % Unpack: high 16 bits = I (sfix16_En14 stored as uint16),
            % low 16 bits = Q
            Iu = uint16(bitshift(words, -16));
            Qu = uint16(bitand(words, uint32(65535)));
            % Reinterpret uint16 -> int16 (two's complement)
            Ii = typecast(Iu, 'int16');
            Qi = typecast(Qu, 'int16');
            % Apply sfix16_En14 scale
            I  = double(Ii) / 2^14;
            Q  = double(Qi) / 2^14;
            sym = complex(I, Q);

            % Print first few symbols for sanity
            fprintf('\n=== V17 post-CS samples (first 8) ===\n');
            for k=1:min(8, numel(sym))
                fprintf('  sym[%2d]: %+.4f %+.4fj   |sym|=%.4f angle=%+.3f rad\n', ...
                    k-1, real(sym(k)), imag(sym(k)), abs(sym(k)), angle(sym(k)));
            end

            % QPSK hard decision (Gray, pi/4 reference): bit pair per symbol.
            % Match the Tx convention: QPSKMod = pskmod(sdataI*2+sdataQ,4,pi/4,'gray')
            % so b in [0..3], with bI = floor(b/2), bQ = mod(b,2).
            % Inverse: b = pskdemod(sym, 4, pi/4, 'gray');
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

            % Reference 120-bit ADI Hello World
            refMsg = dec2bin('ADI Hello World', 8);
            refBits = logical(reshape((refMsg - '0').', 1, []));

            % Align: search shift over 0..119, find best match for first 120 bits
            bestShift = 0; bestMatch = -inf;
            for shift = 0:min(119, numel(descrambled)-120)
                m = sum(descrambled(shift+1:shift+120) == refBits);
                if m > bestMatch
                    bestMatch = m;
                    bestShift = shift;
                end
            end
            aligned = descrambled(bestShift+1:end);

            % Per-packet errors (1 packet = 120 bits, we have 128 bits from 64 symbols)
            nFullPackets = floor(numel(aligned)/120);
            perPacketErrs = zeros(1, nFullPackets);
            for p = 0:nFullPackets-1
                window = aligned(p*120+1 : (p+1)*120);
                perPacketErrs(p+1) = sum(window ~= refBits);
            end
            ber = sum(perPacketErrs) / (nFullPackets*120);

            fprintf('\n=== V17 post-CS MATLAB-decoded ===\n');
            fprintf('Best shift: %d   first-packet match: %d/120\n', bestShift, bestMatch);
            for p = 0:nFullPackets-1
                fprintf('  pkt%d: %d / 120  (%.2f%%)\n', p, perPacketErrs(p+1), ...
                    100*perPacketErrs(p+1)/120);
            end
            fprintf('Aggregate BER (%d packets): %.4f%%\n', nFullPackets, 100*ber);

            % Constellation statistics
            absMean = mean(abs(sym(5:end))); % skip pre-roll
            absStd  = std(abs(sym(5:end)));
            angSpread = std(mod(angle(sym(5:end)) - pi/4, pi/2));
            fprintf('Constellation: |s| mean=%.4f std=%.4f   angle-mod90 std=%.3f rad\n', ...
                absMean, absStd, angSpread);

            outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
            if ~exist(outDir,'dir'), mkdir(outDir); end
            out = struct();
            out.rawWords     = double(words);
            out.I            = I;
            out.Q            = Q;
            out.bestShift    = bestShift;
            out.perPacketErrs= perPacketErrs;
            out.ber          = ber;
            out.absMean      = absMean;
            out.absStd       = absStd;
            out.angSpread    = angSpread;
            fid = fopen(fullfile(outDir,'postCSIQ.json'),'w');
            fprintf(fid, '%s', jsonencode(out));
            fclose(fid);

            testCase.verifyGreaterThan(absMean, 0, 'Captured |s| is zero -- buffer never armed?');
        end
    end
end
