classdef Rx < adi.common.RxTx & adi.common.Attribute
    properties (Nontunable, Hidden)
        SamplesPerFrame
    end

    % properties(Nontunable, Hidden)
    %     kernelBuffersCount
    %     dataTypeStr
    %     DataTimeout
    %     devName
    % end
    % 
    % properties (Dependent,Hidden)
    %     channelCount
    % end

    properties
        LibIIOVersion = '1.0';
    end

    properties (Hidden, Nontunable, Access = protected)
        isOutput
    end

    properties (Hidden, Constant)
        ComplexData = true;
    end
    
    properties(Nontunable, Hidden)
        % Timeout = Inf;
        kernelBuffersCount = 2;
        dataTypeStr = 'int16';
        phyDevName = 'ad9361-phy';
        % iioDevPHY
    end

    properties(Nontunable, Hidden, Constant)
        Type = 'Rx';
    end

    properties (Nontunable, Hidden)
        devName = 'cf-ad9361-lpc';        
    end
    
    % methods (Hidden, Access = {?handle})
    %     function releaseChanBuffers(obj)
    %     end
    % 
    %     function configureChanBuffers(obj)
    %     end
    % end

    properties
        CenterFrequency = 2.4e9;
    end

    properties(Constant, Hidden, Logical)
        %EnableCyclicBuffers Enable Cyclic Buffers
        %   Not used for RX
        EnableCyclicBuffers = false;
    end
    
    methods
        % Check CenterFrequency
        function set.CenterFrequency(obj, value)
            %{
            if isa(obj,'adi.AD9363.Rx')
                validateattributes( value, { 'double','single' }, ...
                    { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>=',325e6,'<=',3.8e9}, ...
                    '', 'CenterFrequency');
            else
                validateattributes( value, { 'double','single' }, ...
                    { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>=',70e6,'<=',6e9}, ...
                    '', 'CenterFrequency');
            end
            %}
            obj.CenterFrequency = value;
            if obj.ConnectedToDevice
                id = sprintf('altvoltage%d',strcmp(obj.Type,'Tx'));
                obj.setAttributeLongLong(id,'frequency',value,true,4);
            end
        end
    end

    methods (Hidden, Access = protected)
                
        function setupInit(obj)
            obj.setAttributeLongLong('altvoltage0','frequency',obj.CenterFrequency,true,4);
        end
    end


    methods(Static)
        function Hello(value)
            disp(value);
        end
    end
end