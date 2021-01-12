clear all;

%% Tx set up
tx = adi.AD9371.Tx('uri','ip:analog');
tx.DataSource = 'DDS';
toneFreq = 30e6;
tx.DDSFrequencies = repmat(toneFreq,2,4);
tx.DDSScales = zeros(2,4);
tx.DDSScales(1,1:2) = [1 1];
tx.DDSPhases = zeros(2,4);
tx.DDSPhases(1,1) = 90000;
tx.AttenuationChannel0 = -10;
tx.EnableCustomProfile = true;
tx.CustomProfileFileName = ...
    'profile_TxBW100_ORxBW100_RxBW100.txt';
tx();
pause(1);

%% Rx set up
rx = adi.AD9371.Rx('uri','ip:analog');
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;
for k=1:10
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