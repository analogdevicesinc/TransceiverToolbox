% clear all;

uri = 'ip:10.0.0.233';

%% Tx set up
tx = adi.ADRV9002.Tx('uri',uri);
% tx.DataSource = 'DDS';
% toneFreq = 5e5;
% tx.DDSFrequencies = repmat(toneFreq,2,2);
% tx.AttenuationChannel0 = -30;
% tx();
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx.AttenuationChannel0 = -30;

data = load('tx_capture.mat');
x = data.tx_capture.Data;

if length(x) > 2^20
    x = x(1:2^20);
end

tx(x);
pause(3);

%% Rx set up
rx = adi.ADRV9002.Rx('uri',uri);
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;
rx.CenterFrequencyChannel0 = tx.CenterFrequencyChannel0 + 1e3;
rx.SamplesPerFrame = 2^20;

%% Run
for k=1:20
    valid = false;
    while ~valid
        [y, valid] = rx();
    end
end
tx.release();
rx.release();

figure(1); 
plot(0:numel(y)-1, real(y), 'r', 0:numel(y)-1, imag(y), 'b'); 
xlim([0 250]); 
xlabel('sample index'); 
grid on;

%% To timeseries
% Scale
yy = double(y) ./ 2^11;
yy = yy(1:2^19);

% Convert to timeseries Simulink can understand
sampleTime = 1/(Rsym*Config.SamplesPerSymbol);
numSteps = length(yy);
time = sampleTime*[0:(numSteps-1)];
data = yy;
time = time';
data = data';
inputData = timeseries(data,time);
save("rx_capture.mat","inputData","-v7.3");