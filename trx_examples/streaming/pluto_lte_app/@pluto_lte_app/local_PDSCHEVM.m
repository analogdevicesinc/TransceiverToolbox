function [finalEVM,plots] = local_PDSCHEVM(app, enb,cec,rxWaveform,varargin)
   
    persistent finalEVM_prev;
    if isempty(finalEVM_prev)
        finalEVM_prev = [];
    end
    persistent delta_f_tilde_prev;
    if isempty(delta_f_tilde_prev)
        delta_f_tilde_prev = [];
    end
    persistent iqoffset_prev;
    if isempty(iqoffset_prev)
        iqoffset_prev = [];
    end
    
    if (nargin>4)
        alg = varargin{1};
    else
        alg = struct();
    end

    % Control over receiver corrections to be performed:

    % Frequency offset correction with estimation in the time domain based
    % on cyclic prefix correlation; estimation/correction applies to each
    % subframe.
    if (~isfield(alg,'CorrectFreqOffsetCPCorr'))
        alg.CorrectFreqOffsetCPCorr = true;
    end

    % IQ offset correction with estimation of the mean of the signal in the
    % time domain; estimation/correction applies to each subframe.
    if (~isfield(alg,'CorrectIQOffset'))
        alg.CorrectIQOffset = true;        
    end

    % Frequency offset correction with estimation in the frequency domain
    % based on the phase shift between channel estimate REs in the
    % locations of successive Cell-Specific Reference Signal (Cell RS)
    % symbols; estimation/correction applies to each subframe. This
    % estimator is more accurate for small frequency offsets than 
    % estimation in the time domain.
    if (~isfield(alg,'CorrectFreqOffsetCellRS'))
        alg.CorrectFreqOffsetCellRS = true;
    end

    if (~isfield(alg,'EnablePlotting'))
        alg.EnablePlotting = 'On';
    end

    % CSI scaling of soft bits
    if (~isfield(enb.PDSCH,'CSI'))
        enb.PDSCH.CSI = 'On';
    end

    app.SummaryTable.Data(1,2) = {sprintf('%s', enb.CyclicPrefix)};
    app.SummaryTable.Data(2,2) = {sprintf('%d', num2str(enb.NCellID))};
            
    % Compute some parameters.
    dims = lteOFDMInfo(enb);
    samplesPerSubframe = dims.SamplingRate/1000;
    nSubframes = floor(size(rxWaveform, 1)/samplesPerSubframe);
    nFrames = floor(nSubframes/10);
    W = app.getEVMWindow(enb);
    if (mod(W,2)==0)
        alpha = 0;
    else
        alpha = 1;
    end

    cpLength=double(dims.CyclicPrefixLengths(2)); 

    gridDims = lteResourceGridSize(enb);
    L = gridDims(2);    

    % Pad on the tail to allow for CP correlation.
    rxWaveform = [rxWaveform; zeros(dims.Nfft, size(rxWaveform, 2))];          

    if (isfield(enb,'TMN'))
        % Create reference test model grid        
        [~,refGrid] = lteTestModelTool(setfield(enb,'TotSubframes',nSubframes));
    end

    % Setup plots          
    if (strcmpi(alg.EnablePlotting,'On'))
        psdPlot = app.PSDAxes;
        psdPlot.XLim = [-0.5 0.5]*enb.SamplingRate*1e-6;
        evmSymbolPlot = app.evmSymsAxes;
        evmSymbolPlot.XLim = [0 (L*nSubframes)-1];
        evmSubcarrierPlot = app.evmSCAxes;
        temp = lteDLResourceGrid(enb,1);
        evmSubcarrierPlot.XLim = [1 size(temp, 1)];
        evmRBPlot = app.evmRBAxes;
        evmRBPlot.XLim = [1 enb.NDLRB];
        evmRBPlot.YLim = [0 10];
        constPlot = app.constAxes;
        evmSymbolPlot.cla;
        evmSubcarrierPlot.cla;
        evmRBPlot.cla;
        constPlot.cla;
    end

    enableCoding = all(isfield(enb.PDSCH,{'CodedTrBlkSizes','TrBlkSizes'}));

    % For each subframe:
    rxGridLow = [];
    rxGridHigh = [];
    frameEVM = repmat(lteEVM([]), 1, max(nFrames,1));
    delta_f_tilde_old = 0.0;
    p = 1;
    evm = repmat(lteEVM([]), 2, nSubframes);
    startSubframe = enb.NSubframe;
    for i = 0:nSubframes-1

        if (i == 0)
            delta_f_tilde_prev = [];
            iqoffset_prev = [];
        end
        % Extract this subframe.
        rxSubframe = rxWaveform( ...
            i*samplesPerSubframe+(1:(samplesPerSubframe+dims.Nfft)), :);
        
        % Do frequency offset estimation and correction for this subframe
        if (alg.CorrectFreqOffsetCPCorr)
            delta_f_tilde = lteFrequencyOffset(enb, rxSubframe, 0);
        else
            delta_f_tilde = 0;
        end
        rxSubframeFreqCorrected = lteFrequencyCorrect( ...
            enb, rxSubframe(1:samplesPerSubframe, :), delta_f_tilde);
        delta_f_tilde_prev = [delta_f_tilde_prev delta_f_tilde];
        

        % Perform IQ offset correction
        if (alg.CorrectIQOffset)
            iqoffset = mean(rxSubframeFreqCorrected);
            rxSubframeFreqCorrected = ...
                rxSubframeFreqCorrected - ...
                repmat(iqoffset, size(rxSubframeFreqCorrected, 1), 1);
        end
        iqoffset_prev = [iqoffset_prev iqoffset];
        

        % Additional CRS-based frequency offset estimation and correction        
        if (alg.CorrectFreqOffsetCellRS)
            rxGrid = lteOFDMDemodulate(enb, rxSubframeFreqCorrected);                       
            delta_f_tilde_crs = frequencyOffsetCellRS(app,...
                setfield(enb,'NSubframe',mod(i+startSubframe,10)), cec, rxGrid); %#ok<*SFLD>
            rxSubframeFreqCorrected = lteFrequencyCorrect( ...
                enb, rxSubframeFreqCorrected, delta_f_tilde_crs);        
            delta_f_tilde = delta_f_tilde + delta_f_tilde_crs;
        end               

        % Ensure phase continuity between frequency corrected outputs 
        duplexInfo = lteDuplexingInfo(setfield(enb,'NSubframe',mod(i+startSubframe,10)));
        if (duplexInfo.NSymbolsDL)
            t = size(rxSubframeFreqCorrected, 1)/dims.SamplingRate;
            p = p*exp(-1i*2*pi*delta_f_tilde_old*t);
            rxSubframeFreqCorrected = rxSubframeFreqCorrected.*p;        
            delta_f_tilde_old = delta_f_tilde;
        end

        % For low edge EVM and high edge EVM:
        for e = 1:2

            % Compute EVM window edge position and perform OFDM
            % demodulation. The standard defines window position in
            % samples, the LTE Toolbox(TM) requires it as a fraction of the
            % cyclic prefix length.
            if (e==1)
                cpFraction = (cpLength/2 + alpha - floor(W/2))/cpLength;                
                 rxGridLow = [rxGridLow lteOFDMDemodulate( ...
                     enb, rxSubframeFreqCorrected, cpFraction)]; %#ok<AGROW>
            else
                cpFraction = (cpLength/2 + floor(W/2))/cpLength;                
                rxGridHigh = [rxGridHigh lteOFDMDemodulate( ...
                    enb, rxSubframeFreqCorrected, cpFraction)]; %#ok<AGROW>
            end

        end

    end
    app.SummaryTable.Data(4,2) = {sprintf('%f Hz', mean(delta_f_tilde_prev))};
    app.SummaryTable.Data(5,2) = {sprintf('%f', mean(iqoffset_prev))};

    % Channel estimation. 
    % Allow channel estimates to be processed in blocks of 10 subframes if
    % TestEVM channel estimate is used as per TS36.141 Annex F.3.4
    if strcmpi(cec.PilotAverage,'TestEVM')
        nsfBlk = 10;
    else
        nsfBlk = nSubframes;
    end
    nBlocks = ceil(nSubframes/nsfBlk);

    HestLow = [];
    HestHigh = [];
    NestLow = [];
    NestHigh = [];
    if (any(strcmpi(enb.PDSCH.TxScheme,{'Port5' 'Port7-8' 'Port8' 'Port7-14'})))
        cec.Reference = 'DMRS';
        channelEstimate = @(x)lteDLChannelEstimate(enb,enb.PDSCH,cec,x);
    else
        channelEstimate = @(x)lteDLChannelEstimate(enb,cec,x);
    end
    for i = 0:(nBlocks-1)
        % Index of symbols within current block. If a symbol index exceeds
        % the length of the received grid remove it.
        symIdx = i*L*nsfBlk+(1:(L*nsfBlk));
        symIdx(symIdx>size(rxGridLow, 2)) = [];

        [HestLowBlk, NestLowBlk] = channelEstimate(rxGridLow(:, symIdx, :));
        HestHighBlk = channelEstimate(rxGridHigh(:, symIdx, :));  

        HestLow = [HestLow HestLowBlk];    %#ok<AGROW>
        HestHigh = [HestHigh HestHighBlk]; %#ok<AGROW>
        NestLow = [NestLow NestLowBlk];    %#ok<AGROW>
    end

    evmGridLow = [];
    evmGridHigh = [];
    if (~isfield(enb,'TMN'))
        allCFI = enb.CFI;
        if (iscell(enb.PDSCH.PRBSet))
            allPRBSet = enb.PDSCH.PRBSet;
        else
            allPRBSet = {enb.PDSCH.PRBSet};
        end
    end
    count = 1;
    
    % decide between spectrogram of entire frame vs subframe below
    n = length(rxWaveform);
    win = kaiser(n,100);
    win = win/sum(win);
    win = win*n;
    rxWaveform1 = rxWaveform.*win;
    X = fft(rxWaveform1)/n;        
    Y = fftshift(X);
    f = (-n/2:n/2-1)*(enb.SamplingRate/n); % zero-centered frequency range
    pxx = 20*log10(abs(Y)/2^11+10^-20);
    var1 = plot(psdPlot, f*1e-6, pxx, 'y');

    for i=0:nSubframes-1
        drawnow;
        if (app.stop_test)
            return;
        end
        
        % Extract this subframe.
        rxSubframe = rxWaveform( ...
            i*samplesPerSubframe+(1:(samplesPerSubframe+dims.Nfft)), :);
        
        % code to draw spectrogram for each subframe
        %{
        n = length(rxSubframe);
        win = kaiser(n,100);
        win = win/sum(win);
        win = win*n;
        rxSubframe = rxSubframe.*win;
        X = fft(rxSubframe)/n;        
        Y = fftshift(X);
        f = (-n/2:n/2-1)*(enb.SamplingRate/n); % zero-centered frequency range
        pxx = 20*log10(abs(Y)/2^11+10^-20);
        if (i == 0)
            var1 = plot(psdPlot, f*1e-6, pxx, 'y');
        else
            var1.YData = pxx;
            var1.XData = f*1e-6;
        end        
        %}        
        
        if (~isfield(enb,'TMN'))
            enb.CFI = allCFI(mod(enb.NSubframe,length(allCFI))+1);
            enb.PDSCH.PRBSet = allPRBSet{mod(enb.NSubframe,length(allPRBSet))+1};
        end

        % ZF equalization
        eqGridLow = lteEqualizeZF(rxGridLow(:, i*L+(1:L), :), HestLow(:, i*L+(1:L), :, :));
        eqGridHigh = lteEqualizeZF(rxGridHigh(:, i*L+(1:L), :), HestHigh(:, i*L+(1:L), :, :));

        duplexInfo = lteDuplexingInfo(enb);
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
                    app.SummaryTable.Data(6,2) = {sprintf('%0.3f', 100*evm_pbch.RMS)};
                end
                
                [cfichBits, cfichSymbols] = ltePCFICHDecode(enb, pcfichRx);
                if ~isempty(cfichSymbols)
                    evm_pcfich = lteEVM(cfichSymbols, ref_PCFICH_Symbols);
                    app.SummaryTable.Data(7,2) = {sprintf('%0.3f', 100*evm_pcfich.RMS)};
                end
                
                if ~isempty(phichRx)
                    evm_phich = lteEVM(phichRx, ref_PHICH_Symbols);
                    app.SummaryTable.Data(8,2) = {sprintf('%0.3f', 100*evm_phich.RMS)};
                end
                
                % something seems incorrect here CHECK ME!
                [cchBits, cchSymbols] = ltePDCCHDecode(enb, pdcchRx);
                if ~isempty(cchSymbols)
                    evm_pdcch = lteEVM(cchSymbols, ref_PDCCH_Symbols);
                    app.SummaryTable.Data(9,2) = {sprintf('%0.3f', evm_pdcch.RMS)};
                end
                
                if ~isempty(rsRx)
                    evm_rs = lteEVM(rsRx, ref_RS_Symbols);
                    app.SummaryTable.Data(10,2) = {sprintf('%0.3f', 100*evm_rs.RMS)};
                end
                
                if ~isempty(pssRx)
                    evm_pss = lteEVM(pssRx, ref_PSS_Symbols);
                    app.SummaryTable.Data(11,2) = {sprintf('%0.3f', 100*evm_pss.RMS)};
                end
                
                if ~isempty(sssRx)
                    evm_sss = lteEVM(sssRx, ref_SSS_Symbols);
                    app.SummaryTable.Data(12,2) = {sprintf('%0.3f', 100*evm_sss.RMS)};
                end
                
                
            end

        else
            ind = ltePDSCHIndices(enb, enb.PDSCH, []);
            allocatedSymbols = [];
        end

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
            evmSymbolRMS = sqrt(sum(evmSubframe.^2,1)./sum(evmSubframe~=0,1)).';
            evmSymbolPeak = (max(evmSubframe,[],1)./any(evmSubframe,1)).';
            evmSymbolPlot.YLim = [0 maxEVM*1.1];
            if (i == 0)
                var2 = plot(evmSymbolPlot, count:count+length(evmSymbolRMS)-1, evmSymbolRMS, 'color',[1 0.6 0]);
                hold(evmSymbolPlot,'on');                
                var3 = plot(evmSymbolPlot, count:count+length(evmSymbolPeak)-1, evmSymbolPeak, 'c');
                legend(evmSymbolPlot,{'\color{white} RMS','\color{white} Peak'}); 
                hold(evmSymbolPlot,'off');
            else
                var2.YData = [var2.YData evmSymbolRMS.'];
                var3.YData = [var3.YData evmSymbolPeak.'];
                var2.XData = [var2.XData (count:count+length(evmSymbolRMS)-1)];
                var3.XData = [var3.XData (count:count+length(evmSymbolPeak)-1)];
            end            
            count = count+length(evmSymbolPeak);
            
            % plot EVM versus subcarrier
            evmSubcarrierRMS = sqrt(sum(evmGrid.^2,2)./sum(evmGrid~=0,2));
            evmSubcarrierPeak = max(evmGrid,[],2)./any(evmGrid,2);
            hold(evmSubcarrierPlot,'on');            
            if (i == 0)
                var4 = plot(evmSubcarrierPlot, 1:length(evmSubcarrierRMS), evmSubcarrierRMS, 'r.-');
                var5 = plot(evmSubcarrierPlot, 1:length(evmSubcarrierPeak), evmSubcarrierPeak, 'g.-');
                legend(evmSubcarrierPlot,{'\color{white} RMS','\color{white} Peak'}); 
            else
                var4.YData = evmSubcarrierRMS;
                var5.YData = evmSubcarrierPeak;
            end
            hold(evmSubcarrierPlot,'off');
            
            % plot EVM versus resource block
            evmRBRMS = zeros(enb.NDLRB,1);
            evmRBPeak = evmRBRMS;
            for rb = 0:enb.NDLRB-1
                rbGrid = evmGrid(rb*12 + (1:12),:,:);
                evmRBRMS(rb+1) = sqrt(sum(rbGrid(:).^2)./sum(rbGrid(:)~=0));
                evmRBPeak(rb+1) = max(rbGrid(:))./any(rbGrid(:));
            end
            hold(evmRBPlot,'on');
            if (i == 0)
                var6 = plot(evmRBPlot, 1:length(evmRBRMS), evmRBRMS, ...
                    'color', [1 0.4 0.6], 'Marker', '.', 'LineStyle', '-');
                var7 = plot(evmRBPlot, 1:length(evmRBPeak), evmRBPeak, 'w.-');
                legend(evmRBPlot,{'\color{white} RMS','\color{white} Peak'}); 
            else
                var6.YData = evmRBRMS.';
                var7.YData = evmRBPeak.';
            end
            hold(evmRBPlot,'off');
            
            % constellation plot
            hold(constPlot,'on');     
            if (i == 0)
                var8 = plot(constPlot, real(rxSymbols), imag(rxSymbols),...
                    'r', 'Marker','o', 'LineStyle', 'none');
                var9 = plot(constPlot, real(refSymbols), imag(refSymbols),...
                    'g', 'Marker','+', 'LineStyle', 'none');
                
            else
                var8.YData = imag(rxSymbols).';
                var9.YData = imag(refSymbols).';
                var8.XData = real(rxSymbols).';
                var9.XData = real(refSymbols).';
            end
            
            drawnow; 
        end

        % After we've filled a frame or if we're at the end of a signal 
        % shorter than a frame, do EVM averaging
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
           if (nFrames~=0)
                msg = sprintf('Mean low edge EVM, subframe %d: %0.3f%%\n', ...
                   nFrame-1, frameLowEVM.RMS*100); 
                app.Label.Text = {msg};
                app.SummaryTable.Data(13,2) = {sprintf('%0.3f', 100*frameLowEVM.RMS)};

                msg = sprintf('Mean high edge EVM, subframe %d: %0.3f%%\n', ...
                   nFrame-1, frameHighEVM.RMS*100); 
                app.Label.Text = {msg};
                pad='     ';
                app.SummaryTable.Data(14,2) = {sprintf('%0.3f %s', 100*frameHighEVM.RMS, pad)};
           end
           if (frameLowEVM.RMS > frameHighEVM.RMS)
               frameEVM(nFrame) = frameLowEVM;
           else
               frameEVM(nFrame) = frameHighEVM;
           end
           if (nFrames~=0)
               app.ListBox.Items = [app.ListBox.Items,...
                   sprintf('Mean EVM for subframe %d: %0.3f%%\n', ...
                    nFrame-1, frameEVM(nFrame).RMS*100)]; 
                scroll(app.ListBox,'bottom');     
                
           end
        end

        % Update subframe number
        enb.NSubframe = mod(enb.NSubframe+1, 10);            

    end

    % Display final Mean EVM across all frames
    finalEVM = lteEVM(cat(1, frameEVM(:).EV));
    finalEVM_prev = [finalEVM_prev finalEVM.RMS];
    app.ListBox.Items = [app.ListBox.Items,...
        sprintf('Mean overall EVM: %0.3f%%\n', finalEVM.RMS*100)]; 
    scroll(app.ListBox,'bottom');
    app.SummaryTable.Data(15,2) = {sprintf('%0.3f', mean(finalEVM_prev)*100)};

    % create array of plots
    if (strcmpi(alg.EnablePlotting,'On'))
        plots = {app.evmSymsAxes, app.evmSCAxes, app.evmRBAxes};
    else
        plots = {};
    end

end