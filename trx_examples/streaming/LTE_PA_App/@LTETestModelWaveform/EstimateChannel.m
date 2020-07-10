function [psd_frame, f, HestLow, HestHigh, allPRBSet] = ...
    EstimateChannel(enb, rxWaveform, nSubframes, cec, rxGridLow, rxGridHigh)
    % Channel estimation. 
    % Allow channel estimates to be processed in blocks of 10 subframes if
    % TestEVM channel estimate is used as per TS36.141 Annex F.3.4
    if strcmpi(cec.PilotAverage,'TestEVM')
        nsfBlk = 10;
    else
        nsfBlk = nSubframes;
    end
    nBlocks = ceil(nSubframes/nsfBlk);

    gridDims = lteResourceGridSize(enb);
    L = gridDims(2);    

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
        [HestHighBlk, NestHighBlk] = channelEstimate(rxGridHigh(:, symIdx, :));  

        HestLow = [HestLow HestLowBlk];    %#ok<AGROW>
        HestHigh = [HestHigh HestHighBlk]; %#ok<AGROW>
        NestLow = [NestLow NestLowBlk];    %#ok<AGROW>
        NestHigh = [NestHigh NestHighBlk];    %#ok<AGROW>
    end

    evmGridLow = [];
    evmGridHigh = [];
    allPRBSet = [];
    if (~isfield(enb,'TMN'))
        allCFI = enb.CFI;
        if (iscell(enb.PDSCH.PRBSet))
            allPRBSet = enb.PDSCH.PRBSet;
        else
            allPRBSet = {enb.PDSCH.PRBSet};
        end
    end
    
    % decide between spectrogram of entire frame vs subframe below
    n = length(rxWaveform);
    win = kaiser(n,100);
    win = win/sum(win);
    win = win*n;
    rxWaveform1 = rxWaveform.*win;
    X = fft(rxWaveform1)/n;        
    Y = fftshift(X);
    f = (-n/2:n/2-1)*(enb.SamplingRate/n); % zero-centered frequency range
    psd_frame = 20*log10(abs(Y)/2^11+10^-20);
    % var1 = plot(psdPlot, f*1e-6, pxx, 'y');
end