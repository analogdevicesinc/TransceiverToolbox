classdef (Abstract) channel < adi.libiio.attribute
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
    methods (Hidden, Access = {?handle}, Static)
        function [status, attrPtr] = iio_channel_find_attr(obj,chanPtr,attr)
            attrPtr = calllib(obj.libName, 'iio_channel_find_attr', chanPtr, attr);
            status = cPtrCheck(obj,attrPtr);
        end

        function [status, value] = iio_channel_attr_read_bool(obj,chanPtr,attr)
            [status, attrPtr] = adi.libiio.channel.iio_channel_find_attr(obj,chanPtr,attr);
            cstatus(obj,status,['Attribute: ' attr ' not found']);            
            [status, value] = adi.libiio.attribute.iio_attr_read_bool(obj,attrPtr);
        end

        function [status, value] = iio_channel_attr_read_longlong(obj,chanPtr,attr)
            [status, attrPtr] = adi.libiio.channel.iio_channel_find_attr(obj,chanPtr,attr);
            cstatus(obj,status,['Attribute: ' attr ' not found']);            
            [status, value] = adi.libiio.attribute.iio_attr_read_longlong(obj,attrPtr);
        end

        function status = iio_channel_attr_write_bool(obj,chanPtr,attr,value)
            [status, attrPtr] = adi.libiio.channel.iio_channel_find_attr(obj,chanPtr,attr);
            cstatus(obj,status,['Attribute: ' attr ' not found']);
            status = adi.libiio.attribute.iio_attr_write_bool(attrPtr, value);
        end

        function status = iio_channel_attr_write_longlong(obj,chanPtr,attr,value)
            [status, attrPtr] = adi.libiio.channel.iio_channel_find_attr(obj,chanPtr,attr);
            cstatus(obj,status,['Attribute: ' attr ' not found']);
            status = adi.libiio.attribute.iio_attr_write_longlong(attrPtr, value);
        end

        function nBytes = iio_channel_attr_write(obj, chanPtr, attr, src)
            [status, attrPtr] = adi.libiio.channel.iio_channel_find_attr(obj,chanPtr,attr);
            cstatus(obj,status,['Attribute: ' attr ' not found']);
            nBytes = adi.libiio.attribute.iio_attr_write_string(attrPtr, src);
        end
    end
end