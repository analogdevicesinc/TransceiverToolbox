% Test Tx DMA data output
amplitude = 2^10; frequency = 0.5e6;
swv1 = dsp.SineWave(amplitude, frequency);
swv1.ComplexOutput = true;
swv1.SamplesPerFrame = 2^20;
swv1.SampleRate = 1.92e6;
y = swv1();

uri = 'ip:analog';
fc = 1e9;

%% Tx set up
tx = adi.ADRV9002.Tx('uri',uri);
tx.CenterFrequencyChannel0 = fc;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
% Note that unless EnableCustomProfile is set, profile is not loaded
tx.EnableCustomProfile = true;
tx.CustomStreamFileName = 'lte_1_4_cmos_fdd_api_29_2_9.stream';
tx.CustomProfileFileName = 'lte_1_4_cmos_fdd_api_29_2_9.json';
tx(y);

%% Rx set up
% Profile is already applied through TX. No need to do it again
rx = adi.ADRV9002.Rx('uri',uri);
rx.CenterFrequencyChannel0 = fc;

%% Run
for k=1:20
    valid = false;
    while ~valid
        [out, valid] = rx();
    end
end

%% Plot
nSamp = length(out);
fs = double(tx.SamplingRate);
FFTRxData  = fftshift(10*log10(abs(fft(out))));
df = fs/nSamp;  freqRangeRx = (-fs/2:df:fs/2-df).'/1000;
plot(freqRangeRx, FFTRxData);
xlabel('Frequency (kHz)');ylabel('Amplitude (dB)');grid on;

rx.release();
tx.release();
