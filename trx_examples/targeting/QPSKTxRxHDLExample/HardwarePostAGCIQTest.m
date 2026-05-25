classdef HardwarePostAGCIQTest < matlab.unittest.TestCase
%HARDWAREPOSTAGCIQTEST  Read 64 complex post-AGC samples (SPS=4) captured
%   by V21_postagc_iq BOOT.BIN, run the full host-side receiver (RRC MF +
%   downsample + CFC + CS + Gardner symbol sync + QPSK demod + LFSR
%   descrambler), and compute BER against ADI Hello World.
%
%   Wave 1 hypothesis test: if MATLAB-decoded BER << 7.3%, every FPGA
%   block downstream of AGC is contributing degradation. If MATLAB BER
%   approximates 7.3%, the AGC output itself is corrupted (clipping / DC).
%
%   Selector: iq_debug_mux @ 0x9D00010C (6 LSBs, 0..63)
%   Output:   capture_word_out @ 0x9D00011C (32-bit packed {I,Q})
%
%   Note: 64 samples at SPS=4 = 16 symbols = ~1/4 of a packet. Not enough
%   for full BER measurement, but enough for a constellation/eye check
%   after the matched filter. The test reports the post-MF eye-pattern
%   metrics and any decoded bits.

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
        function decodePostAGC(testCase)
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
            sym4 = complex(I, Q);   % at SPS=4

            fprintf('\n=== V21 post-AGC samples (first 8) ===\n');
            for k=1:min(8, numel(sym4))
                fprintf('  sym4[%2d]: %+.4f %+.4fj   |s|=%.4f\n', ...
                    k-1, real(sym4(k)), imag(sym4(k)), abs(sym4(k)));
            end

            % Diagnostic: AGC level, DC offset, clipping
            absMean = mean(abs(sym4));
            absStd  = std(abs(sym4));
            dcI     = mean(real(sym4));
            dcQ     = mean(imag(sym4));
            clipping = sum(abs(real(sym4)) > 1.95 | abs(imag(sym4)) > 1.95);
            fprintf('AGC level: |s| mean=%.4f std=%.4f\n', absMean, absStd);
            fprintf('DC offset:  I=%.4f  Q=%.4f\n', dcI, dcQ);
            fprintf('Near-clipping samples (>1.95): %d / %d\n', clipping, numel(sym4));

            % Apply matched filter (RRC) + downsample to 1 SPS
            C = commhdlQPSKTxRxParameters;
            rrc = C.RRCCoef;
            mf = conv(sym4, rrc, 'same');
            % Downsample by SPS, trying each phase 0..SPS-1, pick best EVM
            sps = C.SamplesPerSymbol;
            bestPhase = 0; bestEvm = inf;
            for ph = 0:sps-1
                cand = mf(ph+1:sps:end);
                if numel(cand) < 4, continue; end
                % normalize
                candN = cand / sqrt(mean(abs(cand).^2));
                % project onto nearest QPSK symbol
                refSyms = exp(1j*pi/4) * [1; 1j; -1; -1j];
                evm = mean(min(abs(candN - refSyms.'), [], 2));
                if evm < bestEvm
                    bestEvm = evm;
                    bestPhase = ph;
                end
            end
            symbols = mf(bestPhase+1:sps:end);
            fprintf('Best downsample phase: %d  EVM~%.4f\n', bestPhase, bestEvm);
            fprintf('Recovered %d symbols at 1 SPS\n', numel(symbols));

            % Coarse: just demod the recovered symbols (skip CS/Phase Ambig
            % since we may not have a preamble in this short capture)
            symN = symbols / sqrt(mean(abs(symbols).^2));
            b = pskdemod(symN(:), 4, pi/4, 'gray');
            bits = zeros(2*numel(b),1);
            bits(1:2:end) = floor(b/2);
            bits(2:2:end) = mod(b, 2);
            bits = logical(bits(:)');

            % Descramble
            poly = [1 0 0 1 0 0 0]; st = [1 0 1 1 1 0 1];
            descrambled = false(size(bits));
            for i = 1:numel(bits)
                bb = mod(nnz(st(poly==1)),2);
                descrambled(i) = xor(bits(i), bb);
                st = [st(2:7) bb];
            end

            % This is short (~30 bits) so just compare to ANY ADI Hello World substring
            refMsg = dec2bin('ADI Hello World', 8);
            refBits = logical(reshape((refMsg - '0').', 1, []));

            n = min(numel(descrambled), 120);
            % Try aligning the short stream against a sliding window of the
            % 120-bit reference; with only ~30 bits and unknown rotation
            % (no CS applied), we expect a noisy match
            bestM = -inf; bestShift = 0;
            for shift = 0:(120-n)
                m = sum(descrambled(1:n) == refBits(shift+1:shift+n));
                if m > bestM
                    bestM = m; bestShift = shift;
                end
            end
            fprintf('Best %d-bit window match: %d / %d (shift=%d)\n', n, bestM, n, bestShift);

            outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
            if ~exist(outDir,'dir'), mkdir(outDir); end
            out = struct();
            out.rawWords  = double(words);
            out.I = I; out.Q = Q;
            out.absMean = absMean; out.absStd = absStd;
            out.dcI = dcI; out.dcQ = dcQ; out.clipping = clipping;
            out.bestPhase = bestPhase; out.bestEvm = bestEvm;
            out.bestShortMatch = bestM;
            fid = fopen(fullfile(outDir,'postAGCIQ.json'),'w');
            fprintf(fid, '%s', jsonencode(out));
            fclose(fid);

            testCase.verifyGreaterThan(absMean, 0, 'Captured |s| is zero -- buffer never armed?');
            testCase.verifyLessThan(clipping, testCase.NSamples/4, ...
                sprintf('AGC output clipping: %d/%d samples near rail', clipping, testCase.NSamples));
        end
    end
end
