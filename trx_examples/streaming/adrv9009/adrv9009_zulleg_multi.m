% clear all;
master = adi.ADRV9009.Rx();
master.uri = 'ip:192.168.86.51';
master.contextTimeout = 1000;
master.kernelBuffersCount = 2;
master.EnabledChannels = [1,2];
% master.CenterFrequency = 122.8e7;
master();

slave = adi.ADRV9009.Rx();
slave.uri = 'ip:192.168.86.54';
slave.contextTimeout = 1000;
slave.kernelBuffersCount = 2;
slave.EnabledChannels = [1,2];
% slave.CenterFrequency = 122.8e7;
slave();


% clock_chip_ext = getDevR(master, 'hmc7044-ext');
% clock_chip_carrier = getDevR(master, 'hmc7044-car');
% clock_chip = getDevR(master, 'hmc7044');
% chip_b = getDevR(master, 'adrv9009-phy-b');


%% Clock chip init
for dev = {slave,master}
    dev = dev{:};
    clock_chip_ext = getDevR(dev, 'hmc7044-ext');
    clock_chip_carrier = getDevR(dev, 'hmc7044-car');
    clock_chip = getDevR(dev, 'hmc7044');
    chip_b = getDevR(dev, 'adrv9009-phy-b');
    
    
    dev.setRegister(hex2dec("F"),"3",clock_chip_ext);
    dev.setRegister(hex2dec("4"),"5A",clock_chip);
end
    
%% Unsync
for dev = {master,slave}
    dev = dev{:};
    clock_chip_ext = getDevR(dev, 'hmc7044-ext');
    clock_chip_carrier = getDevR(dev, 'hmc7044-car');
    clock_chip = getDevR(dev, 'hmc7044');
    chip_b = getDevR(dev, 'adrv9009-phy-b');
    
    dev.setRegister(hex2dec("61"),"1",clock_chip);
    dev.setRegister(hex2dec("61"),"1",clock_chip_carrier);
    dev.setRegister(hex2dec("1"),"1",clock_chip_ext);
    pause(1);
    dev.setRegister(hex2dec("0"),"1",clock_chip_ext);
    pause(1);
    dev.setRegister(hex2dec("60"),"1",clock_chip_carrier);
    pause(1);
    dev.setRegister(hex2dec("60"),"1",clock_chip);
end

%% Disable continusous sysref
for dev = {slave,master}
    dev = dev{:};
    clock_chip_ext = getDevR(dev, 'hmc7044-ext');
    clock_chip_carrier = getDevR(dev, 'hmc7044-car');
    clock_chip = getDevR(dev, 'hmc7044');
    chip_b = getDevR(dev, 'adrv9009-phy-b');
    
    dev.setRegister(hex2dec("42"),"5",clock_chip_carrier);
    dev.setRegister(hex2dec("43"),"5",clock_chip);

    dev.setRegister(hex2dec("62"),"1",clock_chip);
    dev.setRegister(hex2dec("62"),"1",clock_chip_carrier);
    dev.setRegister(hex2dec("2"),"1",clock_chip_ext);
    pause(1);
    dev.setRegister(hex2dec("0"),"1",clock_chip_ext);

    pause(1);
    dev.setRegister(hex2dec("60"),"1",clock_chip_carrier);
    pause(1);
    dev.setRegister(hex2dec("60"),"1",clock_chip);
end

%% Sync
clock_chip_ext = getDevR(master, 'hmc7044-ext');
clock_chip_carrier = getDevR(master, 'hmc7044-car'); %#ok<NASGU>
clock_chip = getDevR(master, 'hmc7044');
chip_b = getDevR(master, 'adrv9009-phy-b');

master.setRegister(hex2dec("80"),"1",clock_chip_ext);
master.setRegister(hex2dec("0"),"1",clock_chip_ext);
pause(1);
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
pause(1);

clock_chip_carrier = getDevR(slave, 'hmc7044-car');
slave.setRegister(hex2dec("82"),"5",clock_chip_carrier);

