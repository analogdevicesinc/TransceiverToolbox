function [word, wordValid, wordLast, drop, state] = qpskByteSerializer(state, bitIn, bitValid, start, ready)
% qpskByteSerializer -- recovered payload bit -> 64-bit word serializer for
% the byte-RX path (the EXACT inverse of qpskByteBitShifter: byte-0-first,
% MSB-first within each byte, so shifter(pack(bytes)) bits fed in here
% reproduce pack(bytes) words and the host unpacks them little-endian).
%
%   state = qpskByteSerializer()                            -- initial state
%   [word, wordValid, wordLast, drop, state] = ...
%       qpskByteSerializer(state, bitIn, bitValid, start, ready)
%
% Collects bitValid-gated payload bits into a 64-bit word. `start` (the Rx
% packet-boundary flag, asserted with the packet's first payload bit) resets
% the bit position AND the word counter -- a start arriving mid-word
% DISCARDS the partial word, so word/packet alignment self-heals at every
% packet boundary. When the 64th bit lands the word completes in the SAME
% step:
%   * ready true  -> wordValid asserted for this one step, with wordLast on
%     the 35th word of the packet (2240 bits = exactly 35 words);
%   * ready false -> the word is flagged via `drop` and DISCARDED -- the
%     serializer NEVER stalls the Receiver (the recovered bit stream cannot
%     be backpressured). The word-position counter still advances, so
%     wordLast keeps marking the word that completes the packet.
%
% This function is the unit-tested single source of truth for the logic
% inside the composite overlay's ByteSerializer MATLAB Function block.

if nargin == 0
    word = struct('acc', uint64(0), 'bitIdx', uint8(0), 'wordCnt', uint8(0));
    return
end

word      = uint64(0);
wordValid = false;
wordLast  = false;
drop      = false;

if start
    % packet boundary: discard any partial word, restart word counting
    state.acc     = uint64(0);
    state.bitIdx  = uint8(0);
    state.wordCnt = uint8(0);
end

if bitValid
    if bitIn
        byteIdx   = bitshift(state.bitIdx, -3);          % floor(bitIdx/8)
        bitInByte = bitand(state.bitIdx, uint8(7));      % mod(bitIdx,8)
        % global 0-based bit position: MSB-first within the byteIdx-th byte
        pos = uint32(8)*uint32(byteIdx) + (uint32(7) - uint32(bitInByte));
        state.acc = bitor(state.acc, bitshift(uint64(1), pos));
    end
    state.bitIdx = state.bitIdx + 1;
    if state.bitIdx >= 64
        % word complete this step
        state.wordCnt = state.wordCnt + 1;
        if ready
            word      = state.acc;
            wordValid = true;
            wordLast  = state.wordCnt >= 35;
        else
            drop = true;
        end
        if state.wordCnt >= 35
            state.wordCnt = uint8(0);
        end
        state.acc    = uint64(0);
        state.bitIdx = uint8(0);
    end
end
end
