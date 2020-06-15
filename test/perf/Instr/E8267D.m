classdef E8267D < TxInstr
    properties
        URI = '10.66.98.158';
        CenterFrequency = 1e9;
        SampleRate = 10e6;    
        ScaleInput = true;
        OutputPower = -30;
        FrequencyBias = 0;
    end  
    
    methods
        % Constructor
        function obj = E8267D(varargin)
            % Support name-value pair arguments when constructing object
            setProperties(obj,nargin,varargin{:})            
        end
        
        function Setup(obj, TxDataLength)
            if TxDataLength<60
                error('Tx Data must be at least 60 samples');
            end
            % Connect to instrument
            foundVISA = instrhwinfo('visa');
            obj.Device = visa(foundVISA.InstalledAdaptors{1}, ...
                sprintf('TCPIP0::%s::inst0::INSTR',obj.URI));
            
            % Set up the output buffer size
            obj.Device.OutputBufferSize = 4*(TxDataLength*2) + 1024;
            
            % Set the timeout
            obj.Device.Timeout = 30;
            
            % Set object to use BigEndian format
            obj.Device.ByteOrder = 'bigEndian';
            
            % Open connection to the instrument
            fopen(obj.Device);
            
            % Clear hardware buffers on the instrument
            clrdevice(obj.Device);
            % Reset instrument and clear instrument error queue
            fprintf(obj.Device,'*RST;*CLS');
            
            % Some settings commands to make sure we don't damage the instrument
            fprintf(obj.Device,':SOURce:RADio:ARB:STATe OFF');
            fprintf(obj.Device,':OUTPut:MODulation:STATe OFF');
            fprintf(obj.Device,':OUTPut:STATe OFF'); 
        end
        
        function Tx(obj,txWaveform)
            % Check size
            IQsize = size(txWaveform);
            % User gave input as column vector. Reshape it to row vector.
            if ~isequal(IQsize(1),1)
                % warning('Wrong input detected. Automatically converting to row vector.');
                txWaveform = reshape(txWaveform,1,IQsize(1));
            end
            % Separate out the real and imaginary data in the IQ Waveform
            txWaveform = [real(txWaveform);imag(txWaveform)];
            txWaveform = txWaveform(:)'; % transpose the waveform
            % Scale to uint16
            if obj.ScaleInput
                txWaveform = obj.ScaleInputData(txWaveform);
            end
            % Write the data to the instrument
            fprintf('Starting Download of %d IQ samples...\n',size(txWaveform,2)/2);
            % filename for the data in the ARB
            ArbFileName = 'MATLABWfm';
            binblockwrite(obj.Device,txWaveform,'uint16',[':MEM:DATA "NVWFM:' ArbFileName '",']);
            fprintf(obj.Device,'');
            % Wait till operation completes
            obj.localWaitTillComplete();
            
            % Display any instrument errors
            obj.DisplayInstrumentErrors();
            % Display any instrument errors
            obj.DisplayInstrumentErrors();
            
            
            % Clear volatile memory waveforms
            fprintf(obj.Device, ':MMEMory:DELete:WFM');
            % Copy the waveform to volatile memory
            fprintf(obj.Device,[':MEMory:COPY:NAME "NVWFM:' ArbFileName '","WFM1:NVWFM"']);
            % Wait till operation completes
            obj.localWaitTillComplete();
            % Display any instrument errors
            obj.DisplayInstrumentErrors();
            
            %fprintf('\t...done!\n');
            
            % Set up markers if we need to use this for synchronization using the
            % Event1 hardware output on the signal generator
            
            % Clear all markers from the file
            fprintf(obj.Device,':SOURce:RADio:ARB:MARKer:CLEar:ALL "NVWFM",1');
            % Set marker 1 (first input after filename), starting at the first point
            % (second input), ending at point 1 (third input) and skipping 0.
            % Refer page 295 of
            % <http://cp.literature.agilent.com/litweb/pdf/N5180-90004.pdf Programmer's manual>
            % for more info
            fprintf(obj.Device,':SOURce:RADio:ARB:MARKer:SET "NVWFM",1,1,1,0');
            % Play back the selected waveform
            fprintf(obj.Device, ':SOURce:RADio:ARB:WAVeform "WFM1:NVWFM"');
            fprintf(obj.Device,[':SOURce:RADio:ARB:SCLock:RATE ' num2str(obj.SampleRate) 'Hz']);
            % set center frequency (Hz)
            fprintf(obj.Device, ['SOURce:FREQuency ' num2str(round(obj.CenterFrequency+obj.FrequencyBias)) 'Hz']);
            % set output power (dBm)
            fprintf(obj.Device, ['POWer ' num2str(obj.OutputPower)]);
            % set runtime scaling to 75% of DAC range so that interpolation by the
            % instrument baseband generator doesn't cause errors
            % Refer page 159 of
            % <http://cp.literature.agilent.com/litweb/pdf/E4400-90503.pdf User guide>
            % for more info
            fprintf(obj.Device, 'RADio:ARB:RSCaling 75');
            % Turn on output protection
            fprintf(obj.Device,':OUTPut:PROTection ON');
            % ARB Radio on
            fprintf(obj.Device, ':SOURce:RADio:ARB:STATe ON');
            % modulator on
            fprintf(obj.Device, ':OUTPut:MODulation:STATe ON');
            % RF output on
            fprintf(obj.Device, ':OUTPut:STATe ON');
            % Display any instrument errors
            obj.DisplayInstrumentErrors();
        end
    end
end