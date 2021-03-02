function [EqGridStruct, EVMStruct, evm, allocatedSymbols, rxSymbols, refSymbols, ind, ...
    enb] = EVMSubframe(i, nSubframes, enb, allPRBSet, refGrid, ...
    rxGridLow, rxGridHigh, HestLow, HestHigh)    
    EVMStruct = struct;
    EqGridStruct = struct;

    gridDims = lteResourceGridSize(enb);
    L = gridDims(2);    
    
    if (~isfield(enb,'TMN'))
        enb.CFI = allCFI(mod(enb.NSubframe,length(allCFI))+1);
        enb.PDSCH.PRBSet = allPRBSet{mod(enb.NSubframe,length(allPRBSet))+1};
    end

    % ZF equalization
    eqGridLow = lteEqualizeZF(rxGridLow(:, i*L+(1:L), :), HestLow(:, i*L+(1:L), :, :));
    eqGridHigh = lteEqualizeZF(rxGridHigh(:, i*L+(1:L), :), HestHigh(:, i*L+(1:L), :, :));

    duplexInfo = lteDuplexingInfo(enb);
    evm = repmat(lteEVM([]), 2, nSubframes);
    
    if ((isfield(enb,'TMN') || ~enableCoding || any(enb.PDSCH.CodedTrBlkSizes(:,enb.NSubframe+1))) && duplexInfo.NSymbolsDL)

        % For low edge EVM and high edge EVM:
        for e = 1:2

            % Select the low or high edge equalizer output
            if (e==1)
                edge = 'Low';
                eqGrid = eqGridLow;
            else
                edge = 'High';
                eqGrid = eqGridHigh;
            end

            if (isfield(enb,'TMN'))
                % using Test Model configuration

                if (enb.CellRefP == 1) || (enb.CellRefP == 2) || (enb.CellRefP == 4)
                    if strcmp(enb.TMN, '3.2') || strcmp(enb.TMN, '3.3')
                        prbset = getPRBSet(enb.TMN, enb.BW, i);
                    else
                        prbset = (0:enb.NDLRB-1).';
                    end
                    ind = ltePDSCHIndices(enb, enb.PDSCH, prbset);
                else                    
                    return;
                end
                rxSymbols = eqGrid(ind); 
                refSubframe = refGrid(:, i*L+(1:L), :);
                refSymbols = refSubframe(ind);

                pbchIndices = ltePBCHIndices(enb);
                [pbchRx, ~] = lteExtractResources(pbchIndices, eqGrid);                    
                ref_PBCH_Symbols = refSubframe(pbchIndices); 

                pcfichIndices = ltePCFICHIndices(enb);
                [pcfichRx, ~] = lteExtractResources(pcfichIndices, eqGrid);                    
                ref_PCFICH_Symbols = refSubframe(pcfichIndices); 

                phichIndices = ltePHICHIndices(enb);
                [phichRx, ~] = lteExtractResources(phichIndices, eqGrid);                    
                ref_PHICH_Symbols = refSubframe(phichIndices); 

                pdcchIndices = ltePDCCHIndices(enb);
                [pdcchRx, ~] = lteExtractResources(pdcchIndices, eqGrid);                    
                ref_PDCCH_Symbols = refSubframe(pdcchIndices); 

                rsIndices = lteCellRSIndices(enb);
                [rsRx, ~] = lteExtractResources(rsIndices, eqGrid);                    
                ref_RS_Symbols = refSubframe(rsIndices); 

                pssIndices = ltePSSIndices(enb);
                [pssRx, ~] = lteExtractResources(pssIndices, eqGrid);                    
                ref_PSS_Symbols = refSubframe(pssIndices);

                sssIndices = lteSSSIndices(enb);
                [sssRx, ~] = lteExtractResources(sssIndices, eqGrid);                    
                ref_SSS_Symbols = refSubframe(sssIndices);

            else
                % using RMC configuration 

                % PDSCH demodulation
                % rxSymbols contains target signal for EVM calculation
                % demodBits are to be used to create reference signal for
                % EVM.
                [ind, info] = ltePDSCHIndices(enb, setfield(enb.PDSCH,'NTxAnts',size(eqGrid,3)), enb.PDSCH.PRBSet);
                rxSymbols = eqGrid(ind);
                demodBits = ltePDSCHDecode(enb, setfield(enb.PDSCH,'W',eye(size(eqGrid,3))), rxSymbols);

                if (enableCoding)
                    % Decode, recode and remodulate demodBits to give
                    % remodSymbols, a vector of reference symbols for EVM
                    % calculation.
                    [decodedBits, crc] = lteDLSCHDecode(enb, enb.PDSCH, ...
                        enb.PDSCH.TrBlkSizes(:,enb.NSubframe+1), demodBits);
                    if (sum(crc)~=0)
                        warning(['CRC failed on decoded data, using sliced received symbols,', ...
                            ' EVM may be inaccurate!']);
                        recodedBits = cellfun(@(x)double(x > 0),demodBits,'UniformOutput',false);
                    else
                        recodedBits = lteDLSCH(enb, enb.PDSCH, info.G, decodedBits);
                    end
                else
                    recodedBits = cellfun(@(x)double(x > 0),demodBits,'UniformOutput',false);
                end
                refSymbols = ltePDSCH(enb, setfield(enb.PDSCH,'W',eye(enb.PDSCH.NLayers)), recodedBits);

            end

            % Only retain allocated symbols for EVM computation. 
            allocatedSymbols = any(abs(refSymbols)>0,2); 
            rxSymbols = rxSymbols(allocatedSymbols,:); 
            refSymbols = refSymbols(allocatedSymbols,:); 

            % Compute and display EVM for this subframe.
            evm(e, i+1) = lteEVM(rxSymbols, refSymbols);
            app.Label.Text = sprintf('%s edge EVM, subframe %d: %0.3f%%\n', ...
                edge, enb.NSubframe, evm(e, i+1).RMS*100);

            [bchBits, pbchSymbols, nfmod4, mib, enb.CellRefP] = ltePBCHDecode(enb, pbchRx);
            if ~isempty(pbchSymbols)
                evm_pbch = lteEVM(pbchSymbols, ref_PBCH_Symbols);
                EVMStruct.PBCH = evm_pbch.RMS;
                EqGridStruct.PBCH = pbchRx;
                EqGridStruct.ref_PBCH_Symbols = ref_PBCH_Symbols;
                for ii = 1:length(pbchSymbols)
                    temp = lteEVM(pbchSymbols(ii), ref_PBCH_Symbols(ii));
                    EqGridStruct.PBCHEVMInd(ii) = 100*temp.RMS;                
                end
                EqGridStruct.PBCHInd = pbchIndices;
            end

            [cfichBits, cfichSymbols] = ltePCFICHDecode(enb, pcfichRx);
            if ~isempty(cfichSymbols)
                evm_pcfich = lteEVM(cfichSymbols, ref_PCFICH_Symbols);
                EVMStruct.PCFICH = evm_pcfich.RMS;
                EqGridStruct.PCFICH = pcfichRx;
                EqGridStruct.ref_PCFICH_Symbols = ref_PCFICH_Symbols;
                for ii = 1:length(cfichSymbols)
                    temp = lteEVM(cfichSymbols(ii), ref_PCFICH_Symbols(ii));
                    EqGridStruct.PCFICHEVMInd(ii) = 100*temp.RMS;                
                end
                EqGridStruct.PCFICHInd = pcfichIndices;
            end

            if ~isempty(phichRx)
                evm_phich = lteEVM(phichRx, ref_PHICH_Symbols);
                EVMStruct.PHICH = evm_phich.RMS;
                EqGridStruct.PHICH = phichRx;
                EqGridStruct.ref_PHICH_Symbols = ref_PHICH_Symbols;
                for ii = 1:length(phichRx)
                    temp = lteEVM(phichRx(ii), ref_PHICH_Symbols(ii));
                    EqGridStruct.PHICHEVMInd(ii) = 100*temp.RMS;                
                end
                EqGridStruct.PHICHInd = phichIndices;
            end
            
            if ~isempty(pdcchRx)
                evm_pdcch = lteEVM(pdcchRx, ref_PDCCH_Symbols);
                EVMStruct.PDCCH = evm_pdcch.RMS;
                EqGridStruct.PDCCH = pdcchRx;
                EqGridStruct.ref_PDCCH_Symbols = ref_PDCCH_Symbols;
                for ii = 1:length(pdcchRx)
                    temp = lteEVM(pdcchRx(ii), ref_PDCCH_Symbols(ii));
                    EqGridStruct.PDCCHEVMInd(ii) = 100*temp.RMS;                
                end
                EqGridStruct.PDCCHInd = pdcchIndices;
            end

            if ~isempty(rsRx)
                evm_rs = lteEVM(rsRx, ref_RS_Symbols);
                EVMStruct.RS = evm_rs.RMS;
                EqGridStruct.RS = rsRx;
                EqGridStruct.ref_RS_Symbols = ref_RS_Symbols;
                for ii = 1:length(rsRx)
                    temp = lteEVM(rsRx(ii), ref_RS_Symbols(ii));
                    EqGridStruct.RSEVMInd(ii) = 100*temp.RMS;                
                end
                EqGridStruct.RSInd = rsIndices;
            end

            if ~isempty(pssRx)
                evm_pss = lteEVM(pssRx, ref_PSS_Symbols);
                EVMStruct.PSS = evm_pss.RMS;
                EqGridStruct.PSS = pssRx;
                EqGridStruct.ref_PSS_Symbols = ref_PSS_Symbols;
                for ii = 1:length(pssRx)
                    temp = lteEVM(pssRx(ii), ref_PSS_Symbols(ii));
                    EqGridStruct.PSSEVMInd(ii) = 100*temp.RMS;                
                end
                EqGridStruct.PSSInd = pssIndices;
            end

            if ~isempty(sssRx)
                evm_sss = lteEVM(sssRx, ref_SSS_Symbols);
                EVMStruct.SSS = evm_sss.RMS;
                EqGridStruct.SSS = sssRx;
                EqGridStruct.ref_SSS_Symbols = ref_SSS_Symbols;
                for ii = 1:length(sssRx)
                    temp = lteEVM(sssRx(ii), ref_SSS_Symbols(ii));
                    EqGridStruct.SSSEVMInd(ii) = 100*temp.RMS;                
                end
                EqGridStruct.SSSInd = sssIndices;
            end

        end

    else
        ind = ltePDSCHIndices(enb, enb.PDSCH, []);
        allocatedSymbols = [];
    end
