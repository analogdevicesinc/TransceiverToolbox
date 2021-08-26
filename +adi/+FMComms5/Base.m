classdef (Abstract, Hidden = true) Base < adi.AD9361.Base    
    
    %adi.FMComms5.Base Class
    %   This class contains shared parameters and methods between TX and RX
    %   classes
    properties (Abstract)
        %CenterFrequencyChipB Center Frequency
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChipB
        %RFBandwidthChipB RF Bandwidth
        %   RF Bandwidth of front-end analog filter in Hz, specified as a
        %   scalar from 200 kHz to 56 MHz.
        RFBandwidthChipB
    end
    
    properties(Nontunable, Hidden)
        iioDevPHYChipB
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        
        function icon = getIconImpl(obj)
            icon = sprintf(['FMComms5 ',obj.Type]);
        end
        
        function writeFilterFileFMComms5ChipB(obj)
            fir_data_file = obj.CustomFilterFileName;
            fir_data_str = fileread(fir_data_file);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',false,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',true,obj.iioDevPHYChipB);
            obj.setDeviceAttributeRAW('filter_fir_config',fir_data_str,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',true,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',false,obj.iioDevPHYChipB);
        end
        
    end
end

