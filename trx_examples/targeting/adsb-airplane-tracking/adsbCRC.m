function parity = adsbCRC(dataBits)
%ADSBCRC Mode S 24-bit parity over the leading data bits of a squitter.
%
%   PARITY = ADSBCRC(DATABITS) returns the 24-bit parity field for the
%   88-bit data portion of a 112-bit extended squitter, as a row vector of
%   bits (most significant first).
%
%   Mode S uses the generator polynomial
%       x^24 + x^23 + x^22 + x^21 + x^20 + x^19 + x^18 + x^17 + x^16
%            + x^15 + x^14 + x^13 + x^12 + x^10 + x^3 + 1
%   i.e. 0xFFF409 in its 24-bit truncated form.
%
%   A received frame is valid when ADSBCRC of its first 88 bits equals its
%   trailing 24 bits. (For DF17 the parity is not overlaid with an address,
%   so a plain comparison suffices.)

genPoly = uint32(hex2dec('FFF409'));
mask24 = uint32(hex2dec('FFFFFF'));

reg = uint32(0);
for k = 1:numel(dataBits)
    msb = bitget(reg, 24);
    reg = bitand(bitshift(reg, 1), mask24);
    reg = bitxor(reg, uint32(dataBits(k) ~= 0));
    if msb
        reg = bitxor(reg, genPoly);
    end
end

% Flush the register through 24 more stages so the remainder covers the
% parity field position.
for k = 1:24
    msb = bitget(reg, 24);
    reg = bitand(bitshift(reg, 1), mask24);
    if msb
        reg = bitxor(reg, genPoly);
    end
end

parity = double(bitget(reg, 24:-1:1));

end
