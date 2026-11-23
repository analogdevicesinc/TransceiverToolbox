classdef (Abstract, Hidden = true) Base < ...
        adi.common.RxTx & ...
        adi.common.Attribute & ...
        adi.common.DebugAttribute & ...
        adi.common.IIOBase

    %adi.AD9361.Base Class
    %   This class contains shared parameters and methods between TX and RX
    %   classes
    properties (Nontunable)
        %SamplesPerFrame Samples Per Frame
        %   Number of samples per frame, specified as an even positive
        %   integer from 2 to 16,777,216. Using values less than 3660 can
        %   yield poor performance.
        SamplesPerFrame = 2^15;
    end
    
    properties (Nontunable, Logical)
        %EnableCustomFilter Enable Custom Filter
        %   Enable use of custom filter file to set SamplingRate, 
        %   RFBandwidth, and FIR in datapaths
        EnableCustomFilter = false;
    end
    
    properties (Nontunable)
        %CustomFilterFileName Custom Filter File Name
        %   Path to custom filter file created from filter wizard
        CustomFilterFileName = '';
    end
    
    properties (Abstract)
        %CenterFrequency Center Frequency
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequency
        %SamplingRate Sampling Rate
        %   Baseband sampling rate in Hz, specified as a scalar
        %   from 65105 to 61.44e6 samples per second.
        SamplingRate
        %RFBandwidth RF Bandwidth
        %   RF Bandwidth of front-end analog filter in Hz, specified as a
        %   scalar from 200 kHz to 56 MHz.
        RFBandwidth
    end
    
    properties(Nontunable, Hidden)
        Timeout = Inf;
        kernelBuffersCount = 2;
        dataTypeStr = 'int16';
        phyDevName = 'ad9361-phy';
        iioDevPHY
    end
    
    properties (Hidden, Constant)
        ComplexData = true;
    end
    
    methods
        %% Constructor
        function obj = Base(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.common.IIOBase(varargin{:});
        end
        % Destructor
        function delete(obj)
            teardownLibad9361(obj);
            delete@adi.common.RxTx(obj);
        end
        % Check SamplesPerFrame
        function set.SamplesPerFrame(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>',0,'<=',2^20}, ...
                '', 'SamplesPerFrame');
            obj.SamplesPerFrame = value;
        end
        % Check EnableCustomFilter
        function set.EnableCustomFilter(obj, value)
            validateattributes( value, { 'logical' }, ...
                { }, ...
                '', 'EnableCustomFilter');
            obj.EnableCustomFilter = value;
        end
        % Check CustomFilterFileName
        function set.CustomFilterFileName(obj, value)
            validateattributes( value, { 'char' }, ...
                { }, ...
                '', 'CustomFilterFileName');
            obj.CustomFilterFileName = value;
            if obj.EnableCustomFilter && obj.ConnectedToDevice %#ok<MCSUP>
                writeFilterFile(obj);
            end
        end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        
        function icon = getIconImpl(obj)
            icon = sprintf(['AD9361 ',obj.Type]);
        end
        
        function setupLibad9361(obj)
            % libad9361 is not loaded: its functions take pointers of
            % libiio v0, which the libiio v1 bindings do not have (see
            % hasLibad9361). Only the device handle is looked up.
            obj.iioDevPHY = getDev(obj,'ad9361-phy');
        end
        
        function teardownLibad9361(~)
            % Nothing to unload, see setupLibad9361
        end
        
        function tf = hasLibad9361(~)
            % False with the libiio v1 bindings: the sampling rate is
            % written through the sampling_frequency attribute, without
            % the FIR filter that ad9361_set_bb_rate of libad9361 loads.
            tf = false;
        end
        
        function writeFilterFile(obj)
            fir_data_file = obj.CustomFilterFileName;
            fir_data_str = fileread(fir_data_file);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',false);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',true);
            obj.setDeviceAttributeRAW('filter_fir_config',fir_data_str);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',true);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',false);
        end
        
    end
    
    %% External Dependency Methods
    methods (Hidden, Static)
        
        function tf = isSupportedContext(bldCfg)
            tf = matlabshared.libiio.ExternalDependency.isSupportedContext(bldCfg);
        end
        
        function updateBuildInfo(buildInfo, bldCfg)
            % Call the matlabshared.libiio.method first
            matlabshared.libiio.ExternalDependency.updateBuildInfo(buildInfo, bldCfg);
        end
        
        function bName = getDescriptiveName(~)
            bName = 'AD9361';
        end
        
    end
end

