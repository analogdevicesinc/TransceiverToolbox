classdef channel < handle
    methods
        function obj = channel()
            % CHANNEL constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Static)
        function attrPtr = iio_channel_find_attr(chanPtr,attr)
            attrPtr = calllib(adi.libiio.channel.getIIOLibName(), 'iio_channel_find_attr', chanPtr, attr);
        end

        function [status, value] = iio_channel_attr_read_bool(chanPtr,attr)
            attrPtr = adi.libiio.channel.iio_channel_find_attr(chanPtr,attr);
            % cstatus(status,['Attribute: ' attr ' not found']);            
            [status, value] = adi.libiio.attribute.iio_attr_read_bool(attrPtr);
        end

        function [status, value] = iio_channel_attr_read_longlong(chanPtr,attr)
            attrPtr = adi.libiio.channel.iio_channel_find_attr(chanPtr,attr);
            % cstatus(status,['Attribute: ' attr ' not found']);            
            [status, value] = adi.libiio.attribute.iio_attr_read_longlong(attrPtr);
        end

        function status = iio_channel_attr_write_bool(chanPtr,attr,value)
            attrPtr = adi.libiio.channel.iio_channel_find_attr(chanPtr,attr);
            % cstatus(status,['Attribute: ' attr ' not found']);
            status = adi.libiio.attribute.iio_attr_write_bool(attrPtr, value);
        end

        function status = iio_channel_attr_write_longlong(chanPtr,attr,value)
            attrPtr = adi.libiio.channel.iio_channel_find_attr(chanPtr,attr);
            % cstatus(status,['Attribute: ' attr ' not found']);
            status = adi.libiio.attribute.iio_attr_write_longlong(attrPtr, value);
        end

        function nBytes = iio_channel_attr_write(chanPtr, attr, src)
            attrPtr = adi.libiio.channel.iio_channel_find_attr(chanPtr,attr);
            % cstatus(status,['Attribute: ' attr ' not found']);
            nBytes = adi.libiio.attribute.iio_attr_write_string(attrPtr, src);
        end

        function libName = getIIOLibName()
            libName = 'libiio1';
        end
    end
end