%% sim_with_dma_capture -- DMA-based BER-reproduction test.
%
% Replaces sim_with_hw_captured_postagc.m / devmem polling with libiio DMA via
% adi.ADRV9002.Rx. Requires composite_dma_postagc variant deployed (which
% maps debugI/debugQ/debugValid to IP Data 0/2 OUT and IP Data Valid OUT).
%
% Goal: capture ~10^6 post-AGC samples in <1 s, run MATLAB chain through
% them at multiple iq_debug_mux positions (0=post-AGC, 1=post-SS, 2=post-CS,
% 3=constellation), and report per-tap BER against "ADI Hello World".

cd(fileparts(mfilename('fullpath'))); addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file')==2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI          = 'ip:10.0.0.146';
SSH          = 8;
AxiRxSel     = '0x9D000114';
AxiMuxSelect = '0x9D00010C';
AxiPackets   = '0x9D000104';
AxiBitErrs   = '0x9D000108';

% Sanity-check connectivity
[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc==0, 'board unreachable at %s', URI);

% Force internal-loopback path so we get the noise-free condition.
BistRegisters.write(AxiRxSel, 0, SSH);
pause(2);

% Try captures at all 4 tap positions (post-AGC, post-SS, post-CS, constellation).
TAPS = {'post-AGC','post-SymSync','post-CS','constellation'};
NREQ = 2^18;   % 262144 samples per tap; ~17 ms at 15.36 MHz, easy for DMA.

