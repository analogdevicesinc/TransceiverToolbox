classdef Tx < adi.ADRV9009.Base & adi.common.Tx
    % adi.ADRV9009.Tx Transmit data from the ADRV9009 transceiver
    %   The adi.ADRV9009.Tx System object is a signal sink that can tranmsit
    %   complex data from the ADRV9009.
    %
    %   tx = adi.ADRV9009.Tx;
    %   tx = adi.ADRV9009.Tx('uri','192.168.2.1');
    %
    %   <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9009.pdf">ADRV9009 Datasheet</a>
    
    properties
        %AttenuationChannel0 Attenuation Channel 0
        %   Attentuation specified as a scalar from -41.95 to 0 dB with a
        %   resolution of 0.05 dB.
        AttenuationChannel0 = -30;
        %AttenuationChannel1 Attenuation Channel 1
        %   Attentuation specified as a scalar from -41.95 to 0 dB with a
        %   resolution of 0.05 dB.
        AttenuationChannel1 = -30;
    end
    
    properties (Logical)
        %EnableQuadratureTrackingChannel0 Enable Quadrature Tracking Channel 0
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the transmitted signal.
        EnableQuadratureTrackingChannel0 = true;
        %EnableQuadratureTrackingChannel1 Enable Quadrature Tracking Channel 1
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the transmitted signal.
        EnableQuadratureTrackingChannel1 = true;
        %EnableLOLeakageTrackingChannel0 Enable LO Leakage Tracking Channel 0
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, LO leakage compensation is
        %   applied to the transmitted signal.
        EnableLOLeakageTrackingChannel0 = true;
        %EnableLOLeakageTrackingChannel1 Enable LO Leakage Tracking Channel 1
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, LO leakage compensation is
        %   applied to the transmitted signal.
        EnableLOLeakageTrackingChannel1 = true;
    end
    
    properties(Logical, Nontunable)
        %EnableQuadratureCalibration Enable Quadrature Calibration
        %   Option to enable quadrature calibration on initialization, 
        %   specified as true or false. When this property is true, IQ 
        %   imbalance compensation is applied to the input signal.
        EnableQuadratureCalibration = true;
        %EnableLOLeakageCorrection Enable LO Leakage Correction
        %   Option to enable phase tracking, specified as true or
        %   false. When this property is true, at initialization LO leakage
        %   correction will be applied
        EnableLOLeakageCorrection = true;
        %EnableLOLeakageCorrectionExternal Enable LO Leakage Correction External
        %   Option to enable phase tracking, specified as true or
        %   false. When this property is true, at initialization LO leakage
        %   correction will be applied within an external loopback path.
        %   Note this requires external cabling.
        EnableLOLeakageCorrectionExternal = false;
    end
    
    properties(Logical)
        %PowerdownChannel0 Powerdown Channel 0
        %   Logical which will power down TX channel 0 when set
        PowerdownChannel0 = false;
        %PowerdownChannel1 Powerdown Channel 1
        %   Logical which will power down TX channel 1 when set
        PowerdownChannel1 = false;
    end
        
    properties (Hidden, Nontunable, Access = protected)
        isOutput = true;
    end
    
    properties(Nontunable, Hidden, Constant)
        Type = 'Tx';
    end
        
    properties(Nontunable, Hidden)
        channel_names = {'voltage0','voltage1','voltage2','voltage3'};
    end
    
    
    properties (Nontunable, Hidden)
        devName = 'axi-adrv9009-tx-hpc';
    end
    
    methods
        %% Constructor
        function obj = Tx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.ADRV9009.Base(varargin{:});
        end
        % Check Attentuation
        function set.AttenuationChannel0(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -41.95,'<=', 0}, ...
                '', 'Attenuation');
            assert(mod(value,1/20)==0, 'Attentuation must be a multiple of 0.05');
            obj.AttenuationChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeDouble(id,'hardwaregain',value,true);
            end
        end
        % Check Attentuation
        function set.AttenuationChannel1(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -41.95,'<=', 0}, ...
                '', 'Attenuation');
            assert(mod(value,1/20)==0, 'Attentuation must be a multiple of 0.05');
            obj.AttenuationChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeDouble(id,'hardwaregain',value,true);
            end
        end
        % Check PowerdownChannel0
        function set.PowerdownChannel0(obj, value)
            obj.PowerdownChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'powerdown',value,true);
            end
        end
        % Check PowerdownChannel1
        function set.PowerdownChannel1(obj, value)
            obj.PowerdownChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'powerdown',value,true);
            end
        end
        
        % Check EnableQuadratureTrackingChannel0
        function set.EnableQuadratureTrackingChannel0(obj, value)
            obj.EnableQuadratureTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,true);
            end
        end
        % Check EnableQuadratureTrackingChannel1
        function set.EnableQuadratureTrackingChannel1(obj, value)
            obj.EnableQuadratureTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,true);
            end
        end
        % Check EnableLOLeakageTrackingChannel0
        function set.EnableLOLeakageTrackingChannel0(obj, value)
            obj.EnableLOLeakageTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'lo_leakage_tracking_en',value,true);
            end
        end
        % Check EnableLOLeakageTrackingChannel1
        function set.EnableLOLeakageTrackingChannel1(obj, value)
            obj.EnableLOLeakageTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'lo_leakage_tracking_en',value,true);
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
            % Channels need to be powered up first so we can changed things
            obj.setAttributeBool('voltage0','powerdown',false,true);
            obj.setAttributeBool('voltage1','powerdown',false,true);
                        
            obj.setAttributeLongLong('altvoltage0','frequency',obj.CenterFrequency ,true);
            obj.setAttributeLongLong('voltage0','hardwaregain',obj.AttenuationChannel0,true);
            obj.setAttributeLongLong('voltage1','hardwaregain',obj.AttenuationChannel1,true);

            obj.setAttributeBool('voltage0','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel0,true);
            obj.setAttributeBool('voltage1','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel1,true);
            obj.setAttributeBool('voltage0','lo_leakage_tracking_en',obj.EnableLOLeakageTrackingChannel0,true);
            obj.setAttributeBool('voltage1','lo_leakage_tracking_en',obj.EnableLOLeakageTrackingChannel1,true);
            
            % Do one shot cals
            obj.setDeviceAttributeRAW('calibrate_tx_qec_en',num2str(obj.EnableQuadratureCalibration));
            obj.setDeviceAttributeRAW('calibrate_tx_lol_en',num2str(obj.EnableLOLeakageCorrection));
            obj.setDeviceAttributeRAW('calibrate_tx_lol_ext_en',num2str(obj.EnableLOLeakageCorrectionExternal));
            obj.setDeviceAttributeRAW('calibrate_frm_en',num2str(obj.EnableFrequencyHoppingModeCalibration));
            obj.setDeviceAttributeRAW('calibrate',num2str(true));

            % Bring stuff back up as desired
            obj.setAttributeBool('voltage0','powerdown',obj.PowerdownChannel0,true);
            obj.setAttributeBool('voltage1','powerdown',obj.PowerdownChannel1,true);

            
            obj.ToggleDDS(strcmp(obj.DataSource,'DDS'));
            if strcmp(obj.DataSource,'DDS')
                obj.DDSUpdate();
            end
        end
        
    end
    
end

