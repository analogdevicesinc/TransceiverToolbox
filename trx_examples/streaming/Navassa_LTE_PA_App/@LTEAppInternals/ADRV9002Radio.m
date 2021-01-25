function dataRx = ADRV9002Radio(obj, app, dataTx, frame_ind)
    if (frame_ind == 1)
        % filter
        %{
        switch (app.BWDropDown.Value)
            case '3 MHz'
                TxFilt = load('lte3_filter_tx.mat');
            case '5 MHz'
                TxFilt = load('lte5_filter_tx.mat');
            case '10 MHz'
                TxFilt = load('lte10_filter_tx.mat');
            case '15 MHz'
                TxFilt = load('lte15_filter_tx.mat');
            case '20 MHz'
                TxFilt = load('lte20_filter_tx.mat');
            otherwise
                st = dbstack;
                error("unknown option %s in %s", app.BWDropDown.Value, st.name);
        end
        %}
        %{
        system('iio_attr -a -c axi-adrv9002-tx-lpc altvoltage0 scale 0');
        system('iio_attr -a -c axi-adrv9002-tx-lpc altvoltage1 scale 0');
        system('iio_attr -a -c axi-adrv9002-tx-lpc altvoltage2 scale 0');
        system('iio_attr -a -c axi-adrv9002-tx-lpc altvoltage3 scale 0');
        system('iio_attr -a -c axi-adrv9002-tx2-lpc altvoltage0 scale 0');
        system('iio_attr -a -c axi-adrv9002-tx2-lpc altvoltage1 scale 0');
        system('iio_attr -a -c axi-adrv9002-tx2-lpc altvoltage2 scale 0');
        system('iio_attr -a -c axi-adrv9002-tx2-lpc altvoltage3 scale 0');
        %}
        obj.ADRV9002Tx = adi.ADRV9002.Tx('uri','ip:analog.local');

        % tx setup
        obj.ADRV9002Tx.EnableCustomProfile = true;
        obj.ADRV9002Tx.CenterFrequencyChannel0 = app.LOEditField.Value*1e6;
        % obj.ADRV9002Tx.RadioID = app.TxDropDown.Value;
        obj.ADRV9002Tx.AttenuationChannel0 = obj.test_settings.TxGain;
        obj.ADRV9002Tx.EnableCyclicBuffers = true;
        obj.ADRV9002Tx.CustomProfileFileName = 'LTE_5MHz.json';
        obj.ADRV9002Tx.CustomStreamFileName = 'LTE_5MHz.bin';
        ADRV9002Tx.ClosedLoopTrackingChannel0 = false;

    end
    
    % filter
    %{
    switch (app.BWDropDown.Value)
        case '3 MHz'
            RxFilt = load('lte3_filter_rx.mat');
        case '5 MHz'
            RxFilt = load('lte5_filter_rx.mat'); 
        case '10 MHz'
            RxFilt = load('lte10_filter_rx.mat');
        case '15 MHz'
            RxFilt = load('lte15_filter_rx.mat');
        case '20 MHz'
            RxFilt = load('lte20_filter_rx.mat');
        otherwise
            st = dbstack;
            error("unknown option %s in %s", app.BWDropDown.Value, st.name);
    end
    %}
    obj.ADRV9002Rx = adi.ADRV9002.Rx('uri','ip:analog.local');
    obj.ADRV9002Rx.DigitalGainControlModeChannel0 = ...
        obj.test_settings.RxDigitalGainControlMode;
    % obj.ADRV9002Rx.AttenuationChannel0 = obj.test_settings.Attenuation;
    
    % rx setup
    % obj.ADRV9002Rx.EnableCustomProfile = true;
    obj.ADRV9002Rx.CenterFrequencyChannel0 = app.LOEditField.Value*1e6;
    % obj.ADRV9002Rx.RadioID = app.RxDropDown.Value;
    % obj.ADRV9002Rx.NumFramesInBurst = 1;
    if (frame_ind == 1)
        app.TxDropDown.Enable = 'off';
        app.RxDropDown.Enable = 'off';
    end

    if (app.NumRadios > 1)
        if strcmp(app.StepOrPlayButton, 'step') || (frame_ind == 1)
            obj.ADRV9002Rx = FrequencyCorrectionRadios(obj.ADRV9002Tx, obj.ADRV9002Rx);
            obj.FrequencyCorrection = obj.ADRV9002Rx.FrequencyCorrection;
            obj.ADRV9002Rx.SamplesPerFrame = 2^23;
        else
            obj.ADRV9002Rx.FrequencyCorrection = obj.FrequencyCorrection;
            obj.ADRV9002Rx.SamplesPerFrame = setRxSamplesPerFrame(app.BWDropDown.Value);            
        end
    else
        obj.ADRV9002Rx.SamplesPerFrame = setRxSamplesPerFrame(app.BWDropDown.Value);
    end
    
    if (frame_ind == 1)
        % transmit
        % transmitRepeat(obj.ADRV9002Tx, dataTx);
        obj.ADRV9002Tx(dataTx);
    end
    
    % receive
    msg = sprintf('Fetching samples from the radio.');    
    app.Label.Text = msg; 
    drawnow limitrate;

    for k=1:20
        len = 0;
        while len == 0
            [dataRx, len] = obj.ADRV9002Rx();
        end
    end
    dataRx = double(dataRx);   
