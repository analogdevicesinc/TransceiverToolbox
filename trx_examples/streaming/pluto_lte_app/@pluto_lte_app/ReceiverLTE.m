function ReceiverLTE(app, dataRx,samplingrate,configuration)

    % Apply frequency estimation and correction for the purposes of performing
    % timing synchronization
    foffset_est = lteFrequencyOffset(configuration,dataRx);
    dataRxFreqCorrected = lteFrequencyCorrect(configuration,dataRx,foffset_est);

    % Synchronize the captured waveform
    frameOffset = lteDLFrameOffset(configuration,dataRxFreqCorrected,'TestEVM');
    dataRx = dataRx(1+frameOffset:end,:);

    app.SummaryTable.Data(3, 2) = {sprintf('%0.3f ms', 1e3*frameOffset/samplingrate)};

    if (app.stop_test)
        return;
    end

    % Compute EVM measurements, with plotting disabled
    cec.PilotAverage = 'TestEVM';
    app.local_PDSCHEVM(configuration,cec,dataRx);
    
end