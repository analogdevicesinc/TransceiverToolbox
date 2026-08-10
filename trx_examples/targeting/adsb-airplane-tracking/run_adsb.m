function tracks = run_adsb(varargin)
%RUN_ADSB Live ADS-B airplane tracking against the deployed ADRV9361 design.
%
%   TRACKS = RUN_ADSB() tunes the board to 1090 MHz, streams the frame
%   channel produced by the deployed HDL detector, decodes the squitters,
%   and prints a running table of aircraft. Returns a containers.Map keyed
%   by ICAO address holding what was learned about each aircraft.
%
%   RUN_ADSB(...,'uri',URI)        libIIO URI (default 'ip:analog.local',
%                                  overridden by the IIO_URI environment
%                                  variable when set)
%   RUN_ADSB(...,'Duration',SECS)  how long to listen (default 60)
%   RUN_ADSB(...,'Threshold',T)    correlation threshold written to the DUT
%   RUN_ADSB(...,'Plot',TF)        plot aircraft positions (default true)
%
%   Requires a board booted with the BOOT.BIN built by hdlworkflow.m in this
%   folder -- the stock HDL image has no ADS-B detector and will produce no
%   frames.
%
%   Example:
%       tracks = run_adsb('uri','ip:192.168.2.1','Duration',120);
%
%   See also GENADSBWAVEFORM, DECODEADSBFRAMES, CPRGLOBALPOSITION.

p = inputParser;
p.addParameter('uri', '', @(x) ischar(x) || isstring(x));
p.addParameter('Duration', 60, @(x) isnumeric(x) && isscalar(x) && x > 0);
p.addParameter('Threshold', 40, @(x) isnumeric(x) && isscalar(x));
p.addParameter('Plot', true, @(x) islogical(x) || isnumeric(x));
p.parse(varargin{:});

uri = char(p.Results.uri);
if isempty(uri)
    uri = getenv('IIO_URI');
end
if isempty(uri)
    uri = 'ip:analog.local';
end

c = adsbFrameConstants();

rx = adi.AD9361.Rx('uri', uri);
rx.CenterFrequency = c.CenterFreq;
rx.SamplingRate = c.SamplingRate;
% ADS-B pulses are 0.5 us, so they need appreciably more RF bandwidth than
% the sample rate alone suggests. Widen this if weak targets are missed.
rx.RFBandwidth = 8e6;
rx.GainControlModeChannel0 = 'fast_attack';
rx.GainControlModeChannel1 = 'fast_attack';
% Both RF channels must be enabled: channel 1 carries the raw baseband
% pass-through, channel 2 the frame stream and its status word.
rx.EnabledChannels = [1 2];
rx.SamplesPerFrame = 2^16;

cleanup = onCleanup(@() rx.release());

wThreshold = adsbRegister(uri, 'write', c.RegThreshold, 'int16');
wEnable = adsbRegister(uri, 'write', c.RegEnable, 'boolean');
rDetect = adsbRegister(uri, 'read', c.RegDetectCount, 'uint32');
rCRCPass = adsbRegister(uri, 'read', c.RegCRCPassCount, 'uint32');

wThreshold(p.Results.Threshold);
wEnable(true);

tracks = containers.Map('KeyType', 'char', 'ValueType', 'any');
tStart = tic;
nFrames = 0;
nBadCRC = 0;

fprintf('Listening on %s for %g s at %g MHz...\n', uri, p.Results.Duration, c.CenterFreq/1e6);

while toc(tStart) < p.Results.Duration
    data = rx();
    if isempty(data)
        continue
    end

    % The frame stream rides the second enabled channel pair: 'IP Data 2
    % OUT' feeds fifo_wr_data_2 (the I word of channel 2), so the frame
    % words arrive as the real part.
    streamWords = real(data(:,2));
    frames = extractADSBFrames(streamWords);
    if isempty(frames)
        continue
    end

    msgs = decodeADSBFrames(frames);
    for k = 1:numel(msgs)
        m = msgs(k);
        if ~m.CRCValid
            nBadCRC = nBadCRC + 1;
            continue
        end
        if m.DF ~= 17
            continue
        end
        nFrames = nFrames + 1;
        tracks = updateTrack(tracks, m);
    end

    printTracks(tracks, nFrames, nBadCRC, readCounters(rDetect, rCRCPass));
