clear all;

amplitude = 2^15; frequency = 0.12e6;
swv1 = dsp.SineWave(amplitude, frequency);
swv1.ComplexOutput = true;
swv1.SamplesPerFrame = 1e4*10;
swv1.SampleRate = 3e6;
y = swv1();

tx = adi.AD9361.Tx('uri','ip:analog');
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx.AttenuationChannel0 = -10;
tx(y);
rx = adi.AD9361.Rx('uri','ip:analog');
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