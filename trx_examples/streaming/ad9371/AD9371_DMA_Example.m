clear all;

amplitude = 2^15; frequency = 20e6;
swv1 = dsp.SineWave(amplitude, frequency);
swv1.ComplexOutput = true;
swv1.SamplesPerFrame = 2^20;
swv1.SampleRate = testCase.SamplingRateRX;
x = swv1();

%% Tx set up
tx = adi.AD9371.Tx('uri','ip:analog');
tx.CenterFrequency = 1e9;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx.AttenuationChannel0 = -10;
tx.EnableCustomProfile = true;
tx.CustomProfileFileName = ...
    'profile_TxBW100_ORxBW100_RxBW100.txt';
tx(x);

%% Rx set up
rx = adi.AD9371.Rx('uri','ip:analog');
rx.CenterFrequency = tx.CenterFrequency;
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;
for k=1:20
    valid = false;
    while ~valid
        [y, valid] = rx();
    end
end

figure(1); 
plot(0:numel(y)-1, real(y), 'r', 0:numel(y)-1, imag(y), 'b'); 
xlim([0 250]); 
xlabel('sample index'); 
grid on;

rx.release();
tx.release();