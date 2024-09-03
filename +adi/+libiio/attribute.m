classdef attribute < handle
    methods (Static)
        %% attribute methods
        function status = iio_attr_read_raw(attrPtr, dstPtr, len)
            % Read the content of the given attribute
            %
            % Args:
            %   attrPtr: A pointer to an iio_attr structure
            %   dstPtr: A pointer to the memory area where the read data 
            %   will be stored
            %   len: The available length of the memory area, in bytes
            % 
            % Returns:
            %   On success, the number of bytes written to the buffer
            %   On error, a negative errno code is returned
            %
            % libiio function: iio_attr_read_raw
            validateattributes(len, { 'double','single' }, ...
                {'real', 'scalar', 'finite', 'nonnan', 'nonempty', ...
                'nonnegative', 'integer'});
            
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_read_raw', attrPtr, dstPtr, len);
            else
                status = coder.ceval('iio_attr_read_raw', attrPtr, dstPtr, len);
            end
        end

        function status = iio_attr_write_raw(attrPtr, srcPtr, len)
            % Read the content of the given attribute
            %
            % Args:
            %   attrPtr: A pointer to an iio_attr structure
            %   srcPtr: A pointer to the data to be written
            %   len: The number of bytes that should be written
            % 
            % Returns:
            %   On success, the number of bytes written
            %   On error, a negative errno code is returned
            %
            % libiio function: iio_attr_write_raw
            validateattributes(len, { 'double','single' }, ...
                {'real', 'scalar', 'finite', 'nonnan', 'nonempty', ...
                'nonnegative', 'integer'});
            
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_write_raw', attrPtr, srcPtr, len);
            else
                status = coder.ceval('iio_attr_write_raw', attrPtr, srcPtr, len);
            end
        end

        function name = iio_attr_get_name(attrPtr)
            % Retrieve the name of an attribute
            %
            % Args:
            %   attrPtr: A pointer to an iio_attr structure
            % 
            % Returns:
            %   A pointer to a static NULL-terminated string
            %
            % libiio function: iio_attr_get_name
            
            if coder.target('MATLAB')
                name = adi.libiio.attribute.calllibADI('iio_attr_get_name', attrPtr);
            else
                name = coder.ceval('iio_attr_get_name', attrPtr);
            end
        end

        function name = iio_attr_get_filename(attrPtr)
            % Retrieve the filename of an attribute
            %
            % Args:
            %   attrPtr: A pointer to an iio_attr structure
            % 
            % Returns:
            %   A pointer to a static NULL-terminated string
            %
            % libiio function: iio_attr_get_filename
            
            if coder.target('MATLAB')
                name = adi.libiio.attribute.calllibADI('iio_attr_get_filename', attrPtr);
            else
                name = coder.ceval('iio_attr_get_filename', attrPtr);
            end
        end

        function name = iio_attr_get_static_value(attrPtr)
            % Retrieve the static value of an attribute
            %
            % Args:
            %   attrPtr: A pointer to an iio_attr structure
            % 
            % Returns:
            %   On success, a pointer to a static NULL-terminated string
            %   If the attribute does not have a static value, NULL is returned.
            %
            % libiio function: iio_attr_get_filename
            
            if coder.target('MATLAB')
                name = adi.libiio.attribute.calllibADI('iio_attr_get_static_value', attrPtr);
            else
                name = coder.ceval('iio_attr_get_static_value', attrPtr);
            end
        end

        function [status, value] = iio_attr_read_bool(attrPtr)
            valPtr = libpointer('bool', 0);
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_read_bool', attrPtr, valPtr);
            else
                status = coder.ceval('iio_attr_read_bool', attrPtr, valPtr);
            end
            
            if ~status
                value = valPtr.value;
            else
                value = false;
            end
        end

        function [status, value] = iio_attr_read_longlong(attrPtr)
            valPtr = libpointer('int64Ptr', 0);
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_read_longlong', attrPtr, valPtr);
            else
                status = coder.ceval('iio_attr_read_longlong', attrPtr, valPtr);
            end

            if ~status
                value = valPtr.value;
            else
                value = 0;
            end
        end

        function [status, value] = iio_attr_read_double(attrPtr)
            valPtr = libpointer('double', 0);
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_read_double', attrPtr, valPtr);
            else
                status = coder.ceval('iio_attr_read_double', attrPtr, valPtr);
            end
            
            if ~status
                value = valPtr.value;
            else
                value = 0;
            end
        end

        function status = iio_attr_write_string(attrPtr, value)
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_write_string', attrPtr, value);
            else
                status = coder.ceval('iio_attr_write_string', attrPtr, value);
            end
        end

        function status = iio_attr_write_bool(attrPtr, value)
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_write_bool', attrPtr, value);
            else
                status = coder.ceval('iio_attr_write_bool', attrPtr, value);
            end
        end

        function status = iio_attr_write_longlong(attrPtr, value)
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_write_longlong', attrPtr, value);
            else
                status = coder.ceval('iio_attr_write_longlong', attrPtr, value);
            end
        end

        function status = iio_attr_write_double(attrPtr, value)
            if coder.target('MATLAB')
                status = adi.libiio.attribute.calllibADI('iio_attr_write_double', attrPtr, value);
            else
                status = coder.ceval('iio_attr_write_double', attrPtr, value);
            end
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
            libName = adi.libiio.attribute.getIIOLibName();
            headername = adi.libiio.attribute.getIIOHeaderName();
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
            libName = adi.libiio.attribute.getIIOLibName();
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
            [notfound, warnings] = adi.libiio.attribute.loadLibIIO();
            varargout = cell(1, nargout);
            varargoutLocal = calllib(adi.libiio.attribute.getIIOLibName(), fn, varargin{:});
            % adi.libiio.attribute.unloadLibIIO();
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