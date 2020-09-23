classdef Rx < adi.ADRV9009ZU11EG.Base & adi.ADRV9009.Rx
    % adi.ADRV9009ZU11EG.Rx Receive data from the ADRV9009ZU11EG SOM
    %   The adi.ADRV9009ZU11EG.Rx System object is a signal source that can receive
    %   complex data from the ADRV9009ZU11EG.
    %
    %   rx = adi.ADRV9009ZU11EG.Rx;
    %   rx = adi.ADRV9009ZU11EG.Rx('uri','192.168.2.1');
    %
    %   <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9009.pdf">ADRV9009 Datasheet</a>    
    properties
        %GainControlModeChipB Gain Control Mode
        %   specified as one of the following:
        %   'slow_attack' — For signals with slowly changing power levels
        %   'manual' — For setting the gain manually with the Gain property
        GainControlModeChipB = 'slow_attack';
        %GainChannel0 Gain Channel 0 Chip B
        %   Channel 0 gain, specified as a scalar from -4 dB to 71 dB. The acceptable
        %   minimum and maximum gain setting depends on the center
        %   frequency.
        GainChannel0ChipB = 10;
        %GainChannel1 Gain Channel 1 Chip B
        %   Channel 1 gain, specified as a scalar from -4 dB to 71 dB. The acceptable
        %   minimum and maximum gain setting depends on the center
        %   frequency.
        GainChannel1ChipB = 10;
    end
    
    properties (Nontunable, Logical) % MUST BE NONTUNABLE OR SIMULINK WARNS
        %EnableQuadratureTrackingChannel0ChipB Enable Quadrature Tracking Channel 0
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the input signal.
        EnableQuadratureTrackingChannel0ChipB = true;
        %EnableQuadratureTrackingChannel0ChipB Enable Quadrature Tracking Channel 1
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the input signal.
        EnableQuadratureTrackingChannel1ChipB = true;
    end
    
    properties(Logical)
        %PowerdownChannel0ChipB Powerdown Channel 0 Chip B
        %   Logical which will power down RX channel 0 when set
        PowerdownChannel0ChipB = false;
        %PowerdownChannel1ChipB Powerdown Channel 1 Chip B
        %   Logical which will power down RX channel 1 when set
        PowerdownChannel1ChipB = false;
    end
    
    properties(Constant, Hidden)
        GainControlModeChipBSet = matlab.system.StringSet({ ...
            'manual','slow_attack'});
    end
    
    properties(Nontunable, Hidden, Constant)
        channel_names_runtime = {...
            'voltage0_i','voltage0_q',...
            'voltage1_i','voltage1_q',...
            'voltage2_i','voltage2_q',...
            'voltage3_i','voltage3_q'};
        phyDevNameChipB = 'adrv9009-phy-b';
    end
    
    properties(Hidden)
       iioDevChipB;
    end
    
    methods
        %% Constructor
        function obj = Rx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.ADRV9009.Rx(varargin{:});
            obj = obj@adi.ADRV9009ZU11EG.Base(varargin{:});
            obj.channel_names = obj.channel_names_runtime;
        end
        %% Destructor
        function delete(obj)
        end
        % Check GainControlModeChipB
        function set.GainControlModeChipB(obj, value)
            obj.GainControlModeChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.ADRV9009_B_Rx.setAttributeRAW(id,'gain_control_mode',value,false); %#ok<MCSUP>
            end
        end
        % Check GainChannel0ChipB
        function set.GainChannel0ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -4,'<=', 71}, ...
                '', 'Gain');
            assert(mod(value,1/4)==0, 'Gain must be a multiple of 0.25');
            obj.GainChannel0ChipB = value;
            if obj.ConnectedToDevice && strcmp(obj.GainControlModeChipB,'manual') %#ok<MCSUP>
                id = 'voltage0';
                obj.ADRV9009_B_Rx.setAttributeLongLong(id,'hardwaregain',value,false); %#ok<MCSUP>
            end
        end
        % Check GainChannel1ChipB
        function set.GainChannel1ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -4,'<=', 71}, ...
                '', 'Gain');
            assert(mod(value,1/4)==0, 'Gain must be a multiple of 0.25');
            obj.GainChannel1ChipB = value;
            if obj.ConnectedToDevice && strcmp(obj.GainControlModeChipB,'manual') %#ok<MCSUP>
                id = 'voltage1';
                obj.ADRV9009_B_Rx.setAttributeLongLong(id,'hardwaregain',value,false); %#ok<MCSUP>
            end
        end
        % Check EnableQuadratureTrackingChannel0ChipB
        function set.EnableQuadratureTrackingChannel0ChipB(obj, value)
            obj.EnableQuadratureTrackingChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,false);
            end
        end
        % Check EnableQuadratureTrackingChannel1ChipB
        function set.EnableQuadratureTrackingChannel1ChipB(obj, value)
            obj.EnableQuadratureTrackingChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,false);
            end
        end
        % Check PowerdownChannel0
        function set.PowerdownChannel0ChipB(obj, value)
            obj.PowerdownChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'powerdown',value,false);
            end
        end
        % Check PowerdownChannel1
        function set.PowerdownChannel1ChipB(obj, value)
            obj.PowerdownChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'powerdown',value,false);
            end
        end 
    end
    
    methods (Access=protected)
        % Hide unused parameters when in specific modes
        function flag = isInactivePropertyImpl(obj, prop)
            % Call the superclass method
            flag = isInactivePropertyImpl@adi.common.RxTx(obj,prop);
            
            if ~any(obj.EnabledChannels == 1)
                flag = flag || strcmpi(prop,'EnableQuadratureTrackingChannel0');
            end
            if ~any(obj.EnabledChannels == 2)
                flag = flag || strcmpi(prop,'EnableQuadratureTrackingChannel1');
            end
            if ~any(obj.EnabledChannels == 3)
                flag = flag || strcmpi(prop,'GainChannel0ChipB');
                flag = flag || strcmpi(prop,'EnableQuadratureTrackingChannel0ChipB');            
            end
            if ~any(obj.EnabledChannels == 4)
                flag = flag || strcmpi(prop,'GainChannel1ChipB');
                flag = flag || strcmpi(prop,'EnableQuadratureTrackingChannel1ChipB');           
            end
            if ~any(obj.EnabledChannels == 1) && ~any(obj.EnabledChannels == 2)
                flag = flag || strcmpi(prop,'GainControlMode');
            end
            if ~any(obj.EnabledChannels == 3) && ~any(obj.EnabledChannels == 4)
                flag = flag || strcmpi(prop,'CenterFrequencyChipB');
                flag = flag || strcmpi(prop,'GainControlModeChipB');
            else
                flag = flag || strcmpi(prop,'GainChannel1ChipB') &&...
                    ~strcmpi(obj.GainControlModeChipB, 'manual');    
            end
            if ~strcmpi(obj.GainControlModeChipB, 'manual')
               flag = flag || strcmpi(prop,'GainChannel1ChipB'); 
               flag = flag || strcmpi(prop,'GainChannel0ChipB'); 
            end
        end
        
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
                
        function setupInit(obj)
            % Write all attributes to device once connected through set
            % methods
            % Do writes directly to hardware without using set methods.
            % This is required sine Simulink support doesn't support
            % modification to nontunable variables at SetupImpl
            
            obj.iioDevChipB = getDev(obj, obj.phyDevNameChipB);
            
            if obj.EnableCustomProfile
                writeProfileFile(obj);
                writeProfileFile(obj,obj.iioDevChipB);
            end
            
            % Channels need to be powered up first so we can changed things
            obj.setAttributeBool('voltage0','powerdown',false,false);
            obj.setAttributeBool('voltage1','powerdown',false,false);
            obj.setAttributeBool('voltage0','powerdown',false,false,obj.iioDevChipB);
            obj.setAttributeBool('voltage1','powerdown',false,false,obj.iioDevChipB);
            
            obj.setAttributeRAW('voltage0','gain_control_mode',obj.GainControlMode,false);
            obj.setAttributeRAW('voltage0','gain_control_mode',obj.GainControlModeChipB,false,obj.iioDevChipB);
            obj.setAttributeBool('voltage0','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel0,false);
            obj.setAttributeBool('voltage1','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel1,false);
            obj.setAttributeBool('voltage2','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel0ChipB,false);
            obj.setAttributeBool('voltage3','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel1ChipB,false);
            id = 'altvoltage0';
            obj.setAttributeLongLong(id,'frequency',obj.CenterFrequency ,true);
            obj.setAttributeLongLong(id,'frequency',obj.CenterFrequencyChipB ,true, 10, obj.iioDevChipB);

            if strcmp(obj.GainControlMode,'manual')
                obj.setAttributeLongLong('voltage0','hardwaregain',obj.GainChannel0,false);
                obj.setAttributeLongLong('voltage1','hardwaregain',obj.GainChannel1,false);
            end
            if strcmp(obj.GainControlModeChipB,'manual')
                obj.setAttributeLongLong('voltage0','hardwaregain',obj.GainChannel0ChipB,false,obj.iioDevChipB);
                obj.setAttributeLongLong('voltage1','hardwaregain',obj.GainChannel1ChipB,false,obj.iioDevChipB);
            end
            
            % Bring stuff back up as desired
            obj.setAttributeBool('voltage0','powerdown',obj.PowerdownChannel0,false);
            obj.setAttributeBool('voltage1','powerdown',obj.PowerdownChannel1,false);
            obj.setAttributeBool('voltage0','powerdown',obj.PowerdownChannel0ChipB,false,obj.iioDevChipB);
            obj.setAttributeBool('voltage1','powerdown',obj.PowerdownChannel1ChipB,false,obj.iioDevChipB);
            
        end
        
    end
    
end