C = commhdlQPSKTxRxParameters;
msgStr = 'ADI Hello World';
sA  = dec2bin(double(msgStr), 8);
msg = logical(reshape((sA - '0').', 1, []));

results = struct();
for tapIdx = 0:3
    fprintf('\n========== Tap %d (%s) ==========\n', tapIdx, TAPS{tapIdx+1});
    BistRegisters.write(AxiMuxSelect, tapIdx, SSH);
    pause(0.5);

    % Snapshot BIST before capture
    p0 = double(BistRegisters.read(AxiPackets, SSH));
    e0 = double(BistRegisters.read(AxiBitErrs, SSH));

    fprintf('  Opening libiio Rx (DMA)...\n');
    try
        rx = adi.ADRV9002.Rx('uri', URI);
        rx.SamplesPerFrame = NREQ;
        rx.EnabledChannels = 1;
        % Default ADRV9002 profile from board state — don't reconfigure here.
        tStart = tic;
        data = rx();
        dt = toc(tStart);
        release(rx);
        fprintf('  captured %d complex samples in %.3f s (%.2f Msps eff)\n', ...
            numel(data), dt, numel(data)/dt/1e6);
    catch err
        fprintf('  CAPTURE FAILED: %s\n', err.message);
        results.(sprintf('tap%d', tapIdx)) = struct('error', err.message);
        continue;
    end

    % Snapshot BIST after
    p1 = double(BistRegisters.read(AxiPackets, SSH));
    e1 = double(BistRegisters.read(AxiBitErrs, SSH));
    dp = p1 - p0; de = e1 - e0;
    hwBer = 100*de/(max(1,dp)*120);
    fprintf('  HW BIST during capture: %d packets, %d errs, BER=%.4f%%\n', dp, de, hwBer);

    iq = double(data) / 2^14;
    fprintf('  |s| mean=%.4f std=%.4f, %d non-zero (%.1f%%)\n', ...
        mean(abs(iq)), std(abs(iq)), sum(abs(iq)>0.01), 100*sum(abs(iq)>0.01)/numel(iq));

    % Save raw
    outDir = fullfile(fileparts(mfilename('fullpath')),'test-results');
    if ~exist(outDir,'dir'), mkdir(outDir); end
    save(fullfile(outDir, sprintf('dma_tap%d_%s.mat', tapIdx, lower(strrep(TAPS{tapIdx+1},'-','_')))), ...
        'iq','data','dp','de','hwBer','tapIdx');

    % For post-AGC tap, run full chain (MF → SS → CS → demod → descramble)
    if tapIdx == 0
        sim_results = run_matlab_chain(iq, C, msg);
        fprintf('  MATLAB chain BER: %.4f%% (%d packets decoded)\n', ...
            sim_results.ber*100, sim_results.npackets);
        results.tap0_chain = sim_results;
    end
    % For post-CS tap (tap 2), data is already at symbol decisions
    if tapIdx == 2
        sim_results = run_symbol_decode(iq, msg);
        fprintf('  Symbol-level BER (no SS, no CS in MATLAB): %.4f%% (%d packets)\n', ...
            sim_results.ber*100, sim_results.npackets);
        results.tap2_chain = sim_results;
    end

    results.(sprintf('tap%d', tapIdx)) = struct('hwBer', hwBer, 'dp', dp, 'de', de, ...
        'meanMag', mean(abs(iq)), 'stdMag', std(abs(iq)));
end

% Reset to post-AGC tap and exit
BistRegisters.write(AxiMuxSelect, 0, SSH);

fprintf('\n========== SUMMARY ==========\n');
for tapIdx = 0:3
    f = sprintf('tap%d', tapIdx);
    if isfield(results, f) && isfield(results.(f),'hwBer')
        r = results.(f);
        fprintf('  Tap %d (%-13s): HW BER=%.4f%% over %d packets, |s|=%.3f±%.3f\n', ...
            tapIdx, TAPS{tapIdx+1}, r.hwBer, r.dp, r.meanMag, r.stdMag);
    end
end


%% ---- Helper functions ----

function res = run_matlab_chain(iq_v, C, msg)
% Full chain: MF + SymbolSync + CarrierSynchronizer + hard-decode + descramble
poly = [1 0 0 1 0 0 0];
res.ber = NaN; res.npackets = 0;

% Filter zero samples (valid-gated)
iq_v = iq_v(abs(iq_v) > 0.01);
if numel(iq_v) < 200, return; end

mf = conv(iq_v(:), C.RRCCoef(:), 'same');
mf = mf / rms(mf);

% Pick the SPS that decodes best. AGC may be at sps=4 (Rx internal 7.68M) or
% sps=8 (ADC rate 15.36M) depending on how the chain plumbed valid.
bestBer = 1; bestNp = 0;
for sps_try = [4 8 2]
    try
        ss = comm.SymbolSynchronizer( ...
            'TimingErrorDetector','Gardner (non-data-aided)', ...
            'SamplesPerSymbol', sps_try, ...
            'NormalizedLoopBandwidth', 0.01);
        sym = ss(mf);
    catch, continue;
    end
    if numel(sym) < 200, continue; end
    sym = sym / sqrt(mean(abs(sym).^2));

    cs = comm.CarrierSynchronizer('Modulation','QPSK','SamplesPerSymbol',1, ...
        'NormalizedLoopBandwidth', 0.01);
    sym = cs(sym);
    sym = sym / sqrt(mean(abs(sym).^2));

    % Sweep phase rotations and bit ordering, pick min BER
    for rot_idx = 0:3
        sr = sym * exp(1j*pi/2*rot_idx);
        for swap_bits = [false true]
            b = pskdemod(sr,4,pi/4,'gray');
            bits = zeros(2*numel(b),1);
            if ~swap_bits
                bits(1:2:end) = floor(b/2); bits(2:2:end) = mod(b,2);
            else
                bits(1:2:end) = mod(b,2); bits(2:2:end) = floor(b/2);
            end
            bits = logical(bits(:).');
            for initState = [bin2dec('1011101') 0 127]
                st_bits = bitget(initState, 7:-1:1);
                st = st_bits(:).';
                out = false(1, numel(bits));
                for i = 1:numel(bits)
                    bb = mod(sum(st(logical(poly))), 2);
                    out(i) = xor(bits(i), bb);
                    st = [st(2:end) bb];
                end
                % Slide msg through descrambled stream, count packets, average BER.
                L = numel(msg); N = numel(out);
                if N < L, continue; end
                err_count = zeros(1, N-L+1);
                for k = 0:(N-L)
                    err_count(k+1) = sum(out(k+1:k+L) ~= msg);
                end
                % Identify "packets": local minima below some threshold
                % (packets are spaced ~560 symbols apart × 2 bits/sym = 1120 bits.)
                pkts = find(err_count < 30);  % matches within 25% error
                if isempty(pkts), continue; end
                berThis = mean(err_count(pkts))/L;
                if berThis < bestBer || (berThis == bestBer && numel(pkts) > bestNp)
                    bestBer = berThis;
                    bestNp = numel(pkts);
                end
            end
        end
    end
end
res.ber = bestBer; res.npackets = bestNp;
end

function res = run_symbol_decode(iq_v, msg)
% At post-CS tap, samples should be at symbol decisions. Just demod + descramble.
poly = [1 0 0 1 0 0 0];
res.ber = NaN; res.npackets = 0;

iq_v = iq_v(abs(iq_v) > 0.01);
if numel(iq_v) < 100, return; end
sym = iq_v / sqrt(mean(abs(iq_v).^2));

bestBer = 1; bestNp = 0;
for rot_idx = 0:3
    sr = sym * exp(1j*pi/2*rot_idx);
    for swap_bits = [false true]
        b = pskdemod(sr,4,pi/4,'gray');
        bits = zeros(2*numel(b),1);
        if ~swap_bits
            bits(1:2:end) = floor(b/2); bits(2:2:end) = mod(b,2);
        else
            bits(1:2:end) = mod(b,2); bits(2:2:end) = floor(b/2);
        end
        bits = logical(bits(:).');
        for initState = [bin2dec('1011101') 0 127]
            st_bits = bitget(initState, 7:-1:1);
            st = st_bits(:).';
            out = false(1, numel(bits));
            for i = 1:numel(bits)
                bb = mod(sum(st(logical(poly))), 2);
                out(i) = xor(bits(i), bb);
                st = [st(2:end) bb];
            end
            L = numel(msg); N = numel(out);
            if N < L, continue; end
            err_count = zeros(1, N-L+1);
            for k = 0:(N-L)
                err_count(k+1) = sum(out(k+1:k+L) ~= msg);
            end
            pkts = find(err_count < 30);
            if isempty(pkts), continue; end
            berThis = mean(err_count(pkts))/L;
            if berThis < bestBer
                bestBer = berThis; bestNp = numel(pkts);
            end
        end
    end
end
res.ber = bestBer; res.npackets = bestNp;
end
