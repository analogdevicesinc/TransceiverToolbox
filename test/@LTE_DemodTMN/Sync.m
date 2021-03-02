function [FreqOffset, IQOffset, refGrid, rxGridLow, rxGridHigh, ...
    rxWaveform, nSubframes, nFrames, alg, frameEVM] = ...
    Sync(enb, cec, rxWaveform, varargin)
   
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
            
    % Compute some parameters.
    dims = lteOFDMInfo(enb);
    samplesPerSubframe = dims.SamplingRate/1000;
    nSubframes = floor(size(rxWaveform, 1)/samplesPerSubframe);
    nFrames = floor(nSubframes/10);
    W = LTE_DemodTMN.GetEVMWindow(enb);
    if (mod(W,2)==0)
        alpha = 0;
    else
        alpha = 1;
    end

    cpLength=double(dims.CyclicPrefixLengths(2)); 

    % Pad on the tail to allow for CP correlation.
    rxWaveform = [rxWaveform; zeros(dims.Nfft, size(rxWaveform, 2))];          

    if (isfield(enb,'TMN'))
        % Create reference test model grid        
        [~,refGrid] = lteTestModelTool(setfield(enb,'TotSubframes',nSubframes));
    end

    enableCoding = all(isfield(enb.PDSCH,{'CodedTrBlkSizes','TrBlkSizes'}));

    % For each subframe:
    rxGridLow = [];
    rxGridHigh = [];
    frameEVM = repmat(lteEVM([]), 1, max(nFrames,1));
    delta_f_tilde_old = 0.0;
    p = 1;
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
            delta_f_tilde_crs = LTE_DemodTMN.FrequencyOffsetCellRS(...
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
    FreqOffset = mean(delta_f_tilde_prev);
    IQOffset = mean(iqoffset_prev);
end