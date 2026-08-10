function [lat, lon] = cprGlobalPosition(evenMsg, oddMsg, oddIsLatest)
%CPRGLOBALPOSITION Airborne position from an even/odd squitter pair.
%
%   [LAT,LON] = CPRGLOBALPOSITION(EVENMSG,ODDMSG,ODDISLATEST) decodes the
%   compact position reports carried by a matched pair of ADS-B position
%   frames from the same aircraft. EVENMSG and ODDMSG are elements of the
%   struct array returned by DECODEADSBFRAMES, with CPRFormat 0 and 1
%   respectively. ODDISLATEST selects which frame's zone the result is
%   referenced to, and must be true when the odd frame arrived last.
%
%   Returns NaN for both outputs when the pair straddles a latitude zone
%   boundary, which makes the decode ambiguous -- wait for a fresher pair.
%
%   ADS-B transmits position as a fraction of a latitude/longitude zone
%   rather than an absolute coordinate. Two frames encoded against slightly
%   different zone sizes are needed to resolve which zone the aircraft is in.

lat = NaN;
lon = NaN;

nz = 15;
scale = 2^17;

latCprEven = evenMsg.CPRLat / scale;
latCprOdd = oddMsg.CPRLat / scale;
lonCprEven = evenMsg.CPRLon / scale;
lonCprOdd = oddMsg.CPRLon / scale;

dLatEven = 360 / (4*nz);
dLatOdd = 360 / (4*nz - 1);

% Latitude zone index, common to both frames.
j = floor(59*latCprEven - 60*latCprOdd + 0.5);

latEven = dLatEven * (mod(j, 60) + latCprEven);
latOdd = dLatOdd * (mod(j, 59) + latCprOdd);

% Southern hemisphere values come back in the 270-360 range.
if latEven >= 270, latEven = latEven - 360; end
if latOdd >= 270, latOdd = latOdd - 360; end

% Both frames must fall in the same latitude band for the longitude zone
% count to agree.
if cprNL(latEven) ~= cprNL(latOdd)
    return
end

if oddIsLatest
    lat = latOdd;
    nl = cprNL(latOdd);
    ni = max(nl - 1, 1);
    m = floor(lonCprEven*(nl-1) - lonCprOdd*nl + 0.5);
    lon = (360/ni) * (mod(m, ni) + lonCprOdd);
else
    lat = latEven;
    nl = cprNL(latEven);
    ni = max(nl, 1);
    m = floor(lonCprEven*(nl-1) - lonCprOdd*nl + 0.5);
    lon = (360/ni) * (mod(m, ni) + lonCprEven);
end

if lon >= 180
    lon = lon - 360;
end

end

%% ------------------------------------------------------------------------
function nl = cprNL(lat)
%CPRNL Number of longitude zones at a given latitude.
lat = abs(lat);
if lat >= 87
    nl = 2;
elseif lat == 0
    nl = 59;
else
    num = 1 - cosd(180/(4*15));
    den = 1 - cosd(2*lat);
    nl = floor(2*pi / acos(1 - num/den));
    nl = max(min(nl, 59), 2);
end
end
