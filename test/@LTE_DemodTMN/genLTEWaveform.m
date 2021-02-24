function [eNodeBOutput, etm] = genLTEWaveform(TMN, BW)
    [eNodeBOutput, etm] = LTE_DemodTMN.Tx(TMN, BW);
    
    % scale the signal and cast to int16
    backoff = -3; % dB
    Output_max = max([max(abs(real(eNodeBOutput))) max(abs(imag(eNodeBOutput)))]);
    eNodeBOutput = eNodeBOutput.*(10^(backoff/20))/Output_max;
    eNodeBOutput = int16(eNodeBOutput*2^15);
end     