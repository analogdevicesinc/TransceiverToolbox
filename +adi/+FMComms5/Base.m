classdef (Abstract, Hidden = true) Base < adi.AD9361.Base    
    
    %adi.AD9361.Base Class
    %   This class contains shared parameters and methods between TX and RX
    %   classes
    properties (Nontunable, Logical)
        %EnableCustomFilter Enable Custom Filter
        %   Enable use of custom filter file to set SamplingRate, 
        %   RFBandwidth, and FIR in datapaths
        EnableCustomFilterChipB = false;
    end
    
    properties (Nontunable)
        %CustomFilterFileName Custom Filter File Name
        %   Path to custom filter file created from filter wizard
        CustomFilterFileNameChipB = '';
    end
    
    properties (Abstract)
        %CenterFrequency Center Frequency
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChipB
        %SamplingRate Sampling Rate
        %   Baseband sampling rate in Hz, specified as a scalar
        %   from 65105 to 61.44e6 samples per second.
        SamplingRateChipB
        %RFBandwidth RF Bandwidth
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
        
        function setupLibad9361FMComms5(obj)
            libName = 'libad9361';
            ad9361wrapperh = 'ad9361-wrapper.h';
            ad9361h = 'ad9361.h';
            fp = fileparts(which(ad9361h));
            loadlibraryArgs = {ad9361wrapperh,'includepath',fp,'addheader',ad9361h};
            if ~libisloaded(libName)
                msgID = 'MATLAB:loadlibrary:StructTypeExists';
                warnStruct = warning('off',msgID);
                [~, ~] = loadlibrary(libName, loadlibraryArgs{:});
                warning(warnStruct);
            end
            obj.iioDevPHY = calllib('libiio', 'iio_context_find_device',obj.iioCtx,'ad9361-phy');
            obj.iioDevPHYChipB = calllib('libiio', 'iio_context_find_device',obj.iioCtx,'ad9361-phy-B');
        end
        
        function writeFilterFileFMComms5(obj)
            fir_data_file = obj.CustomFilterFileName;
            fir_data_str = fileread(fir_data_file);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',false);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',true);
            obj.setDeviceAttributeRAW('filter_fir_config',fir_data_str);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',true);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',false);
            
            fir_data_file = obj.CustomFilterFileNameChipB;
            fir_data_str = fileread(fir_data_file);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',false,obj.iioDevChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',true,obj.iioDevChipB);
            obj.setDeviceAttributeRAW('filter_fir_config',fir_data_str,obj.iioDevChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',true,obj.iioDevChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',false,obj.iioDevChipB);
        end
        
    end
end

