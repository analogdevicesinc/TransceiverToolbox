% Estimates the average frequency offset by means of estimation of the
% phase shift between channel estimate REs in the locations of successive
% Cell-Specific Reference Signal (Cell RS) symbols. The approach used 
% follows Equation 14 of Speth, M.; Fechtel, S.; Fock, G.; Meyr, H., 
% "Optimum receiver design for OFDM-based broadband transmission .II. A 
% case study," Communications, IEEE Transactions on , vol.49, no.4, 
% pp.571,578, Apr 2001.
function foffset = frequencyOffsetCellRS(app, enb,cec,rxgrid)
        
            % If the 'TestEVM' channel estimator is specified, use 1x1 pilot 
            % averaging instead. The 'TestEVM' channel estimator gives the same 
            % channel estimate across all OFDM symbols which makes it unsuitable,
            % because the technique here relies on an estimate of the phase shift
            % across OFDM symbols. 
            if (strcmpi(cec.PilotAverage,'TestEVM'))
                cec.PilotAverage = 'UserDefined';
                cec.FreqWindow = 1;
                cec.TimeWindow = 1;
                cec.InterpWinSize = 1;
                cec.InterpWindow = 'Centred';
                cec.InterpType = 'cubic';            
            end
        
            % If the input channel estimator configuration is for a reference
            % signal other than the cell RS, ensure that the parameters are
            % compatible with the cell RS based estimation that will be used below.
            % Specifically, for Centred InterpWindow, if TimeWindow is even then
            % set it to 1.
            if (isfield(cec,'Reference') && ~strcmpi(cec.Reference,'CellRS'))
                if (strcmpi(cec.InterpWindow,'Centred')||strcmpi(cec.InterpWindow,'Centered'))
                    if (~mod(cec.TimeWindow,2))
                        cec.TimeWindow = 1;
                    end
                end
            end
            
            % perform channel estimation
            hest = lteDLChannelEstimate(enb,cec,rxgrid);        
                
            % set some housekeeping variables
            dims = lteDLResourceGridSize(enb);
            K = dims(1);
            L = dims(2);
            nsf = floor(size(hest,2)/L);    
            startsf = enb.NSubframe;
            xleft = 0;
            xright = 0;
            delta_l = 0;
            
            % for each receive antenna:
            for r = 1:size(hest,3)
                
                % for each transmit antenna up to a maximum of 2 (because the cell
                % RS layout is unsuitable for the 3rd and 4th antennas, there is
                % only one RE across all OFDM symbols):
                for p = 1:min(size(hest,4),2)
                    
                    % for each subframe:
                    for i = 0:nsf-1
                        
                        xsf = [];
                        enb.NSubframe = mod(startsf+i,10);
                        
                        % extract the current subframe of the channel estimate
                        hsubframe = hest(:,(i*L)+(1:L),r,p);
                        
                        % extract the channel estimate REs in the location of the 
                        % cell-specific reference signal
                        cellrsind = lteCellRSIndices(enb,p-1) - ((p-1)*K*L);
                        hcellrs = hsubframe(cellrsind);
                                        
                        % establish the set of frequency indices 'kset' occupied by
                        % the cell-specific reference signal
                        cellrssub = lteCellRSIndices(enb,p-1,'sub');                                
                        kset = double(unique(cellrssub(:,1)));
                        
                        % for each frequency index:
                        for kidx = 1:length(kset)
                            
                            % calculate the correlation 'x' between the two
                            % occurrences of the cell-specific reference signal in
                            % this frequency index and store it in the vector 'xsf'
                            % of all correlations for this subframe. The spacing in
                            % OFDM symbols 'delta_l' is also calculated.
                            k = kset(kidx);
                            thisidx = (cellrssub(:,1)==k);
                            thisl = cellrssub(thisidx,2);                    
                            h = hcellrs(thisidx);          
                            if (numel(h)>1)
                                delta_l = double(diff(thisl(1:2)));
                                x = h(2)*conj(h(1));
                            else
                                x = 0;
                            end
                            xsf = [xsf x]; %#ok<AGROW>
                            
                        end   
                        
                        % accumulate the correlations in each half of the spectrum
                        xleft = xleft + sum(xsf(kset<=K/2));
                        xright = xright + sum(xsf(kset>K/2));        
        
                    end
                    
                end
                
            end
                
            % compute OFDM symbol length 'N' and cyclic prefix length 'Ng'
            ofdmInfo = lteOFDMInfo(enb);
            N = double(ofdmInfo.Nfft);
            Ng = double(ofdmInfo.CyclicPrefixLengths(2));
              
            % compute frequency offset estimate based on the phase shift across the
            % number of OFDM symbols give by 'delta_l'. The phase angle of the sum
            % of all the correlations in each half of the spectrum is calculated
            % and these are added together which removes the effect of any
            % sampling clock offset - a sampling clock offset creates a
            % frequency-dependent phase shift whose sign is different in the two
            % halfs of the spectrum, so adding the halfs cancels this effect.
            if (isempty(xsf) || delta_l==0)
                foffset = 0;
            else
                delta_f_tilde = ...
                    1/(2*pi*delta_l*(1+Ng/N))*(1/2)*(angle(xleft)+angle(xright));
                foffset = delta_f_tilde*15000;
            end
        end