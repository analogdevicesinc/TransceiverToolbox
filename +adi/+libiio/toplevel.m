classdef toplevel < handle
    methods (Static)
        %% top-level methods
        function iio_strerror(err, dstPtr, len)
            % Get a string description of an error code
            %
            % Args:
            %   err: The error code. Can be positive or negative.
            %   dst: A pointer to the memory area where the NULL-terminated string
            %       corresponding to the error message will be stored.
            %   len: The available length of the memory area, in bytes.
            %
            % libiio function: iio_strerror

            if coder.target('MATLAB')
                adi.libiio.toplevel.calllibADI('iio_strerror', err, dstPtr, len);
            else
                coder.ceval('iio_strerror', err, dstPtr, len);
            end
        end

        function hasBackend = iio_has_backend(ctxParamsPtr, backend)
            % Check if the specified backend is available
            %
            % Args:
            %   ctxParamsPtr: A pointer to a iio_context_params structure 
            %       that contains context creation information; can be NULL
            %   backend: The name of the backend to query
            % 
            % Returns:
            %   True if the backend is available, false otherwise
            %
            % libiio function: iio_has_backend
            
            if coder.target('MATLAB')
                hasBackend = adi.libiio.toplevel.calllibADI('iio_has_backend', ctxParamsPtr, backend);
            else
                hasBackend = coder.ceval('iio_has_backend', ctxParamsPtr, adi.libiio.toplevel.ntstr(backend));
            end
        end

        function count = iio_get_builtin_backends_count()
            % Get the number of available built-in backends
            % 
            % Returns:
            %   True if the backend is available, false otherwise
            %
            % libiio function: iio_has_backend
            
            if coder.target('MATLAB')
                count = adi.libiio.toplevel.calllibADI('iio_get_builtin_backends_count');
            else
                count = coder.ceval('iio_get_builtin_backends_count');
            end
        end

        function name = iio_get_builtin_backend(idx)
            % Retrieve the name of a given built-in backend
            %
            % Args:
            %   idx: The index corresponding to the backend
            % 
            % Returns:
            %   On success, a pointer to a NULL-terminated string
            %   If the index is invalid, NULL is returned
            %
            % libiio function: iio_get_builtin_backend

            if coder.target('MATLAB')
                name = adi.libiio.toplevel.calllibADI(obj.libName, 'iio_get_builtin_backend', idx);
            else
                name = coder.nullcopy(adi.libiio.toplevel.ntstr(''));
                name = coder.ceval('iio_get_builtin_backend', idx);
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
            libName = adi.libiio.toplevel.getIIOLibName();
            headername = adi.libiio.toplevel.getIIOHeaderName();
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
            libName = adi.libiio.toplevel.getIIOLibName();
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
            [notfound, warnings] = adi.libiio.toplevel.loadLibIIO();
            varargout = cell(1, nargout);
            varargoutLocal = calllib(adi.libiio.toplevel.getIIOLibName(), fn, varargin{:});
            % adi.libiio.toplevel.unloadLibIIO();
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