clock_chip_carrier = getDevR(master, 'hmc7044-car');
master.setRegister(hex2dec("82"),"5",clock_chip_carrier);
pause(1);
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
pause(1);
master.setRegister(hex2dec("83"),"5",clock_chip);

clock_chip = getDevR(slave, 'hmc7044');
slave.setRegister(hex2dec("83"),"5",clock_chip);
clock_chip = getDevR(master, 'hmc7044');

%% MCS
for dev = {slave,master}
    dev = dev{:};
    clock_chip = getDevR(dev, 'hmc7044');
    chip_b = getDevR(dev, 'adrv9009-phy-b');
    
    dev.setRegister(hex2dec("5"),"5A",clock_chip);
    dev.setDeviceAttributeRAW('multichip_sync', '0');
    dev.setDeviceAttributeRAW('multichip_sync', '0',chip_b);
    dev.setDeviceAttributeRAW('multichip_sync', '1');
    dev.setDeviceAttributeRAW('multichip_sync', '1',chip_b);
end
pause(1);

clock_chip_ext = getDevR(master, 'hmc7044-ext');
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);

for dev = {master,slave}
    dev = dev{:};
    chip_b = getDevR(dev, 'adrv9009-phy-b');
    dev.setDeviceAttributeRAW('multichip_sync', '3');
    dev.setDeviceAttributeRAW('multichip_sync', '3',chip_b);
    dev.setDeviceAttributeRAW('multichip_sync', '4');
    dev.setDeviceAttributeRAW('multichip_sync', '4',chip_b);
end

clock_chip_ext = getDevR(master, 'hmc7044-ext');
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);

for dev = {master,slave}
    dev = dev{:};
    chip_b = getDevR(dev, 'adrv9009-phy-b');

    dev.setDeviceAttributeRAW('multichip_sync', '6');
    dev.setDeviceAttributeRAW('multichip_sync', '6',chip_b);
end

clock_chip_ext = getDevR(master, 'hmc7044-ext');
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);

for dev = {master,slave}
    dev = dev{:};
    chip_b = getDevR(dev, 'adrv9009-phy-b');
    
    dev.setDeviceAttributeRAW('multichip_sync', '8');
    dev.setDeviceAttributeRAW('multichip_sync', '8',chip_b);
    dev.setDeviceAttributeRAW('multichip_sync', '9');
    dev.setDeviceAttributeRAW('multichip_sync', '9',chip_b);
end

clock_chip_ext = getDevR(master, 'hmc7044-ext');
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);

for dev = {master,slave}
    dev = dev{:};
    chip_b = getDevR(dev, 'adrv9009-phy-b');

    dev.setDeviceAttributeRAW('multichip_sync', '11');
    dev.setDeviceAttributeRAW('multichip_sync', '11',chip_b);
end

clock_chip_ext = getDevR(master, 'hmc7044-ext');
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);


for dev = {slave,master}
    dev = dev{:};
    chip_b = getDevR(dev, 'adrv9009-phy-b');
    clock_chip = getDevR(dev, 'hmc7044');
    
    dev.setRegister(hex2dec("1"),"5A",clock_chip);

    dev.setDeviceAttributeRAW('calibrate_rx_phase_correction_en', '1');
    dev.setDeviceAttributeRAW('calibrate', '1');
    dev.setDeviceAttributeRAW('calibrate_rx_phase_correction_en', '1',chip_b);
    dev.setDeviceAttributeRAW('calibrate', '1',chip_b);
end

clock_chip_ext = getDevR(master, 'hmc7044-ext');
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
pause(1);

%%
master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);

% if valid
%     error('Expected timeout'); 
% end

