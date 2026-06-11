%% probe_cfoffset — composite cable loopback with Tx CF offset
%   tx_cf_offset_hz from arg; rx stays at 2.4 GHz. 60s BER window.
%   Pass offset via Hz_offset variable in caller.

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

if ~exist('Hz_offset','var'), Hz_offset = 1e6; end
if ~exist('atten_db','var'), atten_db = 0; end
fprintf('=== probe_cfoffset: Tx CF = 2.4 GHz + %.0f Hz, Tx atten=%d dB, Rx CF = 2.4 GHz ===\n', Hz_offset, atten_db);

%% Reboot
BistRegisters.sshExec('(sleep 1; reboot) >/dev/null 2>&1 &', SSH);
t0 = tic;
while toc(t0) < 180
    pause(5);
    [rc,~] = BistRegisters.sshExec('true', SSH);
    if rc == 0, pause(3); [rc2,~] = BistRegisters.sshExec('true', SSH); if rc2==0, break; end; end
end
fprintf('board up at %.0fs\n', toc(t0));

%% Tx setup -- with CF offset
tx = adi.ADRV9002.Tx('uri', URI);
tx.EnabledChannels = 1;
tx.CenterFrequencyChannel0 = 2.4e9 + Hz_offset;
tx.AttenuationChannel0 = atten_db;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));

%% Rx setup
rx = adi.ADRV9002.Rx('uri', URI);
rx.EnabledChannels = 1;
rx.CenterFrequencyChannel0 = 2.4e9;
if ~exist('rx_iface_gain','var'), rx_iface_gain = '0dB'; end
if ~exist('rx_atten','var'), rx_atten = 3; end
rx.InterfaceGainChannel0 = rx_iface_gain;
rx.AttenuationChannel0 = rx_atten;
setup(rx);
pause(2);
fprintf('  tx.CF=%g Hz, rx.CF=%g Hz, tx.Atten=%g dB, rx.IFGain=%s, rx.Atten=%g\n', ...
        tx.CenterFrequencyChannel0, rx.CenterFrequencyChannel0, tx.AttenuationChannel0, ...
        rx_iface_gain, rx_atten);

%% Baseline
p0 = double(BistRegisters.read(AxiPackets, SSH));
e0 = double(BistRegisters.read(AxiErrors, SSH));
pause(3);
p1 = double(BistRegisters.read(AxiPackets, SSH));
e1 = double(BistRegisters.read(AxiErrors, SSH));
fprintf('baseline (rx_sel=0): packets+=%d BER=%.3f%%\n', p1-p0, 100*(e1-e0)/max((p1-p0)*BitsPerPacket,1));

%% Cable loopback, 60s
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1', AxiRxSel), SSH);
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
pause(5);

fprintf('\n--- cable loopback 60s, Tx CF offset=%.0f Hz ---\n', Hz_offset);
p_prev = double(BistRegisters.read(AxiPackets, SSH));
e_prev = double(BistRegisters.read(AxiErrors, SSH));
all_dp = []; all_de = [];
for t = 1:6
    pause(10);
    p = double(BistRegisters.read(AxiPackets, SSH));
    e = double(BistRegisters.read(AxiErrors, SSH));
    dp = p-p_prev; de = e-e_prev;
    if dp>0, ber=100*de/(dp*BitsPerPacket); else ber=NaN; end
    fprintf('  t=%2ds packets+=%-7d errors+=%-8d BER=%.4f%%\n', t*10, dp, de, ber);
    all_dp(end+1) = dp; all_de(end+1) = de; %#ok<SAGROW>
    p_prev = p; e_prev = e;
end
tot_p = sum(all_dp); tot_e = sum(all_de);
fprintf('\nCUMULATIVE: packets=%d errors=%d BER=%.4f%%\n', tot_p, tot_e, 100*tot_e/(tot_p*BitsPerPacket));

%% Restore
BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', AxiRxSel), SSH);
try, release(tx); catch, end
try, release(rx); catch, end
fprintf('\n=== done ===\n');
