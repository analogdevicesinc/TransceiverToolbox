function [SymbEVM, ScEVM, RbEVM, frameLowEVM, frameHighEVM, frameEVM, enb, count, nFrame] = ...
    DemodSymbs(i, ind, nFrames, count, alg, enb, evm, allocatedSymbols, frameEVM, nSubframes)
    evmGridLow = [];
    evmGridHigh = [];
    
    % update EVM plots
    if (strcmpi(alg.EnablePlotting,'On'))
        % build low and high edge EVM resource grids across all 
        % subframes (for plotting)
        evmSubframeLow = lteDLResourceGrid(enb,1);
        evmSubframeHigh = evmSubframeLow;
        includeUnallocated = true; % include unallocated RBs in plots
        if (~isfield(enb,'TMN') && includeUnallocated)
            if (isempty(ind))
                % skip unallocated downlink subframes (e.g. subframe 5 for
                % RMCs) as the content is not known, but include uplink
                % subframes for TDD as the signal should be empty
                duplexInfo = lteDuplexingInfo(enb);
                if (duplexInfo.NSymbolsDL)
                    unallocRB = [];
                else
                    unallocRB = (0:enb.NDLRB-1).';
                end
            else
                unallocRB = setdiff((0:enb.NDLRB-1).',enb.PDSCH.PRBSet);
            end
            unallocInd = ltePDSCHIndices(enb, setfield(enb.PDSCH,'NTxAnts',size(eqGridLow,3)), unallocRB);
            evmSubframeLow(unallocInd(:,1)) = abs(sum(eqGridLow(unallocInd),2))*100;
            evmSubframeHigh(unallocInd(:,1)) = abs(sum(eqGridHigh(unallocInd),2))*100;
        end                        
        evmSubframeLow(ind(allocatedSymbols,1)) = mean(abs(evm(1,i+1).EV)*100,2);
        evmSubframeHigh(ind(allocatedSymbols,1)) = mean(abs(evm(2,i+1).EV)*100,2);
        evmGridLow = cat(2, evmGridLow, evmSubframeLow);
        evmGridHigh = cat(2, evmGridHigh, evmSubframeHigh);
        % the low or high edge timing is chosen for plotting
        % automatically based on whichever has the largest RMS across
        % all subframes
        evmMaxLow = max([evm(1,:).RMS]);
        evmMaxHigh = max([evm(2,:).RMS]);
        if (evmMaxLow > evmMaxHigh)
            evmGrid = evmGridLow;
            evmSubframe = evmSubframeLow;
        else
            evmGrid = evmGridHigh;
            evmSubframe = evmSubframeHigh;
        end
        % maximum EVM, used for plot limits scaling
        maxEVM = max(evmGrid(:));
        if (maxEVM==0)
            maxEVM = 1;
        end
        % plot EVM versus OFDM symbol
        SymbEVM.evmSymbolRMS = sqrt(sum(evmSubframe.^2,1)./sum(evmSubframe~=0,1)).';
        SymbEVM.evmSymbolPeak = (max(evmSubframe,[],1)./any(evmSubframe,1)).';
        count = count+length(SymbEVM.evmSymbolPeak);

        % plot EVM versus subcarrier
        ScEVM.evmSubcarrierRMS = sqrt(sum(evmGrid.^2,2)./sum(evmGrid~=0,2));
        ScEVM.evmSubcarrierPeak = max(evmGrid,[],2)./any(evmGrid,2);
        
        % plot EVM versus resource block
        evmRBRMS = zeros(enb.NDLRB,1);
        evmRBPeak = evmRBRMS;
        for rb = 0:enb.NDLRB-1
            rbGrid = evmGrid(rb*12 + (1:12),:,:);
            evmRBRMS(rb+1) = sqrt(sum(rbGrid(:).^2)./sum(rbGrid(:)~=0));
            evmRBPeak(rb+1) = max(rbGrid(:))./any(rbGrid(:));
        end
        RbEVM.evmRBRMS = evmRBRMS;
        RbEVM.evmRBPeak = evmRBPeak;
        
    end

    % After we've filled a frame or if we're at the end of a signal 
    % shorter than a frame, do EVM averaging
    frameLowEVM = [];
    frameHighEVM = [];
    nFrame = [];
    if (mod(i, 10)==9 || (nFrames==0 && i==nSubframes-1))
       if (nFrames==0)
           sfrange = 1:nSubframes;
           nFrame = 1;
       else
           sfrange = i-8:i+1;
           nFrame = floor((i+1)/10);
       end
       frameLowEVM = lteEVM(cat(1, evm(1, sfrange).EV));
       frameHighEVM = lteEVM(cat(1, evm(2, sfrange).EV));       
       
       if (frameLowEVM.RMS > frameHighEVM.RMS)
           frameEVM(nFrame) = frameLowEVM;
       else
           frameEVM(nFrame) = frameHighEVM;
       end
    end

    % Update subframe number
    enb.NSubframe = mod(enb.NSubframe+1, 10); 
end