end

function SamplesPerFrame = setRxSamplesPerFrame(BW)
    switch (BW)
        case {'3 MHz', '5 MHz', '10 MHz'}
            SamplesPerFrame = 2^19;        
        case {'15 MHz', '20 MHz'}
            SamplesPerFrame = 2^21;        
        otherwise
            st = dbstack;
            error("unknown option %s in %s", BW, st.name);
    end
end

function SDRRx = FrequencyCorrectionRadios(SDRTx, SDRRx)
    sampleRate = SDRTx.BasebandSampleRate;
    centerFreq = SDRTx.CenterFrequency;
    numSamples = SDRRx.SamplesPerFrame;
    fRef = 250e3;
    s = exp(1j*2*pi*fRef*[0:10000-1]'/sampleRate);  
    s = 0.6*s/max(abs(s)); 
    
    transmitRepeat(SDRTx, s);
    receivedSig = SDRRx();

    % Find the tone that corresponds to the 250 kHz transmitted tone
    y = fftshift(abs(fft(receivedSig)));
    [~, idx] = findpeaks(y,'MinPeakProminence',max(0.5*y));
    fReceived = (max(idx)-numSamples/2-1)/numSamples*sampleRate;

    %% Estimate and Apply the Value of FrequencyCorrection
    FrequencyCorrection = (fReceived - fRef) / (centerFreq + fRef) * 1e6;
    msg = sprintf(['Based on the tone detected at %.3f kHz, ' ...
                   'FrequencyCorrection of the receiver should be set to %.4f'], ...
                   fReceived/1000, FrequencyCorrection);
    disp(msg);
    
    %% Receive and Visualize Signal
    SDRRx.FrequencyCorrection = SDRRx.FrequencyCorrection+FrequencyCorrection;
    % Capture 10 frames, but only use the last frame to skip the transient
    % effects due to changing FrequencyCorrection
    disp(['Capture signal and verify frequency correction' newline])
    for i = 1:10
        receivedSig = SDRRx();
    end

    % Find the tone that corresponds to the 250 kHz transmitted tone
    % fReceived2 should be very close to 250 kHz
    y = fftshift(abs(fft(receivedSig)));
    [~,idx] = findpeaks(y,'MinPeakProminence',max(0.5*y));
    fReceived2 = (max(idx)-numSamples/2-1)/numSamples*sampleRate;

    msg = sprintf('Tone detected at %.3f kHz\n', fReceived2/1000);
    disp(msg);
    
    release(SDRTx);
    release(SDRRx);
end