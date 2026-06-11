%% probe_atten_sweep2 — sweep tx atten WITHOUT release(tx) between steps

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

%% Setup chip ONCE at atten=0
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

%% Baseline @ rx_input_select=0
p0 = double(BistRegisters.read(AxiPackets, SSH));
e0 = double(BistRegisters.read(AxiErrors, SSH));
pause(3);
p1 = double(BistRegisters.read(AxiPackets, SSH));
e1 = double(BistRegisters.read(AxiErrors, SSH));
fprintf('baseline (rx_sel=0): packets+=%d BER=%.3f%%\n', p1-p0, 100*(e1-e0)/max((p1-p0)*BitsPerPacket,1));

%% Switch to cable loopback, sweep atten via direct setter (no release)
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1', AxiRxSel), SSH);
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
pause(5);

% libiio writes Atten directly via setAttribute*; no release needed.
atten_list = [0, -3, -6, -10, -15, -20];
fprintf('\natten   packets/10s  errors      BER%%\n');
for k = 1:numel(atten_list)
    a = atten_list(k);
    tx.AttenuationChannel0 = a;
    BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
    pause(4);
    p0 = double(BistRegisters.read(AxiPackets, SSH));
    e0 = double(BistRegisters.read(AxiErrors, SSH));
    pause(10);
    p1 = double(BistRegisters.read(AxiPackets, SSH));
    e1 = double(BistRegisters.read(AxiErrors, SSH));
    dp = p1-p0; de = e1-e0;
    if dp>0, ber=100*de/(dp*BitsPerPacket); else ber=NaN; end
    fprintf('%-5d   %-11d  %-10d  %.4f\n', a, dp, de, ber);
end

%% Restore
BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', AxiRxSel), SSH);
try, release(tx); catch, end
try, release(rx); catch, end
fprintf('\n=== done ===\n');
