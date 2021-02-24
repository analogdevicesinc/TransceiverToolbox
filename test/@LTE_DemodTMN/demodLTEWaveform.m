function logEVM = demodLTEWaveform(eNodeBInput, etm)
    [dataRx, FreqOffset, frameOffset] = ...
           LTE_DemodTMN.CorrectFreqFrameOffset(eNodeBInput, etm);
       %{
    logEVM.FrequencyCorrection = logEVM.FrequencyCorrection + ...
        FreqOffset/logEVM.PlutoTx.CenterFrequency*1e6;
    logEVM.FreqOffset = FreqOffset;
    logEVM.FrameOffset = frameOffset/etm.SamplingRate;   
    %}

    % compute freq offset and IQ offset
    cec.PilotAverage = 'TestEVM';            
    [FreqOffset2, IQOffset_temp, refGrid, rxGridLow, rxGridHigh, ...
        rxWaveform, nSubframes, nFrames, alg, frameEVM] = ...
        LTE_DemodTMN.Sync(etm, cec, dataRx);
    %{
    logEVM.FrequencyCorrection = logEVM.FrequencyCorrection + ...
        FreqOffset2/logEVM.PlutoTx.CenterFrequency*1e6;
    logEVM.IQOffset = IQOffset_temp;
        %}

    % estimate channel
    [~, ~, HestLow, HestHigh, allPRBSet] = ...
        LTE_DemodTMN.EstimateChannel(etm, ...
        rxWaveform, nSubframes, cec, rxGridLow, rxGridHigh);

    % compute EVM measurements           
    gridDims = lteResourceGridSize(etm);
    L = gridDims(2);
    count = 1;
    fprintf('\n');
    for i=0:nSubframes-1
        %{
       app.SummaryTable1_Data{1} = logEVM.CyclicPrefix;
       app.SummaryTable1_Data{2} = logEVM.NCellID;
        %}
        fprintf('*');
       % fprintf('Processing Subframe #%d\n', i);        

       [EqGridStruct, EVMStruct, evm, allocatedSymbols, rxSymbols, ...
           refSymbols, pdsch_ind, etm] = ...
           LTE_DemodTMN.EVMSubframe(i, nSubframes, etm, allPRBSet, ...
           refGrid, rxGridLow, rxGridHigh, HestLow, HestHigh);
       if (etm.CellRefP ~= 1) && (etm.CellRefP ~= 2) && (etm.CellRefP ~= 4)
           error('Test stopped. RF loopback cable likely disconnected. For the demodulated parameter field CellRefP, the value (%d) is not one of the set (1, 2, 4).\n',...
               etm.CellRefP);
       end
       logEVM.EqGridStruct = EqGridStruct;
       logEVM.DemodSyms = ...
           struct('Rec', rxSymbols, 'Ref', refSymbols);

       if isfield(EVMStruct, 'PBCH')
           logEVM.evmRMSCh.PBCH = 100*EVMStruct.PBCH;
       end               
       if isfield(EVMStruct, 'PCFICH')
           logEVM.evmRMSCh.PCFICH = 100*EVMStruct.PCFICH;
       end
       if isfield(EVMStruct, 'PHICH')
           logEVM.evmRMSCh.PHICH = 100*EVMStruct.PHICH;
       end
       if isfield(EVMStruct, 'PDCCH')
           logEVM.evmRMSCh.PDCCH = 100*EVMStruct.PDCCH;
       end
       if isfield(EVMStruct, 'RS')
           logEVM.evmRMSCh.RS = 100*EVMStruct.RS;
       end
       if isfield(EVMStruct, 'PSS')
           logEVM.evmRMSCh.PSS = 100*EVMStruct.PSS;
       end
       if isfield(EVMStruct, 'SSS')
           logEVM.evmRMSCh.SSS = 100*EVMStruct.SSS;
       end

       [SymbEVM, ScEVM, RbEVM, frameLowEVM, frameHighEVM, frameEVM, etm,...
           count, ~] = ...
           LTE_DemodTMN.DemodSymbs(i, pdsch_ind, nFrames, ...
           count, alg, etm, evm, ...
           allocatedSymbols, frameEVM, nSubframes);
       SymbEVM.evmSymbolRMS(1) = SymbEVM.evmSymbolRMS(2);
       SymbEVM.evmSymbolPeak(1) = SymbEVM.evmSymbolPeak(2);
       logEVM.evmSC = ...
           struct('RMS', ScEVM.evmSubcarrierRMS, 'Peak', ScEVM.evmSubcarrierPeak, ...
           'EVMGrid', ScEVM.evmGrid); 
       PDSCHevm_temp = ScEVM.evmGrid(:);
       logEVM.evmRMSCh.PDSCH = mean(PDSCHevm_temp(PDSCHevm_temp~=0));
       logEVM.evmRB = ...
           struct('RMS', RbEVM.evmRBRMS, 'Peak', RbEVM.evmRBPeak);  
       logEVM.evmSymbol = ...
           struct('RMS', SymbEVM.evmSymbolRMS, 'Peak', SymbEVM.evmSymbolPeak);

       if (mod(i, 10)==9 || (nFrames==0 && i==nSubframes-1))                       
           logEVM.FrameEVM = ...
               struct('Low', frameLowEVM, ...
               'High', frameHighEVM, 'Overall', frameEVM);                                       
       end                    
    end
    % Final Mean EVM across all frames
    logEVM.FinalEVM = lteEVM(cat(1, frameEVM(:).EV));      
end