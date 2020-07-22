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
        %ENSMModeChannel0 Enable State Machine Mode Channel 0
        %   specified as one of the following:
        %   'calibrated'
        %   'primed'
        %   'rf_enabled'
        ENSMModeChannel0 = 'rf_enabled';
        %ENSMModeModeChannel1 Enable State Machine Mode Channel 1
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
        %   or disabled since quantization noise is minimal.
        InterfaceGainChannel0 = '0dB';
        %InterfaceGainChannel1 Interface Gain Channel 1
        %   This is the final gain in the digital path with possible
        %   values: -36:6:18
        %   This gain should be selected based on primary signal bandwidth.
        %   For narrowband applications higher levels of interface gain
        %   should be used (0:18) to allow signal level and analog noise to
        %   dominate. For wideband applications this gain should be reduced
        %   or disabled since quantization noise is minimal.
        InterfaceGainChannel1 = '0dB';

        %GainControlModeChannel0 Gain Control Mode Channel 0
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
        %   'AutomaticGainCorrection' - Automatically adjust interface gain
        %   'ManualGainCorrection' - Manually adjust interface gain
        %   'AutomaticGainCompensation' - Automatically adjust interface
        %   gain and external gain element
        %   'ManualGainCompensation' - Manually adjust interface
        %   gain and external gain element
        GainControlModeChannel0 = 'AutomaticGainCorrection';
        %GainControlModeChannel1 Gain Control Mode Channel 1
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
        %   'AutomaticGainCorrection' - Automatically adjust interface gain
        %   'ManualGainCorrection' - Manually adjust interface gain
        %   'AutomaticGainCompensation' - Automatically adjust interface
        %   gain and external gain element
        %   'ManualGainCompensation' - Manually adjust interface
        %   gain and external gain element
        GainControlModeChannel1 = 'AutomaticGainCorrection';
        
        %AttenuationChannel0 Attenuation Channel 0
        %   Must be greater than 0
        AttenuationChannel0 = 3;
        %AttenuationChannel1 Attenuation Channel 1
        %   Must be greater than 0
        AttenuationChannel1 = 3;
    end
    
    properties % ADVANCED
        %ENSMPortEnableModeChannel0 Enable State Machine Port Enable Mode Channel 0
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        ENSMPortEnableModeChannel0 = 'spi';
        %ENSMPortEnableModeChannel1 Enable State Machine Port Enable Mode Channel 0
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        ENSMPortEnableModeChannel1 = 'spi';
        %GainControllerSourceChannel0 Gain Controller Source Channel 0
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        %   'automatic'
        GainControllerSourceChannel0 = 'spi';
        %GainControllerSourceChannel1 Gain Controller Source Channel 1
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        %   'automatic'
        GainControllerSourceChannel1 = 'spi';
    end
    
    properties (Logical) % ADVANCED
        %PowerdownChannel0 Powerdown Channel 0
        PowerdownChannel0 = false;
        %PowerdownChannel0 Powerdown Channel 1
        PowerdownChannel1 = false;
        
        %AGCTrackingEnableChannel0 AGC Tracking Enable Channel 0
        %   Enable AGC on the fly tracking calibration for Channel 0
        AGCTrackingEnableChannel0 = true;
        %AGCTrackingEnableChannel1 AGC Tracking Enable Channel 1
        %   Enable AGC on the fly tracking calibration for Channel 1
        AGCTrackingEnableChannel1 = true;
        
        %BBDCRejectionTrackingEnableChannel0 BBDC Rejection Tracking Enable Channel 0
        %   Baseband DC rejection on the fly tracking calibration for
        %   Channel 0
        BBDCRejectionTrackingEnableChannel0 = true;
        %BBDCRejectionTrackingEnableChannel1 BBDC Rejection Tracking Enable Channel 1
        %   Baseband DC rejection on the fly tracking calibration for
        %   Channel 1
        BBDCRejectionTrackingEnableChannel1 = true;
        
        %HDTrackingEnableChannel0 HD Tracking Enable Channel 0
        %   Harmonic Distortion on the fly tracking calibration for Channel
        %   0
        HDTrackingEnableChannel0 = true;
        %HDTrackingEnableChannel1 HD Tracking Enable Channel 1
        %   Harmonic Distortion on the fly tracking calibration for Channel
        %   1
        HDTrackingEnableChannel1 = true;
        
        %QuadratureFICTrackingEnableChannel0 Quadrature FIC Tracking Enable Channel 0
        %   Quadrature Error Correction Narrowband FIC on the fly tracking
        %   calibration for channel 0
        QuadratureFICTrackingEnableChannel0 = true;
        %QuadratureFICTrackingEnableChannel1 Quadrature FIC Tracking Enable Channel 1
        %   Quadrature Error Correction Narrowband FIC on the fly tracking
        %   calibration for channel 1
        QuadratureFICTrackingEnableChannel1 = true;
        
        %QuadratureWidebandPolyTrackingEnableChannel0 Quadrature Wideband Poly Tracking Enable Channel 0
        %   Quadrature Error Correction Wideband Poly on the fly tracking
        %   calibration for channel 0
        QuadratureWidebandPolyTrackingEnableChannel0 = true;
        %QuadratureWidebandPolyTrackingEnableChannel1 Quadrature Wideband Poly Tracking Enable Channel 1
        %   Quadrature Error Correction Wideband Poly on the fly tracking
        %   calibration for channel 1
        QuadratureWidebandPolyTrackingEnableChannel1 = true;
        
        %RFDCTrackingEnableChannel0 RF DC Tracking Enable Channel 0
        %  RF DC on the fly tracking calibration for channel 0
        RFDCTrackingEnableChannel0 = true;
        %RFDCTrackingEnableChannel1 RF DC Tracking Enable Channel 1
        %  RF DC on the fly tracking calibration for channel 1
        RFDCTrackingEnableChannel1 = true;
        
        %RSSITrackingEnableChannel0 RSSI Tracking Enable Channel 0
        %  RSSI on the fly tracking calibration for channel 0
        RSSITrackingEnableChannel0 = true;
        %RSSITrackingEnableChannel1 RSSI Tracking Enable Channel 1
        %  RSSI on the fly tracking calibration for channel 1
        RSSITrackingEnableChannel1 = true;
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
        
        ENSMPortEnableModeChannel0Set = matlab.system.StringSet({ ...
            'spi','pin'});
        ENSMPortEnableModeChannel1Set = matlab.system.StringSet({ ...
            'spi','pin'});
        
        GainControllerSourceChannel0Set = matlab.system.StringSet({ ...
            'spi','pin','automatic'});
        GainControllerSourceChannel1Set = matlab.system.StringSet({ ...
            'spi','pin','automatic'});
        
        GainControlModeChannel0Set = matlab.system.StringSet({ ...
            'AutomaticGainCorrection','ManualGainCorrection',...
            'AutomaticGainCompensation','ManualGainCompensation'});
        GainControlModeChannel1Set = matlab.system.StringSet({ ...
            'AutomaticGainCorrection','ManualGainCorrection',...
            'AutomaticGainCompensation','ManualGainCompensation'});
        
        InterfaceGainChannel0Set = matlab.system.StringSet({...
            '18dB', '12dB', '6dB', '0dB', '-6dB', '-12dB', '-18dB',...
            '-24dB', '-30dB','-36dB'});
        InterfaceGainChannel1Set = matlab.system.StringSet({...
            '18dB', '12dB', '6dB', '0dB', '-6dB', '-12dB', '-18dB',...
            '-24dB', '-30dB','-36dB'});
    end
    
    properties (Hidden, Nontunable, Access = protected)
        isOutput = false;
    end
    
    properties(Nontunable, Hidden, Constant)
        Type = 'Rx';
        channel_names = {'voltage0_i','voltage0_q','voltage1_i','voltage1_q'};
    end
    
    properties (Nontunable, Hidden)
        devName = 'axi-adrv9002-rx-lpc';
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
        
        % Check ENSMPortEnableModeChannel0
        function set.ENSMPortEnableModeChannel0(obj, value)
            obj.ENSMPortEnableModeChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'port_en_mode',value,false);
            end
        end
        % Check ENSMPortEnableModeChannel1
        function set.ENSMPortEnableModeChannel1(obj, value)
            obj.ENSMPortEnableModeChannel1 = value;
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
        
        % Check GainControlModeChannel0
        function set.GainControlModeChannel0(obj, value)
            obj.GainControlModeChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                value = obj.AGCModeLookup(value);
                obj.setAttributeRAW(id,'digital_gain_control_mode',value,false);
            end
        end
        % Check GainControlModeChannel1
        function set.GainControlModeChannel1(obj, value)
            obj.GainControlModeChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                value = obj.AGCModeLookup(value);
                obj.setAttributeRAW(id,'digital_gain_control_mode',value,false);
            end
        end
        
        % Check Attentuation
        function set.AttenuationChannel0(obj, value)
            obj.AttenuationChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeLongLong(id,'hardwaregain',value,false);
            end
        end
        % Check Attentuation
        function set.AttenuationChannel1(obj, value)
            obj.AttenuationChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeLongLong(id,'hardwaregain',value,false);
            end
        end
        
        % Check InterfaceGainChannel0
        function set.InterfaceGainChannel0(obj, value)
            obj.InterfaceGainChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                if strcmpi(obj.GainControlModeChannel0,'ManualGainCorrection') &&...
                        strcmpi(obj.ENSMModeChannel0,'rf_enabled')
                    obj.setAttributeRAW(id,'interface_gain',value,false);
                end
            end
        end
        % Check InterfaceGainChannel1
        function set.InterfaceGainChannel1(obj, value)
            obj.InterfaceGainChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                if strcmpi(obj.GainControlModeChannel1,'ManualGainCorrection') &&...
                        strcmpi(obj.ENSMModeChannel1,'rf_enabled')
                    obj.setAttributeRAW(id,'interface_gain',value,false);
                end
            end
        end
        
        % Check AGCTrackingEnableChannel0
        function set.AGCTrackingEnableChannel0(obj, value)
            obj.AGCTrackingEnableChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'agc_tracking_en',value,false);
            end
        end
        % Check AGCTrackingEnableChannel1
        function set.AGCTrackingEnableChannel1(obj, value)
            obj.AGCTrackingEnableChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'agc_tracking_en',value,false);
            end
        end

        % Check BBDCRejectionTrackingEnableChannel0
        function set.BBDCRejectionTrackingEnableChannel0(obj, value)
            obj.BBDCRejectionTrackingEnableChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'bbdc_rejection_tracking_en',value,false);
            end
        end
        % Check BBDCRejectionTrackingEnableChannel1
        function set.BBDCRejectionTrackingEnableChannel1(obj, value)
            obj.BBDCRejectionTrackingEnableChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'bbdc_rejection_tracking_en',value,false);
            end
        end
        
        % Check HDTrackingEnableChannel0
        function set.HDTrackingEnableChannel0(obj, value)
            obj.HDTrackingEnableChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'hd_tracking_en',value,false);
            end
        end
        % Check HDTrackingEnableChannel1
        function set.HDTrackingEnableChannel1(obj, value)
            obj.HDTrackingEnableChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'hd_tracking_en',value,false);
            end
        end
        
        % Check QuadratureFICTrackingEnableChannel0
        function set.QuadratureFICTrackingEnableChannel0(obj, value)
            obj.QuadratureFICTrackingEnableChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_fic_tracking_en',value,false);
            end
        end
        % Check QuadratureFICTrackingEnableChannel1
        function set.QuadratureFICTrackingEnableChannel1(obj, value)
            obj.QuadratureFICTrackingEnableChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_fic_tracking_en',value,false);
            end
        end
        
        % Check QuadratureWidebandPolyTrackingEnableChannel0
        function set.QuadratureWidebandPolyTrackingEnableChannel0(obj, value)
            obj.QuadratureWidebandPolyTrackingEnableChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_w_poly_tracking_en',value,false);
            end
        end
        % Check QuadratureWidebandPolyTrackingEnableChannel1
        function set.QuadratureWidebandPolyTrackingEnableChannel1(obj, value)
            obj.QuadratureWidebandPolyTrackingEnableChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_w_poly_tracking_en',value,false);
            end
        end
        
        % Check RFDCTrackingEnableChannel0
        function set.RFDCTrackingEnableChannel0(obj, value)
            obj.RFDCTrackingEnableChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'rfdc_tracking_en',value,false);
            end
        end
        % Check RFDCTrackingEnableChannel1
        function set.RFDCTrackingEnableChannel1(obj, value)
            obj.RFDCTrackingEnableChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'rfdc_tracking_en',value,false);
            end
        end
        
        % Check RSSITrackingEnableChannel0
        function set.RSSITrackingEnableChannel0(obj, value)
            obj.RSSITrackingEnableChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'rssi_tracking_en',value,false);
            end
        end
        % Check RSSITrackingEnableChannel1
        function set.RSSITrackingEnableChannel1(obj, value)
            obj.RSSITrackingEnableChannel1 = value;
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
            if obj.EnableCustomProfile
                writeProfileFile(obj);
            end
            
            obj.setAttributeRAW('voltage0','ensm_mode',obj.ENSMModeChannel0,false);
            obj.setAttributeRAW('voltage1','ensm_mode',obj.ENSMModeChannel1,false);
            
            obj.setAttributeRAW('voltage0','gain_control_mode',obj.GainControllerSourceChannel0,false);
            obj.setAttributeRAW('voltage1','gain_control_mode',obj.GainControllerSourceChannel1,false);

            obj.setAttributeRAW('voltage0','digital_gain_control_mode',obj.AGCModeLookup(obj.GainControlModeChannel0),false);
            obj.setAttributeRAW('voltage1','digital_gain_control_mode',obj.AGCModeLookup(obj.GainControlModeChannel1),false);

            if strcmpi(obj.GainControlModeChannel0,'ManualGainCorrection') && strcmpi(obj.ENSMModeChannel0,'rf_enabled')
                obj.setAttributeRAW('voltage0','interface_gain',obj.InterfaceGainChannel0,false);
            end
            
            if strcmpi(obj.GainControlModeChannel1,'ManualGainCorrection') && strcmpi(obj.ENSMModeChannel1,'rf_enabled')
                obj.setAttributeRAW('voltage1','interface_gain',obj.InterfaceGainChannel1,false);
            end            
            
            
            obj.setAttributeRAW('voltage0','port_en_mode',obj.ENSMPortEnableModeChannel0,false);
            obj.setAttributeRAW('voltage1','port_en_mode',obj.ENSMPortEnableModeChannel0,false);
            
            if contains(obj.GainControlModeChannel0,'Manual')
                obj.setAttributeLongLong('voltage0','hardwaregain',obj.AttenuationChannel0,false);
            end
            if contains(obj.GainControlModeChannel1,'Manual')
                obj.setAttributeLongLong('voltage1','hardwaregain',obj.AttenuationChannel1,false);
            end

            obj.setAttributeLongLong('altvoltage0','RX1_LO_frequency',obj.CenterFrequencyChannel0 ,true);
            obj.setAttributeLongLong('altvoltage1','RX2_LO_frequency',obj.CenterFrequencyChannel1 ,true);
            
            % Calibrations
            obj.setAttributeBool('voltage0','agc_tracking_en',obj.AGCTrackingEnableChannel0,false);
            obj.setAttributeBool('voltage1','agc_tracking_en',obj.AGCTrackingEnableChannel1,false);

            obj.setAttributeBool('voltage0','bbdc_rejection_tracking_en',obj.BBDCRejectionTrackingEnableChannel0,false);
            obj.setAttributeBool('voltage1','bbdc_rejection_tracking_en',obj.BBDCRejectionTrackingEnableChannel1,false);

            obj.setAttributeBool('voltage0','hd_tracking_en',obj.HDTrackingEnableChannel0,false);
            obj.setAttributeBool('voltage1','hd_tracking_en',obj.HDTrackingEnableChannel1,false);

            obj.setAttributeBool('voltage0','quadrature_fic_tracking_en',obj.QuadratureFICTrackingEnableChannel0,false);
            obj.setAttributeBool('voltage1','quadrature_fic_tracking_en',obj.QuadratureFICTrackingEnableChannel1,false);

            obj.setAttributeBool('voltage0','quadrature_w_poly_tracking_en',obj.QuadratureWidebandPolyTrackingEnableChannel0,false);
            obj.setAttributeBool('voltage1','quadrature_w_poly_tracking_en',obj.QuadratureWidebandPolyTrackingEnableChannel1,false);

            obj.setAttributeBool('voltage0','rfdc_tracking_en',obj.RFDCTrackingEnableChannel0,false);
            obj.setAttributeBool('voltage1','rfdc_tracking_en',obj.RFDCTrackingEnableChannel1,false);
            
            obj.setAttributeBool('voltage0','rssi_tracking_en',obj.RSSITrackingEnableChannel0,false);
            obj.setAttributeBool('voltage1','rssi_tracking_en',obj.RSSITrackingEnableChannel1,false);
            
        end
        
    end
    
    methods (Static)
        
        function outname = AGCModeLookup(inname)
            switch inname
                case 'AutomaticGainCorrection'
                    outname = 'Gain_Correction_automatic_control';
                case 'ManualGainCorrection'
                    outname = 'Gain_Correction_manual_control';
                case 'AutomaticGainCompensation'
                    outname = 'Gain_Compensation_manual_control';
                case 'ManualGainCompensation'
                    outname = 'Gain_Correction_manual_control';                    
                otherwise
                    error('Unknown gain mode');
            end
        end
 
    end
    
end

