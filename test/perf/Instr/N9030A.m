classdef N9030A < RxInstr
    properties
        URI = '10.66.100.143';
        SampleRate = 10e6;
        CenterFrequency = 1e9;  
        FrequencyBias = 0;
    end
    
    methods
        % Constructor
        function obj = N9030A(varargin)
            % Support name-value pair arguments when constructing object
            setProperties(obj,nargin,varargin{:})    
        end
        
        function errors = Setup(obj,RxDataLength)
            obj.MeasureTimeSeconds = RxDataLength/obj.SampleRate;
            
            % Set up actual instrument
            % Check for ICT presence
            if isempty(ver('instrument'))
                error(['Please install Instrument Control Toolbox for ',...
                    'this function to work.']);
            end
            % Verify VISA installation and select VISA if available
            foundVISA = instrhwinfo('visa','agilent');
            if ~isempty(foundVISA.AdaptorName)
                obj.Device = visa('agilent', ...
                    sprintf('TCPIP0::%s::inst0::INSTR',obj.URI));
                %usingVISA = true;
            else
                % Untested
                obj.Device = tcpip(obj.Address,5025);
                %usingVISA = false;
            end
            % Set input buffer size
            set(obj.Device,'InputBufferSize', obj.InputBufferSize);
            set(obj.Device,'Timeout',obj.Timeout);% Set timeout to 30 seconds
            set(obj.Device,'ByteOrder','bigEndian');% Set object to use BigEndian format
            fopen(obj.Device);    % Open connection to the instrument
            clrdevice(obj.Device);% Clear hardware buffers on the instrument.
            sendCommand(obj,'*RST;*CLS');% Reset instrument and clear instrument error queue
            obj.WaitTillComplete();% Wait till operation is complete.
            
            errors = obj.DisplayInstrumentErrors();
        end
        
        function [RxIQ, errors]= Rx(obj)
            
            clrdevice(obj.Device);% Clear hardware buffers on the instrument.
            sendCommand(obj,'*RST;*CLS');% Reset instrument and clear instrument error queue
            obj.WaitTillComplete();% Wait till operation is complete.
            
            errors = obj.setupIQMode(); % Force into IQ Mode
            obj.useInternalTrigger(); % Start collecting data
            [RxIQ,captureSampleRate] = obj.getIQData(); % Pull buffer
            % Process data appropriately
            RxIQ = RxIQ(1:end-1);
            captureSampleRate = round(captureSampleRate);
            RxIQ = resample(RxIQ,obj.SampleRate ,round(captureSampleRate));
            % Set scope to spectrum mode to visualize signal better
            if obj.EnableSpectrumViewAfterMeasurement
                obj.enableSpectrumMode();
            end
        end
        
        function useInternalTrigger(obj)
            % Set the trigger to immediate
            sendCommand(obj,':TRIGger:WAVeform:SOURce IMMediate');
        end
        
        function useExternalTrigger(obj)
            % Set the trigger to external source 1 with positive slope triggering
            % When using external triggering, one needs a low-to-high transition on
            % the physical cable connected to the trigger1 in of the analyzer.
            sendCommand(obj,':TRIGger:WAVeform:SOURce EXTernal1');
            sendCommand(obj,':TRIGger:EXTERNAL1:SLOPe POSitive');
        end
        
        function errors = setupIQMode(obj)
            % Set up signal analyzer mode to Basic/IQ mode
            sendCommand(obj,':INSTrument:SELect BASIC');
            % Set the center frequency
            sendCommand(obj,[':SENSe:FREQuency:CENTer ' num2str(obj.CenterFrequency+obj.FrequencyBias) 'Hz']);
            % Set the resolution bandwidth
            sendCommand(obj,[':SENSe:WAVEform:BANDwidth:RESolution ' num2str(obj.SampleRate) 'Hz']);
            % Set the time for which measurement needs to be made
            sendCommand(obj,[':WAVeform:SWE:TIME '  num2str(obj.MeasureTimeSeconds) 's']);
            % Turn off electrical attenuation.
            %sendCommand(obj,':SENSe:POWer:RF:EATTenuation:STATe OFF');
            % Set mechanical attenuation level to 0 dB
            sendCommand(obj,[':SENSe:POWer:RF:ATTenuation ',num2str(obj.Attenuation)]);
            % Turn IQ signal ranging to auto
            sendCommand(obj,':SENSe:VOLTage:IQ:RANGe:AUTO ON');
            % Turn off averaging
            sendCommand(obj,':SENSe:WAVeform:AVER OFF');
            % set to take one single measurement
            sendCommand(obj,':INIT:CONT OFF');
            % Set the endianness of returned data
            sendCommand(obj,':FORMat:BORDer NORMal');
            % Set the format of the returned data
            sendCommand(obj,':FORMat:DATA REAL,32');
            % Set samples per block to get
            %sendCommand(obj,'FCAP:BLOC 100');
            % Wait till operation is complete.
            obj.WaitTillComplete();
            % Check if we have errors
            errors = obj.DisplayInstrumentErrors();
        end
        
        function [IQData,sampleRate] = getIQData(obj)
            % Trigger the instrument and initiate measurement
            sendCommand(obj,'*TRG');
            sendCommand(obj,':INITiate:WAVeform');
            % Wait till operation is complete
            obj.WaitTillComplete();
            % Read the IQ data
            sendCommand(obj,':READ:WAV0?');
            data=binblockread(obj.dev,'float');
            % Read the additional terminator character from the instrument
            fread(obj.dev,1);
            % Retrieve information about the most recently acquired data
            sendCommand(obj,':FETCH:WAV1?');
            signalSpec = binblockread(obj.dev,'float'); fread(obj.dev,1);
            sampleRate = 1/signalSpec(1);
            % Separate the data and build the complex IQ vector.
            inphase=data(1:2:end);
            quadrature=data(2:2:end);
            IQData=inphase+1i*quadrature;
            % Save to hist
            %obj.rxWaveform = IQData;
        end
        
        function errors = DisplayInstrumentErrors(obj)
            errors = [];
            % Display any instrument errors
            instrumentError = query(obj.dev,'SYSTem:ERRor?');
            while ~contains(lower(instrumentError),'no error')
                warning('\tInstrument Error: %s',instrumentError);
                %fprintf('\tInstrument Error: %s',instrumentError);
                num = obj.processError(instrumentError);
                errors = [errors; num]; %#ok<AGROW>
                instrumentError = query(obj.dev,'SYSTem:ERRor:NEXT?');
            end
        end
        
        function errorNum= processError(~,errorString)
            loc = strfind(errorString,',');
            errorNum = str2double(errorString(1:loc));
        end
        
        function enableSpectrumMode(obj)
            % Switch back to the spectrum analyzer view
            sendCommand(obj,':INSTrument:SELect SA');
            % Set mechanical attenuation level
            sendCommand(obj,[':SENSe:POWer:RF:ATTenuation ',num2str(obj.Attenuation)]);            
            % Set the center frequency, RBW and VBW and trigger
            sendCommand(obj,[':SENSe:FREQuency:CENTer ' num2str(obj.CenterFrequency)]);
            sendCommand(obj,[':SENSe:FREQuency:STARt ' num2str(obj.CenterFrequency-obj.SampleRate/2)]);
            sendCommand(obj,[':SENSe:FREQuency:STOP ' num2str(obj.CenterFrequency+obj.SampleRate/2)]);
            sendCommand(obj,[':SENSe:BANDwidth:RESolution ' num2str(200e3)]);
            sendCommand(obj,[':SENSe:BANDwidth:VIDeo ' num2str(200e3)]);
            % Continuous measurement
            sendCommand(obj,':INIT:CONT ON');
            % Trigger
            sendCommand(obj,'*TRG');
        end
    end
end