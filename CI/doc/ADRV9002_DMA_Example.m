clear all;

amplitude = 2^15; frequency = 0.12e6;
swv1 = dsp.SineWave(amplitude, frequency);
swv1.ComplexOutput = true;
swv1.SamplesPerFrame = 1e4*10;
swv1.SampleRate = 1.92e6;
x = swv1();

tx = adi.ADRV9002.Tx('uri','ip:analog');
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx.AttenuationChannel0 = -10;
tx.EnableCustomProfile = true;
tx.CustomProfileFileName = fullfile('../../test/adrv9002_profiles','lte_1_4_cmos_fdd_api_29_2_9.json');
tx.CustomStreamFileName = fullfile('../../test/adrv9002_profiles','lte_1_4_cmos_fdd_api_29_2_9.stream');
tx(x);

rx = adi.ADRV9002.Rx('uri','ip:analog');
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;
for k=1:10
    valid = false;
    while ~valid
        [out, valid] = rx();
    end
end

tx.release();
rx.release();

figure(1); 
plot(0:numel(y)-1, real(y), 'r', 0:numel(y)-1, imag(y), 'b'); 
xlim([0 250]); 
xlabel('sample index'); 
grid on;