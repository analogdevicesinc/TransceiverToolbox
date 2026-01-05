classdef Rx < adi.ADRV9002.Base & adi.common.Rx
    % adi.ADRV9002.Rx Receive data from the ADRV9002 transceiver
    %   The adi.ADRV9002.Rx System object is a signal source that can receive
    %   complex data from the ADRV9002.
    %
    %   rx = adi.ADRV9002.Rx;
    %   rx = adi.ADRV9002.Rx('uri','192.168.2.1');
    %
    %   <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9002.pdf">ADRV9002 Datasheet</a>    
    properties
        %ENSMModeChannel0  State Machine Mode Channel 0
        %   specified as one of the following:
        %   'calibrated'
        %   'primed'
        %   'rf_enabled'
        ENSMModeChannel0 = 'rf_enabled';
        %ENSMModeModeChannel1  State Machine Mode Channel 1
        %   specified as one of the following:
        %   'calibrated'
        %   'primed'
        %   'rf_enabled'
        ENSMModeChannel1 = 'rf_enabled';
        
        %InterfaceGainChannel0 Interface Gain Channel 0
        %   This is the final gain in the digital path with possible
        %   values: -36:6:18
        %   This gain should be selected based on primary signal bandwidth.
        %   For narrowband applications higher levels of interface gain
        %   should be used (0:18) to allow signal level and analog noise to
        %   dominate. For wideband applications this gain should be reduced
        %   or disabled since quantization noise is minimal. Note that the
        %   available options for this gain depend on the profile loaded
        %   and picking an option outside of those options generates an
        %   error.
        InterfaceGainChannel0 = '0dB';
        %InterfaceGainChannel1 Interface Gain Channel 1
        %   This is the final gain in the digital path with possible
        %   values: -36:6:18
        %   This gain should be selected based on primary signal bandwidth.
        %   For narrowband applications higher levels of interface gain
        %   should be used (0:18) to allow signal level and analog noise to
        %   dominate. For wideband applications this gain should be reduced
        %   or disabled since quantization noise is minimal. Note that the
        %   available options for this gain depend on the profile loaded
        %   and picking an option outside of those options generates an
        %   error.
        InterfaceGainChannel1 = '0dB';
        
        %DigitalGainControlModeChannel0 Digital Gain Control Mode Channel 0
        %   The digital gain control has two major purposes, one for gain
        %   correction which is to correct the small step size inaccuracy
        %   in analog front-end attenuation and the other for gain
        %   compensation which is to compensate for the entire analog
        %   front-end attenuation. The digital gain block is controlled by
        %   the Rx gain table. Different digital gain will be applied when
        %   configured in gain correction or gain compensation mode. The Rx
        %   gain table has a unique front-end attenuator setting, with a
        %   corresponding amount of digital gain, programmed at each index
        %   of the table. In the end of the Rx data path, the interface
        %   gain could be further applied by using a “Slicer” block for 2
        %   major purposes. One is to avoid digital saturation in gain
        %   compensation mode. The other one is to ensure the overall SNR
        %   is limited only by analog noise and unaffected by quantization
        %   noise.
        %
        %   Gain correction should be used when external components (LNA or
        %   DSA) does not need to be controlled. Compensation should be
        %   used for external LNA or DSA control.
        %
        %   Gain control is specified as one of the following:    
        %   'automatic' - Automatically adjust interface gain
        %   'spi' - Manually adjust interface gain
        DigitalGainControlModeChannel0 = 'automatic';
        %DigitalGainControlModeChannel1 Digital Gain Control Mode Channel 1
        %   The digital gain control has two major purposes, one for gain
        %   correction which is to correct the small step size inaccuracy
        %   in analog front-end attenuation and the other for gain
        %   compensation which is to compensate for the entire analog
        %   front-end attenuation. The digital gain block is controlled by
        %   the Rx gain table. Different digital gain will be applied when
        %   configured in gain correction or gain compensation mode. The Rx
        %   gain table has a unique front-end attenuator setting, with a
        %   corresponding amount of digital gain, programmed at each index
        %   of the table. In the end of the Rx data path, the interface
        %   gain could be further applied by using a “Slicer” block for 2
        %   major purposes. One is to avoid digital saturation in gain
        %   compensation mode. The other one is to ensure the overall SNR
        %   is limited only by analog noise and unaffected by quantization
        %   noise.
        %
        %   Gain correction should be used when external components (LNA or
        %   DSA) does not need to be controlled. Compensation should be
        %   used for external LNA or DSA control.
        %
        %   Gain control is specified as one of the following:    
        %   'automatic' - Automatically adjust interface gain
        %   'spi' - Manually adjust interface gain
        DigitalGainControlModeChannel1 = 'automatic';
        
        %AttenuationChannel0 Attenuation Channel 0
        %   Must be greater than 0
        AttenuationChannel0 = 3;
        %AttenuationChannel1 Attenuation Channel 1
        %   Must be greater than 0
        AttenuationChannel1 = 3;
    end
    
    properties % ADVANCED
        %ENSMPortModeChannel0 Enable State Machine Port  Mode Channel 0
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        ENSMPortModeChannel0 = 'spi';
        %ENSMPortModeChannel1 Enable State Machine Port  Mode Channel 0
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        ENSMPortModeChannel1 = 'spi';
        %GainControllerSourceChannel0 Gain Controller Source Channel 0
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        %   'automatic'
        GainControllerSourceChannel0 = 'automatic';
        %GainControllerSourceChannel1 Gain Controller Source Channel 1
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        %   'automatic'
        GainControllerSourceChannel1 = 'automatic';
    end
    
    properties (Logical) % ADVANCED
        %PowerdownChannel0 Powerdown Channel 0
        PowerdownChannel0 = false;
        %PowerdownChannel0 Powerdown Channel 1
        PowerdownChannel1 = false;
        
        %AGCTrackingChannel0 AGC Tracking  Channel 0
        %    AGC on the fly tracking calibration for Channel 0
        AGCTrackingChannel0 = true;
        %AGCTrackingChannel1 AGC Tracking  Channel 1
        %    AGC on the fly tracking calibration for Channel 1
        AGCTrackingChannel1 = true;
        
        %BBDCRejectionTrackingChannel0 BBDC Rejection Tracking  Channel 0
        %   Baseband DC rejection on the fly tracking calibration for
        %   Channel 0
        BBDCRejectionTrackingChannel0 = true;
        %BBDCRejectionTrackingChannel1 BBDC Rejection Tracking  Channel 1
        %   Baseband DC rejection on the fly tracking calibration for
        %   Channel 1
        BBDCRejectionTrackingChannel1 = true;
        
        %HDTrackingChannel0 HD Tracking  Channel 0
        %   Harmonic Distortion on the fly tracking calibration for Channel
        %   0
        HDTrackingChannel0 = true;
        %HDTrackingChannel1 HD Tracking  Channel 1
        %   Harmonic Distortion on the fly tracking calibration for Channel
        %   1
        HDTrackingChannel1 = true;
        
        %QuadratureFICTrackingChannel0 Quadrature FIC Tracking  Channel 0
        %   Quadrature Error Correction Narrowband FIC on the fly tracking
        %   calibration for channel 0
        QuadratureFICTrackingChannel0 = true;
        %QuadratureFICTrackingChannel1 Quadrature FIC Tracking  Channel 1
        %   Quadrature Error Correction Narrowband FIC on the fly tracking
        %   calibration for channel 1
        QuadratureFICTrackingChannel1 = true;
        
        %QuadratureWidebandPolyTrackingChannel0 Quadrature Wideband Poly Tracking  Channel 0
        %   Quadrature Error Correction Wideband Poly on the fly tracking
        %   calibration for channel 0
        QuadratureWidebandPolyTrackingChannel0 = true;
        %QuadratureWidebandPolyTrackingChannel1 Quadrature Wideband Poly Tracking  Channel 1
        %   Quadrature Error Correction Wideband Poly on the fly tracking
        %   calibration for channel 1
        QuadratureWidebandPolyTrackingChannel1 = true;
        
        %RFDCTrackingChannel0 RF DC Tracking  Channel 0
        %  RF DC on the fly tracking calibration for channel 0
        RFDCTrackingChannel0 = true;
        %RFDCTrackingChannel1 RF DC Tracking  Channel 1
        %  RF DC on the fly tracking calibration for channel 1
        RFDCTrackingChannel1 = true;
        
        %RSSITrackingChannel0 RSSI Tracking  Channel 0
        %  RSSI on the fly tracking calibration for channel 0
        RSSITrackingChannel0 = true;
        %RSSITrackingChannel1 RSSI Tracking  Channel 1
        %  RSSI on the fly tracking calibration for channel 1
        RSSITrackingChannel1 = true;
    end
        
    properties (Dependent)
        %RSSIChannel0 RSSI Channel 0
        %   Received signal strength indicator. This valid is only valid
        %   once the object has been stepped and MATLAB connects to
        %   hardware
        RSSIChannel0
        %RSSIChannel1 RSSI Channel 1
        %   Received signal strength indicator. This valid is only valid
        %   once the object has been stepped and MATLAB connects to
        %   hardware
        RSSIChannel1
    end

    properties(Constant, Hidden)
        ENSMModeChannel0Set = matlab.system.StringSet({ ...
            'calibrated','primed','rf_enabled'});
        ENSMModeChannel1Set = matlab.system.StringSet({ ...
            'calibrated','primed','rf_enabled'});
        
        ENSMPortModeChannel0Set = matlab.system.StringSet({ ...
            'spi','pin'});
        ENSMPortModeChannel1Set = matlab.system.StringSet({ ...
            'spi','pin'});
        
        GainControllerSourceChannel0Set = matlab.system.StringSet({ ...
            'spi','pin','automatic'});
        GainControllerSourceChannel1Set = matlab.system.StringSet({ ...
            'spi','pin','automatic'});

        DigitalGainControlModeChannel0Set = matlab.system.StringSet({ ...
            'automatic','spi'});
        DigitalGainControlModeChannel1Set = matlab.system.StringSet({ ...
            'automatic','spi'});

        InterfaceGainChannel0Set = matlab.system.StringSet({...
            '18dB', '12dB', '6dB', '0dB', '-6dB', '-12dB', '-18dB',...
            '-24dB', '-30dB','-36dB'});
        InterfaceGainChannel1Set = matlab.system.StringSet({...
            '18dB', '12dB', '6dB', '0dB', '-6dB', '-12dB', '-18dB',...
            '-24dB', '-30dB','-36dB'});
    end
    
    properties(Hidden)
        InterfaceGainAvailableChannel0
        InterfaceGainAvailableChannel1
    end

    properties (Hidden, Nontunable, Access = protected)
        isOutput = false;
    end
    
    properties(Nontunable, Hidden, Constant)
        Type = 'Rx';
    end
    
    properties (Nontunable, Hidden)
        devName = 'axi-adrv9002-rx-lpc';
        channel_names = {'voltage0_i','voltage0_q','voltage1_i','voltage1_q'};
    end
    
    methods
        %% Constructor
        function obj = Rx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.ADRV9002.Base(varargin{:});
        end
        
        function value = get.RSSIChannel0(obj)
            if obj.ConnectedToDevice
                value = obj.getAttributeDouble('voltage0','rssi',false);
            else
                value = NaN;
            end
        end
        function value = get.RSSIChannel1(obj)
            if obj.ConnectedToDevice
                value = obj.getAttributeDouble('voltage1','rssi',false);
            else
                value = NaN;
            end
        end
        function values = get.InterfaceGainAvailableChannel0(obj)
            if obj.ConnectedToDevice
                values = obj.getAttributeRAW('voltage0','interface_gain_available',false);
                values = strsplit(values);
            else
                values = NaN;
            end
        end
        function values = get.InterfaceGainAvailableChannel1(obj)
            if obj.ConnectedToDevice
                values = obj.getAttributeRAW('voltage0','interface_gain_available',false);
                values = strsplit(values);
            else
                values = NaN;
            end
        end
        
        % Check ENSMModeChannel0
        function set.ENSMModeChannel0(obj, value)
            obj.ENSMModeChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'ensm_mode',value,false);
            end
        end
        % Check ENSMModeChannel1
        function set.ENSMModeChannel1(obj, value)
            obj.ENSMModeChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'ensm_mode',value,false);
            end
        end
        
        % Check ENSMPortModeChannel0
        function set.ENSMPortModeChannel0(obj, value)
            obj.ENSMPortModeChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'port_en_mode',value,false);
            end
        end
        % Check ENSMPortModeChannel1
        function set.ENSMPortModeChannel1(obj, value)
            obj.ENSMPortModeChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'port_en_mode',value,false);
            end
        end
        
        % Check GainControllerSourceChannel0
        function set.GainControllerSourceChannel0(obj, value)
            obj.GainControllerSourceChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'gain_control_mode',value,false);
            end
        end
        % Check GainControllerSourceChannel1
        function set.GainControllerSourceChannel1(obj, value)
            obj.GainControllerSourceChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'gain_control_mode',value,false);
            end
        end
        
        % Check DigitalGainControlModeChannel0
        function set.DigitalGainControlModeChannel0(obj, value)
            obj.DigitalGainControlModeChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'digital_gain_control_mode',obj.DigitalGainControlModeChannel0,false);
            end
        end
        % Check DigitalGainControlModeChannel1
        function set.DigitalGainControlModeChannel1(obj, value)
            obj.DigitalGainControlModeChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'digital_gain_control_mode',obj.DigitalGainControlModeChannel1,false);
            end
        end
        
        % Check Attenuation
        function set.AttenuationChannel0(obj, value)
            obj.AttenuationChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeDouble(id,'hardwaregain',value,false);
            end
        end
        % Check Attenuation
        function set.AttenuationChannel1(obj, value)
            obj.AttenuationChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeDouble(id,'hardwaregain',value,false);
            end
        end
        
        % Check InterfaceGainChannel0
        function set.InterfaceGainChannel0(obj, value)
            obj.InterfaceGainChannel0 = value;
            if obj.ConnectedToDevice
                mustBeMember(value,obj.InterfaceGainAvailableChannel0);
                id = 'voltage0';
                if strcmpi(obj.DigitalGainControlModeChannel0,'spi') &&...
                        strcmpi(obj.ENSMModeChannel0,'rf_enabled')
                    obj.setAttributeRAW(id,'interface_gain',value,false);
                end
            end
        end
        % Check InterfaceGainChannel1
        function set.InterfaceGainChannel1(obj, value)
            obj.InterfaceGainChannel1 = value;
            if obj.ConnectedToDevice
                mustBeMember(value,obj.InterfaceGainAvailableChannel1);
                id = 'voltage1';
                if strcmpi(obj.DigitalGainControlModeChannel1,'spi') &&...
                        strcmpi(obj.ENSMModeChannel1,'rf_enabled')
                    obj.setAttributeRAW(id,'interface_gain',value,false);
                end
            end
        end
        
        % Check AGCTrackingChannel0
        function set.AGCTrackingChannel0(obj, value)
            obj.AGCTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'agc_tracking_en',value,false);
            end
        end
        % Check AGCTrackingChannel1
        function set.AGCTrackingChannel1(obj, value)
            obj.AGCTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'agc_tracking_en',value,false);
            end
        end

        % Check BBDCRejectionTrackingChannel0
        function set.BBDCRejectionTrackingChannel0(obj, value)
            obj.BBDCRejectionTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'bbdc_rejection_tracking_en',value,false);
            end
        end
        % Check BBDCRejectionTrackingChannel1
        function set.BBDCRejectionTrackingChannel1(obj, value)
            obj.BBDCRejectionTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'bbdc_rejection_tracking_en',value,false);
            end
        end
        
        % Check HDTrackingChannel0
        function set.HDTrackingChannel0(obj, value)
            obj.HDTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'hd_tracking_en',value,false);
            end
        end
        % Check HDTrackingChannel1
        function set.HDTrackingChannel1(obj, value)
            obj.HDTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'hd_tracking_en',value,false);
            end
        end
        
        % Check QuadratureFICTrackingChannel0
        function set.QuadratureFICTrackingChannel0(obj, value)
            obj.QuadratureFICTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_fic_tracking_en',value,false);
            end
        end
        % Check QuadratureFICTrackingChannel1
        function set.QuadratureFICTrackingChannel1(obj, value)
            obj.QuadratureFICTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_fic_tracking_en',value,false);
            end
        end
        
        % Check QuadratureWidebandPolyTrackingChannel0
        function set.QuadratureWidebandPolyTrackingChannel0(obj, value)
            obj.QuadratureWidebandPolyTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_w_poly_tracking_en',value,false);
            end
        end
        % Check QuadratureWidebandPolyTrackingChannel1
        function set.QuadratureWidebandPolyTrackingChannel1(obj, value)
            obj.QuadratureWidebandPolyTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_w_poly_tracking_en',value,false);
            end
        end
        
        % Check RFDCTrackingChannel0
        function set.RFDCTrackingChannel0(obj, value)
            obj.RFDCTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'rfdc_tracking_en',value,false);
            end
        end
        % Check RFDCTrackingChannel1
        function set.RFDCTrackingChannel1(obj, value)
            obj.RFDCTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'rfdc_tracking_en',value,false);
            end
        end
        
        % Check RSSITrackingChannel0
        function set.RSSITrackingChannel0(obj, value)
            obj.RSSITrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'rssi_tracking_en',value,false);
            end
        end
        % Check RSSITrackingChannel1
        function set.RSSITrackingChannel1(obj, value)
            obj.RSSITrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'rssi_tracking_en',value,false);
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
            
            % Handle split vs MIMO buffer case
            if obj.checkIfDevExists('axi-adrv9002-rx2-lpc')
                % This naming is a bit strange due to the internal indexing
                % but duplicated channel names make it work
                obj.channel_names = ...
                    {'voltage0_i','voltage0_q',...
                    'voltage0_i','voltage0_q'};
                % Update
                if numel(obj.EnabledChannels)>1
                    error(['Driver is in split DMA mode (two separate DMAs axi-adrv9002-rx-lpc and axi-adrv9002-rx2-lpc)',newline,...
                        'Only available options for EnabledChannels are:',newline,...
                        '    [1],[2]']);
                end
                if any(obj.EnabledChannels==2)
                    obj.devName = 'axi-adrv9002-rx2-lpc';
                    obj.iioDev = obj.getDev(obj.devName);
                end
            else
                obj.channel_names = ...
                    {'voltage0_i','voltage0_q','voltage1_i','voltage1_q'};
            end
            
            
            if obj.EnableCustomProfile
                writeProfileFile(obj);
            end
            
            % Check if channel exists with new profile
            phydev = getDev(obj, obj.phyDevName);
            chanPtr = iio_device_find_channel(obj, phydev, 'voltage1', false);
            status = cPtrCheck(obj,chanPtr);
            if status ~= 0
                error("Cannot find channel voltage1")
            end
            [status, rValue] = iio_channel_attr_read(obj,chanPtr,'ensm_mode',1024);
            if status == -19
                channelsAval = 1;
            elseif status < 0
                cstatus(obj,rValue,'Attribute read failed for : ensm_mode');
            else
                channelsAval = 2;
            end
            
            % Check if property naming updated for LOs frequency vs
            % XLOX_frequency
            obj.checkDriverAPI();

            obj.setAttributeRAW('voltage0','ensm_mode',obj.ENSMModeChannel0,false);
            if channelsAval == 2
                obj.setAttributeRAW('voltage1','ensm_mode',obj.ENSMModeChannel1,false);
            end

            obj.setAttributeRAW('voltage0','gain_control_mode',obj.GainControllerSourceChannel0,false);
            if channelsAval == 2
                obj.setAttributeRAW('voltage1','gain_control_mode',obj.GainControllerSourceChannel1,false);
            end

            obj.setAttributeRAW('voltage0','digital_gain_control_mode',obj.DigitalGainControlModeChannel0,false);
            if channelsAval == 2
                obj.setAttributeRAW('voltage1','digital_gain_control_mode',obj.DigitalGainControlModeChannel1,false);
            end

            if strcmpi(obj.DigitalGainControlModeChannel0,'spi') && strcmpi(obj.ENSMModeChannel0,'rf_enabled')
                mustBeMember(obj.InterfaceGainChannel0,obj.InterfaceGainAvailableChannel0);
                obj.setAttributeRAW('voltage0','interface_gain',obj.InterfaceGainChannel0,false);
            end
            
            if strcmpi(obj.DigitalGainControlModeChannel1,'spi') && strcmpi(obj.ENSMModeChannel1,'rf_enabled') && channelsAval == 2
                mustBeMember(obj.InterfaceGainChannel1,obj.InterfaceGainAvailableChannel1);
                obj.setAttributeRAW('voltage1','interface_gain',obj.InterfaceGainChannel1,false);
            end            
            
            
            obj.setAttributeRAW('voltage0','port_en_mode',obj.ENSMPortModeChannel0,false);
            if channelsAval == 2
                obj.setAttributeRAW('voltage1','port_en_mode',obj.ENSMPortModeChannel0,false);
            end
            
            if strcmpi(obj.GainControllerSourceChannel0,'spi')
                obj.setAttributeDouble('voltage0','hardwaregain',obj.AttenuationChannel0,false);
            end
            if strcmpi(obj.GainControllerSourceChannel1,'spi') && channelsAval == 2
                obj.setAttributeDouble('voltage1','hardwaregain',obj.AttenuationChannel1,false);
            end

            if obj.newAPI
                name1 = 'frequency';
                name2 = 'frequency';
            else
                name1 = 'RX1_LO_frequency';
                name2 = 'RX2_LO_frequency';
            end
            obj.setAttributeLongLong('altvoltage0',name1,obj.CenterFrequencyChannel0 ,true);
            if channelsAval == 2
                obj.setAttributeLongLong('altvoltage1',name2,obj.CenterFrequencyChannel1 ,true);
            end
            
            % Calibrations
            agc_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','agc_tracking_en',false);
            if (agc_tracking_en_voltage0_state ~= obj.AGCTrackingChannel0)
                obj.setAttributeBool('voltage0','agc_tracking_en',obj.AGCTrackingChannel0,false);
            end
            if channelsAval == 2
            agc_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','agc_tracking_en',false);
            if (agc_tracking_en_voltage1_state ~= obj.AGCTrackingChannel1)
                obj.setAttributeBool('voltage1','agc_tracking_en',obj.AGCTrackingChannel1,false);
            end
            end

            bbdc_rejection_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','bbdc_rejection_tracking_en',false);
            if (bbdc_rejection_tracking_en_voltage0_state ~= obj.BBDCRejectionTrackingChannel0)
                obj.setAttributeBool('voltage0','bbdc_rejection_tracking_en',obj.BBDCRejectionTrackingChannel0,false);
            end
            if channelsAval == 2
            bbdc_rejection_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','bbdc_rejection_tracking_en',false);
            if (bbdc_rejection_tracking_en_voltage1_state ~= obj.BBDCRejectionTrackingChannel1) && channelsAval == 2
                obj.setAttributeBool('voltage1','bbdc_rejection_tracking_en',obj.BBDCRejectionTrackingChannel1,false);
            end
            end

            hd_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','hd_tracking_en',false);
            if (hd_tracking_en_voltage0_state ~= obj.HDTrackingChannel0)
                obj.setAttributeBool('voltage0','hd_tracking_en',obj.HDTrackingChannel0,false);
            end
            if channelsAval == 2
            hd_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','hd_tracking_en',false);
            if (hd_tracking_en_voltage1_state ~= obj.HDTrackingChannel1) && channelsAval == 2
                obj.setAttributeBool('voltage1','hd_tracking_en',obj.HDTrackingChannel1,false);
            end
            end

            quadrature_fic_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','quadrature_fic_tracking_en',false);
            if (quadrature_fic_tracking_en_voltage0_state ~= obj.QuadratureFICTrackingChannel0)
                obj.setAttributeBool('voltage0','quadrature_fic_tracking_en',obj.QuadratureFICTrackingChannel0,false);
            end
            if channelsAval == 2
            quadrature_fic_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','quadrature_fic_tracking_en',false);
            if (quadrature_fic_tracking_en_voltage1_state ~= obj.QuadratureFICTrackingChannel1) && channelsAval == 2
                obj.setAttributeBool('voltage1','quadrature_fic_tracking_en',obj.QuadratureFICTrackingChannel1,false);
            end
            end

            quadrature_w_poly_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','quadrature_w_poly_tracking_en',false);
            if (quadrature_w_poly_tracking_en_voltage0_state ~= obj.QuadratureWidebandPolyTrackingChannel0)
                obj.setAttributeBool('voltage0','quadrature_w_poly_tracking_en',obj.QuadratureWidebandPolyTrackingChannel0,false);
            end
            if channelsAval == 2
            quadrature_w_poly_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','quadrature_w_poly_tracking_en',false);
            if (quadrature_w_poly_tracking_en_voltage1_state ~= obj.QuadratureWidebandPolyTrackingChannel1) && channelsAval == 2
                obj.setAttributeBool('voltage1','quadrature_w_poly_tracking_en',obj.QuadratureWidebandPolyTrackingChannel1,false);
            end
            end

            rfdc_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','rfdc_tracking_en',false);
            if (rfdc_tracking_en_voltage0_state ~= obj.RFDCTrackingChannel0)
                obj.setAttributeBool('voltage0','rfdc_tracking_en',obj.RFDCTrackingChannel0,false);
            end
            if channelsAval == 2
            rfdc_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','rfdc_tracking_en',false);
            if (rfdc_tracking_en_voltage1_state ~= obj.RFDCTrackingChannel1) && channelsAval == 2
                obj.setAttributeBool('voltage1','rfdc_tracking_en',obj.RFDCTrackingChannel1,false);
            end
            end

            rssi_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','rssi_tracking_en',false);
            if (rssi_tracking_en_voltage0_state ~= obj.RSSITrackingChannel0)
                obj.setAttributeBool('voltage0','rssi_tracking_en',obj.RSSITrackingChannel0,false);
            end
            if channelsAval == 2
            rssi_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','rssi_tracking_en',false);
            if (rssi_tracking_en_voltage1_state ~= obj.RSSITrackingChannel1) && channelsAval == 2
                obj.setAttributeBool('voltage1','rssi_tracking_en',obj.RSSITrackingChannel1,false);
            end
            end
        end
        
    end
    
end

