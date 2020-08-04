classdef (Abstract, Hidden = true) Base < adi.common.Attribute & ...
        adi.common.DebugAttribute & matlabshared.libiio.base & ...
        matlab.system.mixin.CustomIcon
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
    
%     properties (Nontunable, Logical)
%         %EnableCustomProfile Enable Custom Profile
%         %   Enable use of custom Profile file to set SamplingRate, 
%         %   RFBandwidth, and other features of transceiver
%         EnableCustomProfile = false;
%     end
%     
%     properties (Nontunable)
%         %CustomProfileFileName Custom Profile File Name
%         %   Path to custom Profile file created from profile wizard
%         CustomProfileFileName = '';
%     end
    
    properties (Hidden, Constant)
        %SamplingRate Sampling Rate
        %   Baseband sampling rate in Hz, specified as a scalar 
        %   in samples per second.
        SamplingRate = 15.36e6;%%%%% MAKE DEPENDENT
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
                prop = 'TX1_LO_frequency';
            else
                id = 'altvoltage0';
                prop = 'RX1_LO_frequency';
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
                prop = 'TX2_LO_frequency';
            else
                id = 'altvoltage1';
                prop = 'RX2_LO_frequency';
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
        
%         % Check EnableCustomProfile
%         function set.EnableCustomProfile(obj, value)
%             validateattributes( value, { 'logical' }, ...
%                 { }, ...
%                 '', 'EnableCustomProfile');
%             obj.EnableCustomProfile = value;
%         end
%         % Check CustomFilterFileName
%         function set.CustomProfileFileName(obj, value)
%             validateattributes( value, { 'char' }, ...
%                 { }, ...
%                 '', 'CustomProfileFileName');
%             obj.CustomProfileFileName = value;
%             if obj.EnableCustomProfile && obj.ConnectedToDevice %#ok<MCSUP>
%                 writeProfileFile(obj);
%             end
%         end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
                      
        function icon = getIconImpl(obj)
            icon = sprintf(['ADRV9002 ',obj.Type]);
        end
        
        function state = savePartState(obj)
            id = 'voltage0';
            state.in1.hardwaregain = getAttributeLongLong(obj,id,'hardwaregain',false);
            state.in1.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',false);
            state.out1.hardwaregain = getAttributeLongLong(obj,id,'hardwaregain',true);
            state.out1.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',true);
            state.out1.lo_leakage_tracking_en = getAttributeLongLong(obj,id,'lo_leakage_tracking_en',true);

            id = 'voltage1';
            state.in2.hardwaregain = getAttributeLongLong(obj,id,'hardwaregain',false);
            state.in2.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',false);
            state.out2.hardwaregain = getAttributeLongLong(obj,id,'hardwaregain',true);
            state.out2.quadrature_tracking_en = getAttributeLongLong(obj,id,'quadrature_tracking_en',true);
            state.out2.lo_leakage_tracking_en = getAttributeLongLong(obj,id,'lo_leakage_tracking_en',true);           
            
            id = 'altvoltage0';
            state.out.RX_LO_frequency = getAttributeLongLong(obj,id,'RX_LO_frequency',true);
            id = 'altvoltage1';
            state.in.TX_LO_frequency = getAttributeLongLong(obj,id,'TX_LO_frequency',true);
        end

        function returnPartState(obj,state)
            id = 'voltage0';
            setAttributeLongLong(obj,id,'hardwaregain',state.in1.hardwaregain,false);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.in1.quadrature_tracking_en,false);
            setAttributeLongLong(obj,id,'hardwaregain',state.out1.hardwaregain,true);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.out1.quadrature_tracking_en,true);
            setAttributeLongLong(obj,id,'lo_leakage_tracking_en',state.out1.lo_leakage_tracking_en,true);
            
            id = 'voltage1';
            setAttributeLongLong(obj,id,'hardwaregain',state.in2.hardwaregain,false);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.in2.quadrature_tracking_en,false);
            setAttributeLongLong(obj,id,'hardwaregain',state.out2.hardwaregain,true);
            setAttributeLongLong(obj,id,'quadrature_tracking_en',state.out2.quadrature_tracking_en,true);
            setAttributeLongLong(obj,id,'lo_leakage_tracking_en',state.out2.lo_leakage_tracking_en,true);
            
            id = 'altvoltage0';
            setAttributeLongLong(obj,id,'RX_LO_frequency',state.out.RX_LO_frequency,true);
            id = 'altvoltage1';
            setAttributeLongLong(obj,id,'TX_LO_frequency',state.in.TX_LO_frequency,true);
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
            profle_data_str = fileread(obj.CustomProfileFileName);
            % Wrap update in read writes since once profiles are loaded
            % some attributes get lost
%             state = savePartState(obj);
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

