clc;
clear all;
close all;

%% transmit waveform
scale = 30000; % a little less than 2^15-1 to account for some bitgrowth by Farrow filter in the IP
tx_wf = genDVBwf(5, 0.2, 5);
tx_wf = tx_wf/max(max(real(tx_wf)), max(imag(tx_wf)));
tx_wf = round(scale*tx_wf);

%% struct that contains various test settings
hw_tests.radio_uri = 'ip:192.168.3.2';
hw_tests.fc = 5.6e9;
hw_tests.sample_rate = 61.44e6;
hw_tests.bandwidth = 12e6;
hw_tests.ip_loopback = 0;
hw_tests.corr_thresh = 140;
hw_tests.debug_mode = 1; % setting debug mode to 1 to view ZC-sequence correlation
hw_tests.buflen = 6000;
hw_tests.kbc = ceil(length(tx_wf)/hw_tests.buflen);
hw_tests.tx_wf = tx_wf;
hw_tests.rx_gain = 30;
hw_tests.tx_attn = -5;

%% run loopback test
hw_tests = configure_ip(hw_tests);
[rx, tx] = setup_radio(hw_tests);
hw_tests = send_waveform(hw_tests, rx, tx);

release(tx);
release(rx);
    
%% configure loopback delay estimation IP in the fpga
function hwt = configure_ip(hwt)
    % loopback mode
    w1 = matlabshared.libiio.aximm.write('uri',hwt.radio_uri);
    w1.AddressOffset = hex2dec('100');
    w1.HardwareDataType='boolean';
    w1(hwt.ip_loopback);
    
    % correlation threshold
    w2 = matlabshared.libiio.aximm.write('uri',hwt.radio_uri);
    w2.AddressOffset = hex2dec('104');
    w2.HardwareDataType='int16';
    w2(hwt.corr_thresh);
    
    % pulse
    w3 = matlabshared.libiio.aximm.write('uri',hwt.radio_uri);
    w3.AddressOffset = hex2dec('108');
    w3.HardwareDataType='boolean';
    
    % debug
    w4 = matlabshared.libiio.aximm.write('uri',hwt.radio_uri);
    w4.AddressOffset = hex2dec('10C');
    w4.HardwareDataType='boolean';
    w4(hwt.debug_mode);
    
    % window size
    w5 = matlabshared.libiio.aximm.write('uri',hwt.radio_uri);
    w5.AddressOffset = hex2dec('110');
    w5.HardwareDataType='uint16';
    w5(hwt.buflen);
    
    hwt.w1 = w1;
    hwt.w2 = w2;
    hwt.w3 = w3;
    hwt.w4 = w4;
    hwt.w5 = w5;
end

%% radio settings
function [rx, tx] = setup_radio(hwt)
    % rx setup
    rx = adi.AD9361.Rx('uri', hwt.radio_uri);
    rx.CenterFrequency = hwt.fc;
    rx.SamplingRate = hwt.sample_rate;
    rx.SamplesPerFrame = hwt.buflen;
    rx.RFBandwidth = hwt.bandwidth;
    rx.EnabledChannels = [1 2];
    rx.Timeout = 3;
    rx.LoopbackMode = 0;
    rx.GainControlModeChannel0 = 'manual';
    rx.GainChannel0 = hwt.rx_gain;
    rx.kernelBuffersCount = hwt.kbc;
    rx.EnableCustomFilter = true;
    rx.CustomFilterFileName = 'custom_filter.ftr';
    [~, valid] = rx(); % flush the buffer
    if valid
        error('Shouldnt have gotten data');
    end

    % tx setup
    tx = adi.AD9361.Tx('uri', hwt.radio_uri);
    tx.CenterFrequency = hwt.fc;
    tx.SamplingRate = hwt.sample_rate;
    tx.RFBandwidth = hwt.bandwidth;
    tx.DataSource = 'DMA';
    tx.AttenuationChannel0 = hwt.tx_attn;
    tx.kernelBuffersCount = hwt.kbc;
    tx.EnableCustomFilter = true;
    tx.CustomFilterFileName = 'custom_filter.ftr';    
end

%% send tx waveform and capture rx samples
function hwt = send_waveform(hwt, rx, tx)
    tx(hwt.tx_wf);

    % Clear buffer
    valid = 1;
    while (valid)
        [r1, valid] = rx();
    end
    
    % pulse the register to send training sequence using LUTs
    hwt.w3(1);
    hwt.w3(0);
    % Check training 
    [out, valid] = rx();
    if ~valid
        error('Didnt get data');
    end
    
    % plot correlation and its peak
    figure; 
    subplot(2,1,1);
    plot(real(out(:,1))); title('Correlation Peak Location');
    grid on;
    xlabel('sample index');
    ylabel('correlation peak index');
    subplot(2,1,2); 
    plot(imag(out(:,1))); title('Correlation for Integer Delay Estimation');
    grid on;
    xlabel('sample index');
    ylabel('ZC-sequence correlation');    
    hwt.training_out = out;       
end

%% generate DVB-S2 transmit waveform (code taken from the MATLAB example, commDVBS2WithLDPC.m)
function tx_wf = genDVBwf(ovx, rollOff, numFrames)
    % Tx Filter Parameters
    L        = ovx;        % Oversampling factor
    rcDelay  = 4;          % Raised cosine (combined Tx/Rx) delay

    TXFILT  = comm.RaisedCosineTransmitFilter('OutputSamplesPerSymbol', L, ...
        'RolloffFactor', rollOff, 'FilterSpanInSymbols', rcDelay);

    % Initialization
    subsystemType = '16APSK 2/3';   % Constellation and LDPC code rate
    EsNodB        = 15;              % Energy per symbol to noise PSD ratio in dB
    
    % Initialize
    configureDVBS2Demo

    % LDPC Encoder and Decoder

    encldpc = comm.LDPCEncoder(dvb.LDPCParityCheckMatrix);

    % Stream Processing Loop
    bbFrameTx  = false(encbch.MessageLength,1);
    modOut = zeros(16200, numFrames);
    for frameCnt=1:numFrames

        % Transmitter, channel, and receiver
        bbFrameTx(1:dvb.NumInfoBitsPerCodeword) = ...
              logical(randi([0 1], dvb.NumInfoBitsPerCodeword, 1));

        bchEncOut = encbch(bbFrameTx);    
        ldpcEncOut = encldpc(bchEncOut);    
        intrlvrOut = intrlv(ldpcEncOut, dvb.InterleaveOrder);

        if dvb.ModulationOrder == 4 || dvb.ModulationOrder == 8
            modOut(:,frameCnt) = pskModulator(intrlvrOut);
        else
            modOut(:,frameCnt) = dvbsapskmod(intrlvrOut, dvb.ModulationOrder, 's2', ...
                dvb.CodeRate, 'InputType', 'bit', 'UnitAveragePower', true);
        end       
    end
    tx_wf = step(TXFILT, modOut(:));
end