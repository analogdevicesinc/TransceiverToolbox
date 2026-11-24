classdef IIOv1BBRateRecorder < adi.AD9361.Rx
    % IIOv1BBRateRecorder adi.AD9361.Rx that logs what its sampling rate writes
    %   For test/IIOv1EmuTests.m only. While ad9361SetBBRate of
    %   adi.AD9361.Base runs, every attribute read and write that it makes
    %   through the iio_* members of adi.common.IIOBase is added to Log,
    %   one line per call, in the format of
    %   test/emu/ad9361_bb_rate/bb_rate_harness.c, which logs the same for
    %   ad9361_set_bb_rate of libad9361-iio.

    properties (Hidden)
        %Log Cell array of lines
        Log = {};
    end

    properties (Hidden, Access = private)
        Recording = false;
    end

    methods
        function obj = IIOv1BBRateRecorder(varargin)
            obj = obj@adi.AD9361.Rx(varargin{:});
        end
    end

    methods (Hidden, Access = protected)
        function status = ad9361SetBBRate(obj, dev, rate)
            obj.Log{end + 1} = sprintf('CALL ad9361_set_bb_rate %d', rate);
            obj.Recording = true;
            status = ad9361SetBBRate@adi.AD9361.Rx(obj, dev, rate);
            obj.Recording = false;
            obj.Log{end + 1} = sprintf('RET %d', status);
        end
    end

    methods (Hidden)

        function [status, value] = iio_channel_attr_read_longlong(obj, chanPtr, attr)
            [status, value] = iio_channel_attr_read_longlong@adi.AD9361.Rx(obj, chanPtr, attr);
            note(obj, ['chn_read_longlong ' chanText(chanPtr) ' ' attr], status, sprintf('%d', value));
        end

        function [status, value] = iio_channel_attr_read_bool(obj, chanPtr, attr)
            [status, value] = iio_channel_attr_read_bool@adi.AD9361.Rx(obj, chanPtr, attr);
            note(obj, ['chn_read_bool ' chanText(chanPtr) ' ' attr], status, sprintf('%d', value));
        end

        function status = iio_channel_attr_write_longlong(obj, chanPtr, attr, value)
            status = iio_channel_attr_write_longlong@adi.AD9361.Rx(obj, chanPtr, attr, value);
            note(obj, sprintf('chn_write_longlong %s %s %d', chanText(chanPtr), attr, value), status);
        end

        function status = iio_channel_attr_write_bool(obj, chanPtr, attr, value)
            status = iio_channel_attr_write_bool@adi.AD9361.Rx(obj, chanPtr, attr, value);
            note(obj, sprintf('chn_write_bool %s %s %d', chanText(chanPtr), attr, value), status);
        end

        function [status, value] = iio_device_attr_read_bool(obj, devPtr, attr)
            [status, value] = iio_device_attr_read_bool@adi.AD9361.Rx(obj, devPtr, attr);
            note(obj, ['dev_read_bool ' attr], status, sprintf('%d', value));
        end

        function status = iio_device_attr_write_bool(obj, devPtr, attr, value)
            status = iio_device_attr_write_bool@adi.AD9361.Rx(obj, devPtr, attr, value);
            note(obj, sprintf('dev_write_bool %s %d', attr, value), status);
        end

        function [bytes, value] = iio_device_attr_read(obj, devPtr, attr, len)
            [bytes, value] = iio_device_attr_read@adi.AD9361.Rx(obj, devPtr, attr, len);
            note(obj, ['dev_read ' attr], bytes, value);
        end

        function bytes = iio_device_attr_write_raw(obj, devPtr, attr, value)
            bytes = iio_device_attr_write_raw@adi.AD9361.Rx(obj, devPtr, attr, value);
            note(obj, sprintf('dev_write_raw %s %d', attr, numel(value)), bytes);
        end

    end

    methods (Access = private)
        function note(obj, what, status, value)
            % "<what> = <status>[ <value>]": status 0 for success (also
            % where the member returns a number of bytes), the value
            % after a read that succeeded
            if ~obj.Recording
                return
            end
            status = min(double(status), 0);
            if nargin >= 4 && status == 0
                obj.Log{end + 1} = sprintf('%s = 0 %s', what, value);
            else
                obj.Log{end + 1} = sprintf('%s = %d', what, status);
            end
        end
    end

end

function s = chanText(chanPtr)
% "<id> <in|out>" of an iio.Channel, "(none)" for an empty one
if isempty(chanPtr)
    s = '(none)';
elseif chanPtr.output
    s = [chanPtr.id ' out'];
else
    s = [chanPtr.id ' in'];
end
end