end

function prbset = getPRBSet(TMN, BW, subframe_index)
    if strcmp(TMN, '3.2') && strcmp(BW, '3MHz')
        switch subframe_index
            case 0
                prbset = [ 0 1 2 3 11 12 13].';
            case 1
                prbset = [0 3 4 10 11 12 13 ].';
            case 2
                prbset = [0 2 3 5 6 11 13].';
            case 3
                prbset = [0 1 4 5 7 10 12].';
            case 4
                prbset = [0 2 3 4 9 10 13 ].';
            case 5
                prbset = [0 1 2 3 11 12 14 ].';
            case 6
                prbset = [4 5 6 8 11 13 14 ].';
            case 7
                prbset = [2 5 6 9 12 13 14].';
            case 8
                prbset = [0 3 4 7 8 9 11].';
            case 9
                prbset = [1 2 3 4 5 11 12 ].';
        end
    elseif strcmp(TMN, '3.2') && strcmp(BW, '5MHz')
        switch subframe_index
            case 0
                prbset = [0 1 3 4 6 7 8 16 17 18 19 20 21 23 24].';
            case 1
                prbset = [0 1 2 3 4 5 6 9 10 12 13 17 18 20 24].';
            case 2
                prbset = [0 1 2 3 7 8 9 10 12 13 14 19 20 23 24 ].';
            case 3
                prbset = [0 5 6 8 10 11 12 13 15 17 18 20 21 22 24].';
            case 4
                prbset = [0 1 2 4 6 7 12 13 14 15 16 17 22 23 24].';
            case 5
                prbset = [0 1 2 3 4 6 7 8 16 17 18 21 22 23 24].';
            case 6
                prbset = [1 3 4 5 7 9 10 11 12 13 14 15 21 22 24].';
            case 7
                prbset = [0 1 2 3 4 7 8 10 13 14 18 19 20 21 24].';
            case 8
                prbset = [1 4 8 9 10 11 12 13 15 16 18 20 22 23 24].';
            case 9
                prbset = [1 2 3 4 5 6 9 10 11 12 13 16 17 21 23].';
        end
    elseif strcmp(TMN, '3.2') && strcmp(BW, '10MHz')
        switch subframe_index
            case 0
                prbset = [1 2 3 4 5 6 7 8 9 10 11 15 16 17 20 21 28 30 31 32 33 35 36 39 40 42 44 46 47 48].';
            case 1
                prbset = [0 1 2 4 5 6 7 9 10 11 13 15 18 20 21 22 24 25 27 28 29 34 35 36 37 40 43 44 46 49].';
            case 2
                prbset = [0 1 3 4 5 6 7 11 12 14 17 18 19 20 21 22 24 25 26 27 28 29 31 32 34 38 41 42 45 49].';
            case 3
                prbset = [0 1 2 3 5 6 8 12 14 15 16 17 18 22 23 26 28 29 30 32 34 35 38 39 40 41 42 45 46 47 ].';
            case 4
                prbset = [0 3 6 7 8 9 10 12 13 15 16 17 18 21 23 25 28 31 33 37 38 39 41 42 44 45 46 47 48 49].';
            case 5
                prbset = [0 2 3 4 5 7 9 10 11 12 13 14 15 19 20 28 29 30 31 34 36 37 38 39 40 42 44 45 48 49 ].';
            case 6
                prbset = [0 1 3 4 5 6 8 9 10 13 14 16 17 18 19 20 21 23 24 29 30 31 32 35 37 38 39 40 47 48].';
            case 7
                prbset = [0 1 2 3 4 5 6 7 9 10 12 14 16 17 18 19 22 24 25 26 27 28 30 31 32 34 37 42 45 48].';
            case 8
                prbset = [2 5 7 8 9 10 11 14 15 16 17 21 22 27 28 29 30 31 32 34 35 37 38 41 42 43 44 46 48 49].';
            case 9
                prbset = [1 3 6 9 11 13 15 16 17 18 21 24 25 26 27 28 29 30 32 34 37 38 39 40 41 42 45 47 48 49].';
        end    
    elseif strcmp(TMN, '3.2') && strcmp(BW, '15MHz')
        switch subframe_index
            case 0
                prbset = [0 1 2 3 5 6 7 8 9 12 14 16 17 18 19 20 21 23 24 25 26 28 29 30 31 32 33 41 42 45 47 48 49 50 52 53 56 57 60 62 63 64 65 67 68 69 70 71 72 73].';
            case 1
                prbset = [0 1 2 3 4 5 6 7 8 11 18 20 21 24 25 26 27 29 30 31 33 36 37 38 39 40 43 45 46 47 48 49 50 51 53 54 55 57 58 59 60 61 65 67 68 69 70 71 73 74].';
            case 2
                prbset = [1 2 3 4 9 11 12 13 14 15 17 18 20 21 22 24 25 26 28 29 31 32 33 34 40 42 43 44 45 46 47 48 50 51 52 54 56 58 59 60 61 62 63 64 68 70 71 72 73 74].';
            case 3
                prbset = [2 3 4 6 7 9 11 12 14 15 17 18 20 22 24 25 27 28 29 30 31 33 34 35 38 39 40 42 43 45 46 47 48 49 55 56 59 60 61 62 63 65 66 67 68 69 70 71 73 74].';
            case 4
                prbset = [2 4 5 6 8 10 13 15 16 17 18 20 22 24 25 26 27 28 29 30 31 32 33 34 35 38 40 41 44 45 46 47 48 50 51 52 53 54 56 59 60 63 64 67 69 70 71 72 73 74].';
            case 5
                prbset = [0 2 3 4 5 7 8 11 12 14 16 18 20 22 23 24 25 27 28 29 30 31 33 42 43 45 46 47 48 49 50 51 53 54 56 58 60 61 62 63 64 65 66 67 68 69 70 71 72 73 ].';
            case 6
                prbset = [0 1 2 3 9 11 12 14 15 17 18 20 23 25 26 28 29 30 31 32 33 36 37 38 39 41 42 43 45 46 50 52 53 54 57 58 59 60 61 62 63 64 65 67 68 70 71 72 73 74].';
            case 7
                prbset = [0 1 3 4 5 6 7 8 11 12 14 19 20 21 23 24 26 27 28 30 31 33 34 35 38 40 41 42 44 45 46 49 51 52 53 54 55 58 59 60 61 62 63 65 67 69 70 71 72 73].';
            case 8
                prbset = [0 1 2 3 7 8 9 10 12 13 14 15 17 18 19 21 22 23 24 25 26 27 28 29 32 33 34 36 37 39 40 43 46 47 48 49 50 53 54 56 61 62 63 66 68 69 71 72 73 74].';
            case 9
                prbset = [0 1 3 7 8 11 13 14 16 18 19 20 21 22 23 25 27 28 29 30 32 34 35 36 40 41 42 43 44 45 46 47 48 50 51 53 54 55 57 59 61 62 63 64 66 67 68 69 70 71].';
        end    
    elseif strcmp(TMN, '3.2') && strcmp(BW, '20MHz')
        switch subframe_index
            case 0
                prbset = [0 1 4 6 7 8 9 10 11 13 14 15 16 20 21 22 23 25 26 28 29 30 31 32 33 34 36 39 41 42 44 45 54 56 57 58 60 61 63 66 67 68 72 75 76 77 79 81 82 84 85 87 88 91 92 94 95 97 98 99].';
            case 1
                prbset = [1 3 5 6 7 9 10 13 17 19 20 21 22 23 24 25 26 27 28 30 32 33 34 35 36 39 41 47 48 49 50 51 53 54 55 57 58 59 60 61 64 65 67 68 75 76 77 79 80 81 83 84 86 87 89 90 91 93 95 99].';
            case 2
                prbset = [0 1 2 3 6 8 10 11 15 16 17 19 21 22 23 25 26 28 29 30 32 33 35 38 39 40 41 42 43 44 46 49 51 52 53 54 57 59 60 62 63 64 65 67 69 71 72 73 76 79 81 84 86 88 89 90 92 93 94 99].';
            case 3
                prbset = [5 6 7 9 10 12 14 15 16 17 21 22 23 24 27 28 29 30 31 33 34 35 36 37 39 41 44 45 47 49 50 53 54 55 56 57 59 64 65 66 68 70 72 75 76 77 80 81 84 85 86 87 90 91 92 94 95 97 98 99].';
            case 4
                prbset = [0 2 3 4 5 6 7 11 12 14 15 17 19 21 22 24 26 32 36 37 40 42 43 44 47 48 49 50 51 54 56 57 60 62 63 65 66 67 70 71 73 76 77 78 79 81 82 83 84 85 86 87 89 91 94 95 96 97 98 99].';
            case 5
                prbset = [1 2 5 6 8 9 11 12 13 15 21 22 25 26 27 28 29 30 31 32 34 35 38 39 40 41 43 44 45 46 53 57 58 59 61 62 63 64 65 66 68 69 71 72 73 75 77 78 80 82 83 84 85 86 93 94 95 96 97 99].';
            case 6
                prbset = [0 1 2 3 5 8 9 10 12 13 14 16 22 25 26 27 28 29 31 32 33 34 36 37 38 39 43 44 45 46 48 49 52 53 55 59 61 62 63 64 70 71 72 73 74 75 77 78 80 81 82 84 86 89 90 91 93 97 98 99].';
            case 7
                prbset = [0 1 3 4 5 7 8 10 11 15 18 19 20 21 26 27 29 30 31 33 35 37 38 39 40 41 43 44 45 46 47 48 49 50 52 53 55 56 58 60 62 64 65 66 67 69 70 71 72 73 74 81 83 84 86 92 93 94 96 98].';
            case 8
                prbset = [2 3 4 5 7 9 11 13 15 16 17 21 23 24 25 27 28 29 31 33 35 36 40 42 43 44 45 46 48 49 51 52 53 54 55 56 57 59 61 63 64 65 68 71 76 77 78 81 82 83 84 85 86 87 90 91 93 94 98 99 ].';
            case 9
                prbset = [0 3 4 6 7 8 10 11 13 16 18 21 22 23 25 26 28 29 32 35 36 37 38 43 44 46 47 48 49 53 54 57 58 59 60 61 64 66 67 68 69 70 72 76 77 78 80 81 82 83 84 86 87 88 89 91 92 94 95 96].';
        end
    elseif strcmp(TMN, '3.3') && strcmp(BW, '3MHz')
        switch subframe_index
            case 0
                prbset = [0 1 2 3 11 12 13].';
            case 1
                prbset = [0 3 4 10 11 12 13].';
            case 2
                prbset = [0 2 3 5 6 11 13].';
            case 3
                prbset = [0 1 4 5 7 10 12].';
            case 4
                prbset = [0 2 3 4 9 10 13].';
            case 5
                prbset = [0 1 2 3 11 12 14].';
            case 6
                prbset = [4 5 6 8 11 13 14].';
            case 7
                prbset = [2 5 6 9 12 13 14].';
            case 8
                prbset = [0 3 4 7 8 9 11].';
            case 9
                prbset = [1 2 3 4 5 11 12].';
        end
    elseif strcmp(TMN, '3.3') && strcmp(BW, '5MHz')
        switch subframe_index
            case 0
                prbset = [0 1 3 6 7 8 16 17 18 20 21 23 24 ].';
            case 1
                prbset = [0 1 2 4 5 6 9 10 12 17 18 20 24].';
            case 2
                prbset = [0 1 2 3 9 10 12 13 14 19 20 23 24 ].';
            case 3
                prbset = [0 5 6 8 10 12 13 15 17 18 20 21 24].';
            case 4
                prbset = [0 2 4 6 7 12 13 15 16 17 22 23 24].';
            case 5
                prbset = [0 1 2 3 4 6 7 8 16 18 21 22 24].';
            case 6
                prbset = [1 3 4 5 7 9 10 11 12 15 21 22 24].';
            case 7
                prbset = [0 1 2 3 4 7 10 14 18 19 20 21 24].';
            case 8
                prbset = [1 4 8 9 10 11 12 13 15 16 18 20 23].';
            case 9
                prbset = [1 2 3 4 5 6 9 10 11 13 16 17 23].';
        end
    elseif strcmp(TMN, '3.3') && strcmp(BW, '10MHz')
        switch subframe_index
            case 0
                prbset = [1 2 3 5 6 7 8 9 10 11 15 16 20 28 31 32 33 35 36 39 40 42 46 47 48].';
            case 1
                prbset = [1 2 4 5 6 7 9 11 15 18 20 21 22 24 25 27 29 34 35 36 37 40 44 46 49].';
            case 2
                prbset = [0 3 5 6 11 12 14 17 18 19 20 21 22 24 25 26 27 28 29 31 34 38 41 42 49].';
            case 3
                prbset = [0 1 2 3 5 6 8 14 16 18 22 23 26 28 30 32 34 38 39 40 41 42 45 46 47].';
            case 4
                prbset = [0 3 6 7 8 9 10 12 13 16 17 18 21 23 25 31 33 37 41 42 45 46 47 48 49].';
            case 5
                prbset = [0 2 3 4 5 7 9 10 11 12 13 15 19 20 28 29 30 31 34 36 37 42 44 48 49].';
            case 6
                prbset = [0 1 4 5 6 8 9 10 13 16 17 18 19 20 21 24 29 30 31 32 35 37 38 39 47].';
            case 7
                prbset = [0 2 3 4 5 6 7 9 10 12 16 17 18 19 22 24 25 26 30 31 34 37 42 45 48].';
            case 8
                prbset = [5 7 8 9 14 15 16 21 22 27 28 30 31 32 34 35 37 38 41 42 43 44 46 48 49].';
            case 9
                prbset = [3 9 11 13 16 17 18 21 24 27 28 29 30 32 34 37 38 39 40 41 42 45 47 48 49].';
        end    
    elseif strcmp(TMN, '3.3') && strcmp(BW, '15MHz')
        switch subframe_index
            case 0
                prbset = [0 1 2 3 5 6 7 8 9 12 16 17 18 19 20 21 23 24 25 28 29 30 31 32 33 42 47 48 49 53 60 63 65 67 68 70 71 73].';
            case 1
                prbset = [0 1 3 4 5 6 7 8 11 18 20 21 24 25 26 27 29 30 31 38 46 47 49 50 51 53 54 55 57 59 60 61 67 68 69 70 73 74].';
            case 2
                prbset = [2 11 12 13 15 17 18 21 22 24 25 26 29 31 32 33 34 40 42 45 46 47 50 51 52 54 58 59 60 61 62 63 64 68 70 71 72 74].';
            case 3
                prbset = [2 3 4 6 7 9 11 12 15 17 20 24 27 30 33 34 35 38 39 42 43 45 46 48 49 55 56 59 60 61 62 65 67 69 70 71 73 74].';
            case 4
                prbset = [4 5 6 8 10 13 17 22 25 26 27 28 29 30 31 32 33 34 35 38 41 44 46 48 50 52 53 54 56 59 60 64 67 69 70 71 73 74].';
            case 5
                prbset = [0 2 3 4 7 8 11 14 18 20 23 24 25 27 29 42 43 45 46 47 48 49 50 51 54 56 60 62 63 65 66 67 68 69 70 71 72 73].';
            case 6
                prbset = [1 2 9 11 14 15 18 25 26 28 29 30 31 32 33 36 37 38 39 41 43 45 46 50 53 54 58 59 60 62 63 65 67 68 70 71 72 73].';
            case 7
                prbset = [3 4 6 7 8 11 12 19 20 23 24 26 27 28 30 33 34 35 40 41 42 46 49 51 53 54 58 59 60 61 62 65 67 69 70 71 72 73].';
            case 8
                prbset = [0 1 2 3 7 8 9 10 13 14 15 17 18 19 22 23 24 25 26 27 28 32 36 37 39 46 47 50 53 56 61 62 63 68 69 71 73 74].';
            case 9
                prbset = [0 3 7 8 11 13 14 16 18 19 23 25 27 28 29 30 32 35 41 42 44 46 47 48 50 53 55 57 59 61 62 64 66 67 68 69 70 71].';
        end    
    elseif strcmp(TMN, '3.3') && strcmp(BW, '20MHz')
        switch subframe_index
            case 0
                prbset = [0 1 4 6 10 13 14 15 16 20 22 23 25 26 28 29 30 31 32 33 36 39 41 42 44 45 54 56 57 60 63 66 67 68 72 76 77 79 82 84 85 87 88 91 92 94 95 97 98 99].';
            case 1
                prbset = [1 3 7 9 10 13 19 20 21 22 23 24 25 26 27 30 33 34 35 36 47 48 49 50 51 53 54 55 57 59 60 61 64 65 67 68 75 76 77 80 81 83 84 86 87 89 90 93 95 99].';
            case 2
                prbset = [1 2 3 6 8 10 11 15 16 17 19 21 25 26 28 29 30 32 33 35 38 39 40 41 42 43 44 46 49 51 52 54 60 62 63 64 65 69 72 76 79 81 84 86 88 89 90 93 94 99 ].';
            case 3
                prbset = [5 7 9 10 12 14 15 16 21 22 23 24 27 28 29 30 33 34 35 36 37 39 41 44 45 47 49 54 55 56 57 64 66 68 70 72 76 77 80 81 85 86 87 90 91 92 94 95 98 99].';
            case 4
                prbset = [2 3 4 5 6 7 14 15 17 19 21 22 24 26 37 40 42 43 44 47 49 51 54 56 57 60 62 63 65 66 67 70 71 73 76 77 78 81 82 83 84 85 86 87 89 94 95 96 97 99].';
            case 5
                prbset = [1 2 5 6 8 9 12 13 21 22 25 26 27 28 29 31 32 34 35 39 40 43 45 46 53 57 59 61 62 63 64 66 68 69 71 73 75 77 78 82 83 84 85 86 93 94 95 96 97 99].';
            case 6
                prbset = [0 1 2 3 5 8 9 10 12 13 22 25 26 27 29 31 32 33 36 37 38 39 43 45 48 49 52 53 55 59 62 63 64 71 72 73 74 75 77 78 81 82 84 86 89 91 93 97 98 99 ].';
            case 7
                prbset = [0 1 3 4 5 7 10 11 15 18 19 20 21 26 27 29 30 31 33 35 39 40 41 43 44 46 47 49 50 53 55 56 62 64 65 66 67 69 70 71 72 74 83 84 86 92 93 94 96 98].';
            case 8
                prbset = [2 3 4 7 9 11 13 15 16 24 25 27 29 31 33 35 36 40 43 44 45 46 49 51 52 53 54 55 56 57 59 63 64 65 68 71 77 78 81 82 83 84 85 86 90 91 93 94 98 99].';
            case 9
                prbset = [0 4 6 7 8 10 11 13 16 18 21 22 23 26 29 32 35 36 37 43 44 46 47 48 49 53 54 57 59 60 61 64 66 67 68 69 70 72 76 78 80 81 82 84 87 89 91 92 95 96].';
        end
    end
end