clear all;

uri = 'ip:analog';

amplitude = 2^15; frequency = 0.12e6;
swv1 = dsp.SineWave(amplitude, frequency);
swv1.ComplexOutput = true;
swv1.SamplesPerFrame = 1e4*10;
swv1.SampleRate = 7.68e6;
x = swv1();

%% Set profile
rx = adi.ADRV9002.Rx('uri', uri);
rx.EnableCustomProfile = true;
rx.CustomProfileFileName = 'lte_5_cmos_api_48_8_7.json';
rx.CustomStreamFileName = 'lte_5_cmos_api_48_8_7.stream';
rx();

%% Tx set up
tx = adi.ADRV9002.Tx('uri', uri);
tx.CenterFrequencyChannel0 = 1e9;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx.AttenuationChannel0 = -10;
tx(x);

%% Rx set up
rx = adi.ADRV9002.Rx('uri', uri);
rx.CenterFrequencyChannel0 = tx.CenterFrequencyChannel0;
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;

%% Run
for k=1:10
    valid = false;
    while ~valid
        [out, valid] = rx();
    end
end

tx.release();
rx.release();

figure(1); 
plot(0:numel(out)-1, real(out), 'r', 0:numel(out)-1, imag(out), 'b'); 
xlim([0 250]); 
xlabel('sample index'); 
grid on;