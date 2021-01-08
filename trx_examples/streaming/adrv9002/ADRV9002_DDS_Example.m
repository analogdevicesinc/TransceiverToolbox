clear all;

%% Tx set up
tx = adi.ADRV9002.Tx('uri','ip:analog');
tx.DataSource = 'DDS';
toneFreq = 5e5;
tx.DDSFrequencies = repmat(toneFreq,2,2);
tx.AttenuationChannel0 = -30;
tx();
pause(1);

%% Rx set up
rx = adi.ADRV9002.Rx('uri','ip:analog');
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;

%% Run
for k=1:10
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