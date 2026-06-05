%% internal_loopback_per_stage_report  --  per-stage error tracking
%
% Pre-requisite: deploy variant composite_postagc_capture (DIAG) BOOT.BIN
% to root@10.0.0.146 BEFORE running this script. The variant adds a 64-word
% capture buffer at AXI x"11C" wired to the post-AGC complex IQ. The same
% iq_debug_mux selector at x"10C" addresses words 0..63.
%
% This script:
%   1) Forces rx_input_select = 0 (internal Tx -> MUX -> Rx loopback).
%   2) Reads the BIST counters over a 30 s window (ground-truth BER).
%   3) Captures 64 post-AGC complex samples via the AXI mux/word interface.
%   4) Computes per-stage diagnostics: |s| level, DC offset, clipping,
%      EVM vs nearest QPSK constellation, residual carrier phase rate,
%      implied BER from MATLAB hard-decision + descramble.
%   5) Writes test-results/internal_loopback_per_stage.csv and prints a
%      summary table.

cd(fileparts(mfilename('fullpath')));
addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file') == 2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI            = 'ip:10.0.0.146';
SSH            = 8;
AxiPackets     = '0x9D000104';
AxiErrors      = '0x9D000108';
AxiRxSel       = '0x9D000114';
AxiMuxSelect   = '0x9D00010C';
AxiCaptureWord = '0x9D00011C';
BitsPerPacket  = 2240;
NSamples       = 64;

% 0) sanity
[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc == 0, 'Jupiter at 10.0.0.146 not reachable -- is the DIAG BOOT.BIN deployed?');

% 1) Force internal loopback
fprintf('--- Phase 3.1 per-stage tracking report (internal loopback) ---\n');
BistRegisters.write(AxiRxSel, 0, SSH);
pause(5);  % let chain settle

% 2) Ground-truth BER (30 s window)
p0 = double(BistRegisters.read(AxiPackets, SSH));
e0 = double(BistRegisters.read(AxiErrors,  SSH));
fprintf('BIST baseline: packets=%d errors=%d  (30s window)\n', p0, e0);
pause(30);
p1 = double(BistRegisters.read(AxiPackets, SSH));
e1 = double(BistRegisters.read(AxiErrors,  SSH));
dp = p1 - p0; de = e1 - e0;
ber_hw = 100 * de / (dp * BitsPerPacket);
fprintf('BIST 30s delta: packets=%d errors=%d  -> BER = %.4f%%\n', dp, de, ber_hw);

% 3) Capture 64 post-AGC complex samples
fprintf('Capturing %d post-AGC samples...\n', NSamples);
words = zeros(1, NSamples, 'uint32');
for i = 0:NSamples-1
    BistRegisters.write(AxiMuxSelect, i, SSH);
    pause(0.02);
    words(i+1) = uint32(BistRegisters.read(AxiCaptureWord, SSH));
end
% Unpack (sfix16_En14)
Iu = uint16(bitshift(words, -16));
Qu = uint16(bitand(words, uint32(65535)));
Ii = typecast(Iu, 'int16');
Qi = typecast(Qu, 'int16');
I  = double(Ii) / 2^14;
Q  = double(Qi) / 2^14;
sym4 = complex(I, Q);

% 4) Per-stage diagnostics (this build exposes only post-AGC; extend if more taps come online)
C       = commhdlQPSKTxRxParameters;
absMean = mean(abs(sym4));
absStd  = std(abs(sym4));
dcI     = mean(real(sym4));
dcQ     = mean(imag(sym4));
clipping = sum(abs(real(sym4)) > 1.95 | abs(imag(sym4)) > 1.95);

