%% probe_capture_rx_samples - capture ADC samples to see what's actually on the cable
%   Confirms: with rx_input_select=1 and HDL Tx feeding DAC, what does the ADC see?

cd(fileparts(mfilename('fullpath')));
addpath(pwd);
tbxRoot = fileparts(fileparts(fileparts(pwd)));
if exist(fullfile(tbxRoot,'setup.m'),'file') == 2, run(fullfile(tbxRoot,'setup.m')); end
addpath(tbxRoot);

URI = 'ip:10.0.0.146';
SSH = 8;
AxiRxSel = '0x9D000114';

% Tx setup
tx = adi.ADRV9002.Tx('uri', URI);
tx.EnabledChannels = 1;
tx.CenterFrequencyChannel0 = 2.4e9;
tx.AttenuationChannel0 = 0;   % MAX power (was -30 default)
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
try, tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16'))); catch, end
fprintf('Tx armed @ 2.4 GHz, atten=0 dB (max power).\n');

% Rx setup
rx = adi.ADRV9002.Rx('uri', URI);
rx.EnabledChannels = 1;
rx.CenterFrequencyChannel0 = 2.4e9;
rx.SamplesPerFrame = 32768;
try, setup(rx); catch ME, warning('rx setup: %s', ME.message); end
fprintf('Rx setup, SamplesPerFrame=32768.\n');

% Note: with rx_input_select=0, the ADC samples are NOT going to libiio --
% they go to the HDL Receiver path. But there might still be a DMA tap.
% First test: with rx_input_select=0 (boot default), capture rx.
fprintf('\n--- Capture with rx_input_select=0 (HDL internal loopback) ---\n');
try
    data0 = rx();
    fprintf('  got %d samples, |Z|: mean=%.1f max=%.1f min=%.1f\n', ...
            numel(data0), mean(abs(data0)), max(abs(data0)), min(abs(data0)));
catch ME
    fprintf('  rx capture failed: %s\n', ME.message);
end

% Now flip rx_input_select=1 and capture
fprintf('\n--- Flip rx_input_select=1, capture ADC samples ---\n');
BistRegisters.sshExec(sprintf('busybox devmem %s 32 1', AxiRxSel), SSH);
pause(2);
try
    data1 = rx();
    fprintf('  got %d samples, |Z|: mean=%.1f max=%.1f min=%.1f\n', ...
            numel(data1), mean(abs(data1)), max(abs(data1)), min(abs(data1)));
    % Save to mat
    save('rx_capture_rxsel1.mat', 'data1');
    fprintf('  saved to rx_capture_rxsel1.mat\n');
    % Spectral content via FFT magnitude
    N = numel(data1);
    Y = fftshift(fft(double(data1)));
    fs = 15.36e6;
    fbins = (-N/2:N/2-1)*fs/N;
    [pk, idx] = max(abs(Y));
    fprintf('  peak |FFT|=%.0f at f=%.0f Hz\n', pk, fbins(idx));
    % Top 5 peaks
    [vals, ords] = sort(abs(Y), 'descend');
    fprintf('  top 5 peaks: ');
    for i = 1:5
        fprintf(' %.0f Hz=%.0f', fbins(ords(i)), vals(i));
    end
    fprintf('\n');
catch ME
    fprintf('  rx capture failed: %s\n', ME.message);
end

% Restore
BistRegisters.sshExec(sprintf('busybox devmem %s 32 0', AxiRxSel), SSH);
try, release(tx); catch, end
try, release(rx); catch, end
fprintf('\n=== done ===\n');
