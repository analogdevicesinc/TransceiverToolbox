classdef (Abstract) channel < handle & matlabshared.libiio.channel
    % matlabshared.libiio.channel_V1p0 channel class for base matlabshared.libiio.support
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
        function obj = channel()
            % CHANNEL constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle})
        function iio_channel_get_device(obj)
        end

        function iio_channel_get_id(obj)
        end
        
        function iio_channel_get_name(obj)
        end
        
        function iio_channel_is_output(obj)
        end
        
        function iio_channel_is_scan_element(obj)
        end
        
        function iio_channel_get_attrs_count(obj)
        end
        
        function iio_channel_get_attr(obj)
        end
        
        function iio_channel_find_attr(obj)
        end
        
        function iio_channel_enable(obj)
        end
        
        function iio_channel_disable(obj)
        end
        
        function iio_channel_is_enabled(obj)
        end
        
        function iio_channel_read(obj)
        end
        
        function iio_channel_write(obj)
        end        
        
        function iio_channel_set_data(obj)
        end        
        
        function iio_channel_get_data(obj)
        end
        
        function iio_channel_get_type(obj)
        end
        
        function iio_channel_get_modifier(obj)
        end

        function status = iio_channel_attr_write_longlong(obj,chanPtr,attr,value)
            % This function is a wrapper. Its name is chosen to match the
            % corresponding version in < v1.0 to support compatibility
            % through Compat.m.

            attrPtr = calllib(obj.libName, 'iio_channel_find_attr', chanPtr, attr);
            status = calllib(obj.libName, 'iio_attr_write_longlong', attrPtr,value);
        end

        function iio_channel_attr_read_longlong(obj)
            % This function is a wrapper. It calls iio_channel_read() for
            % longlong input. Its name is chosen to match the
            % corresponding version in < v1.0 to support compatibility
            % through Compat.m.
            iio_channel_read(obj);
        end
    end
end