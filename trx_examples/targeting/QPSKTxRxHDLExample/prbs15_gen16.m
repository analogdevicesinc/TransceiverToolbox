function [word, h] = prbs15_gen16(h) %#codegen
%PRBS15_GEN16  One 16-bit-parallel step of a PRBS-15 generator.
%   [WORD, H] = PRBS15_GEN16(H) advances a maximal-length PRBS-15 sequence
%   (multiplicative scrambler driven with 0, polynomial x^15 + x^14 + 1) by
%   16 bits and returns the 16 successive bits packed MSB-first into the
%   uint16 WORD, along with the updated 15-bit history H.
%
%   Convention: bitget(H,k) = y[n-k] for k = 1..15. H MUST be seeded nonzero
%   (an all-zero LFSR state is a fixed point). Recommended seed uint16(32767).
%
%   Pure / stateless / HDL-Coder compatible: fixed loop bounds, integer
%   bit-ops only. The companion checker is PRBS15_CHK16.

    word = uint16(0);
    for b = 1:16    % fixed 16-bit word; loop index intentionally unused
        yb   = bitxor(bitget(h, 14), bitget(h, 15));        % y[n]=y[n-14]^y[n-15]
        word = bitor(bitshift(word, 1), uint16(yb));        % accumulate MSB-first
        h    = bitor(bitshift(bitand(h, uint16(16383)), 1), uint16(yb)); % push, keep 15 bits
    end
end
