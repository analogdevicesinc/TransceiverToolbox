classdef (Abstract) low_level < handle% & matlabshared.libiio.device
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
        function obj = low_level()
            % CONTEXT constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle}, Static)
        %% Low-level Methods
        function attr = iio_device_find_debug_attr(obj, devPtr, name)
        % iio_device_find_debug_attr (const struct iio_device *devPtr, const char *name)
        %
        % Get context from device pointer.
            if useCalllib(obj)
                attr = calllib(obj.libName, 'iio_device_find_debug_attr', devPtr, name);
            else
                if useCodegen(obj)
                    attr = coder.ceval('iio_device_find_debug_attr', devPtr, obj.ntstr(name));
                end
            end
        end
    end
end