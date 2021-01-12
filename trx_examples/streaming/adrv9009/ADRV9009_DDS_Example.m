clear all;

%% Tx set up
tx = adi.ADRV9009.Tx('uri','ip:analog');
tx.DataSource = 'DDS';
toneFreq = 30e6;
tx.DDSFrequencies = repmat(toneFreq,2,4);
tx.AttenuationChannel0 = -10;
tx.EnableCustomProfile = true;
tx.CustomProfileFileName = ...
    'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
tx();
pause(1);

%% Rx set up
rx = adi.ADRV9009.Rx('uri','ip:analog');
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;
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