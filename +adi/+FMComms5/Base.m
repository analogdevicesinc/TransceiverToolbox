classdef (Abstract, Hidden = true) Base < adi.AD9361.Base    
    
    %adi.FMComms5.Base Class
    %   This class contains shared parameters and methods between TX and RX
    %   classes
    properties (Nontunable, Logical)
        %EnableCustomFilterChipB Enable Custom Filter
        %   Enable use of custom filter file to set SamplingRate, 
        %   RFBandwidth, and FIR in datapaths
        EnableCustomFilterChipB = false;
    end
    
    properties (Nontunable)
        %CustomFilterFileNameChipB Custom Filter File Name
        %   Path to custom filter file created from filter wizard
        CustomFilterFileNameChipB = '';
    end
    
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
    
    methods
        % Check EnableCustomFilter
        function set.EnableCustomFilterChipB(obj, value)
            validateattributes( value, { 'logical' }, ...
                { }, ...
                '', 'EnableCustomFilterChipB');
            obj.EnableCustomFilterChipB = value;
        end
        % Check CustomFilterFileName
        function set.CustomFilterFileNameChipB(obj, value)
            validateattributes( value, { 'char' }, ...
                { }, ...
                '', 'CustomFilterFileNameChipB');
            obj.CustomFilterFileNameChipB = value;
            if obj.EnableCustomFilterChipB && obj.ConnectedToDevice %#ok<MCSUP>
                writeFilterFileChipB(obj);
            end
        end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        
        function icon = getIconImpl(obj)
            icon = sprintf(['FMComms5 ',obj.Type]);
        end
        
        function writeFilterFileFMComms5ChipB(obj)
            fir_data_file = obj.CustomFilterFileNameChipB;
            fir_data_str = fileread(fir_data_file);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',false,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',true,obj.iioDevPHYChipB);
            obj.setDeviceAttributeRAW('filter_fir_config',fir_data_str,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',true,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',false,obj.iioDevPHYChipB);
        end
        
    end
end

