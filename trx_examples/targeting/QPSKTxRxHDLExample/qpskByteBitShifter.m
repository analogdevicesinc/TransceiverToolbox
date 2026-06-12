function [bit, pop, state] = qpskByteBitShifter(state, enable, start, word, wordAvail, wordFirst)
% qpskByteBitShifter -- 64-bit word to payload-bit deserializer for the
% byte-TX path. Emits one bit per enabled step, byte-0-first and MSB-first
% within each byte (the BIST reference order: dec2bin(...,8) row-reshape,
% with byte 0 packed in the uint64 LSB byte -- see ByteDmaRegisters.pack).
%
%   state = qpskByteBitShifter()                          -- initial state
%   [bit, pop, state] = qpskByteBitShifter(state, enable, start, word, ...
%                                          wordAvail, wordFirst)
%
% start (the Tx packet-boundary flag) resets the bit index so word/packet
% alignment self-heals every packet (2240 bits = exactly 35 words). pop is
% true on any step that latches OR discards a word -- upstream advances its
% FIFO.
%
% WORD ALIGNMENT (the cyclic DMA's word phase vs the packet boundary is
% arbitrary -- the 35-word payload can arrive rotated by 0..34 words):
% wordFirst is the in-band first-word marker (true while the FIFO head is
% the first word of a DMA transfer, derived from AXI-Stream tlast).
% state.aligned starts false. While ~aligned:
%   * wordAvail && ~wordFirst -> pop WITHOUT latching (discard, one per
%     enabled step) -- the FIFO advances toward the first-marked word;
%   * wordAvail && wordFirst  -> HOLD (no pop) until `start` arrives;
%   * start && wordAvail && wordFirst -> latch + pop + aligned = true.
% Zeros are emitted while unaligned. Once aligned, behavior is exactly the
% legacy one (latch on start or on bitIdx wrap, popping sequentially; 35
% words per packet keeps the lock); on underflow (wordAvail false at a
% reload point) zeros are emitted and aligned is cleared so the
% realignment sequence re-runs.
%
% This function is the unit-tested single source of truth for the logic
% inside the Transmitter's ByteBitShifter MATLAB Function block.

if nargin == 0
    bit = struct('shiftWord', uint64(0), 'bitIdx', uint8(64), ...
                 'aligned', false);
    return
end

bit = false;
pop = false;

if enable
    if ~state.aligned
        if start && logical(wordAvail) && logical(wordFirst)
            % packet boundary with the first-marked word at the head:
            % latch it and lock alignment
            state.shiftWord = uint64(word);
            pop = true;
            state.bitIdx = uint8(0);
            state.aligned = true;
        elseif logical(wordAvail) && ~logical(wordFirst)
            % discard toward the first-marked word (one per enabled step)
            pop = true;
            state.shiftWord = uint64(0);
            state.bitIdx = uint8(64);
        else
            % head is first-marked (hold for the next start) or FIFO empty
            state.shiftWord = uint64(0);
            state.bitIdx = uint8(64);
        end
    elseif start || state.bitIdx >= 64
        if wordAvail
            state.shiftWord = uint64(word);
            pop = true;
            state.bitIdx = uint8(0);
        else
            % underflow: emit zeros and re-run the alignment sequence
            state.shiftWord = uint64(0);
            state.bitIdx = uint8(64);
            state.aligned = false;
        end
    end
    if state.aligned
        byteIdx   = bitshift(state.bitIdx, -3);          % floor(bitIdx/8)
        bitInByte = bitand(state.bitIdx, uint8(7));      % mod(bitIdx,8)
        byteVal   = bitand(bitshift(state.shiftWord, -8*int32(byteIdx)), uint64(255));
        bit = bitget(byteVal, uint64(8 - uint64(bitInByte))) > 0;
        state.bitIdx = state.bitIdx + 1;
    end
end
end
