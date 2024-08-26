classdef context < handle
    methods (Static)
        %% context methods
        function ctxPtr = iio_create_context(ctxParamsPtr, uri)
            % Create a context from a URI description
            %
            % Args:
            %   ctxParamsPtr: A pointer to a iio_context_params structure 
            %       that contains context creation information; can be NULL
            %   uri: a URI describing the context location. If NULL, the 
            %       backend will be created using the URI string present in 
            %       the IIOD_REMOTE environment variable, or if not set, a 
            %       local backend is created.
            % 
            % Returns:
            %   On success, a pointer to a iio_context structure
            %   On failure, a pointer-encoded error is returned
            %
            % libiio function: iio_create_context
            
            if coder.target('MATLAB')
                ctxPtr = adi.libiio.context.calllibADI('iio_create_context', ctxParamsPtr, uri);
            else
                ctxPtr = coder.opaque('struct iio_context*', 'NULL');
                ctxPtr = coder.ceval('iio_create_context', ctxParamsPtr, adi.libiio.context.ntstr(uri));
            end
        end

        function iio_context_destroy(ctxPtr)
            % Create a context from a URI description
            %
            % Args:
            %   ctxPtr: A pointer to a iio_context structure
            %
            % libiio function: iio_context_destroyiio_context_destroy

            if coder.target('MATLAB')
                adi.libiio.context.calllibADI('iio_context_destroy', ctxPtr);
            else
                coder.ceval('iio_context_destroy', ctxPtr);
            end
        end

        function devPtr = iio_context_find_device(ctxPtr, name)
            % Try to find a device structure by its ID, label or name
            %
            % Args:
            %   ctxPtr: A pointer to an iio_context structure
            %   name: A NULL-terminated string corresponding to the ID, 
            %   label or nameof the device to search for
            % 
            % Returns:
            %   On success, a pointer to a iio_device structure
            %   If the parameter does not correspond to the ID, label or 
            %   name of any known device, NULL is returned
            %
            % libiio function: iio_context_find_device

            if coder.target('MATLAB')
                devPtr = adi.libiio.context.calllibADI('iio_context_find_device', ctxPtr, name);
            else
                devPtr = coder.opaque('struct iio_device*', 'NULL');
                devPtr = coder.ceval('iio_context_find_device', ctxPtr, adi.libiio.context.ntstr(name));
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
            libName = adi.libiio.context.getIIOLibName();
            headername = adi.libiio.context.getIIOHeaderName();
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
            libName = adi.libiio.context.getIIOLibName();
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
            [notfound, warnings] = adi.libiio.context.loadLibIIO();
            varargout = cell(1, nargout);
            varargoutLocal = calllib(adi.libiio.context.getIIOLibName(), fn, varargin{:});
            % adi.libiio.context.unloadLibIIO();
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