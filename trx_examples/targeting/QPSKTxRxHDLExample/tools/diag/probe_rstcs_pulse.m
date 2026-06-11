%% probe_rstcs_pulse — pulse rstCS at intervals during cable loopback
%   Tests whether periodic carrier-sync resets reduce BER (the 1.37% may
%   be steady-state drift between preamble re-locks).

cd(fileparts(mfilename('fullpath')));
addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file') == 2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI = 'ip:10.0.0.146';
SSH = 8;
AxiPackets = '0x9D000104';
AxiErrors  = '0x9D000108';
AxiRstCS   = '0x9D000110';
AxiRxSel   = '0x9D000114';
BitsPerPacket = 2240;

%% Reboot
BistRegisters.sshExec('(sleep 1; reboot) >/dev/null 2>&1 &', SSH);
t0 = tic;
while toc(t0) < 180
    pause(5);
    [rc,~] = BistRegisters.sshExec('true', SSH);
    if rc == 0, pause(3); [rc2,~] = BistRegisters.sshExec('true', SSH); if rc2==0, break; end; end
end
fprintf('board up\n');

%% Setup chip
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

%% Switch to cable
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1', AxiRxSel), SSH);
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
pause(3);

%% Measure 1s windows with rstCS pulse every 1s
fprintf('\n--- 30×1s windows with rstCS pulse between each ---\n');
all_dp = []; all_de = [];
p_prev = double(BistRegisters.read(AxiPackets, SSH));
e_prev = double(BistRegisters.read(AxiErrors, SSH));
for t = 1:30
    pause(1);
    p = double(BistRegisters.read(AxiPackets, SSH));
    e = double(BistRegisters.read(AxiErrors, SSH));
    dp = p-p_prev; de = e-e_prev;
    if dp>0, ber=100*de/(dp*BitsPerPacket); else ber=NaN; end
    fprintf('  t=%2ds  packets+=%-5d errors+=%-6d BER=%.4f%%\n', t, dp, de, ber);
    all_dp(end+1) = dp; all_de(end+1) = de;
    p_prev = p; e_prev = e;
    % rstCS pulse
    BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
end
tot_p = sum(all_dp); tot_e = sum(all_de);
fprintf('\nCUMULATIVE: packets=%d errors=%d BER=%.4f%%\n', tot_p, tot_e, 100*tot_e/(tot_p*BitsPerPacket));

% Best 1s window
[best_ber, idx] = min(100*all_de./(all_dp*BitsPerPacket+1e-9));
fprintf('Best 1s window: t=%ds, BER=%.4f%% (%d pkts)\n', idx, best_ber, all_dp(idx));

%% Restore
BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', AxiRxSel), SSH);
try, release(tx); catch, end
try, release(rx); catch, end
fprintf('\n=== done ===\n');
