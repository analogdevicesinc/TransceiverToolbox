function [eNodeBOutput, config] = TransmitterLTE(app)    
    % LTE E-TM Tx
    BW = app.BWDropDown.Value;                    
    etm = lteTestModel(app.TMNDropDown.Value, BW(find(~isspace(BW))));
    [eNodeBOutput,grid,etm] = lteTestModelTool(etm);
    config.txsim.SamplingRate = etm.SamplingRate;

    % Scale the signal for better power output and cast to int16. This is the
    % native format for the SDR hardware. Since we are transmitting the same
    % signal in a loop, we can do the cast once to save processing time.
    powerScaleFactor = 0.7;
    eNodeBOutput = eNodeBOutput.*(1/max(abs(eNodeBOutput))*powerScaleFactor);
    eNodeBOutput = int16(eNodeBOutput*2^15);
    config.etm = etm;
    
end