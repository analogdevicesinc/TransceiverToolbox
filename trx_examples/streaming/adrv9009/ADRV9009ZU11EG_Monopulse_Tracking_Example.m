clear all; close all;

%% Configuration parameters
uri = 'ip:analog';
lo_freq = 5400000000 - 300000;
tx_sine_baseband_freq = 300000;
lambda_over_d_spacing = 1.93;
sample_rate = 122880000;
number_periods_sine_baseband = 12;
num_samps = round((number_periods_sine_baseband * sample_rate) / tx_sine_baseband_freq);
used_rx_channels = 4;
rx_channels_used = [1, 2, 3, 4];
rx_gain = 30;
phase_step = 3;
tracking_length = 200;

%% Rx set up
rx = adi.ADRV9009ZU11EG.Rx;
rx.uri = uri;
rx.CenterFrequency = lo_freq;
rx.CenterFrequencyChipB = lo_freq;
rx.EnabledChannels = rx_channels_used; 
rx.SamplesPerFrame = num_samps;
rx.GainControlMode = 'manual';
rx.GainControlModeChipB = 'manual';
rx.GainChannel0 = rx_gain;
rx.GainChannel1 = rx_gain;
rx.GainChannel0ChipB = rx_gain;
rx.GainChannel1ChipB = rx_gain;
rx.EnableCustomProfile = true;
rx.CustomProfileFileName = ...
    'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_ADRV9009.txt';

%% Boresight Calibration
disp('==================================================');
disp('BORESIGHT CALIBRATION');
disp('Place the transmitting antenna at BORESIGHT (0 degrees)');
input('Press Enter when ready...');

% Phase Calibration
disp('Performing phase calibration...');
repeat_ph_calculations = 10;
num_channels = used_rx_channels - 1; % Exclude reference channel 0
phase_diffs = zeros(num_channels, repeat_ph_calculations);

for iteration = 1:repeat_ph_calculations
    rx_samples = rx();

    % Measure phase difference between ch0 and other channels
    for ch = 2:used_rx_channels
        errorV = angle(rx_samples(:,1) .* conj(rx_samples(:,ch))) * 180 / pi;
        phase_diffs(ch-1, iteration) = mean(errorV);
    end
    fprintf('Iteration %d complete\n', iteration);
end

% Calculate average phase differences
pcal = mean(phase_diffs, 2)'; % Average across iterations
disp(['Phase calibration coefficients (pcal): ', num2str(pcal)]);

%% Gain Calibration
disp('Performing gain calibration...');
rx_samples = rx();

% Measure amplitudes from each channel
amplitudes = max(abs(rx_samples));

% Calculate gain coefficients relative to max amplitude channel
[max_amplitude, max_idx] = max(amplitudes);
gcal = max_amplitude ./ amplitudes;
gcal(max_idx) = 1.0;

disp(['Amplitude values: ', num2str(amplitudes)]);
disp(['Gain calibration coefficients (gcal): ', num2str(gcal)]);

disp('==================================================');

%% Setup Beamforming Constants
phase_cal = [0, pcal(1), pcal(2), pcal(3)];
elem_spacing = (3e8/(lo_freq + tx_sine_baseband_freq))/(lambda_over_d_spacing);
disp(['Element spacing of: ', num2str(elem_spacing), ' meters']);
disp(['Number of elements: ', num2str(used_rx_channels)]);
signal_freq = lo_freq;

%% Initial Scan
phases_to_sweep = -360/lambda_over_d_spacing : 2 : 360/lambda_over_d_spacing;
num_sweep = length(phases_to_sweep);
powers = zeros(1, num_sweep);
angle_of_arrivals = zeros(1, num_sweep);
phase_angles = zeros(1, num_sweep);

disp('Receiving initial samples for sweep...');
receive_samples = rx();

% Apply gain calibration ONCE before sweep
receive_samples = receive_samples .* gcal;

