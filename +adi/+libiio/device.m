classdef (Abstract) device < adi.libiio.attribute% & matlabshared.libiio.device
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
    methods (Hidden, Access = {?handle}, Static)
        %% Device Methods
        function ctxPtr = iio_device_get_context(obj, devPtr)   
            ctxPtr = calllib(obj.libName, 'iio_device_get_context', devPtr);
        end

        function id = iio_device_get_id(obj, devPtr)
            id = calllib(obj.libName, 'iio_device_get_id', devPtr);
        end

        function name = iio_device_get_name(obj, devPtr)
            name = calllib(obj.libName, 'iio_device_get_name', devPtr);
        end

        function label = iio_device_get_label(obj, devPtr)
            label = calllib(obj.libName, 'iio_device_get_label', devPtr);
        end

        function count = iio_device_get_channels_count(obj, devPtr)
            count = calllib(obj.libName, 'iio_device_get_channels_count', devPtr);
        end

        function count = iio_device_get_attrs_count(obj, devPtr)
            count = calllib(obj.libName, 'iio_device_get_attrs_count', devPtr);
        end

        function chanPtr = iio_device_get_channel(obj, devPtr, index)
            chanPtr = calllib(obj.libName, 'iio_device_get_channel', devPtr, index);
        end

        function attrPtr = iio_device_get_attr(obj, devPtr, index)
            attrPtr = calllib(obj.libName, 'iio_device_get_attr', devPtr, index);
        end

        function chanPtr = iio_device_find_channel(obj, dev, id, output)
            % iio_device_find_channel(const struct iio_device *dev, const char *name, bool output)
            % 
            % Find channel by name or channel ID.
            %
            % Args:
            %   dev: A pointer to an iio_device structure
            %   ID: name A NULL-terminated string corresponding to the name
            %   name or the ID of the channel to search for
            %   output: True if the searched channel is output, False
            %   otherwise
            % 
            % Returns:
            %   On success, a pointer to an iio_channel structure. If the
            %   name or ID does not correspond to any known channel of the
            %   given device, NULL is returned.
            chanPtr = calllib(obj.libName, 'iio_device_find_channel', dev, id, output);
        end

        function [status, attrPtr] = iio_device_find_attr(obj, devPtr, attr)
            attrPtr = calllib(obj.libName, 'iio_device_find_attr', devPtr, attr);
            status = cPtrCheck(obj,attrPtr);
        end

        function iio_device_set_data(obj, devPtr, voidPtrToData)
            calllib(obj.libName, 'iio_device_set_data', devPtr, voidPtrToData);
        end

        function voidPtr = iio_device_get_data(obj, devPtr)
            voidPtr = calllib(obj.libName, 'iio_device_get_data', devPtr);
        end

        function status = iio_device_set_trigger(obj, devPtr, triggerPtr)
            triggerPtr = calllib(obj.libName, 'iio_device_set_trigger', devPtr, triggerPtr);
            status = cPtrCheck(obj,triggerPtr);
        end

        function triggerPtr = iio_device_get_trigger(obj, devPtr)
            triggerPtr = calllib(obj.libName, 'iio_device_get_trigger', devPtr);
        end

        function isTrigger = iio_device_is_trigger(obj, devPtr)
            isTrigger = calllib(obj.libName, 'iio_device_is_trigger', devPtr);
        end
    end

    % Wrappers not present in iio.h of v1.0
    % Implemented for backwards compatibility
    methods (Hidden, Access = {?handle}, Static)
        function nBytes = iio_device_attr_write(obj,devPtr,attr,src)
            [status, attrPtr] = adi.libiio.device.iio_device_find_attr(obj, devPtr, attr);
            cstatus(obj,status,['Attribute: ' attr ' not found']);
            nBytes = adi.libiio.attribute.iio_attr_write_string(obj, attrPtr, src);
        end
    end
end