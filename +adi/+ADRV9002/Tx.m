classdef Tx < adi.ADRV9002.Base & adi.common.Tx
    % adi.ADRV9002.Tx Transmit data from the ADRV9002 transceiver
    %   The adi.ADRV9002.Tx System object is a signal sink that can transmit
    %   complex data from the ADRV9002.
    %
    %   tx = adi.ADRV9002.Tx;
    %   tx = adi.ADRV9002.Tx('uri','192.168.2.1');
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
        
        %AttenuationChannel0 Attenuation Channel 0
        %   Attenuation specified as a scalar from -89.75 to 0 dB with a
        %   resolution of 0.25 dB.
        AttenuationChannel0 = -30;
        %AttenuationChannel1 Attenuation Channel 1
        %   Attenuation specified as a scalar from -89.75 to 0 dB with a
        %   resolution of 0.25 dB.
        AttenuationChannel1 = -30;
        
        %AttenuationControlModeChannel0 Attenuation Control Mode Channel 0
        %   Control attenuation through:
        %   - bypass
        %   - spi
        %   - pin
        AttenuationControlModeChannel0 = 'spi';
        %AttenuationControlModeChannel0 Attenuation Control Mode Channel 1
        %   Control attenuation through:
        %   - bypass
        %   - spi
        %   - pin
        AttenuationControlModeChannel1 = 'spi';
        
        %PortEnableControlChannel0 Port Enable Control Channel 0
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        PortEnableControlChannel0 = 'spi';
        %PortEnableControlChannel1 Port Enable Control Channel 1
        %   specified as one of the following:
        %   'spi'
        %   'pin'
        PortEnableControlChannel1 = 'spi';
    end

    properties (Logical) % ADVANCED
        %ClosedLoopTrackingChannel0 Closed Loop Tracking Channel 0
        ClosedLoopTrackingChannel0 = true;
        %ClosedLoopTrackingChannel1 Closed Loop Tracking Channel 1
        ClosedLoopTrackingChannel1 = true;
        
        %LOLeakageTrackingChannel0 LO Leakage Tracking Channel 0
        LOLeakageTrackingChannel0 = true;
        %LOLeakageTrackingChannel1 LO Leakage Tracking Channel 1
        LOLeakageTrackingChannel1 = true;
        
        %LoopbackDelayTrackingChannel0 Loopback Delay Tracking Channel 0
        LoopbackDelayTrackingChannel0 = false;
        %LoopbackDelayTrackingChannel1 Loopback Delay Tracking Channel 1
        LoopbackDelayTrackingChannel1 = false;
        
        %PACorrectionTrackingChannel0 PA Correction Tracking Channel 0
        PACorrectionTrackingChannel0 = false;
        %PACorrectionTrackingChannel1 PA Correction Tracking Channel 1
        PACorrectionTrackingChannel1 = false;
        
        %QuadratureTrackingChannel0 Quadrature Tracking Channel 0
        %   Quadrature Error Correction on the fly tracking
        %   calibration for channel 0
        QuadratureTrackingChannel0 = true;
        %QuadratureTrackingEnableChannel1 Quadrature Tracking Channel 1
        %   Quadrature Error Correction on the fly tracking
        %   calibration for channel 1
        QuadratureTrackingChannel1 = true;
        