% Apply boresight phase calibration (phase=0) to align channels
channel_phases = mod(phase_cal(2:end), 360.0);
channel_phases_rad = deg2rad(channel_phases);
receive_samples(:, 2:end) = receive_samples(:, 2:end) .* exp(1j * channel_phases_rad);

% Sweep over angle
sweep_idx = 0;
for phase = phases_to_sweep
    sweep_idx = sweep_idx + 1;
    rx_samps = receive_samples; % Copy the received samples
    
    % Apply Phase Steering on top of boresight calibration
    idx = 0:used_rx_channels-1;
    steering_phases = mod(phase * idx, 360.0);
    steering_phases_rad = deg2rad(steering_phases);
    rx_samps = rx_samps .* exp(1j * steering_phases_rad);
    
    % Steer Angle Calculation
    val = (3e8 * deg2rad(phase)) / (2 * pi * signal_freq * elem_spacing);
    val = max(min(val, 1), -1);
    steer_angle = rad2deg(asin(val));
    angle_of_arrivals(sweep_idx) = steer_angle;
    phase_angles(sweep_idx) = phase;
    
    % Sum beam
    data_sum = sum(rx_samps, 2);
    power_dB = 10*log10(sum(abs(data_sum).^2));
    powers(sweep_idx) = power_dB;
end

powers = powers - max(powers);
[~, max_idx] = max(powers);
current_phase = phase_angles(max_idx);
max_angle = angle_of_arrivals(max_idx);

disp(['Initial estimated angle: ', num2str(max_angle)]);

%% Plot
figure(1);
clf;
hAx = axes;
% Plot angle history against time index
% X-axis: Angle (-30 to 30), Y-axis: Time/Sample (0 to 200)
hLine = plot(hAx, NaN, NaN);
title('Monopulse Tracking:  Angle vs Time');
xlabel('Steering Angle (deg)');
ylabel('Time Step');
xlim([-30, 30]);
ylim([0, tracking_length]);
grid on;

tracking_angles = ones(1, tracking_length) * 180;
tracking_angles(1:end-1) = -180;

% Initial plot update
set(hLine, 'XData', tracking_angles, 'YData', 1:tracking_length);
drawnow;

%% Tracking Loop
try
    disp('Starting tracking loop. Press Ctrl+C to stop.');
    while true
        % Receive samples
        data = rx();
                
        % Apply Gain calibration
        data = data .* gcal;

        % Apply boresight phase calibration first
        channel_phases = mod(phase_cal(2:end), 360.0);
        channel_phases_rad = deg2rad(channel_phases);
        data(:, 2:end) = data(:, 2:end) .* exp(1j * channel_phases_rad);

        % Apply steering phase on top of boresight calibration
        idx = 0:used_rx_channels-1;
        steering_phases = mod(current_phase * idx, 360.0);
        steering_phases_rad = deg2rad(steering_phases);
        data = data .* exp(1j * steering_phases_rad);
        
        % Sum and Delta Beams
        % Sum: ch0+ch1+ch2+ch3
        % Delta: (ch0+ch1)-(ch2+ch3)
        sum_beam = data(:,1) + data(:,2) + data(:,3) + data(:,4);
        delta_beam = (data(:,1) + data(:,2)) - (data(:,3) + data(:,4));
        
        % Correlation
        sum_delta_correlation = sum(sum_beam .* conj(delta_beam));
        
        err_val = angle(sum_delta_correlation);

        if sign(err_val) > 0
            current_phase = current_phase - phase_step;
        else
            current_phase = current_phase + phase_step;
        end
        
        % Update estimated angle
        val = (3e8 * deg2rad(current_phase)) / (2 * pi * signal_freq * elem_spacing);
        val = max(min(val, 1), -1);
        steer_angle = rad2deg(asin(val));
        
        % Update History
        tracking_angles = [tracking_angles(2:end), steer_angle];

        set(hLine, 'XData', tracking_angles, 'YData', 1:tracking_length);
        drawnow limitrate;
    end
catch ME
    disp('Loop stopped or error occurred.');
    disp(ME.message);
end

%% Cleanup
release(rx);
