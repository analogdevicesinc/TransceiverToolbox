function dataRx = PlutoRadio(obj, app, dataTx, count)
    if (count == 1)
        % filter
        switch (app.BWDropDown.Value)
            case '3 MHz'
                TxFilt = load('lte3_filter_tx.mat');
                obj.PlutoTx = sdrtx('Pluto', TxFilt.filtnv{:});

                RxFilt = load('lte3_filter_rx.mat');
                obj.PlutoRx = sdrrx('Pluto', RxFilt.filtnv{:});  
                
                obj.PlutoRx.SamplesPerFrame = 2^19;
            case '5 MHz'
                TxFilt = load('lte5_filter_tx.mat');
                obj.PlutoTx = sdrtx('Pluto', TxFilt.filtnv{:});

                RxFilt = load('lte5_filter_rx.mat');
                obj.PlutoRx = sdrrx('Pluto', RxFilt.filtnv{:});   
                
                obj.PlutoRx.SamplesPerFrame = 2^19;
            case '10 MHz'
                TxFilt = load('lte10_filter_tx.mat');
                obj.PlutoTx = sdrtx('Pluto', TxFilt.filtnv{:});

                RxFilt = load('lte10_filter_rx.mat');
                obj.PlutoRx = sdrrx('Pluto', RxFilt.filtnv{:}); 
                
                obj.PlutoRx.SamplesPerFrame = 2^19;
            case '15 MHz'
                TxFilt = load('lte15_filter_tx.mat');
                obj.PlutoTx = sdrtx('Pluto', TxFilt.filtnv{:});

                RxFilt = load('lte15_filter_rx.mat');
                obj.PlutoRx = sdrrx('Pluto', RxFilt.filtnv{:});    
                
                obj.PlutoRx.SamplesPerFrame = 2^21;
            case '20 MHz'
                TxFilt = load('lte20_filter_tx.mat');
                obj.PlutoTx = sdrtx('Pluto', TxFilt.filtnv{:});

                RxFilt = load('lte20_filter_rx.mat');
                obj.PlutoRx = sdrrx('Pluto', RxFilt.filtnv{:});     
                
                obj.PlutoRx.SamplesPerFrame = 2^21;
        end

        % tx setup
        obj.PlutoTx.UseCustomFilter = true;
        obj.PlutoTx.CenterFrequency = app.LOEditField.Value*1e6;
        obj.PlutoTx.RadioID = obj.test_settings.DeviceURI;
        obj.PlutoTx.Gain = obj.test_settings.TxGain;
        % obj.PlutoTx.BISTLoopbackMode = 'Digital Tx -> Digital Rx';

        % rx setup
        obj.PlutoRx.UseCustomFilter = true;
        obj.PlutoRx.CenterFrequency = app.LOEditField.Value*1e6;
        obj.PlutoRx.RadioID = obj.test_settings.DeviceURI;        
        obj.PlutoRx.NumFramesInBurst = 1;  
        % obj.PlutoRx.BISTLoopbackMode = 'Digital Tx -> Digital Rx';

        % transmit
        transmitRepeat(obj.PlutoTx, dataTx);
    end

    % receive
    % [~,cmdout] = system('iio_attr -u ip:192.168.2.1 -c ad9361-phy TX_LO frequency');
    % cmdout = strrep(cmdout, '''', '');
    % [~, endIndex] = regexp(cmdout,'frequency, value');
    % msg = sprintf('Fetching samples from PlutoSDR. LO set to %s Hz.', cmdout(1:end-1));    
    msg = sprintf('Fetching samples from the radio.');    
    app.Label.Text = msg; 
    drawnow limitrate;

    for k=1:20
        len = 0;
        while len == 0
            [dataRx, len] = obj.PlutoRx();
        end
    end
    dataRx = double(dataRx);   
end