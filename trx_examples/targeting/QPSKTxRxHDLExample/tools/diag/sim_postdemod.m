%% sim_postdemod -- capture post-Demod bits + verify against forward-scrambled PN
%
% With composite_postdemod deployed: iq_debug_mux=3 routes the QPSK Demodulator's
% 2-bit output through a packer that maps it to (I, Q) ∈ {±0.5, ±0.5}, then
% through the existing debug tap → DMA. We capture, hard-decode IQ to bits, and
% compare to the forward-scrambled PN reference.
%
% Reference: tap 1 (post-SS) gave EVM=0.0102 — clean unit-mag QPSK. The
% Demodulator output is a hard-decision on clean ±π/4 symbols, so it should be
% 100% correct. If post-Demod bits match forward-scrambled PN at <1% BER,
% confirms 7.27% comes from the HDL Data Descrambler (state-sync / CDC).

cd(fileparts(mfilename('fullpath'))); addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file')==2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI          = 'ip:10.0.0.146';
SSH          = 8;
AxiRxSel     = '0x9D000114';
AxiMuxSelect = '0x9D00010C';
AxiPackets   = '0x9D000104';
AxiBitErrs   = '0x9D000108';

[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc==0, 'board unreachable');

% Internal-loopback, mux=3 selects PostDemod_IQ_Pack output.
BistRegisters.write(AxiRxSel, 0, SSH);
BistRegisters.write(AxiMuxSelect, 3, SSH);
pause(2);

% Snapshot BIST
p0 = double(BistRegisters.read(AxiPackets, SSH));
e0 = double(BistRegisters.read(AxiBitErrs, SSH));

fprintf('Capturing post-Demod bits via DMA...\n');
NREQ = 2^18;
rx = adi.ADRV9002.Rx('uri', URI);
rx.SamplesPerFrame = NREQ;
rx.EnabledChannels = 1;
tStart = tic;
data = rx();
dt = toc(tStart);
release(rx);
fprintf('  captured %d samples in %.2fs\n', numel(data), dt);

p1 = double(BistRegisters.read(AxiPackets, SSH));
e1 = double(BistRegisters.read(AxiBitErrs, SSH));
dp = p1 - p0; de = e1 - e0;
hwBer = 100*de/(max(1,dp)*120);
fprintf('  HW BIST during capture: %d packets, %d errs, BER=%.4f%%\n', dp, de, hwBer);

iq = double(data) / 2^14;   % data is int16 sfix16_En14
fprintf('  |s| mean=%.4f std=%.4f, %d non-zero\n', mean(abs(iq)), std(abs(iq)), sum(abs(iq)>0.05));

% Save
outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
if ~exist(outDir,'dir'), mkdir(outDir); end
save(fullfile(outDir,'dma_postdemod.mat'), 'iq','data','dp','de','hwBer');

% --- Decode ---
% Post-Demod tap: I=+0.5 if bit_MSB=1 else -0.5; Q=+0.5 if bit_LSB=1 else -0.5.
% (The packer was wired so MSB→I, LSB→Q.)
% Determine bits by sign:
%   bit_MSB = (I > 0)
%   bit_LSB = (Q > 0)
% Then pack as bit-pair (MSB, LSB) per symbol.

% Find packet rate (symbol rate held over how many fast clocks?)
ndup_d1 = sum(iq(1:end-1) == iq(2:end));
fprintf('  adjacent equal: %d/%d (%.1f%%)\n', ndup_d1, numel(iq)-1, 100*ndup_d1/(numel(iq)-1));
% Try several dedup factors
for dec = [1 2 4 8 16]
    s = iq(1:dec:end);
    nu = sum(s(1:end-1) ~= s(2:end));
    fprintf('  dec=%d: %d/%d unique-trans (%.1f%%)\n', dec, nu, numel(s)-1, 100*nu/(numel(s)-1));
end

% Pick the right downsample rate. For random bits, adjacent-different
% rate at symbol-rate sampling is ~50% (chance). At sub-symbol-rate sampling,
% adjacent-equal rate is much higher (held same symbol). Find the smallest
% dec where adjacent-diff approaches 50%.
dec_factor = 1;
for dec_try = [1 2 4 8 16]
    s = iq(1:dec_try:end);
    nu = sum(s(1:end-1) ~= s(2:end));
    nudiff_rate = nu / (numel(s)-1);
    if nudiff_rate > 0.40
        dec_factor = dec_try;
        break;
    end
end
fprintf('  Using dec=%d (symbol-rate stream)\n', dec_factor);

