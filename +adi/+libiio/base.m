classdef (Abstract) base < adi.libiio.top & ...
        adi.libiio.low_level & ...
        matlab.System
    properties (Hidden, Access = {?handle}, Abstract)
        iioCtx % The LibIIO context pointer
        iioDev% The LibIIO device pointer
        % iioBuf % The LibIIO buffer pointer
        % libTracked = false; % A flag to indicate whether or not the lib has been loaded
        
        libIsLoaded
    end

    properties (Hidden, Access = {?handle})
        iioChn % The LibIIO channel pointer
        iioAttr
    end

    properties (Hidden, Access = {?handle})
        iioCtxParams
    end

    properties(Hidden, Nontunable, Abstract)
        % Context Timeout (milliseconds) [0 = infinite, -1 = default]
        contextTimeout
    end

    properties(Hidden, Access = protected, Nontunable, Dependent, Abstract)
        libraryVersion
    end

    properties(Hidden, Access = protected, Nontunable, Abstract)
        libName
    end

    methods
        function obj = base(varargin)
            % BASE constructor method for matlabshared.libiio.base
            %
            % Returns the adi.libiio.base object
            
            % Support name/value pairs
            % coder.allowpcode('plain');
            setProperties(obj,nargin,varargin{:});
            % coder.allowpcode('plain');
        end
    end

    methods (Hidden, Access = {?handle})
        function devPtr = getDev(obj, name)
            devPtr = iio_context_find_device(obj, obj.iioCtx, name);
            % status = cPtrCheck(obj,devPtr);
            % cstatusid(obj,status, 'libiio:base:FindDeviceFail', name);
        end

        % function status = cPtrCheck(obj,ptr)
        %     % Returns 0 if ptr is a valid pointer, negative error code
        %     % otherwise
        %     status = -int32(isNull(ptr));
        % end
    end

    methods(Hidden, Access = protected)
        function setupImpl(obj)
            % Setup LibIIO
            [notfound,warnings]=loadlibrary(obj.libName,'iio.h');
            obj.libIsLoaded = true;
            
            % Initialize pointers and variables
            obj.iioCtx = libpointer;
            obj.iioCtxParams = libpointer;
            obj.iioDev = libpointer;
            obj.iioBuf = libpointer;
            obj.contextTimeout = uint32(0);
            
            % Get context
            % obj.iioCtx = calllib(obj.libName, 'iio_create_context', obj.iioCtxParams, obj.uri);
            obj.iioCtx = adi.libiio.context.iio_create_context(obj.iioCtxParams, obj.uri);
            status = -int32(isNull(obj.iioCtx));% cPtrCheck(obj,obj.iioCtx);
            
            % Set context timeout
            % status = calllib(obj.libName, 'iio_context_set_timeout', obj.iioCtx, obj.contextTimeout);

            % Get AD9361 PHY device
            % obj.iioDev = calllib(obj.libName, 'iio_context_find_device', obj.iioCtx, 'ad9361-phy');
            obj.iioDev = adi.libiio.context.iio_context_find_device(obj.iioCtx, 'ad9361-phy');

            obj.needsTeardown = true;

            % Device-specific setup
            configureChanBuffers(obj);

            % Find AD9361 LO channel
            % obj.iioChn = calllib(obj.libName, 'iio_device_find_channel', obj.iioDev, 'altvoltage0', true);
            obj.iioChn = adi.libiio.device.iio_device_find_channel(obj.iioDev, 'altvoltage0', true);
            
            % obj.iioAttr = calllib(obj.libName, 'iio_channel_find_attr', obj.iioChn, 'frequency');

            % status = calllib(obj.libName, 'iio_attr_write_longlong', obj.iioAttr, obj.CenterFrequency);
        end

        function releaseImpl(obj)
            unloadlibrary(obj.libName);
        end
    end
end