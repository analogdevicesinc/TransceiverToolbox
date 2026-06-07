%% sim_with_hw_captured_postagc -- DEFINITIVE BER-reproduction test.
%
% Reads 4096 post-AGC IQ samples captured from hardware (via
% composite_bigbuf_postagc variant). Feeds them through a MATLAB-level
% chain that mimics the Rx stages after AGC (RRC matched filter, symbol
% sync, carrier sync, demod, descrambler, BER against "ADI Hello World").
%
% Goal: reproduce the ~7.27% per-checked-bit hardware BER in this
% simulation. If sim BER ≈ 7%, we've confirmed the issue lies in the
% chain's processing of real captured signal (not a synth-only artifact).
% If sim BER ≈ 0%, the HW post-AGC samples are fine and the issue is
% downstream in the HDL implementation (timing/CDC).

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

% Set internal loopback
BistRegisters.write(AxiRxSel, 0, SSH);
pause(2);

% Snapshot BIST so we have HW reference BER over the capture window
p0 = double(BistRegisters.read('0x9D000104', SSH));
e0 = double(BistRegisters.read('0x9D000108', SSH));

% Capture 4096 post-AGC samples — BATCHED via /tmp/ssh_axi_snap.sh (the working
% sshpass+ssh wrapper used elsewhere in this project). One SSH call runs an
% on-board loop reading all N words, ~10–20 s for 4096 reads.
N = 4096;
fprintf('Capturing %d post-AGC samples (batched SSH)...\n', N);
shellCmd = sprintf('for i in $(seq 0 %d); do busybox devmem 0x9D00010C 32 $i >/dev/null; busybox devmem 0x9D00011C 32; done', N-1);
tmpOut = tempname;
sysCmd = sprintf('/tmp/ssh_axi_snap.sh ''%s'' > %s 2>&1', strrep(shellCmd,'''',''''''), tmpOut);
fprintf('  issuing batched SSH...\n');
tStart = tic;
[rc, ~] = system(sysCmd);
raw = fileread(tmpOut);
delete(tmpOut);
fprintf('  ssh rc=%d, output bytes=%d, time=%.2fs\n', rc, numel(raw), toc(tStart));
hexLines = regexp(raw, '0x[0-9A-Fa-f]+', 'match');
fprintf('  parsed %d hex words from SSH output\n', numel(hexLines));
assert(numel(hexLines) >= N, 'expected %d words, got %d', N, numel(hexLines));
words = zeros(1, N, 'uint32');
for i = 1:N
    words(i) = uint32(hex2dec(hexLines{i}(3:end)));
end

p1 = double(BistRegisters.read('0x9D000104', SSH));
e1 = double(BistRegisters.read('0x9D000108', SSH));
dp = p1 - p0; de = e1 - e0;
fprintf('  capture window HW BIST: delta_packets=%d delta_errors=%d → HW BER %.4f%% (/120)\n', ...
    dp, de, 100*de/(max(1,dp)*120));

% Unpack to complex IQ (sfix16_En14)
Iu = uint16(bitshift(words, -16));
Qu = uint16(bitand(words, uint32(65535)));
Ii = typecast(Iu, 'int16');
Qi = typecast(Qu, 'int16');
I  = double(Ii) / 2^14;
Q  = double(Qi) / 2^14;
iq = complex(I, Q);

% Filter out the zero/invalid samples (buffer captures when valid only fires sparsely)
nonzero = abs(iq) > 0.01;
fprintf('  total samples %d, non-zero (valid) %d (%.1f%%)\n', numel(iq), nnz(nonzero), 100*nnz(nonzero)/numel(iq));
iq_valid = iq(nonzero);
fprintf('  valid samples: mean(|s|)=%.4f, std(|s|)=%.4f\n', mean(abs(iq_valid)), std(abs(iq_valid)));

% Save raw capture
outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
if ~exist(outDir,'dir'), mkdir(outDir); end
save(fullfile(outDir,'bigbuf_postagc.mat'), 'iq','iq_valid','dp','de','words');
fprintf('  saved: %s\n', fullfile(outDir,'bigbuf_postagc.mat'));

% ===== Feed to MATLAB Rx chain =====
% The post-AGC samples are at the QPSK Rx internal slow rate (post AGC's
% internal Downsample-by-2 if present). Treating them as Fs=7.68 MHz with
% SPS=4 (since AGC operates at the Rx-internal rate, before MF).
fprintf('\n=== Run MATLAB-ref Rx chain on captured post-AGC IQ ===\n');
Fs_postagc = 7.68e6;   % post-AGC rate guess (Rx internal)
[ber, nframes, evm, info] = demodPlutoCapture(iq_valid, Fs_postagc);
fprintf('  demodPlutoCapture result: %s\n', info);
fprintf('  Sim BER (MATLAB chain on HW post-AGC samples): %.4f%%\n', 100*ber);
fprintf('  HW BIST BER over same window:                  %.4f%% (/120)\n', 100*de/(max(1,dp)*120));

% Also try Fs=15.36 MHz interpretation (if AGC runs at fast rate)
fprintf('\nAlternative: treat as Fs=15.36 MHz (full ADC rate)...\n');
[ber2, nframes2, evm2, info2] = demodPlutoCapture(iq_valid, 15.36e6);
fprintf('  result: %s\n', info2);

% Sanity check: also try the FULL capture (incl zeros) as if it were a sequence
fprintf('\nSanity: full sequence (incl zeros) at Fs=15.36MHz...\n');
[ber3, nframes3, evm3, info3] = demodPlutoCapture(iq, 15.36e6);
fprintf('  result: %s\n', info3);

% Summary
fprintf('\n=== SUMMARY ===\n');
fprintf('  HW BIST BER  (real-time over capture window): %.4f%%\n', 100*de/(max(1,dp)*120));
fprintf('  Sim BER (chain on HW samples, Fs=7.68 MHz):    %.4f%% — %d frames decoded\n', 100*ber, nframes);
fprintf('  Sim BER (chain on HW samples, Fs=15.36 MHz):   %.4f%% — %d frames decoded\n', 100*ber2, nframes2);
fprintf('  Sim BER (chain on full incl zeros, 15.36):     %.4f%% — %d frames decoded\n', 100*ber3, nframes3);
if abs(100*ber - 7.27) < 2 || abs(100*ber2 - 7.27) < 2 || abs(100*ber3 - 7.27) < 2
    fprintf('  *** REPRODUCED ~7%% BER IN SIMULATION ***\n');
elseif (ber < 0.01 && ber2 < 0.01 && ber3 < 0.01)
    fprintf('  Sim BER ~0%% — captured data is fine; HW issue is downstream of AGC tap.\n');
end
