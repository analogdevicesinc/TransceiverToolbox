classdef (Abstract) base < adi.libiio.device & ...
        adi.libiio.channel & ...
        adi.libiio.context & ...
        adi.libiio.top & ...
        adi.libiio.low_level & ...
        matlab.System
    properties(Hidden, Access = protected, Nontunable, Dependent)
        libraryVersion_v1
    end

    methods
        function version = get.libraryVersion_v1(obj)
            version = '1.0';
        end
    end

    %{
    methods (Hidden, Access = {?handle})
        function devPtr = getDev(obj, name)
        end
    end
    %}
end