sym = iq(1:dec_factor:end);
fprintf('  %d post-Demod samples (symbol rate)\n', numel(sym));

% Extract bits from sign
bit_MSB = (real(sym) > 0);
bit_LSB = (imag(sym) > 0);
% Pack into a single bit stream: (MSB_n, LSB_n, MSB_n+1, LSB_n+1, ...)
bits = zeros(2*numel(sym), 1);
bits(1:2:end) = bit_MSB;
bits(2:2:end) = bit_LSB;
bits = logical(bits(:).');
fprintf('  Extracted %d bits from post-Demod IQ\n', numel(bits));

% Forward-scramble the PN reference (poly x^7 + x^3 + 1, multiplicative)
pn = randsrc(2240, 1, [0,1], RandStream('mcg16807','Seed',0));
pnL = logical(pn(:).');
preamb = false(1, 26);
pkt_bits = [preamb pnL];     % 2266 bits per packet
function out = scramble_mult(b, taps)
    n = numel(b); out = false(1, n);
    b = logical(b(:).');
    for i = 1:n
        x = b(i);
        for t = taps, if i > t, x = xor(x, out(i-t)); end, end
        out(i) = x;
    end
end
ref_scrambled = scramble_mult(pkt_bits, [7 3]);
ref120 = ref_scrambled(27:27+120-1);
fprintf('  Ref (scrambled PN first 120): %s\n', sprintf('%d', ref120(1:32)));

% Slide reference through extracted bits, find best match
best = struct('errs', Inf, 'cfg', '', 'ec', []);
for swap_bits = [false true]
    for invert = [false true]
        b2 = bits;
        if swap_bits
            % Swap (MSB, LSB) pairing
            b2 = zeros(size(bits));
            b2(1:2:end) = bit_LSB;
            b2(2:2:end) = bit_MSB;
            b2 = logical(b2(:).');
        end
        if invert, b2 = ~b2; end

        L = 120; N = numel(b2);
        ec = zeros(1, N-L+1);
        for kk = 0:(N-L)
            ec(kk+1) = sum(b2(kk+1:kk+L) ~= ref120);
        end
        ec_min = min(ec);
        if ec_min < best.errs
            best.errs = ec_min;
            best.cfg = sprintf('swap=%d invert=%d', swap_bits, invert);
            best.ec = ec;
        end
    end
end
fprintf('\n=== BEST: %d/120 = %.2f%% BER  [%s] ===\n', best.errs, 100*best.errs/120, best.cfg);
pkts_low = sum(best.ec < 30);
fprintf('  Packets with <30 errors (clean demod hits): %d\n', pkts_low);
pkts_high = sum(best.ec > 60);
fprintf('  Random-looking (>60 errors): %d\n', pkts_high);
% Histogram
h = histcounts(best.ec, [0 5 10 15 20 25 30 40 50 60 70 80]);
fprintf('  Hist:   0-5 5-10 10-15 15-20 20-25 25-30 30-40 40-50 50-60 60-70 70-80\n');
fprintf('          ');
for hh=h, fprintf('%5d ', hh); end; fprintf('\n');

if best.errs == 0
    fprintf('\n*** POST-DEMOD BITS PERFECTLY MATCH SCRAMBLED PN — Demod is CLEAN ***\n');
    fprintf('*** The 7.27%% BER is generated by the HDL Data Descrambler. ***\n');
elseif best.errs / 120 < 0.01
    fprintf('\n*** POST-DEMOD BITS MATCH SCRAMBLED PN at <1%% — Demod is essentially clean ***\n');
    fprintf('*** The 7.27%% BER is generated by the HDL Data Descrambler. ***\n');
elseif best.errs / 120 < 0.10
    fprintf('\n*** POST-DEMOD BITS BER %.2f%% — comparable to HW BIST; ***\n', 100*best.errs/120);
    fprintf('*** Demod IS the source of the ~7%% error. ***\n');
else
    fprintf('\nResult unclear: %.2f%% BER. May be a packet-alignment issue.\n', 100*best.errs/120);
end

% Auto-correlation sanity
sym_lsb = logical(mod(pskdemod(sym/sqrt(mean(abs(sym).^2)),4,pi/4,'gray'),2));
fprintf('\nAutocorrelation at packet-period lags (sanity check):\n');
for lag = [1133 2266]
    if numel(sym_lsb) > lag+100
        x = sym_lsb(1:end-lag); y = sym_lsb(lag+1:end);
        m = sum(x==y);
        fprintf('  lag %4d sym: %d/%d match (%.1f%%)\n', lag, m, numel(x), 100*m/numel(x));
    end
end
