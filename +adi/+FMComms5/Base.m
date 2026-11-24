classdef (Abstract, Hidden = true) Base < adi.AD9361.Base    
    
    %adi.FMComms5.Base Class
    %   This class contains shared parameters and methods between TX and RX
    %   classes
    properties (Abstract)
        %CenterFrequencyChipB Center Frequency
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChipB
        %RFBandwidthChipB RF Bandwidth
        %   RF Bandwidth of front-end analog filter in Hz, specified as a
        %   scalar from 200 kHz to 56 MHz.
        RFBandwidthChipB
    end
    
    properties(Nontunable, Hidden)
        iioDevPHYChipB
    end
    
    methods (Hidden, Access = {?handle})
        
        function status = configureChanBuffers(obj)
            % The second AD9361 is looked up at every setup, with
            % SkipInit too: the set methods of its properties write to it
            setupChipB(obj);
            status = configureChanBuffers@adi.AD9361.Base(obj);
        end
        
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
        
        function icon = getIconImpl(obj)
            icon = sprintf(['FMComms5 ',obj.Type]);
        end
        
        function writeFilterFileFMComms5ChipB(obj)
            fir_data_file = obj.CustomFilterFileName;
            fir_data_str = fileread(fir_data_file);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',false,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','0',true,obj.iioDevPHYChipB);
            obj.setDeviceAttributeRAW('filter_fir_config',fir_data_str,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',true,obj.iioDevPHYChipB);
            obj.setAttributeRAW('voltage0','filter_fir_en','1',false,obj.iioDevPHYChipB);
        end
        
        function setupChipB(obj)
            % Device handle of the second AD9361. The first one is
            % looked up by setupLibad9361 of adi.AD9361.Base.
            obj.iioDevPHYChipB = getDev(obj,'ad9361-phy-B');
        end
        
        function setBBRate(obj, rate)
            % SamplingRate is one property for the two AD9361: at setup
            % and on a change after setup the rate goes to both
            setBBRate@adi.AD9361.Base(obj, rate);
            setBBRateChipB(obj, rate);
        end
        
        function setBBRateChipB(obj, rate)
            % setBBRate of adi.AD9361.Base for the second AD9361:
            % ad9361_set_bb_rate of libad9361-iio. A step that fails is
            % an error.
            status = ad9361SetBBRate(obj, obj.iioDevPHYChipB, rate);
            cstatus(obj, status, sprintf( ...
                'ad9361_set_bb_rate failed on ad9361-phy-B for a sampling rate of %d', rate));
        end
        
        function multichipSync(obj, flags)
            % Synchronise the two AD9361: ad9361_fmcomms5_multichip_sync
            % of libad9361-iio. A device that is missing is an error (the
            % classes ignored the return value of the library).
            status = ad9361FMComms5MultichipSync(obj, flags);
            cstatus(obj, status, 'ad9361_fmcomms5_multichip_sync failed');
        end
        
        function status = ad9361FMComms5MultichipSync(obj, flags)
            % ad9361_fmcomms5_multichip_sync of libad9361-iio
            % (ad9361_multichip_sync.c): ad9361-phy is the master and
            % ad9361-phy-B its one slave
            master = iio_context_find_device(obj, obj.iioCtx, 'ad9361-phy');
            slave = iio_context_find_device(obj, obj.iioCtx, 'ad9361-phy-B');
            if isempty(master) || isempty(slave)
                status = -19;   % ENODEV
                return
            end
            status = ad9361MultichipSync(obj, master, {slave}, flags);
        end
        
        function status = ad9361MultichipSync(obj, master, slaves, flags)
            % ad9361_multichip_sync of libad9361-iio
            % (ad9361_multichip_sync.c) on the libiio v1 bindings: the
            % same attribute and register accesses in the same order,
            % and its return value (0, or a negative errno). MASTER is an
            % iio.Device, SLAVES a cell array of one to three of them.
            % FLAGS is a sum of
            %   1   FIXUP_INTERFACE_TIMING: the registers 0x6 and 0x7 of
            %       the master are copied to the slaves
            %   2   CHECK_SAMPLE_RATES: a slave whose sampling rate
            %       differs from that of the master gets that rate
            % As in the library, the result of no access is checked.
            % Where the library would go on with a value that it did not
            % get (a read that failed leaves its variable as it was),
            % nothing is written here. The library reports a sampling
            % rate that it updates on stderr; nothing is printed here.
            maxSyncDevs = 4;
            numSlaves = numel(slaves);
            mcsIsDebugAttr = isempty(master.find_attr('multichip_sync'));
            
            if numSlaves >= maxSyncDevs || numSlaves < 1
                status = -22;   % EINVAL
                return
            end
            
            if bitand(flags, 2) ~= 0    % CHECK_SAMPLE_RATES
                txSampleMaster = iio_device_find_channel(obj, master, 'voltage0', true);
                [stsMaster, masterFreq] = iio_channel_attr_read_longlong(obj, txSampleMaster, 'sampling_frequency');
                for i = 1:numSlaves
                    txSampleSlave = iio_device_find_channel(obj, slaves{i}, 'voltage0', true);
                    if isempty(txSampleSlave)
                        status = -19;   % ENODEV
                        return
                    end
                    [stsSlave, slaveFreq] = iio_channel_attr_read_longlong(obj, txSampleSlave, 'sampling_frequency');
                    if stsMaster >= 0 && stsSlave >= 0 && masterFreq ~= slaveFreq
                        iio_channel_attr_write_longlong(obj, txSampleSlave, 'sampling_frequency', masterFreq);
                    end
                end
            end
            
            if bitand(flags, 1) ~= 0    % FIXUP_INTERFACE_TIMING
                [sts6, reg6] = iio_device_reg_read(obj, master, 6);
                [sts7, reg7] = iio_device_reg_read(obj, master, 7);
                for i = 1:numSlaves
                    if sts6 >= 0
                        iio_device_reg_write(obj, slaves{i}, 6, reg6);
                    end
                    if sts7 >= 0
                        iio_device_reg_write(obj, slaves{i}, 7, reg7);
                    end
                end
            end
            
            % Move the parts into ALERT for MCS
            ensmMode = cell(1, numSlaves + 1);
            ensmRead = zeros(1, numSlaves + 1);
            [ensmRead(1), ensmMode{1}] = iio_device_attr_read(obj, master, 'ensm_mode', 80);
            iio_device_attr_write(obj, master, 'ensm_mode', 'alert');
            for i = 1:numSlaves
                [ensmRead(i + 1), ensmMode{i + 1}] = iio_device_attr_read(obj, slaves{i}, 'ensm_mode', 80);
                iio_device_attr_write(obj, slaves{i}, 'ensm_mode', 'alert');
            end
            
            for step = 0:5
                for i = 1:numSlaves
                    if mcsIsDebugAttr
                        iio_device_debug_attr_write_longlong(obj, slaves{i}, 'multichip_sync', step);
                    else
                        iio_device_attr_write_longlong(obj, slaves{i}, 'multichip_sync', step);
                    end
                end
                % The master controls the SYNC GPIO
                if mcsIsDebugAttr
                    iio_device_debug_attr_write_longlong(obj, master, 'multichip_sync', step);
                else
                    iio_device_attr_write_longlong(obj, master, 'multichip_sync', step);
                end
                pause(0.001);
            end
            
            if ensmRead(1) >= 0
                iio_device_attr_write(obj, master, 'ensm_mode', ensmMode{1});
            end
            for i = 1:numSlaves
                if ensmRead(i + 1) >= 0
                    iio_device_attr_write(obj, slaves{i}, 'ensm_mode', ensmMode{i + 1});
                end
            end
            status = 0;
        end
        
    end
end

