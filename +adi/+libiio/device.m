classdef (Abstract) device < handle & matlabshared.libiio.device
    % matlabshared.libiio.contextV1p0 context class for base matlabshared.libiio.support
    %
    % This abstract system object defines the APIs necessary to use libIIO
    % V1.0 for MATLAB/Simulink simulation as well as codegen on a Linux
    % target
    
    % Copyright 2024 Analog Devices Inc.
    %#codegen
    
    %% Abstract Properties
    properties(Abstract, Hidden, Access = protected)
        libName
    end
    
    methods
        function obj = device()
            % CONTEXT constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle})
        %% Device Methods
        function ctxPtr = iio_device_get_context(obj, devPtr)
        % iio_device_get_context (const char *uri)
        %
        % Get context from device pointer.
            if useCalllib(obj)
                ctxPtr = calllib(obj.libName, 'iio_device_get_context', devPtr);
            else
                ctxPtr = coder.opaque('struct iio_context*', 'NULL');
                if useCodegen(obj)
                    ctxPtr = coder.ceval('iio_device_get_context', devPtr);
                end
            end
        end

        function iio_device_get_id(obj)
        end

        function iio_device_get_name(obj)
        end

        function iio_device_get_label(obj)
        end

        function iio_device_get_channels_count(obj)
        end

        function iio_device_get_attrs_count(obj)
        end

        function iio_device_get_channel(obj)
            % iio_device_get_channel@matlabshared.libiio.device(obj);
        end

        function iio_device_get_attr(obj)
        end

        function chanPtr = iio_device_find_channel(obj,dev,id,output)
        end

        function iio_device_find_attr(obj)
        end

        function iio_device_set_data(obj)
        end

        function iio_device_get_data(obj)
        end

        function iio_device_get_trigger(obj)
        end

        function iio_device_set_trigger(obj)
        end

        function iio_device_is_trigger(obj)
        end
    end
end