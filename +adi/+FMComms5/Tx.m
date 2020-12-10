classdef Tx < adi.FMComms5.Base & adi.AD9361.Tx
    % adi.FMComms5.Tx Transmit data from the FMComms5
    %   The adi.FMComms5.Tx System object is a signal sink that can tranmsit
    %   complex data from the FMComms5.
    %
    %   tx = adi.FMComms5.Tx;
    %   tx = adi.FMComms5.Tx('uri','192.168.2.1');
    %
    %   <a href="https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/eval-ad-fmcomms5-ebz.html">Product Page</a>
    
    properties
        %CenterFrequencyChipB Center Frequency
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChipB = 2.4e9;
        %RFBandwidthChipB RF Bandwidth
        %   RF Bandwidth of front-end analog filter in Hz, specified as a
        %   scalar from 200 kHz to 56 MHz.
        RFBandwidthChipB = 3e6;
    end
    
    properties
        %AttenuationChannel0ChipB Attenuation Channel 0 ChipB
        %   Attentuation specified as a scalar from -89.75 to 0 dB with a
        %   resolution of 0.25 dB.
        AttenuationChannel0ChipB = -30;
        %AttenuationChannel1ChipB Attenuation Channel 1 ChipB
        %   Attentuation specified as a scalar from -89.75 to 0 dB with a
        %   resolution of 0.25 dB.
        AttenuationChannel1ChipB = -30;
    end
    
    properties (Hidden, Nontunable, Access = protected)
        isOutputChipB = true;
    end
    
    properties(Nontunable, Hidden, Constant)
        TypeChipB = 'Tx';
    end
    
    properties (Nontunable, Hidden)
        devNameChipB = 'cf-ad9361-dds-core-B';
    end
    
    properties
        %RFPortSelect RF Port Select
        %    'A'
        %    'B'
        RFPortSelectChipB = 'A';
    end
    
    properties(Constant, Hidden)
        RFPortSelectSetChipB = matlab.system.StringSet({'A', 'B'});
    end     
    
    properties(Hidden)
        iioDevChipB;
    end
    
    properties(Nontunable, Hidden, Constant)
        channel_names_runtime = {'voltage0','voltage1','voltage2','voltage3',...
            'voltage4','voltage5','voltage6','voltage7'};
        phyDevNameChipB = 'ad9361-phy-B';
    end
    
    methods
        %% Constructor
        function obj = Tx(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.FMComms5.Base(varargin{:});
            obj.EnableChipB = true;
            obj.channel_names = obj.channel_names_runtime;
        end
        % Check RFPortSelect
        function set.RFPortSelectChipB(obj, value)
            obj.RFPortSelect = value;
            if obj.ConnectedToDevice
                obj.setAttributeRAW('voltage0','rf_port_select',value,false,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check Attentuation
        function set.AttenuationChannel0ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -89.75,'<=', 0}, ...
                '', 'Attenuation');
            assert(mod(value,1/4)==0, 'Attentuation must be a multiple of 0.25');
            obj.AttenuationChannel0ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeLongLong(id,'hardwaregain',value,true,0,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check Attentuation
        function set.AttenuationChannel1ChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -89.75,'<=', 0}, ...
                '', 'Attenuation');
            assert(mod(value,1/4)==0, 'Attentuation must be a multiple of 0.25');
            obj.AttenuationChannel1ChipB = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeLongLong(id,'hardwaregain',value,true,0,obj.iioDevPHYChipB); %#ok<MCSUP>
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
                obj.setAttributeLongLong(id,'frequency',value,true,8,obj.iioDevPHYChipB); %#ok<MCSUP>
            end
        end
        % Check RFBandwidth
        function set.RFBandwidthChipB(obj, value)            
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>=',200e3,'<=',40e6}, ...
                '', 'RFBandwidth');                
            obj.RFBandwidthChipB = value;
            if obj.ConnectedToDevice && ~obj.EnableCustomFilter
                id = 'voltage0';
                obj.setAttributeLongLong(id,'rf_bandwidth',value,strcmp(obj.Type,'Tx'),30,obj.iioDevPHYChipB); %#ok<MCSUP>
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
        function setupInit(obj)
            obj.iioDevChipB = getDev(obj, obj.devNameChipB);
            
            % Write all attributes to device once connected through set
            % methods
            setupLibad9361(obj);
            obj.iioDevPHYChipB = getDev(obj,obj.phyDevNameChipB);
            % Do writes directly to hardware without using set methods.
            % This is required sine Simulink support doesn't support
            % modification to nontunable variables at SetupImpl
            id = 'altvoltage1';
            obj.setAttributeLongLong(id,'frequency',obj.CenterFrequency,true,8);
            obj.setAttributeLongLong(id,'frequency',obj.CenterFrequencyChipB,true,8,obj.iioDevPHYChipB);
            if  ~obj.EnableCustomFilter
                if libisloaded('libad9361')
                    calllib('libad9361','ad9361_set_bb_rate',obj.iioDevPHY,int32(obj.SamplingRate));
                else
                    obj.setAttributeLongLong('voltage0','sampling_frequency',obj.SamplingRate,true,4);
                    obj.setAttributeLongLong('voltage0','rf_bandwidth',obj.RFBandwidth,strcmp(obj.Type,'Tx'));
                end
            else
                writeFilterFile(obj);
            end
            
            if  ~obj.EnableCustomFilterChipB
                if libisloaded('libad9361')
                    calllib('libad9361','ad9361_set_bb_rate',obj.iioDevPHYChipB,int32(obj.SamplingRate));
                else
                    obj.setAttributeLongLong('voltage0','sampling_frequency',obj.SamplingRate,true,4,obj.iioDevPHYChipB);
                    obj.setAttributeLongLong('voltage0','rf_bandwidth',obj.RFBandwidthChipB,strcmp(obj.Type,'Tx'),[],obj.iioDevPHYChipB);
                end
            else
                writeFilterFileFMComms5ChipB(obj);
            end
            
            obj.setAttributeLongLong('voltage0','hardwaregain',obj.AttenuationChannel0,true);
            if (obj.channelCount>2)
                obj.setAttributeLongLong('voltage1','hardwaregain',obj.AttenuationChannel1,true);
                if (obj.channelCount>4)
                    obj.setAttributeLongLong('voltage0','hardwaregain',obj.AttenuationChannel0ChipB,true,0,obj.iioDevPHYChipB);
                    if (obj.channelCount>6)
                        obj.setAttributeLongLong('voltage1','hardwaregain',obj.AttenuationChannel1ChipB,true,0,obj.iioDevPHYChipB);
                    end
                end
            end
            obj.ToggleDDS(strcmp(obj.DataSource,'DDS'));
            obj.ToggleDDSChipB(strcmp(obj.DataSource,'DDS'));
            if strcmp(obj.DataSource,'DDS')
                obj.DDSUpdate();          
                obj.DDSUpdateChipB();
            end
            obj.setAttributeRAW('voltage0','rf_port_select',obj.RFPortSelect,true);
            obj.setAttributeRAW('voltage0','rf_port_select',obj.RFPortSelectChipB,true,obj.iioDevPHYChipB);
        end
    end
end