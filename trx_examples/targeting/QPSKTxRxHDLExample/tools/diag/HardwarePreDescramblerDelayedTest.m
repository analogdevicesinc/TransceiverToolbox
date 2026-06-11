classdef HardwarePreDescramblerDelayedTest < matlab.unittest.TestCase
%HARDWAREPREDESCRAMBLERDELAYEDTEST  Read 1024 pre-Descrambler bits
%   captured by V22_predesc_delayed BOOT.BIN, run the LFSR descrambler in
%   MATLAB, and compute BER against the ADI Hello World reference.
%
%   V22 vs V18: arm trigger is the 10000th dstart pulse (~330 ms past
%   boot at 30 kpkt/s), so this captures a STEADY-STATE packet, not the
%   cold-start packet that V18 sees. Host-side decode is identical.
%
%   Wave 2 hypothesis test:
%     - If MATLAB-descrambled BER << 7.3%, pre-Descrambler bits are clean
%       in steady state too -> errors enter at the Descrambler (Branch F).
%     - If MATLAB-descrambled BER ~= 7.3%, errors are ALREADY present
%       BEFORE the Descrambler in steady state -> defect is upstream
%       (Branch G; V17b's constellation then localizes further).
%
%   Selector: iq_debug_mux @ 0x9D00010C (5 LSBs, 0..31)
%   Output:   capture_word_out @ 0x9D00011C (32-bit word, 32 words = 1024 bits)

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
        function decodePreDescramblerDelayed(testCase)
            [rc,~] = BistRegisters.sshExec('true', testCase.SshTimeoutSec);
            testCase.assumeEqual(rc, 0, 'Jupiter at 10.0.0.146 not reachable');

            pause(testCase.SettleSec);

            % Read 32 x 32-bit capture words
            words = zeros(1,32,'uint32');
            for i = 0:31
                BistRegisters.write(testCase.AxiMuxSelect, i, testCase.SshTimeoutSec);
                pause(0.02);
                words(i+1) = uint32(BistRegisters.read(testCase.AxiCaptureWord, testCase.SshTimeoutSec));
            end

            % Unpack to 1024 bits (LSB-first per word, matching V22 BitCapture)
            bits = false(1,1024);
            for i = 0:1023
                w = floor(i/32) + 1;
                b = mod(i,32);
                bits(i+1) = bitand(words(w), bitshift(uint32(1), b)) ~= 0;
            end

            % MATLAB self-synchronizing descrambler -- poly + initial state
            % matching the Tx Scrambler reference (QPSKRxChainTest.m)
            poly = [1 0 0 1 0 0 0];
            st   = [1 0 1 1 1 0 1];
            descrambled = false(size(bits));
            for i = 1:numel(bits)
                bb = mod(nnz(st(poly==1)),2);
                descrambled(i) = xor(bits(i), bb);
                st = [st(2:7) bb];
            end

            % Reference: 120-bit ADI Hello World (MSB-first per byte)
            refMsg = dec2bin('ADI Hello World', 8);
            refBits = logical(reshape((refMsg - '0').', 1, []));

            captured = descrambled;
            bestShift = 0; bestPkt0Match = -inf;
            for shift = 0:119
                rotated = [captured(shift+1:end) captured(1:shift)];
                m = sum(rotated(1:120) == refBits);
                if m > bestPkt0Match
                    bestPkt0Match = m;
                    bestShift = shift;
                end
            end

            aligned = [captured(bestShift+1:end) captured(1:bestShift)];

            nPackets = floor(1024/120);
            perPacketErrs = zeros(1,nPackets);
            for p = 0:nPackets-1
                window = aligned(p*120+1 : (p+1)*120);
                perPacketErrs(p+1) = sum(window ~= refBits);
            end

            tgt = repmat(refBits, 1, ceil(1024/120));
            tgt = tgt(1:1024);
            totalMatches = sum(aligned == tgt);
            totalBits    = 1024;
            ber          = (totalBits - totalMatches) / totalBits;

            fprintf('\n=== V22 pre-Descrambler DELAYED decode (steady state, ~packet 10000) ===\n');
            fprintf('Best alignment shift: %d bits\n', bestShift);
            fprintf('Packet 0 match: %d / 120\n', bestPkt0Match);
            fprintf('Per-packet errors:\n');
            for p = 0:nPackets-1
                fprintf('  pkt%d: %d / 120  (%.2f%%)\n', p, perPacketErrs(p+1), ...
                    100*perPacketErrs(p+1)/120);
            end
            fprintf('Overall stream BER: %.4f%% (across 1024 bits)\n', 100*ber);

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
            fprintf('Recovered packet 0 ASCII: ''%s''\n', char(bytes));

            outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
            if ~exist(outDir,'dir'), mkdir(outDir); end
            out = struct();
            out.rawWords      = double(words);
            out.bestShift     = bestShift;
            out.pkt0Match     = bestPkt0Match;
            out.perPacketErrs = perPacketErrs;
            out.streamBER     = ber;
            out.recoveredASCII = char(bytes);
            fid = fopen(fullfile(outDir,'preDescDelayed.json'),'w');
            fprintf(fid, '%s', jsonencode(out));
            fclose(fid);

            testCase.verifyGreaterThan(bestPkt0Match, 0, 'No bits matched');
        end
    end
end