%         %PowerdownChannel0 Powerdown Channel 0
%         PowerdownChannel0 = false;
%         
%         %PowerdownChannel0 Powerdown Channel 1
%         PowerdownChannel1 = false;
    end
    
    properties(Constant, Hidden)
        ENSMModeChannel0Set = matlab.system.StringSet({ ...
            'calibrated','primed','rf_enabled'});
        ENSMModeChannel1Set = matlab.system.StringSet({ ...
            'calibrated','primed','rf_enabled'});
        
        PortEnableControlChannel0Set = matlab.system.StringSet({ ...
            'pin','spi'});
        PortEnableControlChannel1Set = matlab.system.StringSet({ ...
            'pin','spi'});
        
        AttenuationControlModeChannel0Set = matlab.system.StringSet({ ...
            'bypass','pin','spi'});
        AttenuationControlModeChannel1Set = matlab.system.StringSet({ ...
            'bypass','pin','spi'});
        
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
        devName = 'axi-adrv9002-tx-lpc';
    end
    
    methods
        %% Constructor
        function obj = Tx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.ADRV9002.Base(varargin{:});
        end
        % Check AttentuationChannel0
        function set.AttenuationChannel0(obj, value)
            obj.AttenuationChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeDouble(id,'hardwaregain',value,true);
            end
        end
        % Check AttentuationChannel1
        function set.AttenuationChannel1(obj, value)
            obj.AttenuationChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeDouble(id,'hardwaregain',value,true);
            end
        end
        % Check ENSMModeChannel0
        function set.ENSMModeChannel0(obj, value)
            obj.ENSMModeChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'ensm_mode',value,true);
            end
        end
        % Check ENSMModeChannel1
        function set.ENSMModeChannel1(obj, value)
            obj.ENSMModeChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'ensm_mode',value,true);
            end
        end
        
        % Check AttenuationControlModeChannel0
        function set.AttenuationControlModeChannel0(obj, value)
            obj.AttenuationControlModeChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'atten_control_mode',value,true);
            end
        end
        % Check AttenuationControlModeChannel1
        function set.AttenuationControlModeChannel1(obj, value)
            obj.AttenuationControlModeChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'atten_control_mode',value,true);
            end
        end
        
        % Check PortEnableControlChannel0
        function set.PortEnableControlChannel0(obj, value)
            obj.PortEnableControlChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeRAW(id,'port_en_mode',value,true);
            end
        end
        % Check PortEnableControlChannel1
        function set.PortEnableControlChannel1(obj, value)
            obj.PortEnableControlChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeRAW(id,'port_en_mode',value,true);
            end
        end
        
        % Check ClosedLoopTrackingChannel0
        function set.ClosedLoopTrackingChannel0(obj, value)
            obj.ClosedLoopTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'close_loop_gain_tracking_en',value,true);
            end
        end
        % Check ClosedLoopTrackingChannel1
        function set.ClosedLoopTrackingChannel1(obj, value)
            obj.ClosedLoopTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'close_loop_gain_tracking_en',value,true);
            end
        end
        
        % Check LOLeakageTrackingChannel0
        function set.LOLeakageTrackingChannel0(obj, value)
            obj.LOLeakageTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'lo_leakage_tracking_en',value,true);
            end
        end
        % Check LOLeakageTrackingChannel1
        function set.LOLeakageTrackingChannel1(obj, value)
            obj.LOLeakageTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'lo_leakage_tracking_en',value,true);
            end
        end
        
        % Check LoopbackDelayTrackingChannel0
        function set.LoopbackDelayTrackingChannel0(obj, value)
            obj.LoopbackDelayTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'loopback_delay_tracking_en',value,true);
            end
        end
        % Check LoopbackDelayTrackingChannel1
        function set.LoopbackDelayTrackingChannel1(obj, value)
            obj.LoopbackDelayTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'loopback_delay_tracking_en',value,true);
            end
        end
        
        % Check PACorrectionTrackingChannel0
        function set.PACorrectionTrackingChannel0(obj, value)
            obj.PACorrectionTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'pa_correction_tracking_en',value,true);
            end
        end
        % Check PACorrectionTrackingChannel1
        function set.PACorrectionTrackingChannel1(obj, value)
            obj.PACorrectionTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'pa_correction_tracking_en',value,true);
            end
        end
        
        % Check PACorrectionTrackingChannel0
        function set.QuadratureTrackingChannel0(obj, value)
            obj.QuadratureTrackingChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,true);
            end
        end
        % Check QuadratureTrackingChannel1
        function set.QuadratureTrackingChannel1(obj, value)
            obj.QuadratureTrackingChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeBool(id,'quadrature_tracking_en',value,true);
            end
        end
        
