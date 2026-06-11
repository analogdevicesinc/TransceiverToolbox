%% probe_query_rates — read ADRV9002 Tx + Rx sample rates after setup
cd(fileparts(mfilename('fullpath')));
addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file') == 2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI = 'ip:10.0.0.146';

tx = adi.ADRV9002.Tx('uri', URI);
tx.EnabledChannels = 1;
tx.CenterFrequencyChannel0 = 2.4e9;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
try, tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16'))); catch, end

rx = adi.ADRV9002.Rx('uri', URI);
rx.EnabledChannels = 1;
rx.CenterFrequencyChannel0 = 2.4e9;
try, setup(rx); catch, end

pause(2);

fprintf('=== ADRV9002 sample rates ===\n');
try, fprintf('  tx.SamplingRate = %g Hz\n', tx.SamplingRate); catch ME, fprintf('  tx.SamplingRate ERR: %s\n', ME.message); end
try, fprintf('  rx.SamplingRate = %g Hz\n', rx.SamplingRate); catch ME, fprintf('  rx.SamplingRate ERR: %s\n', ME.message); end
fprintf('  HDL design rate = 15360000 Hz\n');

% Also dump some chip device attributes for sanity
try
    fprintf('\n=== Tx attributes ===\n');
    fprintf('  CF        = %g\n', tx.CenterFrequencyChannel0);
    fprintf('  Atten     = %g\n', tx.AttenuationChannel0);
catch
end
try
    fprintf('\n=== Rx attributes ===\n');
    fprintf('  CF        = %g\n', rx.CenterFrequencyChannel0);
catch
end

try, release(tx); catch, end
try, release(rx); catch, end
fprintf('\n=== done ===\n');
