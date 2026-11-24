classdef IIOv1MCSRecorder < adi.FMComms5.Rx
    % IIOv1MCSRecorder adi.FMComms5.Rx that logs what its multichip sync does
    %   For test/IIOv1EmuTests.m only. While ad9361FMComms5MultichipSync
    %   of adi.FMComms5.Base runs, every attribute and register access
    %   that it makes through the iio_* members of adi.common.IIOBase is
    %   added to Log, one line per call, in the format of
    %   test/emu/ad9361_mcs/mcs_harness.c, which logs the same for
    %   ad9361_fmcomms5_multichip_sync of libad9361-iio.

    properties (Hidden)
        %Log Cell array of lines
        Log = {};
    end

    properties (Hidden, Access = private)
        Recording = false;
    end

    methods
        function obj = IIOv1MCSRecorder(varargin)
            obj = obj@adi.FMComms5.Rx(varargin{:});
        end
    end

    methods (Hidden, Access = protected)
        function status = ad9361FMComms5MultichipSync(obj, flags)
            obj.Log{end + 1} = sprintf('CALL ad9361_fmcomms5_multichip_sync %d', flags);
            obj.Recording = true;
            status = ad9361FMComms5MultichipSync@adi.FMComms5.Rx(obj, flags);
            obj.Recording = false;
            obj.Log{end + 1} = sprintf('RET %d', status);
        end
    end

    methods (Hidden)

        function status = runMultichipSync(obj, flags)
            % The multichip sync of a connected object, with its result
            status = ad9361FMComms5MultichipSync(obj, flags);
        end

        function [status, value] = iio_channel_attr_read_longlong(obj, chanPtr, attr)
            [status, value] = iio_channel_attr_read_longlong@adi.FMComms5.Rx(obj, chanPtr, attr);
            note(obj, ['chn_read_longlong ' chanText(chanPtr) ' ' attr], status, sprintf('%d', value));
        end

        function status = iio_channel_attr_write_longlong(obj, chanPtr, attr, value)
            status = iio_channel_attr_write_longlong@adi.FMComms5.Rx(obj, chanPtr, attr, value);
            note(obj, sprintf('chn_write_longlong %s %s %d', chanText(chanPtr), attr, value), status);
        end

        function [status, value] = iio_device_reg_read(obj, devPtr, addr)
            [status, value] = iio_device_reg_read@adi.FMComms5.Rx(obj, devPtr, addr);
            note(obj, sprintf('reg_read %s 0x%x', devPtr.name, addr), status, sprintf('0x%x', value));
        end

        function status = iio_device_reg_write(obj, devPtr, addr, value)
            status = iio_device_reg_write@adi.FMComms5.Rx(obj, devPtr, addr, value);
            note(obj, sprintf('reg_write %s 0x%x 0x%x', devPtr.name, addr, value), status);
        end

        function [bytes, value] = iio_device_attr_read(obj, devPtr, attr, len)
            [bytes, value] = iio_device_attr_read@adi.FMComms5.Rx(obj, devPtr, attr, len);
            note(obj, sprintf('dev_read %s %s', devPtr.name, attr), bytes, value);
        end

        function bytes = iio_device_attr_write(obj, devPtr, attr, value)
            bytes = iio_device_attr_write@adi.FMComms5.Rx(obj, devPtr, attr, value);
            note(obj, sprintf('dev_write %s %s %s', devPtr.name, attr, value), bytes);
        end

        function status = iio_device_attr_write_longlong(obj, devPtr, attr, value)
            status = iio_device_attr_write_longlong@adi.FMComms5.Rx(obj, devPtr, attr, value);
            note(obj, sprintf('dev_write_longlong %s %s %d', devPtr.name, attr, value), status);
        end

        function status = iio_device_debug_attr_write_longlong(obj, devPtr, attr, value)
            status = iio_device_debug_attr_write_longlong@adi.FMComms5.Rx(obj, devPtr, attr, value);
            note(obj, sprintf('debug_write_longlong %s %s %d', devPtr.name, attr, value), status);
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
% "<device> <id> <in|out>" of an iio.Channel, "(none)" for an empty one
if isempty(chanPtr)
    s = '(none)';
elseif chanPtr.output
    s = [chanPtr.device.name ' ' chanPtr.id ' out'];
else
    s = [chanPtr.device.name ' ' chanPtr.id ' in'];
end
end