end

if p.Results.Plot
    plotTracks(tracks);
end

end

%% ------------------------------------------------------------------------
function counters = readCounters(rDetect, rCRCPass)
counters = struct('Detected', NaN, 'CRCPass', NaN);
try
    counters.Detected = double(rDetect());
    counters.CRCPass = double(rCRCPass());
catch
    % Register reads are diagnostic only; a failure must not stop tracking.
end
end

%% ------------------------------------------------------------------------
function tracks = updateTrack(tracks, m)
if isKey(tracks, m.ICAO)
    t = tracks(m.ICAO);
else
    t = struct('ICAO', m.ICAO, 'Callsign', '', 'Altitude', NaN, ...
        'Speed', NaN, 'Heading', NaN, 'Lat', NaN, 'Lon', NaN, ...
        'Even', [], 'Odd', [], 'OddIsLatest', false, 'Count', 0);
end

t.Count = t.Count + 1;

if ~isempty(m.Callsign)
    t.Callsign = m.Callsign;
end
if ~isnan(m.Altitude)
    t.Altitude = m.Altitude;
end
if ~isnan(m.Speed)
    t.Speed = m.Speed;
    t.Heading = m.Heading;
end

if ~isnan(m.CPRFormat)
    if m.CPRFormat == 0
        t.Even = m;
        t.OddIsLatest = false;
    else
        t.Odd = m;
        t.OddIsLatest = true;
    end
    % A position needs one frame of each parity.
    if ~isempty(t.Even) && ~isempty(t.Odd)
        [lat, lon] = cprGlobalPosition(t.Even, t.Odd, t.OddIsLatest);
        if ~isnan(lat)
            t.Lat = lat;
            t.Lon = lon;
        end
    end
end

tracks(m.ICAO) = t; %#ok<NASGU>
end

%% ------------------------------------------------------------------------
function printTracks(tracks, nFrames, nBadCRC, counters)
clc;
fprintf('ADS-B frames decoded: %d   link CRC failures: %d\n', nFrames, nBadCRC);
fprintf('DUT counters -- preamble detections: %g   CRC passes: %g\n\n', ...
    counters.Detected, counters.CRCPass);
fprintf('%-8s %-9s %9s %8s %8s %11s %11s %6s\n', ...
    'ICAO', 'CALLSIGN', 'ALT(ft)', 'SPD(kt)', 'HDG', 'LAT', 'LON', 'MSGS');
keysList = keys(tracks);
for k = 1:numel(keysList)
    t = tracks(keysList{k});
    fprintf('%-8s %-9s %9.0f %8.0f %8.0f %11.5f %11.5f %6d\n', ...
        t.ICAO, t.Callsign, t.Altitude, t.Speed, t.Heading, t.Lat, t.Lon, t.Count);
end
end

%% ------------------------------------------------------------------------
function plotTracks(tracks)
keysList = keys(tracks);
lat = [];
lon = [];
labels = {};
for k = 1:numel(keysList)
    t = tracks(keysList{k});
    if ~isnan(t.Lat)
        lat(end+1) = t.Lat; %#ok<AGROW>
        lon(end+1) = t.Lon; %#ok<AGROW>
        if isempty(t.Callsign)
            labels{end+1} = t.ICAO; %#ok<AGROW>
        else
            labels{end+1} = t.Callsign; %#ok<AGROW>
        end
    end
end

if isempty(lat)
    fprintf('No positions resolved -- need an even/odd frame pair per aircraft.\n');
    return
end

figure('Name', 'ADS-B Airplane Tracking');
% geoplot needs no extra products, but a basemap does; fall back to a plain
% axes so this demo never hard-requires Mapping Toolbox.
try
    geoplot(lat, lon, 'r^', 'MarkerFaceColor', 'r');
    geobasemap('none');
    text(lat, lon, labels, 'VerticalAlignment', 'bottom');
catch
    plot(lon, lat, 'r^', 'MarkerFaceColor', 'r');
    text(lon, lat, labels, 'VerticalAlignment', 'bottom');
    xlabel('Longitude (deg)');
    ylabel('Latitude (deg)');
    grid on;
end
title('Aircraft decoded from ADS-B');
end
