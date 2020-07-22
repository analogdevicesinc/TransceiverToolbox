classdef Tx < adi.ADRV9002.Base & adi.common.Tx
    % adi.ADRV9002.Tx Transmit data from the ADRV9002 transceiver
    %   The adi.ADRV9002.Tx System object is a signal sink that can tranmsit
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
        %   Attentuation specified as a scalar from -89.75 to 0 dB with a
        %   resolution of 0.25 dB.
        AttenuationChannel0 = -30;
        %AttenuationChannel1 Attenuation Channel 1
        %   Attentuation specified as a scalar from -89.75 to 0 dB with a
        %   resolution of 0.25 dB.
        AttenuationChannel1 = -30;
    end

    properties(Constant, Hidden)
        ENSMModeChannel0Set = matlab.system.StringSet({ ...
            'calibrated','primed','rf_enabled'});
        ENSMModeChannel1Set = matlab.system.StringSet({ ...
            'calibrated','primed','rf_enabled'});
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
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -89.75,'<=', 0}, ...
                '', 'Attenuation');
            assert(mod(value,1/4)==0, 'Attentuation must be a multiple of 0.25');
            obj.AttenuationChannel0 = value;
            if obj.ConnectedToDevice
                id = 'voltage0';
                obj.setAttributeLongLong(id,'hardwaregain',value,true);
            end
        end
        % Check AttentuationChannel1
        function set.AttenuationChannel1(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'scalar', 'finite', 'nonnan', 'nonempty', '>=', -89.75,'<=', 0}, ...
                '', 'Attenuation');
            assert(mod(value,1/4)==0, 'Attentuation must be a multiple of 0.25');
            obj.AttenuationChannel1 = value;
            if obj.ConnectedToDevice
                id = 'voltage1';
                obj.setAttributeLongLong(id,'hardwaregain',value,true);
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
        
    end
        
    %% API Functions
    methods (Hidden, Access = protected)
                
        function setupInit(obj)
            % Write all attributes to device once connected through set
            % methods
            % Do writes directly to hardware without using set methods.
            % This is required sine Simulink support doesn't support
            % modification to nontunable variables at SetupImpl
            
%             if obj.EnableCustomProfile
%                 writeProfileFile(obj);
%             end
            
            obj.setAttributeLongLong('altvoltage2','TX1_LO_frequency',obj.CenterFrequencyChannel0 ,true);
            obj.setAttributeLongLong('altvoltage3','TX2_LO_frequency',obj.CenterFrequencyChannel1 ,true);
            obj.setAttributeLongLong('voltage0','hardwaregain',obj.AttenuationChannel0,true);
            obj.setAttributeLongLong('voltage1','hardwaregain',obj.AttenuationChannel1,true);
            
            obj.ToggleDDS(strcmp(obj.DataSource,'DDS'));
            if strcmp(obj.DataSource,'DDS')
                obj.DDSUpdate();
            end
        end
        
    end
    
end

