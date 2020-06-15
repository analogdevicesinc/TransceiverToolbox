classdef DSG3060 < TxInstr
    properties
        URI = 'USB0::0x1AB1::0x0992::DSG3A172400066::INSTR';
        CenterFrequency = 1e9;
        SampleRate = 10e6;    
        ScaleInput = true;
        OutputPower = -30;
        FrequencyBias = 0;
    end
    
    methods
        % Constructor
        function obj = DSG3060(varargin)
            % Support name-value pair arguments when constructing object
            setProperties(obj,nargin,varargin{:})
        end
        
        % Check CenterFrequency for calibration case
        function set.CenterFrequency(obj, value)
            org = obj.CenterFrequency;
            obj.CenterFrequency = value;
            if abs(value - org) > (obj.SampleRate)/2 && obj.DeviceSetup%#ok<MCSUP>
                obj.CalibrateBand();
            end
        end
        
        function CalibrateBand(obj)           
            % Setup frequency band for calibration
            %obj.sendCommand([':CALibration:IQ:STARt ' num2str(round(obj.CenterFrequency-obj.SampleRate)) ' Hz']);
            %obj.sendCommand([':CALibration:IQ:STOP ' num2str(round(obj.CenterFrequency+obj.SampleRate)) ' Hz']);
            % Do calibration
            %obj.sendCommand(':CALibration:IQ:USER');
            WaitTillComplete(obj);
            obj.DisplayInstrumentErrors();
        end
        
        function Setup(obj,~)
            obj.Device = visa('ni',obj.URI);
            
            % Set the timeout
            obj.Device.Timeout = 30;
            
            % Open connection to the instrument
            fopen(obj.Device);            
            
            % Reset instrument and clear instrument error queue
            fprintf(obj.Device,'*RST;*CLS');
            
            % Some settings commands to make sure we don't damage the instrument
            fprintf(obj.Device,':SOURce:IQ:BASeout:STATe OFF');
            fprintf(obj.Device,':OUTPut:STATe OFF');
            fprintf(obj.Device,[':SOURce:IQ:SAMPle ', obj.SampleRate]);
            obj.DeviceiceSetup = true;
        end
        
        function Tx(obj,~)
            % Reset instrument and clear instrument error queue
            fprintf(obj.Device,'*RST;*CLS');
            fprintf(obj.Device,':SYST:PRES:TYPE FAC');
            fprintf(obj.Device,':SYST:PRES');
            % Some settings commands to make sure we don't damage the instrument
            fprintf(obj.Device,':SOURce:IQ:BASeout:STATe OFF');
            fprintf(obj.Device,':SOURce:IQ:MODe:STATe OFF');
            fprintf(obj.Device, ':SOURce:MODulation:STATe OFF');
            fprintf(obj.Device, ':OUTPut:STATe OFF');
            
            % set center frequency (Hz)
            fprintf(obj.Device, ['SOURce:FREQuency ' num2str(round(obj.CenterFrequency+obj.FrequencyBias)) 'Hz']);
            % set output attenutation (dB)
            fprintf(obj.Device, ['SOURce:LEVel:ATTenuation ', num2str(obj.Attenuation)]);
            
            % Set file source
            fprintf(obj.Device,sprintf(':MMEMory:LOAD %s.arb',obj.filename));
            
            % Enable output
            fprintf(obj.Device,':SOURce:IQ:MODe INTernal');
            fprintf(obj.Device,[':SOURce:LEVel ',num2str(obj.OutputPower)]);
            
            fprintf(obj.Device,':SOURce:IQ:BASeout:STATe ON');
            fprintf(obj.Device,':SOURce:IQ:MODe:STATe ON');
            fprintf(obj.Device,':SOURce:MODulation:STATe ON');
            fprintf(obj.Device,':OUTPut:STATe ON');
            
            % Display any instrument errors
%             obj.DisplayInstrumentErrors();
        end
    end
end