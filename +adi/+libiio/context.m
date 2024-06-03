classdef (Abstract) context < matlabshared.libiio.context & ...
        matlabshared.libiio.device
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
        function obj = context()
            % CONTEXT constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle})
        %% Context Methods
        function ctxPtr = iio_create_context(obj, ctxParamsPtr, uri)
        % iio_create_context_from_uri (const char *uri)
        %
        % Create a context from a URI description.
            if useCalllib(obj)
                ctxPtr = calllib(obj.libName, 'iio_create_context', ctxParamsPtr, uri);
            else
                ctxPtr = coder.opaque('struct iio_context*', 'NULL');
                if useCodegen(obj)
                    ctxPtr = coder.ceval('iio_create_context', ctxParamsPtr, obj.ntstr(uri));
                end
            end
        end

        function iio_context_destroy(obj)
        end

        function iio_context_get_version_major(obj)
        end

        function iio_context_get_version_minor(obj)
        end

        function iio_context_get_version_tag(obj)
        end

        function iio_context_get_xml(obj)
        end

        function iio_context_get_name(obj)
        end

        function iio_context_get_description(obj)
        end

        function iio_context_get_attrs_count(obj)
        end

        function iio_context_get_attr(obj)
        end

        function iio_context_find_attr(obj)
        end

        function iio_context_get_devices_count(obj)
        end

        function iio_context_get_device(obj)
        end

        function iio_context_find_device(obj)
        end

        function iio_context_set_timeout(obj)
        end

        function iio_context_get_params(obj)
        end

        function iio_context_set_data(obj)
        end

        function iio_context_get_data(obj)
        end
    end
end