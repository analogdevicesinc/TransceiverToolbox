function dataRx = PlutoRadio(obj, app, dataTx, count)
    if (count == 1)
        % filter
        switch (app.BWDropDown.Value)
            case '5 MHz'
                TxFilt = load('lte5_filter_tx.mat');
                obj.PlutoTx = sdrtx('Pluto', TxFilt.filtnv{:});

                RxFilt = load('lte5_filter_rx.mat');
                obj.PlutoRx = sdrrx('Pluto', RxFilt.filtnv{:});        
            case '10 MHz'
                TxFilt = load('lte10_filter_tx.mat');
                obj.PlutoTx = sdrtx('Pluto', TxFilt.filtnv{:});

                RxFilt = load('lte10_filter_rx.mat');
                obj.PlutoRx = sdrrx('Pluto', RxFilt.filtnv{:});        
        end

        % tx setup
        obj.PlutoTx.UseCustomFilter = true;
        obj.PlutoTx.CenterFrequency = app.LOEditField.Value*1e6;
        obj.PlutoTx.RadioID = obj.test_settings.DeviceIP;
        obj.PlutoTx.Gain = obj.test_settings.TxGain;

        % rx setup
        obj.PlutoRx.UseCustomFilter = true;
        obj.PlutoRx.CenterFrequency = app.LOEditField.Value*1e6;
        obj.PlutoRx.RadioID = obj.test_settings.DeviceIP;
        obj.PlutoRx.SamplesPerFrame = obj.test_settings.RxBufferSize;
        obj.PlutoRx.NumFramesInBurst = 1;        

        % transmit
        transmitRepeat(obj.PlutoTx, dataTx);
    end

    % receive
    app.Label.Text = {'Starting a new RF capture.'}; 

    for k=1:20
        len = 0;
        while len == 0
            [dataRx, len] = obj.PlutoRx();
        end
    end
    dataRx = double(dataRx);   
end