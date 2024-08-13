classdef (Abstract) device < handle% & matlabshared.libiio.device
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
        function obj = device()
            % CONTEXT constructor method for matlabshared.libiio.context
            %
            % Returns the matlabshared.libiio.context object
            coder.allowpcode('plain');
        end
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle}, Static)
        %% Device Methods
        function ctxPtr = iio_device_get_context(obj, devPtr)        
            ctxPtr = calllib(obj.libName, 'iio_device_get_context', devPtr);
        end       

        function chanPtr = iio_device_find_channel(obj, dev, id, output)
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
            chanPtr = calllib(obj.libName, 'iio_device_find_channel', dev, id, output);
        end

        function [status, attrPtr] = iio_device_find_attr(obj, devPtr, attr)
            attrPtr = calllib(obj.libName, 'iio_device_find_attr', devPtr, attr);
            status = cPtrCheck(obj,attrPtr);
        end

        function nBytes = iio_device_attr_write(obj,devPtr,attr,src)
            % [status, attrPtr] = iio_device_find_attr(obj, devPtr, attr);
            attrPtr = calllib(obj.libName, 'iio_device_find_attr', devPtr, attr);
            status = cPtrCheck(obj,attrPtr);
            cstatus(obj,status,['Attribute: ' attr ' not found']);
            % nBytes = iio_attr_write_string(attrPtr, src);
            nBytes = calllib(obj.libName, 'iio_attr_write_string', attrPtr, src);
        end
    end
end