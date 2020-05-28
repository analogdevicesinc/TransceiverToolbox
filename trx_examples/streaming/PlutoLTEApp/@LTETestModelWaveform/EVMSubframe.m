function [EVMStruct, evm, allocatedSymbols, rxSymbols, refSymbols, ind, ...
    enb] = EVMSubframe(i, nSubframes, enb, allPRBSet, refGrid, ...
    rxGridLow, rxGridHigh, HestLow, HestHigh)    
    EVMStruct = struct;

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

                ind = ltePDSCHIndices(enb, enb.PDSCH, (0:enb.NDLRB-1).');
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
                % app.SummaryTable.Data(6,2) = {sprintf('%0.3f', 100*evm_pbch.RMS)};
            end

            [cfichBits, cfichSymbols] = ltePCFICHDecode(enb, pcfichRx);
            if ~isempty(cfichSymbols)
                evm_pcfich = lteEVM(cfichSymbols, ref_PCFICH_Symbols);
                EVMStruct.PCFICH = evm_pcfich.RMS;
                % app.SummaryTable.Data(7,2) = {sprintf('%0.3f', 100*evm_pcfich.RMS)};
            end

            if ~isempty(phichRx)
                evm_phich = lteEVM(phichRx, ref_PHICH_Symbols);
                EVMStruct.PHICH = evm_phich.RMS;
                % app.SummaryTable.Data(8,2) = {sprintf('%0.3f', 100*evm_phich.RMS)};
            end

            % something seems incorrect here CHECK ME!
            [cchBits, cchSymbols] = ltePDCCHDecode(enb, pdcchRx);
            if ~isempty(cchSymbols)
                evm_pdcch = lteEVM(cchSymbols, ref_PDCCH_Symbols);
                EVMStruct.PDCCH = evm_pdcch.RMS;
                % app.SummaryTable.Data(9,2) = {sprintf('%0.3f', evm_pdcch.RMS)};
            end

            if ~isempty(rsRx)
                evm_rs = lteEVM(rsRx, ref_RS_Symbols);
                EVMStruct.RS = evm_rs.RMS;
                % app.SummaryTable.Data(10,2) = {sprintf('%0.3f', 100*evm_rs.RMS)};
            end

            if ~isempty(pssRx)
                evm_pss = lteEVM(pssRx, ref_PSS_Symbols);
                EVMStruct.PSS = evm_pss.RMS;
                % app.SummaryTable.Data(11,2) = {sprintf('%0.3f', 100*evm_pss.RMS)};
            end

            if ~isempty(sssRx)
                evm_sss = lteEVM(sssRx, ref_SSS_Symbols);
                EVMStruct.SSS = evm_sss.RMS;
                % app.SummaryTable.Data(12,2) = {sprintf('%0.3f', 100*evm_sss.RMS)};
            end


        end

    else
        ind = ltePDSCHIndices(enb, enb.PDSCH, []);
        allocatedSymbols = [];
    end
end
