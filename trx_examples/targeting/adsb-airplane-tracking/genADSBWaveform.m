function [wf, bits] = genADSBWaveform(msg, varargin)
%GENADSBWAVEFORM Synthesize a Mode S extended squitter as a PPM waveform.
%
%   WF = GENADSBWAVEFORM(MSG) returns a complex int16 baseband waveform
%   carrying the 112-bit extended squitter MSG, sampled at 4 MSPS. MSG is
%   either a 28-character hex string or a 112-element bit vector. The 24-bit
%   parity field is recomputed, so a message may be supplied with its parity
%   field zeroed.
%
%   WF = GENADSBWAVEFORM(MSG,'Amplitude',A) scales the pulses to amplitude A
%   (default 16384, leaving headroom in the int16 range).
%
%   WF = GENADSBWAVEFORM(MSG,'PadSamples',N) appends N zero samples, so a
%   transmit buffer can be padded to a convenient length.
%
%   [WF,BITS] = GENADSBWAVEFORM(...) also returns the transmitted 112 bits
%   (with recomputed parity) for bit-exact comparison against what the
%   receiver recovers.
%
%   ADS-B uses pulse position modulation at 1 Mbps: a 1 bit is a 0.5 us
%   pulse in the first half of its 1 us slot, a 0 bit a pulse in the second
%   half. Each frame opens with a fixed 8 us preamble of four pulses.
%
%   This waveform is loopback stimulus for the hardware test -- it makes the
%   detector verifiable without depending on live air traffic. Do not
%   transmit it over the air.
%
%   Example:
%       wf = genADSBWaveform('8D4840D6202CC371C32CE0576098');

p = inputParser;
p.addParameter('Amplitude', 16384, @(x) isnumeric(x) && isscalar(x) && x > 0);
p.addParameter('PadSamples', 0, @(x) isnumeric(x) && isscalar(x) && x >= 0);
p.parse(varargin{:});
amplitude = p.Results.Amplitude;
padSamples = p.Results.PadSamples;

c = adsbFrameConstants();

% Accept either hex text or a raw bit vector.
if ischar(msg) || isstring(msg)
    hexStr = char(upper(strtrim(msg)));
    if numel(hexStr) ~= c.FrameBits/4
        error('genADSBWaveform:BadLength', ...
            'Hex message must be %d characters, got %d.', c.FrameBits/4, numel(hexStr));
    end
    nib = zeros(numel(hexStr), 4);
    for k = 1:numel(hexStr)
        nib(k,:) = bitget(hex2dec(hexStr(k)), 4:-1:1);
    end
    bits = reshape(nib.', 1, []);
else
    bits = double(msg(:)).';
    if numel(bits) ~= c.FrameBits
        error('genADSBWaveform:BadLength', ...
            'Bit vector must have %d elements, got %d.', c.FrameBits, numel(bits));
    end
end

% Recompute the parity field so the receiver's CRC check passes.
bits(89:112) = adsbCRC(bits(1:88));

% 4 MSPS => 0.25 us per sample, so a 0.5 us pulse is 2 samples and a 1 us
% bit slot is 4 samples.
samplesPerHalfBit = 2;
samplesPerBit = 2*samplesPerHalfBit;

% Preamble pulses begin at 0, 1.0, 3.5 and 4.5 us within an 8 us window.
preamble = zeros(1, 8/0.25);
pulseStarts_us = [0 1.0 3.5 4.5];
for k = 1:numel(pulseStarts_us)
    idx = round(pulseStarts_us(k)/0.25) + (1:samplesPerHalfBit);
    preamble(idx) = 1;
end

% Pulse in the first half for a 1, the second half for a 0.
payload = zeros(1, numel(bits)*samplesPerBit);
for k = 1:numel(bits)
    base = (k-1)*samplesPerBit;
    if bits(k)
        payload(base + (1:samplesPerHalfBit)) = 1;
    else
        payload(base + samplesPerHalfBit + (1:samplesPerHalfBit)) = 1;
    end
end

env = [preamble payload zeros(1, padSamples)];

% Real-valued envelope split evenly across I and Q keeps the magnitude the
% detector computes equal to the pulse amplitude.
iq = amplitude/sqrt(2) * env;
wf = complex(int16(round(iq)), int16(round(iq))).';

end
