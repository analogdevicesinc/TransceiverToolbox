classdef LTETestModelWaveform < handle
    methods (Static, Access = private)
        % static, private methods in separate files
        foffset = frequencyOffsetCellRS(enb, cec, rxgrid)
        W = getEVMWindow(enb)
    end
    
    methods (Static)
        [FreqOffset, IQOffset, refGrid, rxGridLow, rxGridHigh, ...
            rxWaveform, nSubframes, nFrames, alg, frameEVM] = ...
            Sync(enb, cec, rxWaveform)
        [psd_frame, f, HestLow, HestHigh, allPRBSet] = ...
            EstimateChannel(etm, rxWaveform, nSubframes, cec, rxGridLow, rxGridHigh)
        [EVMStruct, evm, allocatedSymbols, rxSymbols, refSymbols, pdsch_ind, enb] = ...
            EVMSubframe(i, nSubframes, enb, allPRBSet, refGrid, rxGridLow, ...
            rxGridHigh, HestLow, HestHigh)  
        [SymbEVM, ScEVM, RbEVM, frameLowEVM, frameHighEVM, frameEVM, enb, count, nFrame] = ...
            DemodSymbs(i, pdsch_ind, nFrames, count, alg, enb, evm, allocatedSymbols, frameEVM, nSubframes)        
    end
    
    methods (Static)
        function [eNodeBOutput, etm] = Tx(TMN, BW)
            % LTE E-TM Tx
            etm = lteTestModel(TMN, BW);
            [eNodeBOutput,~,etm] = lteTestModelTool(etm);            
        end
        
        function [dataRx, frameOffset] = CorrectFreqFrameOffset(dataRx, configuration)            
            % Apply frequency estimation and correction for the purposes of performing
            % timing synchronization
            foffset_est = lteFrequencyOffset(configuration, dataRx);
            dataRxFreqCorrected = lteFrequencyCorrect(configuration, dataRx, foffset_est);

            % Synchronize the captured waveform
            frameOffset = lteDLFrameOffset(configuration, dataRxFreqCorrected, 'TestEVM');
            dataRx = dataRx(1+frameOffset:end,:);
            dataRx = dataRx(1:76800);
        end
    end
end    