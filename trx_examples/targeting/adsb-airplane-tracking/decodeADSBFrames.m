function msgs = decodeADSBFrames(frames)
%DECODEADSBFRAMES Decode Mode S extended squitter frames into aircraft data.
%
%   MSGS = DECODEADSBFRAMES(FRAMES) decodes an N-by-112 matrix of squitter
%   bits (as returned by EXTRACTADSBFRAMES) into a struct array with fields:
%
%       Hex        message as a 28-character hex string
%       DF         downlink format (17 for ADS-B extended squitter)
%       ICAO       24-bit aircraft address, as hex text
%       TypeCode   ADS-B type code, taken from the message field
%       CRCValid   true when the trailing parity matches the payload
%       Callsign   flight identification (type codes 1-4), else ''
%       Altitude   barometric altitude in feet (type codes 9-18), else NaN
%       Speed      ground speed in knots (type code 19), else NaN
%       Heading    track angle in degrees (type code 19), else NaN
%       CPRFormat  0 for an even position frame, 1 for odd, else NaN
%       CPRLat     raw 17-bit encoded latitude, else NaN
%       CPRLon     raw 17-bit encoded longitude, else NaN
%
%   Position frames carry only half of a compact position report, so a
%   latitude/longitude requires pairing an even and an odd frame -- see
%   CPRGLOBALPOSITION.
%
%   Frames failing the CRC are still returned, with CRCValid false, so the
%   caller can count them. The HDL detector only forwards frames that pass
%   its own check, so a false here means the link corrupted the frame.
%
%   See also EXTRACTADSBFRAMES, CPRGLOBALPOSITION, ADSBCRC.

nMsg = size(frames, 1);
msgs = repmat(emptyMessage(), nMsg, 1);

for k = 1:nMsg
    b = double(frames(k,:) ~= 0);
    m = emptyMessage();

    m.Hex = bitsToHex(b);
    m.DF = bitsToNum(b(1:5));
    m.ICAO = bitsToHex(b(9:32));
    m.CRCValid = isequal(adsbCRC(b(1:88)), b(89:112));

    % The 56-bit ME field carries the payload; its first five bits select
    % how the rest is interpreted.
    me = b(33:88);
    m.TypeCode = bitsToNum(me(1:5));

    if m.TypeCode >= 1 && m.TypeCode <= 4
        m.Callsign = decodeCallsign(me(9:56));
    elseif m.TypeCode >= 9 && m.TypeCode <= 18
        m.Altitude = decodeAltitude(me(9:20));
        m.CPRFormat = me(22);
        m.CPRLat = bitsToNum(me(23:39));
        m.CPRLon = bitsToNum(me(40:56));
    elseif m.TypeCode == 19
        [m.Speed, m.Heading] = decodeVelocity(me);
    end

    msgs(k) = m;
end

end

%% ------------------------------------------------------------------------
function m = emptyMessage()
m = struct('Hex', '', 'DF', NaN, 'ICAO', '', 'TypeCode', NaN, ...
    'CRCValid', false, 'Callsign', '', 'Altitude', NaN, ...
    'Speed', NaN, 'Heading', NaN, ...
    'CPRFormat', NaN, 'CPRLat', NaN, 'CPRLon', NaN);
end

%% ------------------------------------------------------------------------
function v = bitsToNum(b)
v = sum(double(b(:)).' .* 2.^(numel(b)-1:-1:0));
end

%% ------------------------------------------------------------------------
function s = bitsToHex(b)
nib = reshape(double(b(:)).', 4, []).';
vals = nib * [8; 4; 2; 1];
s = upper(dec2hex(vals).');
end

%% ------------------------------------------------------------------------
function cs = decodeCallsign(b)
% Six-bit character encoding, padded with spaces.
alphabet = ['#ABCDEFGHIJKLMNOPQRSTUVWXYZ#####' ' ###############0123456789######'];
chars = reshape(double(b(:)).', 6, []).';
idx = chars * [32; 16; 8; 4; 2; 1];
cs = alphabet(idx + 1);
cs = strtrim(strrep(cs, '#', ''));
end

%% ------------------------------------------------------------------------
function alt = decodeAltitude(b)
% Bit 8 of the 12-bit field is the Q flag; when set, the remaining 11 bits
% are a 25 ft increment above -1000 ft. The 100 ft Gillham encoding used
% when Q is clear is rare in ADS-B and is not decoded here.
qBit = b(8);
if ~qBit
    alt = NaN;
    return
end
n = bitsToNum([b(1:7) b(9:12)]);
alt = n*25 - 1000;
end

%% ------------------------------------------------------------------------
function [speed, heading] = decodeVelocity(me)
speed = NaN;
heading = NaN;

subType = bitsToNum(me(6:8));
if subType ~= 1 && subType ~= 2
    return   % airspeed subtypes are not decoded
end

% East-west and north-south ground speed components, each with a sign bit
% and a magnitude offset by one.
signEW = me(14);
vEW = bitsToNum(me(15:24)) - 1;
signNS = me(25);
vNS = bitsToNum(me(26:35)) - 1;

if vEW < 0 || vNS < 0
    return   % velocity unavailable
end

if subType == 2
    % Supersonic subtype reports in 4 kt units.
    vEW = vEW*4;
    vNS = vNS*4;
end

if signEW, vEW = -vEW; end
if signNS, vNS = -vNS; end

speed = hypot(vEW, vNS);
heading = mod(atan2d(vEW, vNS), 360);

end