% % ARM DMA
% for dev = {slave,master}
%     dev = dev{:};
%     masterdev = getDevR(dev, 'axi-adrv9009-rx-hpc');
%     for k=1:100
%        dev.setRegister(hex2dec('8'),'80000044',masterdev);
%        r = dev.getRegister('80000068',masterdev);
%        disp(r);
%        if r ~= uint32(0)
%            disp('DMA ARMED');
%            break
%        end
%        pause(0.1);
%     end
% end
% % Check timeout
% [data, valid] = master();
% if valid
%     error('Expected timeout'); 
% end
% [data, valid] = slave();
% if valid
%     error('Expected timeout'); 
% end

master.CenterFrequency = 122.8e7;
slave.CenterFrequency = 122.8e7;
pause(1);
master.CenterFrequency = 1e9;
slave.CenterFrequency = 1e9;
pause(1);

% Request
% H = 10;
phases = zeros(H,2);
for k=1:H
    [data, valid] = master();
    if ~valid
        error('Expected data');
    end
    [data, valid] = slave();
    if ~valid
        error('Expected data');
    end
    % ARM DMA
    if k>0
        for dev = {slave,master}
            dev = dev{:};
            masterdev = getDevR(dev, 'axi-adrv9009-rx-hpc');
            r = dev.getRegister('80000068',masterdev);
            if r ~= uint32(0)
               error('DMA in invalid state'); 
            end
            disp('ARMING DMA');
            for g=1:1000
                dev.setRegister(hex2dec('8'),'80000044',masterdev);
                r = dev.getRegister('80000068',masterdev);
                if r ~= uint32(0)
                    disp('DMA ARMED');
                    break
                end
                pause(0.1);
            end
        end
    end
    %
    [dataMaster, validmaster] = master();
    if k==1
    [dataMaster, validmaster] = master();
    if validmaster
        error('Expected timeout');
    end
    end
    [data, valid] = slave();
    if k==1
    [data, valid] = slave();
    if valid
        error('Expected timeout');
    end
    end
    %
    masterdev = getDevR(master, 'axi-adrv9009-rx-hpc');
    assert(master.getRegister('80000068',masterdev)==1)
    slavedev = getDevR(slave, 'axi-adrv9009-rx-hpc');
    assert(slave.getRegister('80000068',slavedev)==1)
    
    master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
%     pause(0.1);
    masterdev = getDevR(master, 'axi-adrv9009-rx-hpc');
    indx = 0;
    while master.getRegister('80000068',masterdev)~=0
        pause(0.1);
        indx = indx + 1;
        if indx>10
            indx = 0;
            master.setDeviceAttributeRAW('sysref_request', '1', clock_chip_ext);
            disp('EXTRA SYSREF FIRED-----------');
        end
        continue;
    end
    slavedev = getDevR(slave, 'axi-adrv9009-rx-hpc');
    while slave.getRegister('80000068',slavedev)~=0
        continue;
    end

    
    [dataMaster, validmaster] = master();
    if ~validmaster
        error('Expected data');
    end
    [data, valid] = slave();
    if ~valid
        error('Expected data');
    end
    % Phase diffs
    phase1 = angle(dataMaster(:,1) .* conj(dataMaster(:,2))) * 180/pi;
    fprintf("SC Angle: %f\n",mean(phase1));
    phases(k,1) = mean(phase1);
    phase1 = angle(data(:,1) .* conj(dataMaster(:,1))) * 180/pi;
    fprintf("AC Angle: %f\n",mean(phase1));
    phases(k,2) = mean(phase1);
%     phase1 = angle(dataMaster(:,1) .* conj(dataMaster(:,3))) * 180/pi;
%     fprintf("SC Angle: %f\n",mean(phase1));
%     phases(k,3) = mean(phase1);

    
    
    N = 100;
    x = 1:N;
%     figure(1);plot(x,real(data(1:N,:)),x,real(dataMaster(1:N,:)));
%     figure(2);plot(1:H,phases);

%     pause(1);
end
figure(3);plot(1:H,phases(1:H,:));
ylabel('Phase Delta (Degrees)')
grid on
legend('Across Channels','Across SOMS')
xlabel('Measurement Instance');
master.release();
slave.release();
clear master
clear slave
clear dev
