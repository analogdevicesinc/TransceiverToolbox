function [frames, nMarkers] = extractADSBFrames(streamWords)
%EXTRACTADSBFRAMES Recover squitter bits from the DUT frame-stream channel.
%
%   FRAMES = EXTRACTADSBFRAMES(STREAMWORDS) scans the frame-stream channel
%   captured from the target (channel 2 of the receive buffer) for the
%   sync marker the HDL_DUT emits before each detected frame, and returns
%   the frames it finds as an N-by-112 matrix of bits, most significant
%   first.
%
%   [FRAMES,NMARKERS] = EXTRACTADSBFRAMES(...) also returns how many markers
%   were seen. A marker count higher than SIZE(FRAMES,1) means the buffer
%   ended mid-frame; those bits arrive at the head of the next buffer, so
%   the caller may want to carry the tail over.
%
%   The DUT keeps its output valid asserted continuously and zero-fills
%   between frames, so the buffer always fills at the sample rate rather
%   than stalling until enough aircraft happen to be overhead.
%
%   See also ADSBFRAMECONSTANTS, DECODEADSBFRAMES.

c = adsbFrameConstants();

% Compare in uint16 so the marker matches regardless of how the caller's
% capture signed the 16-bit words.
w = uint16(bitand(int32(streamWords(:)).', int32(65535)));

markerIdx = find(w == uint16(c.SyncMarker));
nMarkers = numel(markerIdx);

frames = zeros(0, c.FrameBits);
for k = 1:nMarkers
    first = markerIdx(k) + 1;
    last = first + c.WordsPerFrame - 1;
    if last > numel(w)
        break   % frame is split across the buffer boundary
    end
    words = w(first:last);
    bits = zeros(c.WordsPerFrame, 16);
    for n = 1:c.WordsPerFrame
        bits(n,:) = bitget(words(n), 16:-1:1);
    end
    frames(end+1,:) = reshape(bits.', 1, []); %#ok<AGROW>
end

end
