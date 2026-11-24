classdef (Abstract, Hidden = true) Base < ...
        adi.common.RxTx & ...
        adi.common.Attribute & ...
        adi.common.DebugAttribute & ...
        adi.common.IIOBase

    %adi.AD9361.Base Class
    %   This class contains shared parameters and methods between TX and RX
    %   classes
    properties (Nontunable)
        %SamplesPerFrame Samples Per Frame
        %   Number of samples per frame, specified as an even positive
        %   integer from 2 to 16,777,216. Using values less than 3660 can
        %   yield poor performance.
        SamplesPerFrame = 2^15;
    end
    
    properties (Nontunable, Logical)
        %EnableCustomFilter Enable Custom Filter
        %   Enable use of custom filter file to set SamplingRate, 
        %   RFBandwidth, and FIR in datapaths
        EnableCustomFilter = false;
    end
    
    properties (Nontunable)
        %CustomFilterFileName Custom Filter File Name
        %   Path to custom filter file created from filter wizard
        CustomFilterFileName = '';
    end
    
    properties (Abstract)
        %CenterFrequency Center Frequency
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequency
        %SamplingRate Sampling Rate
        %   Baseband sampling rate in Hz, specified as a scalar
        %   from 65105 to 61.44e6 samples per second.
        SamplingRate
        %RFBandwidth RF Bandwidth
        %   RF Bandwidth of front-end analog filter in Hz, specified as a
        %   scalar from 200 kHz to 56 MHz.
        RFBandwidth
    end
    
    properties(Nontunable, Hidden)
        Timeout = Inf;
        kernelBuffersCount = 2;
        dataTypeStr = 'int16';
        phyDevName = 'ad9361-phy';
        iioDevPHY
    end
    
    properties (Hidden, Constant)
        ComplexData = true;
    end
    
    methods
        %% Constructor
        function obj = Base(varargin)
            coder.allowpcode('plain');
            obj = obj@adi.common.IIOBase(varargin{:});
        end
        % Destructor
        function delete(obj)
            teardownLibad9361(obj);
            delete@adi.common.RxTx(obj);
        end
        % Check SamplesPerFrame
        function set.SamplesPerFrame(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>',0,'<=',2^20}, ...
                '', 'SamplesPerFrame');
            obj.SamplesPerFrame = value;
        end
        % Check EnableCustomFilter
        function set.EnableCustomFilter(obj, value)
            validateattributes( value, { 'logical' }, ...
                { }, ...
                '', 'EnableCustomFilter');
            obj.EnableCustomFilter = value;
        end
        % Check CustomFilterFileName
        function set.CustomFilterFileName(obj, value)
            validateattributes( value, { 'char' }, ...
                { }, ...
                '', 'CustomFilterFileName');
            obj.CustomFilterFileName = value;
            if obj.EnableCustomFilter && obj.ConnectedToDevice %#ok<MCSUP>
                writeFilterFile(obj);
            end
        end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        
        function icon = getIconImpl(obj)
            icon = sprintf(['AD9361 ',obj.Type]);
        end
        
        function setupLibad9361(obj)
            % libad9361 is not loaded: its functions take pointers of
            % libiio v0, which the libiio v1 bindings do not have. What
            % the classes used of it, ad9361_set_bb_rate, is setBBRate.
            % Only the device handle is looked up.
            obj.iioDevPHY = getDev(obj,'ad9361-phy');
        end
        
        function teardownLibad9361(~)
            % Nothing to unload, see setupLibad9361
        end

        function setBBRate(obj, rate)
            % Sampling rate of the baseband, with the FIR filter that
            % belongs to it: ad9361_set_bb_rate of libad9361-iio. A step
            % that fails is an error (the classes ignored the return
            % value of the library).
            status = ad9361SetBBRate(obj, getDev(obj, obj.phyDevName), rate);
            cstatus(obj, status, sprintf( ...
                'ad9361_set_bb_rate failed for a sampling rate of %d', rate));
        end
        
        function status = ad9361SetBBRate(obj, dev, rate)
            % ad9361_set_bb_rate of libad9361-iio
            % (ad9361_baseband_auto_rate.c) on the libiio v1 bindings: the
            % same reads and writes in the same order, and its return
            % value (0, or a negative errno).
            %   rate <= 20e6        128 taps, decimation/interpolation 4
            %   rate <= 40e6        128 taps, 2
            %   rate <= 53333333    96 taps, 2
            %   above               64 taps, 2
            % A rate of at most 25e6/12 is only valid with the filter
            % enabled, so there the filter is enabled before the rate is
            % written, and after it for the other rates.
            lowRate = 2083333;  % 25000000 / 12 in integers
            [text, ~, taps] = adi.AD9361.Base.bbRateFIRConfig(rate);
            chan = iio_device_find_channel(obj, dev, 'voltage0', true);
            if isempty(chan)
                status = -19;   % ENODEV
                return
            end
            [status, currentRate] = iio_channel_attr_read_longlong(obj, chan, 'sampling_frequency');
            if status < 0
                return
            end
            [status, enable] = ad9361GetTRXFIREnable(obj, dev);
            if status < 0
                return
            end
            if enable
                if currentRate <= lowRate
                    % result not checked, as in the library
                    iio_channel_attr_write_longlong(obj, chan, 'sampling_frequency', 3000000);
                end
                status = ad9361SetTRXFIREnable(obj, dev, false);
                if status < 0
                    return
                end
            end
            status = iio_device_attr_write_raw(obj, dev, 'filter_fir_config', text);
            if status < 0
                return
            end
            if rate <= lowRate
                [status, rates] = iio_device_attr_read(obj, dev, 'tx_path_rates', 100);
                if status < 0
                    return
                end
                v = sscanf(rates, 'BBPLL:%*d DAC:%d T2:%*d T1:%*d TF:%*d TXSAMP:%d');
                if numel(v) ~= 2
                    status = -14;   % EFAULT
                    return
                end
                dacRate = v(1);
                txRate = v(2);
                if txRate == 0
                    status = -22;   % EINVAL
                    return
                end
                if fix(dacRate / txRate) * 16 < taps
                    % result not checked, as in the library
                    iio_channel_attr_write_longlong(obj, chan, 'sampling_frequency', 3000000);
                end
                status = ad9361SetTRXFIREnable(obj, dev, true);
                if status < 0
                    return
                end
                status = iio_channel_attr_write_longlong(obj, chan, 'sampling_frequency', rate);
                if status < 0
                    return
                end
            else
                status = iio_channel_attr_write_longlong(obj, chan, 'sampling_frequency', rate);
                if status < 0
                    return
                end
                status = ad9361SetTRXFIREnable(obj, dev, true);
                if status < 0
                    return
                end
            end
            status = 0;
        end
        
        function [status, enable] = ad9361GetTRXFIREnable(obj, dev)
            % ad9361_get_trx_fir_enable of libad9361-iio: the device
            % attribute in_out_voltage_filter_fir_en, or the attribute
            % voltage_filter_fir_en of the input channel "out"
            [status, enable] = iio_device_attr_read_bool(obj, dev, 'in_out_voltage_filter_fir_en');
            if status < 0
                chan = iio_device_find_channel(obj, dev, 'out', false);
                [status, enable] = iio_channel_attr_read_bool(obj, chan, 'voltage_filter_fir_en');
            end
        end
        
        function status = ad9361SetTRXFIREnable(obj, dev, enable)
            % ad9361_set_trx_fir_enable of libad9361-iio
            status = iio_device_attr_write_bool(obj, dev, 'in_out_voltage_filter_fir_en', logical(enable));
            if status < 0
                chan = iio_device_find_channel(obj, dev, 'out', false);
                status = iio_channel_attr_write_bool(obj, chan, 'voltage_filter_fir_en', logical(enable));
            end
        end
        
        function writeFilterFile(obj)
            fir_data_file = obj.CustomFilterFileName;
            fir_data_str = fileread(fir_data_file);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',false);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',true);
            obj.setDeviceAttributeRAW('filter_fir_config',fir_data_str);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',true);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',false);
        end
        
    end
    
    %% FIR filters of ad9361_set_bb_rate
    methods (Hidden, Static)
        
        function [text, factor, numTaps] = bbRateFIRConfig(rate)
            % Text that ad9361_set_bb_rate of libad9361-iio writes to
            % filter_fir_config for a sampling rate, the decimation and
            % interpolation of the filter and its number of taps
            if rate <= 20000000
                factor = 4;
                taps = adi.AD9361.Base.bbRateFIRTaps('fir_128_4');
            elseif rate <= 40000000
                factor = 2;
                taps = adi.AD9361.Base.bbRateFIRTaps('fir_128_2');
            elseif rate <= 53333333
                factor = 2;
                taps = adi.AD9361.Base.bbRateFIRTaps('fir_96_2');
            else
                factor = 2;
                taps = adi.AD9361.Base.bbRateFIRTaps('fir_64_2');
            end
            numTaps = numel(taps);
            % the same taps for receive and transmit
            text = [sprintf('RX 3 GAIN -6 DEC %d\n', factor), ...
                sprintf('TX 3 GAIN 0 INT %d\n', factor), ...
                sprintf('%d,%d\n', [taps; taps]), newline];
        end
        
        function taps = bbRateFIRTaps(name)
            % Taps of the filters of libad9361-iio
            % (ad9361_baseband_auto_rate.c), by the name they have there
            switch name
                case 'fir_128_4'
                    taps = [ ...
                        -15,-27,-23,-6,17,33,31,9,-23,-47,-45,-13,34,69,67, ...
                        21,-49,-102,-99,-32,69,146,143,48,-96,-204,-200,-69, ...
                        129,278,275,97,-170,-372,-371,-135,222,494,497,187, ...
                        -288,-654,-665,-258,376,875,902,363,-500,-1201, ...
                        -1265,-530,699,1748,1906,845,-1089,-2922,-3424, ...
                        -1697,2326,7714,12821,15921,15921,12821,7714,2326, ...
                        -1697,-3424,-2922,-1089,845,1906,1748,699,-530, ...
                        -1265,-1201,-500,363,902,875,376,-258,-665,-654, ...
                        -288,187,497,494,222,-135,-371,-372,-170,97,275,278, ...
                        129,-69,-200,-204,-96,48,143,146,69,-32,-99,-102, ...
                        -49,21,67,69,34,-13,-45,-47,-23,9,31,33,17,-6,-23, ...
                        -27,-15];
                case 'fir_128_2'
                    taps = [ ...
                        0,0,1,0,-2,0,3,0,-5,0,8,0,-11,0,17,0,-24,0,33,0,-45, ...
                        0,61,0,-80,0,104,0,-134,0,169,0,-213,0,264,0,-327,0, ...
                        401,0,-489,0,595,0,-724,0,880,0,-1075,0,1323,0, ...
                        -1652,0,2114,0,-2819,0,4056,0,-6883,0,20837,32767, ...
                        20837,0,-6883,0,4056,0,-2819,0,2114,0,-1652,0,1323, ...
                        0,-1075,0,880,0,-724,0,595,0,-489,0,401,0,-327,0, ...
                        264,0,-213,0,169,0,-134,0,104,0,-80,0,61,0,-45,0,33, ...
                        0,-24,0,17,0,-11,0,8,0,-5,0,3,0,-2,0,1,0,0,0];
                case 'fir_96_2'
                    taps = [ ...
                        -4,0,8,0,-14,0,23,0,-36,0,52,0,-75,0,104,0,-140,0, ...
                        186,0,-243,0,314,0,-400,0,505,0,-634,0,793,0,-993,0, ...
                        1247,0,-1585,0,2056,0,-2773,0,4022,0,-6862,0,20830, ...
                        32767,20830,0,-6862,0,4022,0,-2773,0,2056,0,-1585,0, ...
                        1247,0,-993,0,793,0,-634,0,505,0,-400,0,314,0,-243, ...
                        0,186,0,-140,0,104,0,-75,0,52,0,-36,0,23,0,-14,0,8, ...
                        0,-4,0];
                case 'fir_64_2'
                    taps = [ ...
                        -58,0,83,0,-127,0,185,0,-262,0,361,0,-488,0,648,0, ...
                        -853,0,1117,0,-1466,0,1954,0,-2689,0,3960,0,-6825,0, ...
                        20818,32767,20818,0,-6825,0,3960,0,-2689,0,1954,0, ...
                        -1466,0,1117,0,-853,0,648,0,-488,0,361,0,-262,0,185, ...
                        0,-127,0,83,0,-58,0];
                otherwise
                    error('adi:AD9361:noSuchFIR', 'No filter named %s.', name);
            end
        end
        
    end
    
    %% External Dependency Methods
    methods (Hidden, Static)
        
        function tf = isSupportedContext(bldCfg)
            tf = matlabshared.libiio.ExternalDependency.isSupportedContext(bldCfg);
        end
        
        function updateBuildInfo(buildInfo, bldCfg)
            % Call the matlabshared.libiio.method first
            matlabshared.libiio.ExternalDependency.updateBuildInfo(buildInfo, bldCfg);
        end
        
        function bName = getDescriptiveName(~)
            bName = 'AD9361';
        end
        
    end
end

