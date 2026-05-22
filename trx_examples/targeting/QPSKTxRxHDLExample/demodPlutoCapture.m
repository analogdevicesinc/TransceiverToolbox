function [ber, nframes, evm, info] = demodPlutoCapture(iq, Fs, msgStr)
%demodPlutoCapture  Offline QPSK receiver for a Pluto capture of the model's
%   "ADI Hello World" loopback signal. Returns BER vs the reference message.
%
%   [ber,nframes,evm] = demodPlutoCapture(iq, Fs)   % default msg "ADI Hello World"
%
%   iq   : complex baseband samples captured at sample rate Fs (Hz).
%   Fs   : capture sample rate (e.g., 3.84e6 or 5e6).
%   ber  : mean per-frame BER over the first 120 message bits.
%
%   Chain: resample->4 sps, RRC matched filter, coarse freq comp (QPSK),
%   Gardner symbol sync, carrier sync (QPSK), preamble matched-filter detect,
%   unique-word phase-ambiguity de-rotation, additive descramble, BER.
%   Validated: 0.000% BER on the model Tx waveform with +20 kHz CFO @ 20 dB SNR.

if nargin < 3, msgStr = 'ADI Hello World'; end
C = commhdlQPSKTxRxParameters; sps = C.SamplesPerSymbol; Rsym = 1.92e6; Fs4 = sps*Rsym;
pre = C.Preamble(:); ps = pskmod(pre(1:2:end)*2 + pre(2:2:end), 4, pi/4, 'gray'); ps = ps(:);
payShape = C.DataBitsPerPacket/2;
sA = dec2bin(double(msgStr), 8); msg = double(reshape(sA.', 1, [])-'0').';

% --- resample to 4 sps at Rsym ---
iq = double(iq(:));
[p,q] = rat(Fs4/Fs, 1e-6);
x = resample(iq, p, q);
x = x / rms(x);

% --- matched filter + coarse freq + symbol sync + carrier sync ---
mf  = conv(x, C.RRCCoef, 'same');
cfc = comm.CoarseFrequencyCompensator('Modulation','QPSK','SampleRate',Fs4,'FrequencyResolution',200);
y   = cfc(mf);
ssy = comm.SymbolSynchronizer('TimingErrorDetector','Gardner (non-data-aided)','SamplesPerSymbol',sps);
y   = ssy(y);
csy = comm.CarrierSynchronizer('Modulation','QPSK','SamplesPerSymbol',1);
y   = csy(y); y = y(:);
y   = y / sqrt(mean(abs(y).^2));

% post-lock EVM (second half)
sl  = pskmod(pskdemod(y,4,pi/4,'gray'),4,pi/4,'gray');
h2  = round(numel(y)/2):numel(y);
evm = sqrt(mean(abs(y(h2)-sl(h2)).^2));

% --- preamble detection ---
cc = conv(y, conj(flipud(ps))); cm = abs(cc).^2;
if max(cm)==0, ber=NaN; nframes=0; info='no signal'; return; end
cm = cm/max(cm);
[~, locs] = findpeaks(cm, 'MinPeakHeight', 0.5, 'MinPeakDistance', 1000);

% --- per-frame: phase-ambiguity resolve, descramble, BER ---
poly = [1 0 0 1 0 0 0]; berv = [];
for L = locs(:).'
    p0 = L;
    if p0-12 < 1 || p0+payShape > numel(y), continue; end
    preRx = y(p0-12:p0);
    Z = sum(preRx .* conj(ps)); rot = conj(Z)/abs(Z);   % de-rotate the QPSK ambiguity
    pay = y(p0+1:p0+payShape) * rot;
    b = pskdemod(pay,4,pi/4,'gray');
    bits = zeros(2*numel(b),1); bits(1:2:end) = floor(b/2); bits(2:2:end) = mod(b,2);
    st = [1 0 1 1 1 0 1]; o = zeros(size(bits));
    for i = 1:numel(bits), bb = mod(nnz(st(poly==1)),2); o(i) = xor(bits(i),bb); st = [st(2:7) bb]; end
    berv(end+1) = mean(o(1:numel(msg)) ~= msg); %#ok<AGROW>
end
nframes = numel(berv);
ber = mean(berv);
info = sprintf('%d frames, EVM=%.3f, BER mean=%.3f%% min=%.3f%% max=%.3f%%', ...
    nframes, evm, 100*ber, 100*min([berv Inf]), 100*max([berv -Inf]));
end
