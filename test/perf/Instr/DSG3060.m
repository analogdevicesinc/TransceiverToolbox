classdef DSG3060 < Instr
    properties
        URI = 'USB0::0x1AB1::0x0992::DSG3A172400066::INSTR';
        CenterFrequency = 1e9;
        SampleRate = 10e6;        
    end
    
    methods
        function Setup(obj,~)
            obj.dev = visa('ni',obj.USB);
            
            % Set the timeout
            obj.dev.Timeout = 30;
            
            % Open connection to the instrument
            fopen(obj.dev);            
            
            % Reset instrument and clear instrument error queue
            fprintf(obj.dev,'*RST;*CLS');
            
            % Some settings commands to make sure we don't damage the instrument
            fprintf(obj.dev,':SOURce:IQ:BASeout:STATe OFF');
            fprintf(obj.dev,':OUTPut:STATe OFF');
            fprintf(obj.dev,[':SOURce:IQ:SAMPle ', obj.SampleRate]);
            obj.DeviceSetup = true;
        end
    end
end