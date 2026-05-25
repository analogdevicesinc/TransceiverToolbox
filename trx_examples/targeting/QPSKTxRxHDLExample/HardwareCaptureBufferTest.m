classdef HardwareCaptureBufferTest < matlab.unittest.TestCase
%HARDWARECAPTUREBUFFERTEST  Read the V16_capture_buf 1024-bit ring buffer
%   via AXI4-Lite, reconstruct the captured Rx bit stream, and diff against
%   the expected ADI Hello World packet stream to localize errors.
%
%   Selector: iq_debug_mux @ x"10C" (5 LSBs, 0..31)
%   Output:   capture_word_out @ x"11C" (32-bit word)
%
%   Buffer captures 1024 bits starting from first dstart after boot, then
%   freezes. A board reboot is required to re-arm capture.
%
%   Prerequisite: V16_capture_buf BOOT.BIN deployed to root@10.0.0.146.
%
%   Run: runtests('HardwareCaptureBufferTest')

    properties (Constant)
        AxiCaptureWord = '0x9D00011C';
        AxiMuxSelect   = '0x9D00010C';
        AxiPackets     = '0x9D000104';
        SshTimeoutSec  = 5;
        SettleSec      = 6;
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
        function decodeCaptureBuffer(testCase)
            % Skip cleanly if board not reachable
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, ...
                'Jupiter at 10.0.0.146 not reachable -- skipping V16 capture-buffer test');

            % Let the buffer fill (first dstart after boot starts capture;
            % capture freezes after 1024 bits). SettleSec >>> 1024/(3.84e6/2) us.
            pause(testCase.SettleSec);

            % Read all 32 words via libiio devmem
            words = zeros(1,32,'uint32');
            for i = 0:31
                BistRegisters.write(testCase.AxiMuxSelect, i, testCase.SshTimeoutSec);
                pause(0.02);
                w = BistRegisters.read(testCase.AxiCaptureWord, testCase.SshTimeoutSec);
                words(i+1) = uint32(w);
            end

            % Reconstruct bit stream (LSB-first per word, matching the
            % bitor(buf, bitshift(1, bitInWord)) write order in V16)
            bits = false(1,1024);
            for i = 0:1023
                w = floor(i/32) + 1;
                b = mod(i,32);
                bits(i+1) = bitand(words(w), bitshift(uint32(1), b)) ~= 0;
            end

            % Build expected reference: 120-bit ADI Hello World repeated.
            refMsg = dec2bin('ADI Hello World', 8);
            refBits = logical(reshape((refMsg - '0').', 1, []));   % 120 bits
            assert(numel(refBits)==120, 'reference must be 120 bits');

            % Align: brute-force search the best start offset within the
            % first 120 bits of the capture by trying each cyclic shift
            % and counting matches against ~8 repetitions of refBits.
            captured = bits;
            bestShift = 0; bestMatch = -inf;
            % We have 1024 bits captured. Each packet boundary creates
            % a 120-bit alignment. After dstart, the receiver delivers
            % the 120 BIST bits then idle/inter-frame data until the next
            % start. Conservatively, we assume the first 120 bits ARE
            % the start of the first packet's window.
            shifts = 0:119;
            tgt = repmat(refBits, 1, ceil(1024/120));
            tgt = tgt(1:1024);
            for shift = shifts
                rotated = [captured(shift+1:end) captured(1:shift)];
                m = sum(rotated == tgt);
                if m > bestMatch
                    bestMatch = m;
                    bestShift = shift;
                end
            end

            aligned = [captured(bestShift+1:end) captured(1:bestShift)];

            % Per-position error: across the 8 packets in the capture,
            % count how many times each bit-position-within-packet
            % differs from the reference.
            nPackets = floor(1024/120);  % = 8
            errMatrix = zeros(nPackets, 120, 'uint8');
            for p = 0:nPackets-1
                window = aligned(p*120+1 : (p+1)*120);
                errMatrix(p+1,:) = uint8(window ~= refBits);
            end

            % Reporting
            fprintf('\n=== V16 capture-buffer decode ===\n');
            fprintf('Best alignment shift: %d bits\n', bestShift);
            fprintf('Total matches: %d / 1024 (%.2f%%)\n', bestMatch, 100*bestMatch/1024);
            fprintf('\nPer-bit-position error count (across %d packets):\n', nPackets);
            fprintf('bit | byte:bit | errors / %d\n', nPackets);
            colSums = sum(errMatrix, 1);
            for b = 0:119
                fprintf('%3d | %2d:%d     | %d\n', b, floor(b/8), mod(b,8), colSums(b+1));
            end
            fprintf('\nPer-packet error count:\n');
            for p = 0:nPackets-1
                fprintf('  pkt%d: %d / 120\n', p, sum(errMatrix(p+1,:)));
            end

            % Show the actual captured bytes (LSB-first within byte)
            fprintf('\nCaptured packet 0 as ASCII:\n');
            pkt0 = aligned(1:120);
            bytes = zeros(1,15,'uint8');
            for k = 0:14
                v = uint8(0);
                for bit = 0:7
                    if pkt0(k*8 + bit + 1)
                        v = bitor(v, bitshift(uint8(1), 7-bit));  % MSB-first inside byte (matches dec2bin default)
                    end
                end
                bytes(k+1) = v;
            end
            fprintf('  %s\n', char(bytes));

            % Persist output for offline analysis
            outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
            if ~exist(outDir,'dir'), mkdir(outDir); end
            out = struct();
            out.rawWords     = double(words);
            out.bestShift    = bestShift;
            out.bestMatch    = bestMatch;
            out.errMatrix    = double(errMatrix);
            out.colSums      = double(colSums);
            out.capturedASCII = char(bytes);
            out.perPacketErrors = double(sum(errMatrix, 2)');
            fid = fopen(fullfile(outDir,'captureBuffer.json'),'w');
            fprintf(fid, '%s', jsonencode(out));
            fclose(fid);

            testCase.verifyGreaterThan(bestMatch, 0, 'No bits matched — buffer never armed?');
        end
    end
end
