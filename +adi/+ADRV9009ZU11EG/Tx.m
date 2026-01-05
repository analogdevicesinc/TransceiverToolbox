classdef Tx < adi.ADRV9009ZU11EG.Base & adi.ADRV9009.Tx
    % adi.ADRV9009ZU11EG.Tx Transmit data from the ADRV9009ZU11EG SOM
    %   The adi.ADRV9009ZU11EG.Tx System object is a signal sink that can transmit
    %   complex data from the ADRV9009ZU11EG.
    %
    %   tx = adi.ADRV9009ZU11EG.Tx;
    %   tx = adi.ADRV9009ZU11EG.Tx('uri','192.168.2.1');
    %
    %   <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9009.pdf">ADRV9009 Datasheet</a>
    
    properties
        %AttenuationChannel0ChipB Attenuation Channel 0 ChipB
        %   Attenuation specified as a scalar from -41.95 to 0 dB with a
        %   resolution of 0.05 dB.
        AttenuationChannel0ChipB = -30;
        %AttenuationChannel1ChipB Attenuation Channel 1 ChipB
        %   Attenuation specified as a scalar from -41.95 to 0 dB with a
        %   resolution of 0.05 dB.
        AttenuationChannel1ChipB = -30;
    end

    properties (Logical)
        %EnableQuadratureTrackingChannel0ChipB Enable Quadrature Tracking Channel 0 Chip B
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the transmitted signal.
        EnableQuadratureTrackingChannel0ChipB = true;
        %EnableQuadratureTrackingChannel1ChipB Enable Quadrature Tracking Channel 1 Chip B
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, IQ imbalance compensation is
        %   applied to the transmitted signal.
        EnableQuadratureTrackingChannel1ChipB = true;
        %EnableLOLeakageTrackingChannel0ChipB Enable LO Leakage Tracking Channel 0 Chip B
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, LO leakage compensation is
        %   applied to the transmitted signal.
        EnableLOLeakageTrackingChannel0ChipB = true;
        %EnableLOLeakageTrackingChannel1ChipB Enable LO Leakage Tracking Channel 1 Chip B
        %   Option to enable quadrature tracking, specified as true or
        %   false. When this property is true, LO leakage compensation is
        %   applied to the transmitted signal.
        EnableLOLeakageTrackingChannel1ChipB = true;
    end
    
    properties(Logical, Nontunable)
        %EnableQuadratureCalibrationChipB Enable Quadrature Calibration Chip B
        %   Option to enable quadrature calibration on initialization, 
        %   specified as true or false. When this property is true, IQ 
        %   imbalance compensation is applied to the input signal.
        EnableQuadratureCalibrationChipB = true;
        %EnableLOLeakageCorrectionChipB Enable LO Leakage Correction Chip B
        %   Option to enable phase tracking, specified as true or
        %   false. When this property is true, at initialization LO leakage
        %   correction will be applied
        EnableLOLeakageCorrectionChipB = true;
        %EnableLOLeakageCorrectionExternalChipB Enable LO Leakage Correction External Chip B
        %   Option to enable phase tracking, specified as true or
        %   false. When this property is true, at initialization LO leakage
        %   correction will be applied within an external loopback path.
        %   Note this requires external cabling.
        EnableLOLeakageCorrectionExternalChipB = false;
    end
    
    properties(Logical)
        %PowerdownChannel0ChipB Powerdown Channel 0 Chip B
        %   Logical which will power down TX channel 0 when set
        PowerdownChannel0ChipB = false;
        %PowerdownChannel1ChipB Powerdown Channel 1 Chip B
        %   Logical which will power down TX channel 1 when set
        PowerdownChannel1ChipB = false;
    end
    
    properties(Nontunable, Hidden, Constant)
        channel_names_runtime = {'voltage0','voltage1','voltage2','voltage3',...
            'voltage4','voltage5','voltage6','voltage7'};
    end
    
    properties(Nontunable, Hidden)
        phyDevNameChipB = 'adrv9009-phy-b';
    end
    
    properties(Hidden)
        iioDevChipB;
    end
    
    methods
        %% Constructor
        function obj = Tx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.ADRV9009.Tx(varargin{:});
            obj = obj@adi.ADRV9009ZU11EG.Base(varargin{:});
            obj.channel_names = obj.channel_names_runtime;
        end
        % Check AttenuationChannel0ChipB
        function set.AttenuationChannel0ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -41.95,'<=', 0}, ...
                '', 'AttenuationChannel0ChipB');
            assert(mod(value,1/20)==0, 'Attenuation must be a multiple of 0.05');
            obj.AttenuationChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeDouble(id,'hardwaregain',value,true,0,obj.iioDevChipB); %#ok<MCSUP>
            end
        end
        % Check AttenuationChannel1ChipB
        function set.AttenuationChannel1ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -41.95,'<=', 0}, ...
                '', 'AttenuationChannel1ChipB');
            assert(mod(value,1/20)==0, 'Attenuation must be a multiple of 0.05');
            obj.AttenuationChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeDouble(id,'hardwaregain',value,true,0,obj.iioDevChipB); %#ok<MCSUP>
            end
        end
        
        % Check PowerdownChannel0ChipB
        function set.PowerdownChannel0ChipB(obj, value)
            obj.PowerdownChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'powerdown',value,true,obj.iioDevChipB);
            end
        end
        % Check PowerdownChannel1ChipB
        function set.PowerdownChannel1ChipB(obj, value)
            obj.PowerdownChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'powerdown',value,true,obj.iioDevChipB);
            end
        end
        
        % Check EnableQuadratureTrackingChannel0ChipB
        function set.EnableQuadratureTrackingChannel0ChipB(obj, value)
            obj.EnableQuadratureTrackingChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,true,obj.iioDevChipB);
            end
        end
        % Check EnableQuadratureTrackingChannel1ChipB
        function set.EnableQuadratureTrackingChannel1ChipB(obj, value)
            obj.EnableQuadratureTrackingChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,true,obj.iioDevChipB);
            end
        end
        % Check EnableLOLeakageTrackingChannel0ChipB
        function set.EnableLOLeakageTrackingChannel0ChipB(obj, value)
            obj.EnableLOLeakageTrackingChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'lo_leakage_tracking_en',value,true,obj.iioDevChipB);
            end
        end
        % Check EnableLOLeakageTrackingChannel1ChipB
        function set.EnableLOLeakageTrackingChannel1ChipB(obj, value)
            obj.EnableLOLeakageTrackingChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'lo_leakage_tracking_en',value,true,obj.iioDevChipB);
            end
        end

        
        
    end
    
    methods (Access=protected)

        % Hide unused parameters when in specific modes
        function flag = isInactivePropertyImpl(obj, prop)
            % Call the superclass method
            flag = isInactivePropertyImpl@adi.common.RxTx(obj,prop);

            if ~any(obj.EnabledChannels == 1)
                flag = flag || strcmpi(prop,'AttenuationChannel0');
            end
            if ~any(obj.EnabledChannels == 2)
                flag = flag || strcmpi(prop,'AttenuationChannel1');
            end
            if ~any(obj.EnabledChannels == 3)
                flag = flag || strcmpi(prop,'AttenuationChannel0ChipB');
            end
            if ~any(obj.EnabledChannels == 4)
                flag = flag || strcmpi(prop,'AttenuationChannel1ChipB');
            end
            if ~any(obj.EnabledChannels == 3) && ~any(obj.EnabledChannels == 4)
                flag = flag || strcmpi(prop,'CenterFrequencyChipB');
            end
        end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        
        function numIn = getNumInputsImpl(obj)
            if strcmp(obj.DataSource,'DDS')
                numIn = 0;
            else
                numIn = obj.channelCount/2;
            end
        end
        
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
            obj.setAttributeBool('voltage0','powerdown',false,true);
            obj.setAttributeBool('voltage1','powerdown',false,true);
            obj.setAttributeBool('voltage0','powerdown',false,true,obj.iioDevChipB);
            obj.setAttributeBool('voltage1','powerdown',false,true,obj.iioDevChipB);
              
            % LO
            obj.setAttributeLongLong('altvoltage0','frequency',obj.CenterFrequency ,true);
            obj.setAttributeLongLong('altvoltage0','frequency',obj.CenterFrequencyChipB ,true, 10, obj.iioDevChipB);
            % Gain
            obj.setAttributeDouble('voltage0','hardwaregain',obj.AttenuationChannel0,true);
            obj.setAttributeDouble('voltage1','hardwaregain',obj.AttenuationChannel1,true);
            obj.setAttributeDouble('voltage0','hardwaregain',obj.AttenuationChannel0ChipB,true,10,obj.iioDevChipB);
            obj.setAttributeDouble('voltage1','hardwaregain',obj.AttenuationChannel1ChipB,true,10,obj.iioDevChipB);
            
            obj.setAttributeBool('voltage0','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel0,true);
            obj.setAttributeBool('voltage1','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel1,true);
            obj.setAttributeBool('voltage0','lo_leakage_tracking_en',obj.EnableLOLeakageTrackingChannel0,true);
            obj.setAttributeBool('voltage1','lo_leakage_tracking_en',obj.EnableLOLeakageTrackingChannel1,true);
            
            obj.setAttributeBool('voltage0','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel0ChipB,true,obj.iioDevChipB);
            obj.setAttributeBool('voltage1','quadrature_tracking_en',obj.EnableQuadratureTrackingChannel1ChipB,true,obj.iioDevChipB);
            obj.setAttributeBool('voltage0','lo_leakage_tracking_en',obj.EnableLOLeakageTrackingChannel0ChipB,true,obj.iioDevChipB);
            obj.setAttributeBool('voltage1','lo_leakage_tracking_en',obj.EnableLOLeakageTrackingChannel1ChipB,true,obj.iioDevChipB);
            
            % Do one shot cals
            obj.setDeviceAttributeRAW('calibrate_tx_qec_en',num2str(obj.EnableQuadratureCalibration));
            obj.setDeviceAttributeRAW('calibrate_tx_lol_en',num2str(obj.EnableLOLeakageCorrection));
            obj.setDeviceAttributeRAW('calibrate_tx_lol_ext_en',num2str(obj.EnableLOLeakageCorrectionExternal));
            if strcmpi(class(obj),'adi.ADRV9009ZU11EG.Tx')
                obj.setDeviceAttributeRAW('calibrate_fhm_en',num2str(obj.EnableFrequencyHoppingModeCalibration));
            end
            obj.setDeviceAttributeRAW('calibrate',num2str(true));
            
            obj.setDeviceAttributeRAW('calibrate_tx_qec_en',num2str(obj.EnableQuadratureCalibrationChipB),obj.iioDevChipB);
            obj.setDeviceAttributeRAW('calibrate_tx_lol_en',num2str(obj.EnableLOLeakageCorrectionChipB),obj.iioDevChipB);
            obj.setDeviceAttributeRAW('calibrate_tx_lol_ext_en',num2str(obj.EnableLOLeakageCorrectionExternalChipB),obj.iioDevChipB);
            if strcmpi(class(obj),'adi.ADRV9009ZU11EG.Tx')
                obj.setDeviceAttributeRAW('calibrate_fhm_en',num2str(obj.EnableFrequencyHoppingModeCalibrationChipB),obj.iioDevChipB);
            end
            obj.setDeviceAttributeRAW('calibrate',num2str(true),obj.iioDevChipB);
            
            % Bring stuff back up as desired
            obj.setAttributeBool('voltage0','powerdown',obj.PowerdownChannel0,true);
            obj.setAttributeBool('voltage1','powerdown',obj.PowerdownChannel1,true);
            obj.setAttributeBool('voltage0','powerdown',obj.PowerdownChannel0ChipB,true,obj.iioDevChipB);
            obj.setAttributeBool('voltage1','powerdown',obj.PowerdownChannel1ChipB,true,obj.iioDevChipB);
            
            % DDS
            obj.ToggleDDS(strcmp(obj.DataSource,'DDS'));
            if strcmp(obj.DataSource,'DDS')
                obj.DDSUpdate();
            end
        end
        
    end
    
end

