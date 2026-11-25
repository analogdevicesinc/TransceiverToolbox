classdef IIOv1MCSTxCounter < adi.FMComms5.Tx
    % IIOv1MCSTxCounter adi.FMComms5.Tx that notes each multichip sync
    %   For test/IIOv1EmuTests.m only. Every call of
    %   ad9361FMComms5MultichipSync of adi.FMComms5.Base adds its flags
    %   to Flags and its return value to Status.

    properties (Hidden)
        %Flags Flags of each call, in order
        Flags = [];
        %Status Return value of each call, in order
        Status = [];
    end

    methods
        function obj = IIOv1MCSTxCounter(varargin)
            obj = obj@adi.FMComms5.Tx(varargin{:});
        end
    end

    methods (Hidden, Access = protected)
        function status = ad9361FMComms5MultichipSync(obj, flags)
            status = ad9361FMComms5MultichipSync@adi.FMComms5.Tx(obj, flags);
            obj.Flags(end + 1) = flags;
            obj.Status(end + 1) = status;
        end
    end
end
