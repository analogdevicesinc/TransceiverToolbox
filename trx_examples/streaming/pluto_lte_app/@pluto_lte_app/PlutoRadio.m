function dataRx = PlutoRadio(app, eNodeBOutput)
    dataTx = int16(2^15.*double(eNodeBOutput)./max(abs(double(eNodeBOutput))));

    mw = true;  % only MW system objects are supported when compiled into a standalone app
    % filter
    if (mw)
        switch (app.BWDropDown.Value)
            case '5 MHz'
                load lte5_filter_tx.mat;
                PlutoTx = sdrtx('Pluto',filtnv{:});

                load lte5_filter_rx.mat;
                PlutoRx = sdrrx('Pluto',filtnv{:});        
            case '10 MHz'
                load lte10_filter_tx.mat;
                PlutoTx = sdrtx('Pluto',filtnv{:});

                load lte10_filter_rx.mat;
                PlutoRx = sdrrx('Pluto',filtnv{:});        
        end
        
        % tx setup
        PlutoTx.UseCustomFilter = true;
        PlutoTx.CenterFrequency = app.LOEditField.Value*1e6;
        PlutoTx.RadioID = app.test_settings.DeviceIP;
        PlutoTx.Gain = app.test_settings.TxGain;
        
        % rx setup
        PlutoRx.UseCustomFilter = true;
        PlutoRx.CenterFrequency = app.LOEditField.Value*1e6;
        PlutoRx.RadioID = app.test_settings.DeviceIP;
        PlutoRx.SamplesPerFrame = app.test_settings.RxBufferSize;
        PlutoRx.NumFramesInBurst = 1;        
        
        % transmit
        transmitRepeat(PlutoTx, dataTx);
    else
        % tx setup
        PlutoTx = adi.Pluto.Tx();
        PlutoTx.CenterFrequency = app.LOEditField.Value*1e6;
        PlutoTx.uri = app.test_settings.DeviceIP;
        PlutoTx.EnableCyclicBuffers = true;
        PlutoTx.AttenuationChannel0 = app.test_settings.TxGain;
        
        % rx setup
        PlutoRx = adi.Pluto.Rx();
        PlutoRx.CenterFrequency = app.LOEditField.Value*1e6;
        PlutoRx.uri = app.test_settings.DeviceIP;
        PlutoRx.SamplesPerFrame = app.test_settings.RxBufferSize;
        PlutoRx.kernelBuffersCount = 1;
        PlutoRx.GainControlModeChannel0 = app.test_settings.RxGainMode;
        
        % apply filter
        PlutoTx.EnableCustomFilter = true;
        PlutoRx.EnableCustomFilter = true;
        
        switch (app.BWDropDown.Value)
            case '1.4 MHz' % option not currently supported
                PlutoTx.CustomFilterFileName = 'LTE1p4_MHz.ftr';  
                PlutoRx.CustomFilterFileName = 'LTE1p4_MHz.ftr';  
            case '3 MHz' % option not currently supported
                PlutoTx.CustomFilterFileName = 'LTE3_MHz.ftr';  
                PlutoRx.CustomFilterFileName = 'LTE3_MHz.ftr';  
            case '5 MHz'
                PlutoTx.CustomFilterFileName = 'LTE5_MHz.ftr';  
                PlutoRx.CustomFilterFileName = 'LTE5_MHz.ftr';  
            case '10 MHz'
                PlutoTx.CustomFilterFileName = 'LTE10_MHz.ftr';  
                PlutoRx.CustomFilterFileName = 'LTE10_MHz.ftr';  
            case '15 MHz' % option not currently supported
                PlutoTx.CustomFilterFileName = 'LTE15_MHz.ftr';  
                PlutoRx.CustomFilterFileName = 'LTE15_MHz.ftr';  
            case '20 MHz' % option not currently supported
                PlutoTx.CustomFilterFileName = 'LTE20_MHz.ftr';  
                PlutoRx.CustomFilterFileName = 'LTE20_MHz.ftr';  
        end
        
        % transmit
        PlutoTx(dataTx);
    end

    % receive
    app.Label.Text = {'Starting a new RF capture.'}; 

    for k=1:20
        len = 0;
        while len == 0
            [dataRx, len] = PlutoRx();
        end
    end
    dataRx = double(dataRx);

    % cleanup
    PlutoTx.release();
    PlutoRx.release();
    clear PlutoTx PlutoRx    
end