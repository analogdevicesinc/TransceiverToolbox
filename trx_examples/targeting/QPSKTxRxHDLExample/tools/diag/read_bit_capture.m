%% read_bit_capture  -- read the 1024-bit BitCapture buffer + analyze per-bit error pattern
% Prerequisite: deploy composite_bit_capture BOOT.BIN (1M-cycle warm-up,
% capture starts on first dstart after warm-up).

cd(fileparts(mfilename('fullpath')));
addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file')==2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI            = 'ip:10.0.0.146';
SSH            = 8;
AxiRxSel       = '0x9D000114';
AxiMuxSelect   = '0x9D00010C';
AxiCaptureWord = '0x9D00011C';

[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc==0, 'board unreachable');

% rx_input_select=0 (internal) — this is what we're diagnosing
BistRegisters.write(AxiRxSel, 0, SSH);
pause(5);

% Read 32 words = 1024 bits
words = zeros(1, 32, 'uint32');
for i = 0:31
    BistRegisters.write(AxiMuxSelect, i, SSH);
    pause(0.02);
    words(i+1) = uint32(BistRegisters.read(AxiCaptureWord, SSH));
end

% Reconstruct bit stream (LSB-first within each 32-bit word)
bits = false(1, 1024);
for i = 0:1023
    w = floor(i/32) + 1;
    b = mod(i, 32);
    bits(i+1) = bitand(words(w), bitshift(uint32(1), b)) ~= 0;
end

% Expected reference: 13-bit Barker preamble + 2240-bit payload (first 120 = "ADI Hello World")
C = commhdlQPSKTxRxParameters;
sA = dec2bin(double('ADI Hello World'), 8);
msg = logical(reshape((sA - '0').', 1, []));

% v3 (no dstart): captured 1024 bits is a contiguous slice of descrambler output
% starting at first valid sample after 1M-cycle warm-up. Cross-correlate against
% the BIST repetition pattern to find packet boundaries.
% The deployed BIST counter compares the first 120 bits of each packet (after
% Frame Sync's dstart) against "ADI Hello World"; the descrambler output stream
% repeats the message bits within each 1120-symbol (2240-bit) frame, but only
% 120 are *checked* per frame.

% Try all possible offsets within one frame period and pick the one with
% lowest aggregate error rate.
bestOff = 0; bestErr = Inf;
for off = 0:120
    nWindows = floor((1024 - off) / 120);
    if nWindows < 4, continue; end
    totErr = 0;
    for k = 0:nWindows-1
        seg = bits(off + k*120 + (1:120));
        totErr = totErr + nnz(seg ~= msg);
    end
    if totErr < bestErr
        bestErr = totErr; bestOff = off; packetsCovered = nWindows;
    end
end
fprintf('Best alignment offset = %d bit(s), %d packet windows, total errors = %d\n', ...
    bestOff, packetsCovered, bestErr);

fprintf('\nPer-packet error counts (offset=%d, vs "ADI Hello World" 120-bit ref):\n', bestOff);
errPos = false(packetsCovered, 120);
for k = 0:packetsCovered-1
    seg = bits(bestOff + k*120 + (1:120));
    err = seg ~= msg;
    errPos(k+1, :) = err;
    fprintf('  pkt %2d: %3d errors  ', k, nnz(err));
    fprintf('  %s\n', char('.' + double(err)*('|'-'.')));
end

fprintf('\nSummed errors per bit position (across %d packets):\n', packetsCovered);
posErr = sum(errPos, 1);
for chunk = 0:floor(119/40)
    rng_ = chunk*40 + (1:min(40, 120-chunk*40));
    fprintf('  pos %3d..%3d:  ', rng_(1)-1, rng_(end)-1);
    for ii = rng_
        if posErr(ii)==0, c='.'; elseif posErr(ii) >= packetsCovered, c='#'; else, c='0'+min(9,posErr(ii)); end
        fprintf('%c', c);
    end
    fprintf('\n');
end

fprintf('\nOverall: %d errors / %d bits = %.3f%% (true /120)\n', ...
    nnz(errPos), packetsCovered*120, 100*nnz(errPos)/(packetsCovered*120));

outDir = fullfile(fileparts(mfilename('fullpath')), 'test-results');
if ~exist(outDir,'dir'), mkdir(outDir); end
out = struct('rawWords', double(words), 'bits', double(bits), ...
    'msg', double(msg), 'errPos', double(errPos), 'posErr', posErr, ...
    'packetsCovered', packetsCovered, 'totalErrors', nnz(errPos));
fid = fopen(fullfile(outDir,'bitCapture_internal.json'),'w');
fprintf(fid, '%s', jsonencode(out));
fclose(fid);
fprintf('JSON: %s\n', fullfile(outDir,'bitCapture_internal.json'));
