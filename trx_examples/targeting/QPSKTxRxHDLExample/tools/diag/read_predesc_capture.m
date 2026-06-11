%% read_predesc_capture -- read 1024 pre-Descrambler bits, run software
% descrambler, compare to "ADI Hello World" reference. If software-descrambled
% bits match cleanly → HDL Descrambler is the source. If they don't → the
% errors enter at QPSK Demodulator.

cd(fileparts(mfilename('fullpath'))); addpath(pwd);
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

BistRegisters.write(AxiRxSel, 0, SSH);
pause(5);

words = zeros(1, 32, 'uint32');
for i = 0:31
    BistRegisters.write(AxiMuxSelect, i, SSH);
    pause(0.02);
    words(i+1) = uint32(BistRegisters.read(AxiCaptureWord, SSH));
end

% Reconstruct 1024 pre-descrambler bits
preDesc = false(1, 1024);
for i = 0:1023
    w = floor(i/32) + 1;
    b = mod(i, 32);
    preDesc(i+1) = bitand(words(w), bitshift(uint32(1), b)) ~= 0;
end

fprintf('Captured 1024 PRE-descrambler bits:\n');
fprintf('  ones=%d (%.2f%%)  zeros=%d (%.2f%%)\n', ...
    nnz(preDesc), 100*nnz(preDesc)/1024, nnz(~preDesc), 100*nnz(~preDesc)/1024);

% Software descramble the captured stream
poly = logical([1 0 0 1 0 0 0]);
descrambleStream = @(in, initState) deal_descramble(in, initState, poly);

% Reference message bits
msgStr = 'ADI Hello World';
sA = dec2bin(double(msgStr), 8);
msg = logical(reshape((sA - '0').', 1, []));

% Try software descrambling with the canonical Tx initial state
initState = logical([1 0 1 1 1 0 1]);

% The descrambler state may be MID-FRAME at the start of our capture (since
% there's no dstart trigger). So try ALL 128 possible 7-bit initial states
% AND all bit offsets, find the alignment that maximizes match with reference.
fprintf('\nSearching for best (init_state, bit_offset) combination...\n');
bestMatch = -inf; bestState = 0; bestOff = 0;
for s = 0:127
    initS = logical(bitand(s, 2.^(0:6)) ~= 0);
    desc = deal_descramble(preDesc, initS, poly);
    % Try all bit offsets 0..(1024-120)
    nW = 1024 - 120;
    for off = 0:min(nW, 200)  % limit search range for speed
        seg = desc(off+1:off+120);
        m = sum(seg == msg);
        if m > bestMatch
            bestMatch = m; bestState = s; bestOff = off;
        end
    end
end
fprintf('  best match: %d/120 bits (%.2f%%, errors=%d)\n', bestMatch, 100*bestMatch/120, 120-bestMatch);
fprintf('  best init state = %d  best offset = %d\n', bestState, bestOff);

% Also: try descrambling with the CANONICAL init state and search offsets
initS = logical([1 0 1 1 1 0 1]);
desc = deal_descramble(preDesc, initS, poly);
nW = 1024 - 120;
canonMatches = zeros(1, nW+1);
for off = 0:nW
    seg = desc(off+1:off+120);
    canonMatches(off+1) = sum(seg == msg);
end
[m2, o2] = max(canonMatches);
fprintf('\nWith canonical init=[1 0 1 1 1 0 1]:\n');
fprintf('  best match across all offsets: %d/120 bits (%.2f%%, errors=%d) at offset=%d\n', m2, 100*m2/120, 120-m2, o2-1);

outDir = fullfile(fileparts(mfilename('fullpath')), 'test-results');
if ~exist(outDir,'dir'), mkdir(outDir); end
out = struct('preDesc', double(preDesc), 'rawWords', double(words), ...
    'bestMatch', bestMatch, 'bestState', bestState, 'bestOff', bestOff, ...
    'canonMatch', m2, 'canonOff', o2-1, ...
    'msg', double(msg));
fid = fopen(fullfile(outDir,'predesc_capture.json'),'w');
fprintf(fid, '%s', jsonencode(out));
fclose(fid);
fprintf('\nJSON: %s\n', fullfile(outDir,'predesc_capture.json'));

function out = deal_descramble(in, initState, poly)
    st = initState(:).'; out = false(size(in));
    for i = 1:numel(in)
        bb = mod(nnz(st(poly)),2);
        out(i) = xor(in(i), bb);
        st = [st(2:7) bb];
    end
end
