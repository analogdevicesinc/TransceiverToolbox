function [errs, hr] = prbs9_chk16(hr, word) %#codegen
%PRBS9_CHK16  Self-synchronizing PRBS-9 checker for a 16-bit word.
%   [ERRS, HR] = PRBS9_CHK16(HR, WORD) runs the PRBS-9 multiplicative
%   descrambler (polynomial x^9 + x^5 + 1) over the 16 received bits in the
%   uint16 WORD (processed MSB-first, matching PRBS9_GEN16) using the
%   received-bit history HR. On a bit-exact link the recovered bit is 0; ERRS
%   counts recovered 1s (real bit errors); HR is the updated history.
%
%   Self-synchronizes after 9 received bits with no alignment FSM.
%   Pure / stateless / HDL-Coder compatible. Companion generator PRBS9_GEN16.

    errs = uint8(0);
    for b = 16:-1:1                                          % temporal order = MSB-first
        rb   = bitget(word, b);
        xhat = bitxor(bitxor(uint8(rb), uint8(bitget(hr, 5))), uint8(bitget(hr, 9)));
        errs = errs + xhat;
        hr   = bitor(bitshift(bitand(hr, uint16(255)), 1), uint16(rb)); % push received bit
    end
end
