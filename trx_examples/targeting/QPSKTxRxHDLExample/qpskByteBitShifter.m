function [bit, pop, state] = qpskByteBitShifter(state, enable, start, word, wordAvail)
% qpskByteBitShifter -- 64-bit word to payload-bit deserializer for the
% byte-TX path. Emits one bit per enabled step, byte-0-first and MSB-first
% within each byte (the BIST reference order: dec2bin(...,8) row-reshape,
% with byte 0 packed in the uint64 LSB byte -- see ByteDmaRegisters.pack).
%
%   state = qpskByteBitShifter()                          -- initial state
%   [bit, pop, state] = qpskByteBitShifter(state, enable, start, word, wordAvail)
%
% start (the Tx packet-boundary flag) resets the bit index so word/packet
% alignment self-heals every packet (2240 bits = exactly 35 words). pop is
% true on any step that latches a new word -- upstream advances its FIFO.
% If wordAvail is false at a reload point, zeros are emitted (underflow).
%
% This function is the unit-tested single source of truth for the logic
% inside the Transmitter's ByteBitShifter MATLAB Function block.

if nargin == 0
    bit = struct('shiftWord', uint64(0), 'bitIdx', uint8(64));
    return
end

bit = false;
pop = false;

if enable
    if start || state.bitIdx >= 64
        if wordAvail
            state.shiftWord = uint64(word);
        else
            state.shiftWord = uint64(0);
        end
        pop = logical(wordAvail);
        state.bitIdx = uint8(0);
    end
    byteIdx   = bitshift(state.bitIdx, -3);          % floor(bitIdx/8)
    bitInByte = bitand(state.bitIdx, uint8(7));      % mod(bitIdx,8)
    byteVal   = bitand(bitshift(state.shiftWord, -8*int32(byteIdx)), uint64(255));
    bit = bitget(byteVal, uint64(8 - uint64(bitInByte))) > 0;
    state.bitIdx = state.bitIdx + 1;
end
end
