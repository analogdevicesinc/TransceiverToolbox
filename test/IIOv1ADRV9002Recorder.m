classdef IIOv1ADRV9002Recorder < adi.ADRV9002.Rx
    % IIOv1ADRV9002Recorder adi.ADRV9002.Rx that keeps its device attribute writes
    %   For test/IIOv1EmuTests.m only. Every write of a device attribute
    %   as text (iio_device_attr_write) or as bytes
    %   (iio_device_attr_write_raw) through the members of
    %   adi.common.IIOBase is added to Writes with what was handed to the
    %   bindings. The emulation keeps a value only up to its first zero
    %   byte, so the bytes of a stream file cannot be read back from it.

    properties (Hidden)
        %Writes One row per write: 'string' or 'raw', the name of the
        %   attribute, the value (char or uint8), the result of the member
        Writes = cell(0, 4);
    end

    methods
        function obj = IIOv1ADRV9002Recorder(varargin)
            obj = obj@adi.ADRV9002.Rx(varargin{:});
        end
    end

    methods (Hidden)

        function bytes = iio_device_attr_write(obj, devPtr, attr, value)
            bytes = iio_device_attr_write@adi.ADRV9002.Rx(obj, devPtr, attr, value);
            obj.Writes(end + 1, :) = {'string', attr, value, bytes};
        end

        function bytes = iio_device_attr_write_raw(obj, devPtr, attr, value)
            bytes = iio_device_attr_write_raw@adi.ADRV9002.Rx(obj, devPtr, attr, value);
            obj.Writes(end + 1, :) = {'raw', attr, value, bytes};
        end

    end

end
