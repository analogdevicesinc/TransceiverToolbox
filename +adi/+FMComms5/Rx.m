classdef Rx < adi.FMComms5.Base & adi.AD9361.Rx ...
        & adi.FMComms5.TuneAGCFMComms5ChipB
    % adi.FMComms5.Rx Receive data from the FMComms5 transceiver
    %   The adi.FMComms5.Rx System object is a signal source that can receive
    %   complex data from the FMComms5.
    %
    %   rx = adi.FMComms5.Rx;
    %   rx = adi.FMComms5.Rx('uri','192.168.2.1');
    %
    %   <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/AD9361.pdf">AD9361 Datasheet</a>
    %
    %   See also adi.FMComms2.Rx, adi.FMComms3.Rx, adi.AD9361.Rx
    
    properties
        %CenterFrequency Center Frequency
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChipB = 2.4e9;
        %RFBandwidth RF Bandwidth
        %   RF Bandwidth of front-end analog filter in Hz, specified as a
        %   scalar from 200 kHz to 56 MHz.
        RFBandwidthChipB = 3e6;
    end
    
    properties
        %GainControlModeChannel0ChipB Gain Control Mode Channel 0 Chip B
        %   specified as one of the following:
        %   'slow_attack' — For signals with slowly changing power levels
        %   'fast_attack' — For signals with rapidly changing power levels
        %   'manual' — For setting the gain manually with the Gain property
        %   'hybrid' — For configuring hybrid AGC mode
        GainControlModeChannel0ChipB = 'slow_attack';
        %GainChannel0ChipB Gain Channel 0 Chip B 
        %   Channel 0 gain, specified as a scalar from -4 dB to 71 dB. The acceptable
        %   minimum and maximum gain setting depends on the center
        %   frequency.
        GainChannel0ChipB = 10;
        %GainControlModeChannel1ChipB Gain Control Mode Channel 1 Chip B
        %   specified as one of the following:
        %   'slow_attack' — For signals with slowly changing power levels
        %   'fast_attack' — For signals with rapidly changing power levels
        %   'manual' — For setting the gain manually with the Gain property
        %   'hybrid' — For configuring hybrid AGC mode
        GainControlModeChannel1ChipB = 'slow_attack';
        %GainChannel1ChipB Gain Channel 1 Chip B
        %   Channel 1 gain, specified as a scalar from -4 dB to 71 dB. The acceptable
        %   minimum and maximum gain setting depends on the center
        %   frequency.
        GainChannel1ChipB = 10;
    end
    
    properties (Nontunable)
        %DigitalLoopbackModeChipB Digital Loopback Mode Chip B
        %   Option to set digital loopback mode, specified as 0,
        %   1 or 2. Allows either to digitally loopback TX data 
        %   into the RX path or vice versa.
        %    Value   |    Mode
        %   ---------------------------
        %      0     |   Disable
        %      1     |   Digital TX -> Digital RX
        %      2     |   RF RX -> RF TX 
        LoopbackModeChipB = 0;        
    end
    
    properties (Nontunable, Logical) % MUST BE NONTUNABLE OR SIMULINK WARNS
        %EnableQuadratureTracking Enable Quadrature Tracking
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the input signal.
        EnableQuadratureTrackingChipB = true;
        %EnableRFDCTracking Enable RFDC Tracking
        %   Option to enable RF DC tracking, specified as true or false.
        %   When this property is true, an RF DC blocking filter is applied
        %   to the input signal.
        EnableRFDCTrackingChipB = true;
        %EnableBasebandDCTracking Enable Baseband DC Tracking
        %   Option to enable baseband DC tracking, specified as true or
        %   false. When this property is true, a baseband DC blocking
        %   filter is applied to the input signal.
        EnableBasebandDCTrackingChipB = true;           
    end
    
    properties
        RFPortSelectChipB = 'A_BALANCED';
    end
    
    properties(Constant, Hidden)
        GainControlModeChannel0ChipBSet = matlab.system.StringSet({ ...
            'manual','fast_attack','slow_attack','hybrid'});
        GainControlModeChannel1ChipBSet = matlab.system.StringSet({ ...
            'manual','fast_attack','slow_attack','hybrid'});
        RFPortSelectChipBSet = matlab.system.StringSet({ ...
            'A_BALANCED', 'B_BALANCED', 'C_BALANCED',...
            'A_N', 'A_P', 'B_N', 'B_P', 'C_N', 'C_P',...
            'TX_MONITOR1', 'TX_MONITOR2', 'TX_MONITOR1_2'});
    end
    
    properties (Hidden, Nontunable, Access = protected)
        isOutputChipB = false;
    end
    
    properties(Nontunable, Hidden, Constant)
        TypeChipB = 'Rx';
    end
    
    properties (Nontunable, Hidden)
        devNameChipB = 'cf-ad9361-B';        
    end
    
    properties(Nontunable, Hidden, Constant)
        channel_names_runtime = {'voltage0','voltage1','voltage2','voltage3',...
            'voltage4','voltage5','voltage6','voltage7'};
        phyDevNameChipB = 'ad9361-phy-B';    
    end
    
    methods
        %% Constructor
        function obj = Rx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.FMComms5.Base(varargin{:});
            obj.channel_names = obj.channel_names_runtime;
            obj.devName = 'cf-ad9361-A';
        end
        % Check RFPortSelect
        function set.RFPortSelectChipB(obj, value)
            obj.RFPortSelectChipB = value;
            if obj.ConnectedToDevice
                obj.setAttributeRAW('voltage0','rf_port_select',value,false,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check GainControlModeChannel0
        function set.GainControlModeChannel0ChipB(obj, value)
            obj.GainControlModeChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'gain_control_mode',value,false,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check GainControlModeChannel1
        function set.GainControlModeChannel1ChipB(obj, value)
            obj.GainControlModeChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'gain_control_mode',value,false,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check GainChannel0
        function set.GainChannel0ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -4,'<=', 71}, ...
                '', 'Gain');
            assert(mod(value,1/4)==0, 'Gain must be a multiple of 0.25');
            obj.GainChannel0ChipB = value;
            if obj.ConnectedToDevice && strcmp(obj.GainControlModeChannel0ChipB,'manual') %#ok<MCSUP>
                id = 'voltage0';
                obj.setAttributeLongLong(id,'hardwaregain',value,false,0,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check GainChannel1
        function set.GainChannel1ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -4,'<=', 71}, ...
                '', 'Gain');
            assert(mod(value,1/4)==0, 'Gain must be a multiple of 0.25');
            obj.GainChannel1ChipB = value;
            if obj.ConnectedToDevice && strcmp(obj.GainControlModeChannel1ChipB,'manual') %#ok<MCSUP>
                id = 'voltage1';
                obj.setAttributeLongLong(id,'hardwaregain',value,false,0,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check EnableQuadratureTracking
        function set.EnableQuadratureTrackingChipB(obj, value)
            obj.EnableQuadratureTrackingChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,false,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check EnableRFDCTracking
        function set.EnableRFDCTrackingChipB(obj, value)
            obj.EnableRFDCTrackingChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'rf_dc_offset_tracking_en',value,false,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check EnableRFDCTracking
        function set.EnableBasebandDCTrackingChipB(obj, value)
            obj.EnableBasebandDCTrackingChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'bb_dc_offset_tracking_en',value,false,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check CenterFrequency
        function set.CenterFrequencyChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>=',70e6,'<=',6e9}, ...
                '', 'CenterFrequency');

            obj.CenterFrequencyChipB = value;
            if obj.ConnectedToDevice
                id = sprintf('altvoltage%d',strcmp(obj.Type,'Tx'));
                obj.setAttributeLongLong(id,'frequency',value,true,4,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check RFBandwidth
        function set.RFBandwidthChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>=',200e3,'<=',56e6}, ...
                '', 'RFBandwidth');
            
            obj.RFBandwidthChipB = value;
            if obj.ConnectedToDevice && ~obj.EnableCustomFilter
                id = 'voltage0';
                obj.setAttributeLongLong(id,'rf_bandwidth',value,strcmp(obj.Type,'Tx'),30,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        function set.LoopbackModeChipB(obj, value)
            validateattributes( value, { 'double','single', 'uint32' }, ...
                { 'real', 'nonnegative','scalar', 'finite', 'nonnan', 'nonempty','integer','>=',0,'<=',2}, ...
                '', 'LoopbackMode');    
            obj.LoopbackModeChipB = value;
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('loopback',value,1,obj.iioDevPHYChipB); %#ok<MCSUP>                    
            end
        end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        function setupInit(obj)
            % Write all attributes to device once connected through set
            % methods
            setupLibad9361(obj);
            obj.iioDevPHYChipB = calllib('libiio', 'iio_context_find_device',obj.iioCtx,'ad9361-phy-B');
            % Do writes directly to hardware without using set methods.
            % This is required sine Simulink support doesn't support
            % modification to nontunable variables at SetupImpl
            
            % Gains
            if (any(obj.EnabledChannels == 1))
                obj.setAttributeRAW('voltage0','gain_control_mode',obj.GainControlModeChannel0,false);
            end
            if (any(obj.EnabledChannels == 2))
                obj.setAttributeRAW('voltage1','gain_control_mode',obj.GainControlModeChannel1,false);
            end
            if (any(obj.EnabledChannels == 3))
                obj.setAttributeRAW('voltage0','gain_control_mode',obj.GainControlModeChannel0,false,obj.iioDevPHYChipB);
            end
            if (any(obj.EnabledChannels == 4))
                obj.setAttributeRAW('voltage1','gain_control_mode',obj.GainControlModeChannel1,false,obj.iioDevPHYChipB);
            end
            if (strcmp(obj.GainControlModeChannel0,'manual') && any(obj.EnabledChannels == 1))
                obj.setAttributeLongLong('voltage0','hardwaregain',obj.GainChannel0,false);                
            end
            if (strcmp(obj.GainControlModeChannel1,'manual') && any(obj.EnabledChannels == 2))
                obj.setAttributeLongLong('voltage1','hardwaregain',obj.GainChannel1,false);                
            end
            if (strcmp(obj.GainControlModeChannel0ChipB,'manual') && any(obj.EnabledChannels == 3))
                obj.setAttributeLongLong('voltage0','hardwaregain',obj.GainChannel0ChipB,false,0,obj.iioDevPHYChipB);
            end
            if (strcmp(obj.GainControlModeChannel1ChipB,'manual') && any(obj.EnabledChannels == 4))
                obj.setAttributeLongLong('voltage1','hardwaregain',obj.GainChannel1ChipB,false,0,obj.iioDevPHYChipB);
            end
            % Trackings
            obj.setAttributeBool('voltage0','quadrature_tracking_en',obj.EnableQuadratureTracking,false);
            obj.setAttributeBool('voltage0','rf_dc_offset_tracking_en',obj.EnableRFDCTracking,false);
            obj.setAttributeBool('voltage0','bb_dc_offset_tracking_en',obj.EnableBasebandDCTracking,false);
            obj.setAttributeBool('voltage0','quadrature_tracking_en',obj.EnableQuadratureTrackingChipB,false,obj.iioDevPHYChipB); 
            obj.setAttributeBool('voltage0','rf_dc_offset_tracking_en',obj.EnableRFDCTrackingChipB,false,obj.iioDevPHYChipB); 
            obj.setAttributeBool('voltage0','bb_dc_offset_tracking_en',obj.EnableBasebandDCTrackingChipB,false,obj.iioDevPHYChipB); 
            id = sprintf('altvoltage%d',strcmp(obj.Type,'Tx'));
            obj.setAttributeLongLong(id,'frequency',obj.CenterFrequency ,true,4);
            obj.setAttributeLongLong(id,'frequency',obj.CenterFrequencyChipB ,true,4,obj.iioDevPHYChipB); 
            % Loopback Mode
            obj.setDebugAttributeLongLong('loopback', obj.LoopbackMode);
            obj.setDebugAttributeLongLong('loopback', obj.LoopbackModeChipB,1,obj.iioDevPHYChipB); 
            
            % Sample rates and RF bandwidth
            if  ~obj.EnableCustomFilter
                if libisloaded('libad9361')
                    calllib('libad9361','ad9361_set_bb_rate',obj.iioDevPHY,int32(obj.SamplingRate));
                    calllib('libad9361','ad9361_set_bb_rate',obj.iioDevPHYChipB,int32(obj.SamplingRate));
                else
                    obj.setAttributeLongLong('voltage0','sampling_frequency',obj.SamplingRate,true,4);
                    obj.setAttributeLongLong('voltage0','rf_bandwidth',obj.RFBandwidth,strcmp(obj.Type,'Tx'));
                    obj.setAttributeLongLong('voltage0','sampling_frequency',obj.SamplingRate,true,4,obj.iioDevPHYChipB); 
                    obj.setAttributeLongLong('voltage0','rf_bandwidth',obj.RFBandwidthChipB,strcmp(obj.Type,'Tx'),0,obj.iioDevPHYChipB); 
                end
            else
                writeFilterFile(obj);
                writeFilterFileFMComms5ChipB(obj);
            end
            obj.setAttributeRAW('voltage0','rf_port_select',obj.RFPortSelect,false);
            obj.setAttributeRAW('voltage0','rf_port_select',obj.RFPortSelectChipB,false,obj.iioDevPHYChipB); 
            calllib('libad9361','ad9361_fmcomms5_multichip_sync',obj.iioCtx,uint32(3));
            
            if (obj.CustomAGC)
                % Initialize hardware to reflect debug attribute changes
                obj.WriteDebugAttributes();
                obj.setDebugAttributeLongLong('initialize',1);
                obj.WriteToRegisters();
            end
            if (obj.CustomAGCChipB)
                % Initialize hardware to reflect debug attribute changes
                obj.WriteDebugAttributesFMComms5ChipB();
                obj.setDebugAttributeLongLong('initialize',1,0,obj.iioDevPHYChipB);
                obj.WriteToRegistersFMComms5ChipB();
            end
        end
    end
end