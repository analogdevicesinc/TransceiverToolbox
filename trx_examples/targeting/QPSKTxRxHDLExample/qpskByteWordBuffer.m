function [word, avail, ready, wordFirst, state] = qpskByteWordBuffer(state, dataIn, validIn, popReq, firstIn)
% qpskByteWordBuffer -- 2-deep word FIFO between the AXI-Stream byte DMA
% and the Transmitter's bit shifter, with REGISTERED ready backpressure
% (legal AXIS: tready is a registered output, accept happens on
% tvalid && tready of the same beat).
%
%   state = qpskByteWordBuffer()                          -- initial state
%   [word, avail, ready, wordFirst, state] = ...
%       qpskByteWordBuffer(state, dataIn, validIn, popReq, firstIn)
%
% word/avail/wordFirst expose the head entry; popReq && avail consumes it.
% firstIn is the in-band first-word marker (byte_breakout's byte_first =
% "this beat is the first of a transfer", derived from the previous beat's
% tlast); it is stored alongside each word so the bit shifter downstream
% can word-align a rotated cyclic-DMA stream. ready is the value
% registered from the PREVIOUS step's occupancy (<2), matching the
% hardware where tready is a flop.
%
% Unit-tested single source of truth for the composite overlay's
% ByteWordBuffer MATLAB Function block.

if nargin == 0
    word = struct('buf', [uint64(0); uint64(0)], ...
                  'bufF', [false; false], 'count', uint8(0), ...
                  'rd', uint8(0), 'readyReg', true);
    return
end

ready     = state.readyReg;
avail     = state.count > 0;
word      = state.buf(state.rd + 1);
wordFirst = state.bufF(state.rd + 1);

push = logical(validIn) && logical(ready) && state.count < 2;
popp = logical(popReq) && avail;

if push
    wr = bitand(state.rd + state.count, uint8(1));
    state.buf(wr + 1)  = uint64(dataIn);
    state.bufF(wr + 1) = logical(firstIn);
end
newCount = state.count + uint8(push) - uint8(popp);
if popp
    state.rd = bitand(state.rd + 1, uint8(1));
end
state.count = newCount;
state.readyReg = newCount < 2;
end
