classdef (Abstract) top < handle%  & matlabshared.libiio.top
    % matlabshared.libiio.top device class for base matlabshared.libiio.support
    %
    % This abstract system object defines the APIs necessary to use libIIO
    % for MATLAB/Simulink simulation as well as codegen on a Linux target
    
    % Copyright 2018 The MathWorks, Inc.
    %#codegen
    
    %% Abstract Properties
    properties(Abstract, Hidden, Access = protected)
        libName
    end
    
    %% Internal Helper Functions
    methods (Hidden, Access = {?handle})
        %% Top-level functions
        function [major, minor, gitTag] = iio_library_get_version(obj)
        % iio_library_get_version(unsigned int *major,unsigned int *minor,char git_tag[8])
        %
        % Get the version of the libiio library.
            
            majorPtr = libpointer('uint32Ptr',0);
            minorPtr = libpointer('uint32Ptr',0);
            gitTagPtr = libpointer('int8Ptr',zeros(1,8));
            
            calllib(obj.libName, 'iio_context_get_version_major', majorPtr);
            calllib(obj.libName, 'iio_context_get_version_minor', minorPtr);
            calllib(obj.libName, 'iio_context_get_version_tag', gitTagPtr);
            
            major = majorPtr.Value;
            minor = minorPtr.Value;
            gitTag = char(gitTagPtr.Value);
        end
    end
end
