function W = getEVMWindow(app, enb)
            
    % Numbers of downlink resource blocks
    nrbs = [6 15 25 50 75 100];

    % EVM window lengths W for normal CP
    Ws = [5 12 32 66 136 136];

    % EVM window lengths W for extended CP  
    if (isfield(enb,'CyclicPrefix'))
        if(strcmpi(enb.CyclicPrefix,'Extended'))
            Ws = [28 58 124 250 504 504];
        end
    else
        enb.CyclicPrefix='Normal';
    end

    % Get corresponding EVM window length for NDLRB; if NDLRB is
    % non-standard, use FFT size to determine the EVM window length
    if (isempty(find(enb.NDLRB==nrbs,1)))
        Nffts = [128 256 512 1024 2048];
        ofdmInfo = lteOFDMInfo(enb);
        W = Ws(double(ofdmInfo.Nfft)==Nffts);
    else
        W = Ws(enb.NDLRB==nrbs);
    end

end