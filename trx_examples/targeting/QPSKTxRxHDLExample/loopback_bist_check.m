function bist = loopback_bist_check(uri, RsymTarget, dwellSec)
%LOOPBACK_BIST_CHECK  Verify the deployed QPSK Receiver over an RF loopback.
%   bist = loopback_bist_check(uri, RsymTarget, dwellSec) transmits the
%   "ADI Hello World" QPSK frames (preamble + payload) the in-FPGA BIST
%   checker expects, then reads the BIST AXI registers and reports the
%   packet-sync count and bit-error count.
%
%   This is the hardware counterpart to the rate bug fixed by UpsamplesRx=2.
%   The QPSK Rx is designed for 4 samples/symbol. The ADRV9002/Jupiter radio
%   runs at 15.36 MHz, so:
%     * design symbol rate Rsym = 1.92 MHz  -> 8 sps on the radio
%       - needs the FIXED Receiver (UpsamplesRx=2, downsamples 8->4 sps) to sync.
%       - the BUGGY Receiver (UpsamplesRx=1) sees 8 sps and FAILS to sync.
%     * Rsym = 3.84 MHz -> 4 sps on the radio
%       - the BUGGY Receiver (UpsamplesRx=1) accidentally syncs (it sees 4 sps).
%   Sweeping RsymTarget over [3.84e6 1.92e6] is a self-validating A/B test.
%
%   Requires the libiio MATLAB support package (deps/). The BIST registers
%   are read over SSH with devmem at the IP base 0x9D000000:
%       0x100 count_out, 0x104 packets_out, 0x108 bit_errors_out.
%
%   Example:
%     loopback_bist_check('ip:10.0.0.146', 1.92e6, 3);   % design rate -> needs the fix
%     loopback_bist_check('ip:10.0.0.146', 3.84e6, 3);   % 2x rate    -> works on buggy build

if nargin < 1, uri = 'ip:10.0.0.146'; end
if nargin < 2, RsymTarget = 1.92e6; end
if nargin < 3, dwellSec = 3; end

host = regexprep(uri,'^ip:','');
C = commhdlQPSKTxRxParameters;

% ---- Build the loopback waveform the BIST expects -----------------------
msg = 'ADI Hello World';                 % exact string hardcoded in the BIST (msgdec)
mb  = dec2bin(double(msg),8).'; mb = mb(:) - '0';     % 120 payload bits, MSB-first per char
Npk = 8; pre = C.Preamble(:);
payload = repmat([mb; zeros(C.DataBitsPerPacket-numel(mb),1)], 1, Npk);
bitsPk  = [repmat(pre,1,Npk); payload];
allbits = bitsPk(:);
si = allbits(1:2:end); sq = allbits(2:2:end);
sym = pskmod(si*2 + sq, 4, pi/4, 'gray');

% RRC pulse shape at the design 4 sps, then resample to the radio sps for RsymTarget
w4 = zeros(numel(sym)*C.SamplesPerSymbol,1);
w4(1:C.SamplesPerSymbol:end) = sym;
w4 = filter(C.RRCCoef, 1, w4);

tx = adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels = 1;
spsRadio = round(tx.SamplingRate / RsymTarget);       % e.g. 15.36e6/1.92e6 = 8
if spsRadio ~= C.SamplesPerSymbol
    w = resample(w4, spsRadio, C.SamplesPerSymbol);
else
    w = w4;
end
fprintf('Radio Fs=%.4g MHz, target Rsym=%.3g MHz => %d sps on radio.\n', ...
        tx.SamplingRate/1e6, RsymTarget/1e6, spsRadio);

% ---- Transmit cyclically over the loopback ------------------------------
tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
tx.CenterFrequencyChannel0 = 2.4e9;
scale = @(x) int16(x ./ max(abs([real(w);imag(w)])) .* 2^14);
tx(complex(scale(real(w)), scale(imag(w))));

% ---- Read BIST registers before/after a dwell ---------------------------
rd = @() readBist(host);
b0 = rd(); pause(dwellSec); b1 = rd();
release(tx);

bist = b1;
fprintf('\nBIST over %d s dwell:\n', dwellSec);
fprintf('  packets_out : %d -> %d  (delta %d)\n', b0.packets, b1.packets, b1.packets-b0.packets);
fprintf('  bit_errors  : %d -> %d  (delta %d)\n', b0.errors,  b1.errors,  b1.errors-b0.errors);
fprintf('  count_out   : %d -> %d\n', b0.count, b1.count);
if (b1.packets - b0.packets) > 0
    fprintf('  => RX SYNCED to the loopback at %.3g MHz symbol rate.\n', RsymTarget/1e6);
else
    fprintf('  => RX did NOT sync (no new packets) at %.3g MHz symbol rate.\n', RsymTarget/1e6);
end
end

function b = readBist(host)
% Read the three BIST counters via SSH + devmem (busybox).
cmd = sprintf(['ssh -o StrictHostKeyChecking=accept-new root@%s ' ...
    '"for o in 100 104 108; do devmem 0x9D0000$o 32; done"'], host);
[st,out] = system(cmd);
v = sscanf(out, '0x%x');
if st~=0 || numel(v) < 3
    error('BIST read failed (st=%d): %s', st, out);
end
b.count = v(1); b.packets = v(2); b.errors = v(3);
end
