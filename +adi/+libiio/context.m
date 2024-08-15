classdef context < handle
    %% Internal Helper Functions
    methods (Static)
        %% Context Methods
        function ctxPtr = iio_create_context(ctxParamsPtr, uri)
            ctxPtr = calllib(adi.libiio.context.getIIOLibName(), 'iio_create_context', ctxParamsPtr, uri);
        end

        function devPtr = iio_context_find_device(ctxPtr, name)
            devPtr = calllib(adi.libiio.context.getIIOLibName(), 'iio_context_find_device', ctxPtr, name);
        end

        function libName = getIIOLibName()
            libName = 'libiio1';
        end
    end
end