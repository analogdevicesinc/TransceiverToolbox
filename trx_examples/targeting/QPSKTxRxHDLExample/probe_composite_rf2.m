%% probe_composite_rf2 — clean real-RF probe with reboot + rstCS pulse
%   Sequence:
%   1. SSH check
%   2. Reboot board (clean state)
%   3. Set up ADRV9002 Tx + Rx via libiio (BEFORE touching MUX)
%   4. Confirm boot-state BIST (rx_input_select=0) is at 0.39% baseline
%   5. Flip rx_input_select=1
%   6. Pulse rstCS to reset carrier sync after MUX flip
%   7. Read BIST over 20s windows
%   8. If still 0 packets: try Tx CF offset (LO leakage workaround)
%   9. Restore rx_input_select=0 + reset state

cd(fileparts(mfilename('fullpath')));
addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file') == 2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);
if exist(fullfile(tbxRoot,'deps'),'dir'), addpath(fullfile(tbxRoot,'deps')); end

URI = 'ip:10.0.0.146';
SSH = 8;

AxiPackets = '0x9D000104';
AxiErrors  = '0x9D000108';
AxiIqMux   = '0x9D00010C';
AxiRstCS   = '0x9D000110';
AxiRxSel   = '0x9D000114';
BitsPerPacket = 2240;

fprintf('=== probe_composite_rf2 ===\n');

%% Reboot board to clean state
fprintf('\n--- reboot board for clean state ---\n');
[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc==0, 'Jupiter unreachable');
BistRegisters.sshExec('(sleep 1; reboot) >/dev/null 2>&1 &', SSH);

% wait for board down then back up
fprintf('waiting for board...\n');
t0 = tic; ready = false;
while toc(t0) < 180
    pause(5);
    [rc,~] = BistRegisters.sshExec('true', SSH);
    if rc == 0
        % Wait one extra cycle to be sure FPGA loaded
        pause(3);
        [rc2,~] = BistRegisters.sshExec('true', SSH);
        if rc2 == 0
            ready = true;
            break;
        end
    end
end
assert(ready, 'board did not reboot in 180s');
fprintf('board back up at %.0fs\n', toc(t0));

%% Configure ADRV9002 Tx + Rx (BEFORE flipping MUX)
fprintf('\n--- ADRV9002 Tx setup ---\n');
tx = adi.ADRV9002.Tx('uri', URI);
tx.EnabledChannels = 1;
tx.CenterFrequencyChannel0 = 2.4e9;
tx.AttenuationChannel0 = -10;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
try
    tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));
    fprintf('Tx DMA armed.\n');
catch ME
    warning('tx push: %s', ME.message);
end

fprintf('\n--- ADRV9002 Rx setup ---\n');
rx = adi.ADRV9002.Rx('uri', URI);
rx.EnabledChannels = 1;
rx.CenterFrequencyChannel0 = 2.4e9;
try
    setup(rx);
    fprintf('Rx setup complete.\n');
catch ME
    warning('rx setup: %s', ME.message);
end

pause(2);

%% Confirm boot-state BIST (rx_input_select=0)
fprintf('\n--- BIST baseline @ rx_input_select=0 (5s) ---\n');
p0 = double(BistRegisters.read(AxiPackets, SSH));
e0 = double(BistRegisters.read(AxiErrors, SSH));
pause(5);
p1 = double(BistRegisters.read(AxiPackets, SSH));
e1 = double(BistRegisters.read(AxiErrors, SSH));
fprintf('  packets+=%d errors+=%d  BER=%.3f%%\n', p1-p0, e1-e0, ...
        100*(e1-e0)/max((p1-p0)*BitsPerPacket,1));

%% Flip MUX to 1, pulse rstCS, measure
fprintf('\n--- flip rx_input_select 0 -> 1 + pulse rstCS ---\n');
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1', AxiRxSel), SSH);
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
pause(3);

fprintf('\n--- BER window 4×5s @ rx_input_select=1, after rstCS pulse ---\n');
p_prev = double(BistRegisters.read(AxiPackets, SSH));
e_prev = double(BistRegisters.read(AxiErrors, SSH));
for t = 1:4
    pause(5);
    p = double(BistRegisters.read(AxiPackets, SSH));
    e = double(BistRegisters.read(AxiErrors, SSH));
    dp = p - p_prev; de = e - e_prev;
    bits = dp * BitsPerPacket;
    if bits > 0, ber = 100*de/bits; else ber = NaN; end
    fprintf('  t=%2ds packets+=%-7d errors+=%-7d BER=%.4f%%\n', t*5, dp, de, ber);
    p_prev = p; e_prev = e;
end

%% Try Tx CF offset (1 MHz) to push past LO leakage
fprintf('\n--- retry with Tx CF offset by 1 MHz ---\n');
try
    release(tx);
    tx.CenterFrequencyChannel0 = 2.401e9;
    tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));
    fprintf('Tx re-armed at 2.401 GHz.\n');
catch ME
    warning('tx CF retune: %s', ME.message);
end
% rstCS pulse again
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
pause(3);
p_prev = double(BistRegisters.read(AxiPackets, SSH));
e_prev = double(BistRegisters.read(AxiErrors, SSH));
for t = 1:4
    pause(5);
    p = double(BistRegisters.read(AxiPackets, SSH));
    e = double(BistRegisters.read(AxiErrors, SSH));
    dp = p - p_prev; de = e - e_prev;
    bits = dp * BitsPerPacket;
    if bits > 0, ber = 100*de/bits; else ber = NaN; end
    fprintf('  t=%2ds packets+=%-7d errors+=%-7d BER=%.4f%%\n', t*5, dp, de, ber);
    p_prev = p; e_prev = e;
end

%% Restore
fprintf('\n--- restore ---\n');
BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', AxiRxSel), SSH);
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
try, release(tx); catch, end
try, release(rx); catch, end

fprintf('\n=== probe complete ===\n');
