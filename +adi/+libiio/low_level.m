classdef (Abstract) low_level < handle% & matlabshared.libiio.device
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
        function obj = low_level()
            % CONTEXT constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle})
        %% Low-level Methods
        %{
        function iio_create_channels_mask(obj)
        end

        function iio_channels_mask_destroy(obj)
        end

        function iio_device_get_sample_size(obj)
        end

        function iio_channel_get_index(obj)
        end

        function iio_channel_get_data_format(obj)
        end

        function iio_channel_convert(obj, chanPtr, dst, src)
        end

        function iio_channel_convert_inverse(obj)
        end
        
        function iio_device_get_debug_attrs_count(obj)
        end

        function iio_device_get_debug_attr(obj)
        end
        %}

        function attr = iio_device_find_debug_attr(obj, devPtr, name)
        % iio_device_find_debug_attr (const struct iio_device *devPtr, const char *name)
        %
        % Get context from device pointer.
            if useCalllib(obj)
                attr = calllib(obj.libName, 'iio_device_find_debug_attr', devPtr, name);
            else
                if useCodegen(obj)
                    attr = coder.ceval('iio_device_find_debug_attr', devPtr, obj.ntstr(name));
                end
            end
        end

        %{
        function iio_device_reg_write(obj)
        end

        function iio_device_reg_read(obj)
        end

        function iio_attr_read_bool(obj)
        end

        function iio_attr_read_longlong(obj)
        end

        function iio_attr_read_double(obj)
        end

        function iio_attr_write_string(obj)
        end

        function iio_attr_write_bool(obj)
        end

        function iio_attr_write_longlong(obj)
        end

        function iio_attr_write_double(obj)
        end
        %}
    end
end