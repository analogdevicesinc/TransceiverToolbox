classdef device < handle
    %% Internal Helper Functions
    methods (Static)
        %% Device Methods
        function ctxPtr = iio_device_get_context(devPtr)   
            ctxPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_context', devPtr);
        end

        % function id = iio_device_get_id(devPtr)
        %     id = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_id', devPtr);
        % end
        % 
        % function name = iio_device_get_name(devPtr)
        %     name = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_name', devPtr);
        % end
        % 
        % function label = iio_device_get_label(devPtr)
        %     label = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_label', devPtr);
        % end

        % function count = iio_device_get_channels_count(devPtr)
        %     count = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_channels_count', devPtr);
        % end
        % 
        % function count = iio_device_get_attrs_count(devPtr)
        %     count = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_attrs_count', devPtr);
        % end
        % 
        % function chanPtr = iio_device_get_channel(devPtr, index)
        %     chanPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_channel', devPtr, index);
        % end
        % 
        % function attrPtr = iio_device_get_attr(devPtr, index)
        %     attrPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_attr', devPtr, index);
        % end

        function chanPtr = iio_device_find_channel(dev, id, output)
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
            chanPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_find_channel', dev, id, output);
        end

        function [status, attrPtr] = iio_device_find_attr(devPtr, attr)
            attrPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_find_attr', devPtr, attr);
            status = -int32(isNull(attrPtr));
        end

        % function iio_device_set_data(devPtr, voidPtrToData)
        %     calllib(adi.libiio.device.getIIOLibName(), 'iio_device_set_data', devPtr, voidPtrToData);
        % end
        % 
        % function voidPtr = iio_device_get_data(devPtr)
        %     voidPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_data', devPtr);
        % end
        % 
        % function status = iio_device_set_trigger(devPtr, triggerPtr)
        %     triggerPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_set_trigger', devPtr, triggerPtr);
        %     status = cPtrCheck(obj,triggerPtr);
        % end
        % 
        % function triggerPtr = iio_device_get_trigger(devPtr)
        %     triggerPtr = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_get_trigger', devPtr);
        % end
        % 
        % function isTrigger = iio_device_is_trigger(devPtr)
        %     isTrigger = calllib(adi.libiio.device.getIIOLibName(), 'iio_device_is_trigger', devPtr);
        % end

        function libName = getIIOLibName()
            libName = 'libiio1';
        end
    end

    % Wrappers not present in iio.h of v1.0
    % Implemented for backwards compatibility
    methods (Static)
        function nBytes = iio_device_attr_write(devPtr,attr,src)
            [status, attrPtr] = adi.libiio.device.iio_device_find_attr(devPtr, attr);
            % cstatus(obj,status,['Attribute: ' attr ' not found']);
            nBytes = adi.libiio.attribute.iio_attr_write_string(attrPtr, src);
        end
    end
end