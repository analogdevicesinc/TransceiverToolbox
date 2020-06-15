classdef TxInstr < Instr
    properties (Abstract)
        ScaleInput
        OutputPower
    end    
    
    methods (Abstract)
        Tx(obj)
    end      
    
    methods 
        function wave = ScaleInputData(~,wave)
            % Scale the waveform as necessary
            tmp = max(abs([max(wave) min(wave)]));
            if (tmp == 0)
                tmp = 1;
            end
            
            % ARB binary range is 2's Compliment -32768 to + 32767
            % So scale the waveform to +/- 32767
            scale = 2^15-1;
            scale = scale/tmp;
            wave = round(wave * scale);
            modval = 2^16;
            % Get data from double to uint16 as required by instrument
            wave = uint16(mod(modval + wave, modval));
        end
    end
end