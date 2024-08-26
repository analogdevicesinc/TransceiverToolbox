classdef device < handle
    methods (Static)
        %% device methods
        function ctxPtr = iio_device_get_context(devPtr)
            % Retrieve a pointer to the iio_context structure
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            % 
            % Returns:
            %   A pointer to an iio_context structure
            %
            % libiio function: iio_device_get_context
            
            if coder.target('MATLAB')
                ctxPtr = adi.libiio.device.calllibADI('iio_device_get_context', devPtr);
            else
                ctxPtr = coder.opaque('struct iio_context*', 'NULL');
                ctxPtr = coder.ceval('iio_device_get_context', devPtr);
            end
        end

        function id = iio_device_get_id(devPtr)
            % Retrieve the device ID (e.g. iio:device0)
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            % 
            % Returns:
            %   A pointer to a static NULL-terminated string
            %
            % libiio function: iio_device_get_id
            
            if coder.target('MATLAB')
                id = adi.libiio.device.calllibADI('iio_device_get_id', devPtr);
            else
                id = coder.ceval('iio_device_get_id', devPtr);
            end
        end

        function name = iio_device_get_name(devPtr)
            % Retrieve the device name (e.g. xadc)
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            % 
            % Returns:
            %   A pointer to a static NULL-terminated string
            %
            % NOTE: 
            %   If the device has no name, NULL is returned
            %
            % libiio function: iio_device_get_name
            
            if coder.target('MATLAB')
                name = adi.libiio.device.calllibADI('iio_device_get_name', devPtr);
            else
                name = coder.ceval('iio_device_get_name', devPtr);
            end
        end

        function label = iio_device_get_label(devPtr)
            % Retrieve the device label (e.g. lo_pll0_rx_adf4351)
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            % 
            % Returns:
            %   A pointer to a static NULL-terminated string
            %
            % NOTE: 
            %   If the device has no name, NULL is returned
            %
            % libiio function: iio_device_get_label
            
            if coder.target('MATLAB')
                label = adi.libiio.device.calllibADI('iio_device_get_label', devPtr);
            else
                label = coder.ceval('iio_device_get_label', devPtr);
            end
        end

        function count = iio_device_get_channels_count(devPtr)
            % Enumerate the channels of the given device
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            % 
            % Returns:
            %   The number of channels found
            %
            % libiio function: iio_device_get_channels_count
            
            if coder.target('MATLAB')
                count = adi.libiio.device.calllibADI('iio_device_get_channels_count', devPtr);
            else
                count = coder.ceval('iio_device_get_channels_count', devPtr);
            end
        end

        function count = iio_device_get_attrs_count(devPtr)
            % Enumerate the device-specific attributes of the given device
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            % 
            % Returns:
            %   The number of channels found
            %
            % libiio function: iio_device_get_attrs_count
            
            if coder.target('MATLAB')
                count = adi.libiio.device.calllibADI('iio_device_get_attrs_count', devPtr);
            else
                count = coder.ceval('iio_device_get_attrs_count', devPtr);
            end
        end

        function chanPtr = iio_device_get_channel(devPtr, index)
            % Get the channel present at the given index
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %   index: The index corresponding to the channel
            % 
            % Returns:
            %   On success, a pointer to an iio_channel structure. 
            %   If the index is invalid, NULL is returned.
            %
            % libiio function: iio_device_get_channel

            if coder.target('MATLAB')
                chanPtr = adi.libiio.device.calllibADI('iio_device_get_channel', devPtr, index);
            else
                chanPtr = coder.opaque('struct iio_channel*', 'NULL');
                chanPtr = coder.ceval('iio_device_get_channel', devPtr, index);
            end
        end

        function attrPtr = iio_device_get_attr(devPtr, index)
            % Get the device-specific attribute present at the given index
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %   index: The index corresponding to the attribute
            % 
            % Returns:
            %   On success, a pointer to an iio_attr structure. 
            %   If the index is invalid, NULL is returned.
            %
            % libiio function: iio_device_get_attr

            if coder.target('MATLAB')
                attrPtr = adi.libiio.device.calllibADI('iio_device_get_attr', devPtr, index);
            else
                attrPtr = coder.opaque('struct iio_attr*', 'NULL');
                attrPtr = coder.ceval('iio_device_get_attr', devPtr, index);
            end
        end
        
        function chanPtr = iio_device_find_channel(devPtr, id, output)
            %  Try to find a channel structure by its name of ID
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %   id: name A NULL-terminated string corresponding to the name
            %   name or the ID of the channel to search for
            %   output: True if the searched channel is output, False
            %   otherwise
            % 
            % Returns:
            %   On success, a pointer to an iio_channel structure. 
            %   If the name or ID does not correspond to any known channel 
            %   of the given device, NULL is returned.
            %
            % libiio function: iio_device_find_channel

            if coder.target('MATLAB')
                chanPtr = adi.libiio.device.calllibADI('iio_device_find_channel', devPtr, id, output);
            else
                chanPtr = coder.opaque('struct iio_channel*', 'NULL');
                chanPtr = coder.ceval('iio_device_find_channel', devPtr, id, output);
            end
        end

        function attrPtr = iio_device_find_attr(devPtr, name)
            % Try to find a device-specific attribute by its name
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %   name: A NULL-terminated string corresponding to the name 
            %   of the attribute
            % 
            % Returns:
            %   On success, a pointer to an iio_attr structure. 
            %   If the name or ID does not correspond to any known channel 
            %   of the given device, NULL is returned.
            %
            % NOTE: 
            %   This function is useful to detect the presence of an 
            %   attribute. It can also be used to retrieve the name of an 
            %   attribute as a pointer to a static string from a 
            %   dynamically allocated string.
            %
            % libiio function: iio_device_find_attr

            if coder.target('MATLAB')
                attrPtr = adi.libiio.device.calllibADI('iio_device_find_attr', devPtr, name);
            else
                attrPtr = coder.opaque('struct iio_attr*', 'NULL');
                attrPtr = coder.ceval('iio_device_find_attr', devPtr, name);
            end
        end

        function iio_device_set_data(devPtr, dataPtr)
            % Associate a pointer to an iio_device structure
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %   dataPtr: The pointer to be associated
            %
            % libiio function: iio_device_set_data

            if coder.target('MATLAB')
                adi.libiio.device.calllibADI('iio_device_set_data', devPtr, dataPtr);
            else
                coder.ceval('iio_device_set_data', devPtr, dataPtr);
            end
        end

        function valPtr = iio_device_get_data(devPtr)
            % Retrieve a previously associated pointer of an iio_device structure
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %
            % Returns:
            %   The pointer previously associated if present, or NULL 
            %
            % libiio function: iio_device_get_data

            if coder.target('MATLAB')
                valPtr = adi.libiio.device.calllibADI('iio_device_get_data', devPtr);
            else
                valPtr = coder.opaque('void*', 'NULL'); 
                valPtr = coder.ceval('iio_device_get_data', devPtr);
            end
        end

        function triggerPtr = iio_device_get_trigger(devPtr, dataPtr)
            % Retrieve the trigger of a given device
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %   dataPtr: The pointer to be associated
            %
            % Returns:
            %   On success, a pointer to the trigger's iio_device 
            %   structure is returned.
            %   On failure, a pointer-encoded error is returned. If no 
            %   trigger has been associated with the given device, the 
            %   error code will be -ENODEV.
            %
            % libiio function: iio_device_get_trigger

            if coder.target('MATLAB')
                triggerPtr = adi.libiio.device.calllibADI('iio_device_get_trigger', devPtr, dataPtr);
            else
                triggerPtr = coder.opaque('const struct iio_device*', 'NULL'); 
                triggerPtr = coder.ceval('iio_device_get_trigger', devPtr, dataPtr);
            end
        end

        function status = iio_device_set_trigger(devPtr, triggerPtr)
            % Associate a trigger to a given device
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %   triggerPtr: A pointer to the iio_device structure 
            %   corresponding to the trigger that should be associated.
            %
            % Returns:
            %   On success, 0 is returned
            %   On error, a negative errno code is returned.
            %
            % libiio function: iio_device_set_trigger

            if coder.target('MATLAB')
                status = adi.libiio.device.calllibADI('iio_device_set_trigger', devPtr, triggerPtr);
            else
                status = coder.ceval('iio_device_set_trigger', devPtr, triggerPtr);
            end
        end

        function status = iio_device_is_trigger(devPtr)
            % Return True if the given device is a trigger
            %
            % Args:
            %   devPtr: A pointer to an iio_device structure
            %
            % Returns:
            %   True if the device is a trigger, False otherwise
            %
            % libiio function: iio_device_is_trigger

            if coder.target('MATLAB')
                status = adi.libiio.device.calllibADI('iio_device_is_trigger', devPtr);
            else
                status = coder.ceval('iio_device_is_trigger', devPtr);
            end
        end
    end

    % Wrappers to maintain backwards-compatibility
    methods (Static)
        function nBytes = iio_device_attr_write(devPtr,attr,src)
            [status, attrPtr] = adi.libiio.device.iio_device_find_attr(devPtr, attr);
            % cstatus(obj,status,['Attribute: ' attr ' not found']);
            nBytes = adi.libiio.device.iio_attr_write_string(attrPtr, src);
        end
    end

    %%Helpers
    methods (Hidden, Access = private, Static)
        function libName = getIIOLibName()
            libName = 'libiio1';
        end

        function headername = getIIOHeaderName()
            headername = 'iio.h';
        end

        function [notfound, warnings] = loadLibIIO()
            notfound = [];
            warnings = [];
            libName = adi.libiio.device.getIIOLibName();
            headername = adi.libiio.device.getIIOHeaderName();
            % persistent IsLibiioLoaded
            % if isempty(IsLibiioLoaded)
            %     [notfound, warnings] = loadlibrary(libName,headername);
            %     if ~isempty(notfound)
            %         % error
            %     end
            %     IsLibiioLoaded = libisloaded(libName);
            % end

            if ~libisloaded(libName)
                [notfound, warnings] = loadlibrary(libName,headername);
                if ~isempty(notfound)
                    % error
                end
            end
        end

        function unloadLibIIO()
            libName = adi.libiio.device.getIIOLibName();
            % persistent IsLibiioLoaded
            % if isempty(IsLibiioLoaded)
            %     IsLibiioLoaded = libisloaded(libName);
            % end
            % 
            % if IsLibiioLoaded
            %     unloadlibrary(libName);
            % end

            if libisloaded(libName)
                unloadlibrary(libName);
            end
        end

        function varargout = calllibADI(fn, varargin)
            [notfound, warnings] = adi.libiio.device.loadLibIIO();
            varargout = cell(1, nargout);
            varargoutLocal = calllib(adi.libiio.device.getIIOLibName(), fn, varargin{:});
            % adi.libiio.device.unloadLibIIO();
            [varargout{:}] = varargoutLocal;
        end

        function strout = ntstr(strin)
            % Appends a null character to terminate the string.
            % This is needed for code generation since MATLAB character 
            % arrays are not null terminated in code generation.
            strout = [uint8(strin) uint8(0)];
        end
    end
end