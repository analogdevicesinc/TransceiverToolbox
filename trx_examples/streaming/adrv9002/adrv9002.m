% Test Tx DMA data output
amplitude = 2^10; frequency = 3e6;
swv1 = dsp.SineWave(amplitude, frequency);
swv1.ComplexOutput = true;
swv1.SamplesPerFrame = 2^20;
swv1.SampleRate = 100e6;
y = swv1();

uri = 'ip:analog';
fc = 1e9;

%% Tx set up
tx = adi.ADRV9002.Tx('uri',uri);
tx.CenterFrequencyChannel0 = fc;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx(y);

%% Rx set up
rx = adi.ADRV9002.Rx('uri',uri);
rx.CenterFrequencyChannel0 = fc;

%% Run
for k=1:20
    valid = false;
    while ~valid
        [out, valid] = rx();
    end
end
rx.release();
tx.release();

%% Plot
nSamp = length(out);
fs = tx.SamplingRate;
FFTRxData  = fftshift(10*log10(abs(fft(out))));
df = fs/nSamp;  freqRangeRx = (-fs/2:df:fs/2-df).'/1000;
plot(freqRangeRx, FFTRxData);
xlabel('Frequency (kHz)');ylabel('Amplitude (dB)');grid on;