% Matched filter + per-phase EVM
rrc = C.RRCCoef;
mf  = conv(sym4, rrc, 'same');
sps = C.SamplesPerSymbol;
bestPhase = 0; bestEvm = inf;
for ph = 0:sps-1
    cand = mf(ph+1:sps:end);
    if numel(cand) < 4, continue; end
    candN = cand / sqrt(mean(abs(cand).^2));
    refSyms = exp(1j*pi/4) * [1; 1j; -1; -1j];
    dist = abs(candN(:) - refSyms(:).');
    evm  = mean(min(dist, [], 2));
    if evm < bestEvm, bestEvm = evm; bestPhase = ph; end
end
symbols = mf(bestPhase+1:sps:end);

% Residual phase rate (unwrap angle, fit a line; only meaningful with >8 symbols)
if numel(symbols) >= 8
    sN = symbols / sqrt(mean(abs(symbols).^2));
    % Remove QPSK modulation by ^4 trick (assumes a tight constellation)
    phRes = unwrap(angle(sN.^4)) / 4;
    pHat  = polyfit((1:numel(phRes)).', phRes(:), 1);
    phaseRateRadPerSym = pHat(1);
else
    phaseRateRadPerSym = NaN;
end

% Implied BER from hard-decision + descrambler (short capture; aligns to "ADI Hello World" reference window)
symN = symbols / sqrt(mean(abs(symbols).^2));
b    = pskdemod(symN(:), 4, pi/4, 'gray');
bits = zeros(2*numel(b),1);
bits(1:2:end) = floor(b/2);
bits(2:2:end) = mod(b, 2);
bits = logical(bits(:)');

% Descramble
poly = [1 0 0 1 0 0 0]; st = [1 0 1 1 1 0 1];
desc = false(size(bits));
for k = 1:numel(bits)
    bb = mod(nnz(st(poly==1)),2);
    desc(k) = xor(bits(k), bb);
    st = [st(2:7) bb];
end

% Compare to a sliding window of the 120-bit "ADI Hello World" reference
refMsg  = dec2bin('ADI Hello World', 8);
refBits = logical(reshape((refMsg - '0').', 1, []));
n = min(numel(desc), 120);
bestM = -inf; bestShift = 0; bestRot = 0;
% Try all 4 QPSK rotations (carrier-sync not applied here; ambiguity is ±pi/2)
for rotIdx = 0:3
    rotated = symN * exp(-1j*pi/2*rotIdx);
    br = pskdemod(rotated(:), 4, pi/4, 'gray');
    bb = zeros(2*numel(br),1);
    bb(1:2:end) = floor(br/2); bb(2:2:end) = mod(br, 2);
    bb = logical(bb(:)');
    st2 = [1 0 1 1 1 0 1];
    descR = false(size(bb));
    for k = 1:numel(bb)
        x = mod(nnz(st2(poly==1)),2);
        descR(k) = xor(bb(k), x);
        st2 = [st2(2:7) x];
    end
    for shift = 0:(120-n)
        m = sum(descR(1:n) == refBits(shift+1:shift+n));
        if m > bestM, bestM = m; bestShift = shift; bestRot = rotIdx; end
    end
end
matchFrac    = bestM / n;
impliedBERpct = 100 * (1 - matchFrac);

% 5) Report
gainErr_dB = 20*log10(absMean / 0.25);
fprintf('\n=== POST-AGC DIAGNOSTICS (n=%d samples) ===\n', NSamples);
fprintf('  |s| mean         = %.4f   (target ~0.5; |s|^2 ~0.25 = AGCReference)\n', absMean);
fprintf('  |s| std          = %.4f\n', absStd);
fprintf('  DC offset I,Q    = %+.4f, %+.4f\n', dcI, dcQ);
fprintf('  Near-clip samples = %d / %d\n', clipping, NSamples);
fprintf('  AGC gain error    = %+.2f dB (mean |s| vs target 0.25)\n', gainErr_dB);
fprintf('  Best downsample phase = %d\n', bestPhase);
fprintf('  EVM (post-MF, best ph) = %.4f\n', bestEvm);
fprintf('  Residual phase rate    = %.4e rad/sym  (sign of NCO wander)\n', phaseRateRadPerSym);
fprintf('  Hard-dec match vs ref  = %d/%d bits (%.1f%%), rot=%d, shift=%d\n', ...
    bestM, n, 100*matchFrac, bestRot, bestShift);
fprintf('  Implied BER (post-AGC) = %.4f%%   (cf. BIST hw = %.4f%%)\n', impliedBERpct, ber_hw);

% Attribution
fprintf('\n=== ATTRIBUTION ===\n');
if impliedBERpct < 1.0
    fprintf('  MATLAB-decoded BER from post-AGC samples is < 1%%; the chain DOWNSTREAM\n');
    fprintf('  of AGC (Symbol Sync / Carrier Sync / Demod / Descrambler / Frame Sync)\n');
    fprintf('  is degrading the signal from clean-AGC to %.4f%% hardware BER.\n', ber_hw);
elseif impliedBERpct > 2*ber_hw
    fprintf('  MATLAB-decoded BER (%.2f%%) MUCH worse than hardware (%.4f%%) -- the short\n', impliedBERpct, ber_hw);
    fprintf('  capture is dominated by lack of CS/SS/preamble lock in software, not a true\n');
    fprintf('  signal quality issue. AGC level / DC / clipping are the more reliable metrics.\n');
else
    fprintf('  Post-AGC IQ already shows ~%.2f%% implied BER; the AGC output is the\n', impliedBERpct);
    fprintf('  primary source. Check |s| level (%.4f vs 0.5 target), DC offset, clipping.\n', absMean);
end

% CSV
outDir = fullfile(fileparts(mfilename('fullpath')), 'test-results');
if ~exist(outDir, 'dir'), mkdir(outDir); end
csvPath = fullfile(outDir, 'internal_loopback_per_stage.csv');
fid = fopen(csvPath, 'w');
fprintf(fid, 'tap,name,absMean,absStd,dcI,dcQ,clipping,evm,phaseRateRadPerSym,gainErr_dB,bestShift,bestRot,impliedBERpct,hardwareBERpct\n');
fprintf(fid, '0,postAGC,%.6f,%.6f,%.6f,%.6f,%d,%.6f,%.6e,%.4f,%d,%d,%.4f,%.4f\n', ...
    absMean, absStd, dcI, dcQ, clipping, bestEvm, phaseRateRadPerSym, gainErr_dB, bestShift, bestRot, impliedBERpct, ber_hw);
fclose(fid);
fprintf('\nReport written: %s\n', csvPath);

% JSON for downstream use
jsonPath = fullfile(outDir, 'internal_loopback_per_stage.json');
out = struct();
out.tap            = 'postAGC';
out.rxInputSelect  = 0;
out.hardwareBERpct = ber_hw;
out.deltaPackets   = dp;
out.deltaErrors    = de;
out.absMean        = absMean; out.absStd = absStd;
out.dcI = dcI; out.dcQ = dcQ; out.clipping = clipping;
out.bestPhase = bestPhase; out.bestEvm = bestEvm;
out.phaseRateRadPerSym = phaseRateRadPerSym;
out.gainErr_dB = gainErr_dB;
out.impliedBERpct = impliedBERpct;
out.matchBits = bestM; out.totalBits = n; out.matchFrac = matchFrac;
out.bestShift = bestShift; out.bestRot = bestRot;
out.rawWords  = double(words);
out.I = I; out.Q = Q;
fid = fopen(jsonPath, 'w');
fprintf(fid, '%s', jsonencode(out));
fclose(fid);
fprintf('JSON written:   %s\n', jsonPath);
fprintf('\n=== done ===\n');
