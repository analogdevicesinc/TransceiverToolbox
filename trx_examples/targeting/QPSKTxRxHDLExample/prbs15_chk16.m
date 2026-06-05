function [errs, hr] = prbs15_chk16(hr, word) %#codegen
%PRBS15_CHK16  Self-synchronizing PRBS-15 checker for a 16-bit word.
%   [ERRS, HR] = PRBS15_CHK16(HR, WORD) runs the PRBS-15 multiplicative
%   descrambler (polynomial x^15 + x^14 + 1) over the 16 received bits in the
%   uint16 WORD (processed MSB-first, matching PRBS15_GEN16) using the
%   received-bit history HR. On a bit-exact link the recovered bit is 0; ERRS
%   is the number of recovered 1s (real bit errors) in this word, and HR is
%   the updated history.
%
%   Self-synchronizes after 15 received bits (<= one word) with no alignment
%   FSM and no shared seed -- the defining property of a multiplicative
%   descrambler. HR may start at 0.
%
%   Pure / stateless / HDL-Coder compatible. Companion generator PRBS15_GEN16.

    errs = uint8(0);
    for b = 16:-1:1                                          % temporal order = MSB-first
        rb   = bitget(word, b);
        xhat = bitxor(bitxor(uint8(rb), uint8(bitget(hr, 14))), uint8(bitget(hr, 15)));
        errs = errs + xhat;
        hr   = bitor(bitshift(bitand(hr, uint16(16383)), 1), uint16(rb)); % push received bit
    end
end
