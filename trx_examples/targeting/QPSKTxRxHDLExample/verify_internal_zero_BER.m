%% verify_internal_zero_BER  --  Phase 3.2 acceptance
%
% Pre-requisite: deploy composite_internal_zero_BER (FIX) BOOT.BIN to
% root@10.0.0.146 BEFORE running this script.
%
% This script:
%   1) Sets rx_input_select=0 (internal Tx-loopback), measures BER over
%      60 s. PASS if delta_errors == 0 AND delta_bits >= 50,000.
%   2) Sets rx_input_select=1 (cable), measures BER over 60 s. PASS if
%      cable BER in [1.0%, 1.7%] (Δ ≤ ±0.3% from documented 1.37%).
%   3) Emits test-results/verify_internal_zero_BER.json and a one-line
%      PASS/FAIL verdict.

cd(fileparts(mfilename('fullpath')));
addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file') == 2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI         = 'ip:10.0.0.146';
SSH         = 8;
AxiPackets  = '0x9D000104';
AxiErrors   = '0x9D000108';
AxiRxSel    = '0x9D000114';
BitsPerPkt  = 2240;
WindowSec   = 60;
SettleSec   = 5;
MinBits     = 50000;
CableBerLo  = 1.0;
CableBerHi  = 1.7;

[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc == 0, 'Jupiter at 10.0.0.146 not reachable');

% --- internal-loopback BER ---
fprintf('--- INTERNAL LOOPBACK (rx_input_select=0) ---\n');
BistRegisters.write(AxiRxSel, 0, SSH);
pause(SettleSec);
p0 = double(BistRegisters.read(AxiPackets, SSH));
e0 = double(BistRegisters.read(AxiErrors,  SSH));
fprintf('  baseline:  packets=%d errors=%d\n', p0, e0);
fprintf('  measuring %d s window...\n', WindowSec);
pause(WindowSec);
p1 = double(BistRegisters.read(AxiPackets, SSH));
e1 = double(BistRegisters.read(AxiErrors,  SSH));
dp_int = p1 - p0; de_int = e1 - e0; bits_int = dp_int * BitsPerPkt;
if bits_int > 0
    ber_int = 100 * de_int / bits_int;
else
    ber_int = NaN;
end
fprintf('  delta:     packets=%d errors=%d bits=%d  BER=%.6f%%\n', dp_int, de_int, bits_int, ber_int);
pass_int = (de_int == 0) && (bits_int >= MinBits);
fprintf('  INTERNAL %s\n\n', cond(pass_int, 'PASS', 'FAIL'));

% --- cable-loopback regression ---
fprintf('--- CABLE LOOPBACK (rx_input_select=1) ---\n');
% Configure ADRV9002 (necessary for cable mode to have a signal)
try
    tx = adi.ADRV9002.Tx('uri', URI);
    tx.EnabledChannels = 1;
    tx.CenterFrequencyChannel0 = 2.4e9;
    tx.AttenuationChannel0 = 0;
    tx.DataSource = 'DMA';
    tx.EnableCyclicBuffers = true;
    tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));
    rx = adi.ADRV9002.Rx('uri', URI);
    rx.EnabledChannels = 1;
    rx.CenterFrequencyChannel0 = 2.4e9;
    setup(rx);
    pause(2);
catch e
    fprintf('  warn: ADRV9002 setup failed: %s\n', e.message);
end
BistRegisters.write(AxiRxSel, 1, SSH);
pause(SettleSec);
p2 = double(BistRegisters.read(AxiPackets, SSH));
e2 = double(BistRegisters.read(AxiErrors,  SSH));
fprintf('  baseline:  packets=%d errors=%d\n', p2, e2);
fprintf('  measuring %d s window...\n', WindowSec);
pause(WindowSec);
p3 = double(BistRegisters.read(AxiPackets, SSH));
e3 = double(BistRegisters.read(AxiErrors,  SSH));
dp_cab = p3 - p2; de_cab = e3 - e2; bits_cab = dp_cab * BitsPerPkt;
if bits_cab > 0
    ber_cab = 100 * de_cab / bits_cab;
else
    ber_cab = NaN;
end
fprintf('  delta:     packets=%d errors=%d bits=%d  BER=%.4f%%\n', dp_cab, de_cab, bits_cab, ber_cab);
pass_cab = (~isnan(ber_cab)) && (ber_cab >= CableBerLo) && (ber_cab <= CableBerHi);
fprintf('  CABLE %s (must be in [%.1f%%, %.1f%%])\n\n', cond(pass_cab, 'PASS', 'FAIL'), CableBerLo, CableBerHi);

% restore internal mode (the operating default for this branch)
BistRegisters.write(AxiRxSel, 0, SSH);
try, release(tx); catch, end
try, release(rx); catch, end

% verdict
verdict = pass_int && pass_cab;
fprintf('================================================\n');
fprintf('OVERALL %s   (internal=%s, cable=%s)\n', cond(verdict,'PASS','FAIL'), cond(pass_int,'OK','FAIL'), cond(pass_cab,'OK','FAIL'));
fprintf('================================================\n');

% JSON
outDir = fullfile(fileparts(mfilename('fullpath')), 'test-results');
if ~exist(outDir, 'dir'), mkdir(outDir); end
out = struct();
out.internal = struct('rxInputSelect',0,'deltaPackets',dp_int,'deltaErrors',de_int,'deltaBits',bits_int,'berPct',ber_int,'pass',pass_int);
out.cable    = struct('rxInputSelect',1,'deltaPackets',dp_cab,'deltaErrors',de_cab,'deltaBits',bits_cab,'berPct',ber_cab,'pass',pass_cab);
out.windowSec = WindowSec;
out.overallPass = verdict;
fid = fopen(fullfile(outDir,'verify_internal_zero_BER.json'),'w');
fprintf(fid, '%s', jsonencode(out));
fclose(fid);

function s = cond(b, t, f)
    if b, s=t; else, s=f; end
end
