function [word, h] = prbs9_gen16(h) %#codegen
%PRBS9_GEN16  One 16-bit-parallel step of a PRBS-9 generator.
%   [WORD, H] = PRBS9_GEN16(H) advances a maximal-length PRBS-9 sequence
%   (multiplicative scrambler driven with 0, polynomial x^9 + x^5 + 1) by 16
%   bits and returns the 16 successive bits packed MSB-first into the uint16
%   WORD, along with the updated 9-bit history H.
%
%   Convention: bitget(H,k) = y[n-k] for k = 1..9. H MUST be seeded nonzero.
%   Recommended seed uint16(511).
%
%   Distinct polynomial from the I-lane (PRBS-15) so that an I/Q lane swap or
%   inter-lane coupling is detected by the phase-insensitive checker.
%   Pure / stateless / HDL-Coder compatible. Companion checker PRBS9_CHK16.

    word = uint16(0);
    for b = 1:16    % fixed 16-bit word; loop index intentionally unused
        yb   = bitxor(bitget(h, 5), bitget(h, 9));          % y[n]=y[n-5]^y[n-9]
        word = bitor(bitshift(word, 1), uint16(yb));        % accumulate MSB-first
        h    = bitor(bitshift(bitand(h, uint16(255)), 1), uint16(yb)); % push, keep 9 bits
    end
end
