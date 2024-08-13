classdef (Abstract) context < handle% & matlabshared.libiio.context & ...
        %matlabshared.libiio.device
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
        function obj = context()
            % CONTEXT constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle}, Static)
        %% Context Methods
        function ctxPtr = iio_create_context(obj, ctxParamsPtr, uri)
            ctxPtr = calllib(obj.libName, 'iio_create_context', ctxParamsPtr, uri);
        end

        function [status, devPtr] = iio_context_find_device(obj, ctxPtr, name)
            devPtr = calllib(obj.libName, 'iio_context_find_device', ctxPtr, name);
            status = cPtrCheck(obj,devPtr);
        end        
    end
end