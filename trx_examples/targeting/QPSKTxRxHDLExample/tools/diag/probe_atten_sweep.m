%% probe_atten_sweep — sweep Tx attenuation, find lowest BER on cable loopback

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

%% Reboot once for clean state
[rc,~] = BistRegisters.sshExec('true', SSH);
assert(rc==0, 'Jupiter unreachable');
BistRegisters.sshExec('(sleep 1; reboot) >/dev/null 2>&1 &', SSH);
fprintf('rebooting...\n');
t0 = tic;
while toc(t0) < 180
    pause(5);
    [rc,~] = BistRegisters.sshExec('true', SSH);
    if rc == 0, pause(3); [rc2,~] = BistRegisters.sshExec('true', SSH); if rc2==0, break; end; end
end
fprintf('board back up.\n');

%% Set up Tx once (atten will be changed per sweep step)
tx = adi.ADRV9002.Tx('uri', URI);
tx.EnabledChannels = 1;
tx.CenterFrequencyChannel0 = 2.4e9;
tx.AttenuationChannel0 = 0;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
try, tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16'))); catch, end

rx = adi.ADRV9002.Rx('uri', URI);
rx.EnabledChannels = 1;
rx.CenterFrequencyChannel0 = 2.4e9;
try, setup(rx); catch ME, warning('%s', ME.message); end

pause(2);

%% Activate cable loopback once
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1', AxiRxSel), SSH);

%% Sweep attenuation
atten_list = [0, -3, -6, -10, -15, -20, -25, -30];
results = struct('atten',{},'packets',{},'errors',{},'ber',{});
for k = 1:numel(atten_list)
    a = atten_list(k);
    % set atten -- may need release-reset
    try
        release(tx);
        tx.AttenuationChannel0 = a;
        tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));
    catch ME
        warning('set atten %d failed: %s', a, ME.message);
    end
    % rstCS pulse to nudge carrier sync
    BistRegisters.sshExec(sprintf('busybox devmem %s 32 1; busybox devmem %s 32 0', AxiRstCS, AxiRstCS), SSH);
    pause(3);  % settle

    % 10s window
    p0 = double(BistRegisters.read(AxiPackets, SSH));
    e0 = double(BistRegisters.read(AxiErrors, SSH));
    pause(10);
    p1 = double(BistRegisters.read(AxiPackets, SSH));
    e1 = double(BistRegisters.read(AxiErrors, SSH));
    dp = p1 - p0; de = e1 - e0;
    if dp > 0, ber = 100*de/(dp*BitsPerPacket); else ber = NaN; end
    fprintf('atten=%-4d  packets=%-7d errors=%-8d BER=%.4f%%\n', a, dp, de, ber);
    results(end+1) = struct('atten',a,'packets',dp,'errors',de,'ber',ber); %#ok<SAGROW>
end

%% Restore
BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', AxiRxSel), SSH);
try, release(tx); catch, end
try, release(rx); catch, end

%% Summary
fprintf('\n=== sweep summary ===\n');
[~, idx] = min([results.ber]);
fprintf('best: atten=%d dB -> BER=%.4f%% over %d packets\n', ...
        results(idx).atten, results(idx).ber, results(idx).packets);
save('probe_atten_sweep.mat', 'results');
fprintf('\n=== done ===\n');
