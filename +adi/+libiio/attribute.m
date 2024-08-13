classdef (Abstract) attribute < handle
    % matlabshared.libiio.channel_V1p0 channel class for base matlabshared.libiio.support
    %
    % This abstract system object defines the APIs necessary to use libIIO
    % V1.0 for MATLAB/Simulink simulation as well as codegen on a Linux
    % target
    
    % Copyright 2024 Analog Devices Inc.
    %#codegen
    
    %% Abstract Properties
    properties(Hidden, Access = protected)
        libName = 'libiio1'
    end

    methods
        function obj = attribute()
            % CHANNEL constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle}, Static)
        function [status, value] = iio_attr_read_bool(obj,attrPtr)
            valPtr = libpointer('bool', 0);
            status = calllib(obj.libName, 'iio_attr_read_bool', attrPtr, valPtr);
            if ~status
                value = valPtr.value;
            end
        end

        function [status, value] = iio_attr_read_longlong(obj,attrPtr)
            valPtr = libpointer('int64Ptr', 0);
            status = calllib(obj.libName, 'iio_attr_read_longlong', attrPtr, valPtr);
            if ~status
                value = valPtr.value;
            end
        end

        function [status, value] = iio_attr_read_double(obj,attrPtr)
            valPtr = libpointer('double', 0);
            status = calllib(obj.libName, 'iio_attr_read_double', attrPtr, valPtr);
            if ~status
                value = valPtr.value;
            end
        end

        function status = iio_attr_write_string(attrPtr, value)
            status = calllib(obj.libName, 'iio_attr_write_bool', attrPtr, value);
        end

        function status = iio_attr_write_bool(attrPtr, value)
            status = calllib(obj.libName, 'iio_attr_write_bool', attrPtr, value);
        end

        function status = iio_attr_write_longlong(attrPtr, value)
            status = calllib(obj.libName, 'iio_attr_write_longlong', attrPtr, value);
        end

        function status = iio_attr_write_double(attrPtr, value)
            status = calllib(obj.libName, 'iio_attr_write_double', attrPtr, value);
        end
    end
end