%         % Check PowerdownChannel0
%         function set.PowerdownChannel0(obj, value)
%             obj.PowerdownChannel0 = value;
%             if obj.ConnectedToDevice
%                 id = 'voltage0';
%                 obj.setAttributeBool(id,'en',value,true);
%             end
%         end
%         % Check PowerdownChannel1
%         function set.PowerdownChannel1(obj, value)
%             obj.PowerdownChannel1 = value;
%             if obj.ConnectedToDevice
%                 id = 'voltage1';
%                 obj.setAttributeBool(id,'en',value,true);
%             end
%         end
        
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
            if obj.checkIfDevExists('axi-adrv9002-tx2-lpc')
                % This naming is a bit strange due to the internal indexing
                % but duplicated channel names make it work
                obj.channel_names = ...
                    {'voltage0','voltage1',...
                    'voltage0','voltage1'};
                obj.dds_channel_names = ...
                    {'altvoltage0',...
                    'altvoltage1',...
                    'altvoltage2',...
                    'altvoltage3'};
                % Update
                if numel(obj.EnabledChannels)>1
                    error(['Driver is in split DMA mode (two separate DMAs axi-adrv9002-tx-lpc and axi-adrv9002-tx2-lpc)',newline,...
                        'Only available options for EnabledChannels are:',newline,...
                        '    [1],[2]']);
                end
                if any(obj.EnabledChannels==2)
                    obj.devName = 'axi-adrv9002-tx2-lpc';
                    obj.iioDev = obj.getDev(obj.devName);
                end
            else
                obj.channel_names = ...
                    {'voltage0','voltage1','voltage2','voltage3'};
                obj.dds_channel_names = ...
                    {'altvoltage0',...
                    'altvoltage1',...
                    'altvoltage2',...
                    'altvoltage3',...
                    'altvoltage4',...
                    'altvoltage5',...
                    'altvoltage6',...
                    'altvoltage7'};
            end
            
            if obj.EnableCustomProfile
                writeProfileFile(obj);
            end

            % Check if channel exists with new profile
            phydev = getDev(obj, obj.phyDevName);
            chanPtr = iio_device_find_channel(obj, phydev, 'voltage1', true);
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

            if obj.newAPI
                name1 = 'frequency';
                name2 = 'frequency';
            else
                name1 = 'TX1_LO_frequency';
                name2 = 'TX2_LO_frequency';
            end            
            obj.setAttributeLongLong('altvoltage2',name1,obj.CenterFrequencyChannel0 ,true);
            if channelsAval == 2
                obj.setAttributeLongLong('altvoltage3',name2,obj.CenterFrequencyChannel1 ,true);
            end

            obj.setAttributeRAW('voltage0','ensm_mode',obj.ENSMModeChannel0,true);
            if channelsAval == 2
                obj.setAttributeRAW('voltage1','ensm_mode',obj.ENSMModeChannel1,true);
            end

            % Controls
            obj.setAttributeRAW('voltage0','port_en_mode',obj.PortEnableControlChannel0,true);
            if channelsAval == 2
                obj.setAttributeRAW('voltage1','port_en_mode',obj.PortEnableControlChannel1,true);
            end
            
            obj.setAttributeRAW('voltage0','atten_control_mode',obj.AttenuationControlModeChannel0,true);
            if channelsAval == 2
                obj.setAttributeRAW('voltage1','atten_control_mode',obj.AttenuationControlModeChannel1,true);
            end

            % Gains
            obj.setAttributeDouble('voltage0','hardwaregain',obj.AttenuationChannel0,true);
            if channelsAval == 2
                obj.setAttributeDouble('voltage1','hardwaregain',obj.AttenuationChannel1,true);
            end
                      
            % Calibrations
            close_loop_gain_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','close_loop_gain_tracking_en',true);
            if (close_loop_gain_tracking_en_voltage0_state ~= obj.ClosedLoopTrackingChannel0)
                obj.setAttributeBool('voltage0','close_loop_gain_tracking_en',obj.ClosedLoopTrackingChannel0,true);
            end
            if channelsAval == 2
                close_loop_gain_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','close_loop_gain_tracking_en',true);
                if (close_loop_gain_tracking_en_voltage1_state ~= obj.ClosedLoopTrackingChannel1)
                    obj.setAttributeBool('voltage1','close_loop_gain_tracking_en',obj.ClosedLoopTrackingChannel1,true);
                end
            end

            lo_leakage_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','lo_leakage_tracking_en',true);
            if (lo_leakage_tracking_en_voltage0_state ~= obj.LOLeakageTrackingChannel0)
                obj.setAttributeBool('voltage0','lo_leakage_tracking_en',obj.LOLeakageTrackingChannel0,true);
            end
            if channelsAval == 2
                lo_leakage_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','lo_leakage_tracking_en',true);
                if (lo_leakage_tracking_en_voltage1_state ~= obj.LOLeakageTrackingChannel1)
                    obj.setAttributeBool('voltage1','lo_leakage_tracking_en',obj.LOLeakageTrackingChannel1,true);
                end
            end

            loopback_delay_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','loopback_delay_tracking_en',true);
            if (loopback_delay_tracking_en_voltage0_state ~= obj.LoopbackDelayTrackingChannel0)
                obj.setAttributeBool('voltage0','loopback_delay_tracking_en',obj.LoopbackDelayTrackingChannel0,true);
            end
            if channelsAval == 2
                loopback_delay_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','loopback_delay_tracking_en',true);
                if (loopback_delay_tracking_en_voltage1_state ~= obj.LoopbackDelayTrackingChannel1)
                    obj.setAttributeBool('voltage1','loopback_delay_tracking_en',obj.LoopbackDelayTrackingChannel1,true);
                end
            end
            
            pa_correction_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','pa_correction_tracking_en',true);
            if (pa_correction_tracking_en_voltage0_state ~= obj.PACorrectionTrackingChannel0)
                obj.setAttributeBool('voltage0','pa_correction_tracking_en',obj.PACorrectionTrackingChannel0,true);
            end
            if channelsAval == 2
                pa_correction_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','pa_correction_tracking_en',true);
                if (pa_correction_tracking_en_voltage1_state ~= obj.PACorrectionTrackingChannel1)
                    obj.setAttributeBool('voltage1','pa_correction_tracking_en',obj.PACorrectionTrackingChannel1,true);
                end
            end
            
            quadrature_tracking_en_voltage0_state = obj.getAttributeBool('voltage0','quadrature_tracking_en',true);
            if (quadrature_tracking_en_voltage0_state ~= obj.QuadratureTrackingChannel0)
                obj.setAttributeBool('voltage0','quadrature_tracking_en',obj.QuadratureTrackingChannel0,true);
            end
            if channelsAval == 2
                quadrature_tracking_en_voltage1_state = obj.getAttributeBool('voltage1','quadrature_tracking_en',true);
                if (quadrature_tracking_en_voltage1_state ~= obj.QuadratureTrackingChannel1)
                    obj.setAttributeBool('voltage1','quadrature_tracking_en',obj.QuadratureTrackingChannel1,true);
                end
            end
            
%             obj.setAttributeBool('voltage0','en',obj.PowerdownChannel0,true);
%             obj.setAttributeBool('voltage1','en',obj.PowerdownChannel1,true);
            
            obj.ToggleDDS(strcmp(obj.DataSource,'DDS'));
            if strcmp(obj.DataSource,'DDS')
                obj.DDSUpdate();
            end
        end
        
    end
    
end

