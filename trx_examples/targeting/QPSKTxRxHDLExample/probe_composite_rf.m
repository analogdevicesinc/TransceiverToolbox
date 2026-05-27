%% probe_composite_rf — manual real-RF probe of composite-α
%   1. Configure ADRV9002 Tx+Rx via libiio
%   2. Set rx_input_select=1
%   3. Read BIST over 20s windows
%   4. Reset to rx_input_select=0 at the end
%
%   Goal: BER < 1% over >= 50,000 packets on DAC->cable->ADC path.

cd(fileparts(mfilename('fullpath')));
addpath(pwd);

% Put toolkit on path so adi.ADRV9002.Tx/Rx and BistRegisters resolve.
% setup.m only adds hdl/ + trx_examples/. The +adi package needs its
% parent directory on the path -- add the toolbox root explicitly.
tbxRoot = fileparts(fileparts(fileparts(pwd)));
setupM = fullfile(tbxRoot, 'setup.m');
if exist(setupM,'file') == 2, run(setupM); end
addpath(tbxRoot);    % so +adi is found
if exist(fullfile(tbxRoot,'deps'),'dir')
    addpath(fullfile(tbxRoot,'deps'));    % libad9361 (only needed for AD9361)
end

URI = 'ip:10.0.0.146';
SSH = 8;

AxiPackets = '0x9D000104';
AxiErrors  = '0x9D000108';
AxiRxSel   = '0x9D000114';
BitsPerPacket = 2240;

fprintf('=== probe_composite_rf ===\n');

%% Step 1: SSH check
[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc==0, 'Jupiter unreachable');
fprintf('Jupiter reachable.\n');

%% Step 2: BIST snapshot before ADRV9002 config (rx_input_select still = 0)
p0 = double(BistRegisters.read(AxiPackets, SSH));
e0 = double(BistRegisters.read(AxiErrors, SSH));
fprintf('\n[Baseline @ rx_input_select=0, no ADRV9002 host config yet]\n');
fprintf('  packets=%d errors=%d\n', p0, e0);

%% Step 3: Configure ADRV9002 Tx (DAC carrier)
fprintf('\n--- ADRV9002 Tx setup ---\n');
tx = adi.ADRV9002.Tx('uri', URI);
tx.EnabledChannels = 1;
tx.CenterFrequencyChannel0 = 2.4e9;
tx.AttenuationChannel0 = -10;          % -10 dB attenuation
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
% Push a zero buffer just to "arm" the DAC chain; actual data on the
% DAC comes from the HDL TxRxComposite/Transmitter via IP Data 0/1 OUT.
try
    tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));
    fprintf('Tx DMA armed with zero buffer.\n');
catch ME
    warning('tx push: %s', ME.message);
end

%% Step 4: Configure ADRV9002 Rx (ADC carrier)
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

pause(3);

%% Step 5: Set rx_input_select=1 (route ADC into HDL Receiver)
fprintf('\n--- flip rx_input_select 0 -> 1 ---\n');
cmd = sprintf('busybox devmem %s 32 1', AxiRxSel);
[rc,out] = BistRegisters.sshExec(cmd, SSH);
fprintf('write rx_input_select=1: rc=%d\n', rc);
pause(2);

%% Step 6: BER window over 20s
fprintf('\n--- BER window 20s @ rx_input_select=1 ---\n');
p_prev = double(BistRegisters.read(AxiPackets, SSH));
e_prev = double(BistRegisters.read(AxiErrors, SSH));
ts = tic;
for t = 1:4   % 4×5s = 20s
    pause(5);
    p = double(BistRegisters.read(AxiPackets, SSH));
    e = double(BistRegisters.read(AxiErrors, SSH));
    dp = p - p_prev; de = e - e_prev;
    bits = dp * BitsPerPacket;
    if bits > 0
        ber = 100 * de / bits;
    else
        ber = NaN;
    end
    fprintf('  t=%2ds  packets+=%-7d  errors+=%-7d  BER=%.4f%%\n', ...
            t*5, dp, de, ber);
    p_prev = p; e_prev = e;
end
fprintf('elapsed: %.1f s\n', toc(ts));

%% Step 7: Cumulative
p_end = double(BistRegisters.read(AxiPackets, SSH));
e_end = double(BistRegisters.read(AxiErrors, SSH));
dp_tot = p_end - p0; de_tot = e_end - e0;
bits_tot = dp_tot * BitsPerPacket;
if bits_tot > 0
    ber_tot = 100*de_tot/bits_tot;
else
    ber_tot = NaN;
end
fprintf('\n=== TOTALS since baseline ===\n');
fprintf('  packets : %d  (need >= 50000)\n', dp_tot);
fprintf('  errors  : %d / %d bits\n', de_tot, bits_tot);
fprintf('  BER     : %.4f%%\n', ber_tot);

%% Step 8: restore rx_input_select=0
fprintf('\n--- restore rx_input_select=0 ---\n');
BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', AxiRxSel), SSH);
try, release(tx); catch, end
try, release(rx); catch, end

fprintf('\n=== probe complete ===\n');
