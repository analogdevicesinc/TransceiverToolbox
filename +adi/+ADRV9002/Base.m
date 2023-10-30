classdef (Abstract, Hidden = true) Base < ...
        adi.common.RxTx & ...
        adi.common.Attribute & ...
        adi.common.DebugAttribute & ...
        matlabshared.libiio.base
    %adi.ADRV9002.Base Class
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
        %EnableCustomProfile Enable Custom Profile
        %   Enable use of custom Profile file to set SamplingRate, 
        %   RFBandwidth, and other features of transceiver
        EnableCustomProfile = false;
    end
    
    properties (Nontunable)
        %CustomProfileFileName Custom Profile File Name
        %   Path to custom Profile file created from profile wizard
        CustomProfileFileName = '';
        %CustomStreamFileName Custom Stream File Name
        %   Path to custom stream file created from profile wizard
        CustomStreamFileName = '';
    end
    
    properties (Dependent)
        %SamplingRate Sampling Rate
        %   Baseband sampling rate in Hz, specified as a scalar 
        %   in samples per second. This is a read-only property
        SamplingRate
    end
    
    properties
        %CenterFrequencyChannel0 Center Frequency Channel0
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChannel0 = 2.4e9;
        %CenterFrequencyChannel1 Center Frequency Channel 1
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChannel1 = 2.4e9;
        
        %NCOCorrectionFrequencyChannel0 NCO Correction Frequency Channel 0
        %   NCO correction frequency, specified in Hz as a scalar. The
        %   default is 0.  This property is tunable.
        NCOCorrectionFrequencyChannel0 = 0;
        %NCOCorrectionFrequencyChannel1 NCO Correction Frequency Channel 1
        %   NCO correction frequency, specified in Hz as a scalar. The
        %   default is 0.  This property is tunable.
        NCOCorrectionFrequencyChannel1 = 0;
    end
    
    properties(Nontunable, Hidden)
        Timeout = Inf;
        kernelBuffersCount = 2;
        dataTypeStr = 'int16';
        phyDevName = 'adrv9002-phy';
        iioDevPHY
        newAPI = false;
    end

    properties (Hidden, Constant)
        ComplexData = true;
    end
    
    methods
        %% Constructor
        function obj = Base(varargin)
            coder.allowpcode('plain');
            obj = obj@matlabshared.libiio.base(varargin{:});
        end
        function value = get.SamplingRate(obj)
            if obj.ConnectedToDevice
                value = obj.getAttributeLongLong('voltage0','sampling_frequency',strcmpi(obj.Type,'Tx'));
            else
                value = NaN;
            end
        end
        
        % Check SamplesPerFrame
        function set.SamplesPerFrame(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>',0,'<=',2^20}, ...
                '', 'SamplesPerFrame');
            obj.SamplesPerFrame = value;
        end
        % Check CenterFrequencyChannel0
        function set.CenterFrequencyChannel0(obj, value)
            obj.CenterFrequencyChannel0 = value;
            if strcmpi(obj.Type,'Tx')
                id = 'altvoltage2';
                if obj.newAPI
                    prop = 'frequency';
                else
                    prop = 'TX1_LO_frequency';
                end
            else
                id = 'altvoltage0';
                if obj.newAPI
                    prop = 'frequency';
                else
                    prop = 'RX1_LO_frequency';
                end
            end
            if obj.ConnectedToDevice
                obj.setAttributeLongLong(id,prop,value,true);
            end
        end
        % Check CenterFrequencyChannel1
        function set.CenterFrequencyChannel1(obj, value)
            obj.CenterFrequencyChannel1 = value;
            if strcmpi(obj.Type,'Tx')
                id = 'altvoltage3';
                if obj.newAPI
                    prop = 'frequency';
                else
                    prop = 'TX2_LO_frequency';
                end
            else
                id = 'altvoltage1';
                if obj.newAPI
                    prop = 'frequency';
                else
                    prop = 'RX2_LO_frequency';
                end
            end
            if obj.ConnectedToDevice
                obj.setAttributeLongLong(id,prop,value,true);
            end
        end
        
        % Check NCOCorrectionFrequencyChannel0
        function set.NCOCorrectionFrequencyChannel0(obj, value)
            obj.NCOCorrectionFrequencyChannel0 = value;
            id = 'voltage0';
            prop = 'nco_frequency';
            if obj.ConnectedToDevice
                obj.setAttributeLongLong(id,prop,value,strcmpi(obj.Type,'Tx'));
            end
        end
        % Check NCOCorrectionFrequencyChannel1
        function set.NCOCorrectionFrequencyChannel1(obj, value)
            obj.NCOCorrectionFrequencyChannel1 = value;
            id = 'voltage1';
            prop = 'nco_frequency';
            if obj.ConnectedToDevice
                obj.setAttributeLongLong(id,prop,value,strcmpi(obj.Type,'Tx'));
            end
        end
        
        % Check EnableCustomProfile
        function set.EnableCustomProfile(obj, value)
            validateattributes( value, { 'logical' }, ...
                { }, ...
                '', 'EnableCustomProfile');
            obj.EnableCustomProfile = value;
        end
        % Check CustomFilterFileName
        function set.CustomProfileFileName(obj, value)
            validateattributes( value, { 'char' }, ...
                { }, ...
                '', 'CustomProfileFileName');
            obj.CustomProfileFileName = value;
            if obj.EnableCustomProfile && obj.ConnectedToDevice %#ok<MCSUP>
                writeProfileFile(obj);
            end
        end
        % Check CustomStreamFileName
        function set.CustomStreamFileName(obj, value)
            validateattributes( value, { 'char' }, ...
                { }, ...
                '', 'CustomStreamFileName');
            obj.CustomStreamFileName = value;
            if obj.EnableCustomProfile && obj.ConnectedToDevice %#ok<MCSUP>
                writeProfileFile(obj);
            end
        end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        function checkDriverAPI(obj)
            % Due to driver updates between version there are 2 names for
            % the LO props. We need to check which one we are using
            phydev = getDev(obj, obj.phyDevName);
            chanPtr = iio_device_find_channel(obj, phydev, 'altvoltage0', true);
            status = cPtrCheck(obj,chanPtr);
            if status ~= 0
                error("Cannot find channel altvoltage0")
            end
            status = iio_channel_attr_read(obj,chanPtr,'frequency',1024);
            obj.newAPI = status >= 0;
        end

        function lowerDDSs(obj,singleDDS)
            % Since calibrations are sensitive, DDSs need to be powered
            % down anytime a profile is loaded
            
            dev = getDev(obj,'axi-adrv9002-tx-lpc');
            if singleDDS
                numChannels = 8;
            else
                numChannels = 4;
            end
            
            for channel=0:numChannels-1
                id = sprintf('altvoltage%d',channel);
                chanPtr = getChan(obj, dev,id,true);
                iio_channel_attr_write_double(obj,chanPtr,'scale',0);
            end
            
            if ~singleDDS
                dev = getDev(obj, 'axi-adrv9002-tx2-lpc');
                for channel=0:numChannels-1
                    id = sprintf('altvoltage%d',channel);
                    chanPtr = getChan(obj, dev,id,true);
                    iio_channel_attr_write_double(obj,chanPtr,'scale',0);
                end
            end
            
        end
        
        function r = checkIfDevExists(obj,name)
            devPtr = iio_context_find_device(obj, obj.iioCtx, name);
            status = cPtrCheck(obj,devPtr);
            r = status==0;
        end
        
        function icon = getIconImpl(obj)
            icon = sprintf(['ADRV9002 ',obj.Type]);
        end
        
        function state = savePartState(obj)
            id = 'voltage0';
            state.in1.hardwaregain = getAttributeDouble(obj,id,'hardwaregain',false);
            state.in1.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',false);
            state.out1.hardwaregain = getAttributeDouble(obj,id,'hardwaregain',true);
            state.out1.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',true);
            state.out1.lo_leakage_tracking_en = getAttributeLongLong(obj,id,'lo_leakage_tracking_en',true);

            id = 'voltage1';
            state.in2.hardwaregain = getAttributeDouble(obj,id,'hardwaregain',false);
            state.in2.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',false);
            state.out2.hardwaregain = getAttributeDouble(obj,id,'hardwaregain',true);
            state.out2.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',true);
            state.out2.lo_leakage_tracking_en = getAttributeLongLong(obj,id,'lo_leakage_tracking_en',true);           
            
            id = 'altvoltage0';
            state.out.RX_LO_frequency = getAttributeLongLong(obj,id,'frequency',true);
            id = 'altvoltage1';
            state.in.TX_LO_frequency = getAttributeLongLong(obj,id,'frequency',true);
        end

        function returnPartState(obj,state)
            id = 'voltage0';
            setAttributeDouble(obj,id,'hardwaregain',state.in1.hardwaregain,false);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.in1.quadrature_tracking_en,false);
            setAttributeDouble(obj,id,'hardwaregain',state.out1.hardwaregain,true);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.out1.quadrature_tracking_en,true);
            setAttributeLongLong(obj,id,'lo_leakage_tracking_en',state.out1.lo_leakage_tracking_en,true);
            
            id = 'voltage1';
            setAttributeDouble(obj,id,'hardwaregain',state.in2.hardwaregain,false);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.in2.quadrature_tracking_en,false);
            setAttributeDouble(obj,id,'hardwaregain',state.out2.hardwaregain,true);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.out2.quadrature_tracking_en,true);
            setAttributeLongLong(obj,id,'lo_leakage_tracking_en',state.out2.lo_leakage_tracking_en,true);
            
            id = 'altvoltage0';
            setAttributeLongLong(obj,id,'frequency',state.out.RX_LO_frequency,true);
            id = 'altvoltage1';
            setAttributeLongLong(obj,id,'frequency',state.in.TX_LO_frequency,true);
        end

        
        function writeProfileFile(obj)
            if obj.Count() > 1
                [~,props] = obj.Count(0,obj,'EnableCustomProfile');
                if any(props{:})
                   warning('ADRV9002:Profile:RXTX',...
                       ['Existing objects in the workspace have written profiles.\n',...
                       'Doing so again can have undesirable side affects.\n',...
                       'First stepped object should only set profile.']); 
                end
            end
            
            assert(~isempty(obj.CustomStreamFileName),'A custom stream file must be defined for custom profiles');
            assert(~isempty(obj.CustomProfileFileName),'A custom profile file must be defined for custom profiles');
            
            
            obj.lowerDDSs(strcmpi(obj.channel_names(3),'voltage1_i') || ...
                strcmpi(obj.channel_names(3),'voltage2'));
            
            % Wrap update in read writes since once profiles are loaded
            % some attributes get lost
%             state = savePartState(obj);
            stream_data_str = fileread(obj.CustomStreamFileName);
            obj.setDeviceAttributeRAW('stream_config',stream_data_str);
            profle_data_str = fileread(obj.CustomProfileFileName);
            obj.setDeviceAttributeRAW('profile_config',profle_data_str);
%             returnPartState(obj,state)
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
            bName = 'ADRV9002';
        end
        
    end
end

