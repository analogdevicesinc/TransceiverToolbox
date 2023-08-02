classdef Rx < adi.AD9371.Base & adi.common.Rx
    % adi.AD9371.Rx Receive data from the AD9371 transceiver
    %   The adi.AD9371.Rx System object is a signal source that can receive
    %   complex data from the AD9371.
    %
    %   rx = adi.AD9371.Rx;
    %   rx = adi.AD9371.Rx('uri','192.168.2.1');
    %
    %   <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/AD9371.pdf">AD9371 Datasheet</a>
    properties
        % GainControlMode Gain Control Mode
        %   specified as one of the following:
        %   'slow_attack' — For signals with slowly changing power levels
        %   'fast_attack' — For signals with rapidly changing power levels
        %   'manual' — For setting the gain manually with the Gain property
        %   'hybrid' — For configuring hybrid AGC mode
        GainControlMode = 'automatic'
        % GainChannel0 Gain Channel 0
        %   Channel 0 gain, specified as a scalar from -4 dB to 71 dB. The acceptable
        %   minimum and maximum gain setting depends on the center
        %   frequency.
        GainChannel0 = 10
        % GainChannel1 Gain Channel 1
        %   Channel 1 gain, specified as a scalar from -4 dB to 71 dB. The acceptable
        %   minimum and maximum gain setting depends on the center
        %   frequency.
        GainChannel1 = 10
    end

    properties (Nontunable)
        % DigitalLoopbackMode Digital Loopback Mode
        %   Option to set digital loopback mode, specified as 0 or 1.
        %   Allows digital loopback of TX data into the RX path.
        %    Value   |    Mode
        %   ---------------------------
        %      0     |   Disable
        %      1     |   Enable
        LoopbackMode = 0
    end

    properties (Nontunable, Logical) % MUST BE NONTUNABLE OR SIMULINK WARNS
        % EnableQuadratureTrackingChannel0 Enable Quadrature Tracking Channel 0
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the input signal.
        EnableQuadratureTrackingChannel0 = true
        % EnableQuadratureTrackingChannel1 Enable Quadrature Tracking Channel 1
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the input signal.
        EnableQuadratureTrackingChannel1 = true
    end

    properties (Constant, Hidden)
        GainControlModeSet = matlab.system.StringSet({ ...
                                                      'manual', 'automatic', 'hybrid'})
    end

    properties (Hidden, Nontunable, Access = protected)
        isOutput = false
    end

    properties (Nontunable, Hidden, Constant)
        Type = 'Rx'
        channel_names = {'voltage0_i', 'voltage0_q', 'voltage1_i', 'voltage1_q'}
    end

    properties (Nontunable, Hidden)
        devName = 'axi-ad9371-rx-hpc'
    end

    methods

        %% Constructor
        function obj = Rx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.AD9371.Base(varargin{:});
        end

        % Check GainControlMode
        function set.GainControlMode(obj, value)
            obj.GainControlMode = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id, 'gain_control_mode', value, false);
            end
        end

        % Check GainChannel0
        function set.GainChannel0(obj, value)
            validateattributes(value, { 'double', 'single' }, ...
                               { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', 0, '<=', 30}, ...
                               '', 'Gain');
            assert(mod(value, 1 / 4) == 0, 'Gain must be a multiple of 0.25');
            obj.GainChannel0 = value;
            if obj.ConnectedToDevice && strcmp(obj.GainControlMode, 'manual')
                id = 'voltage0';
                obj.setAttributeDouble(id, 'hardwaregain', value, false);
            end
        end

        % Check GainChannel1
        function set.GainChannel1(obj, value)
            validateattributes(value, { 'double', 'single' }, ...
                               { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', 0, '<=', 30}, ...
                               '', 'Gain');
            assert(mod(value, 1 / 4) == 0, 'Gain must be a multiple of 0.25');
            obj.GainChannel1 = value;
            if obj.ConnectedToDevice && strcmp(obj.GainControlMode, 'manual')
                id = 'voltage1';
                obj.setAttributeDouble(id, 'hardwaregain', value, false);
            end
        end

        % Check EnableQuadratureTrackingChannel0
        function set.EnableQuadratureTrackingChannel0(obj, value)
            obj.EnableQuadratureTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id, 'quadrature_tracking_en', value, false);
            end
        end

        % Check EnableQuadratureTrackingChannel1
        function set.EnableQuadratureTrackingChannel1(obj, value)
            obj.EnableQuadratureTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id, 'quadrature_tracking_en', value, false);
            end
        end

        function set.LoopbackMode(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 1}, ...
                               '', 'LoopbackMode');
            obj.LoopbackMode = value;
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('loopback_tx_rx', value);
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
            if obj.EnableCustomProfile
                writeProfileFile(obj);
            end

            obj.setAttributeRAW('voltage0', 'gain_control_mode', obj.GainControlMode, false);
            obj.setAttributeBool('voltage0', 'quadrature_tracking_en', obj.EnableQuadratureTrackingChannel0, false);
            obj.setAttributeBool('voltage1', 'quadrature_tracking_en', obj.EnableQuadratureTrackingChannel1, false);
            id = sprintf('altvoltage%d', strcmp(obj.Type, 'Tx'));
            obj.setAttributeLongLong(id, 'RX_LO_frequency', obj.CenterFrequency, true);
            % Loopback Mode
            obj.setDebugAttributeLongLong('loopback_tx_rx', obj.LoopbackMode);

            if strcmp(obj.GainControlMode, 'manual')
                obj.setAttributeDouble('voltage0', 'hardwaregain', obj.GainChannel0, false);
                obj.setAttributeDouble('voltage1', 'hardwaregain', obj.GainChannel1, false);
            end
        end

    end

end
