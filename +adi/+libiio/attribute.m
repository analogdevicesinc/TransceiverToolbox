classdef attribute < handle
    % methods
    %     function obj = attribute()
    %         % CHANNEL constructor method for matlabshared.libiio.context
    %         %
    %         % Returns the matlabshared.libiio.context object
    %         coder.allowpcode('plain');
    %     end
    % end
    
    %% Internal Helper Functions
    methods (Static)
        function [status, value] = iio_attr_read_bool(attrPtr)
            valPtr = libpointer('bool', 0);
            status = calllib(adi.libiio.attribute.getIIOLibName(), 'iio_attr_read_bool', attrPtr, valPtr);
            if ~status
                value = valPtr.value;
            end
        end

        function [status, value] = iio_attr_read_longlong(attrPtr)
            valPtr = libpointer('int64Ptr', 0);
            status = calllib(adi.libiio.attribute.getIIOLibName(), 'iio_attr_read_longlong', attrPtr, valPtr);
            if ~status
                value = valPtr.value;
            end
        end

        function [status, value] = iio_attr_read_double(attrPtr)
            valPtr = libpointer('double', 0);
            status = calllib(adi.libiio.attribute.getIIOLibName(), 'iio_attr_read_double', attrPtr, valPtr);
            if ~status
                value = valPtr.value;
            end
        end

        function status = iio_attr_write_string(attrPtr, value)
            status = calllib(adi.libiio.attribute.getIIOLibName(), 'iio_attr_write_string', attrPtr, value);
        end

        function status = iio_attr_write_bool(attrPtr, value)
            status = calllib(adi.libiio.attribute.getIIOLibName(), 'iio_attr_write_bool', attrPtr, value);
        end

        function status = iio_attr_write_longlong(attrPtr, value)
            status = calllib(adi.libiio.attribute.getIIOLibName(), 'iio_attr_write_longlong', attrPtr, value);
        end

        function status = iio_attr_write_double(attrPtr, value)
            status = calllib(adi.libiio.attribute.getIIOLibName(), 'iio_attr_write_double', attrPtr, value);
        end

        function libName = getIIOLibName()
            libName = 'libiio1';
        end
    end
end