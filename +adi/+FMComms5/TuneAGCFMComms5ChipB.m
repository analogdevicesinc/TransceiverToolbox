classdef TuneAGCFMComms5ChipB < adi.common.DebugAttribute & adi.common.RegisterReadWrite
    properties (Nontunable, Hidden)
        CustomAGCChipB = 0

        AttackDelayChipB = 1
        PeakOverloadWaitTimeChipB = 10
        AGCLockLevelChipB = 10
        DecStepSizeFullTableCase3ChipB = 3
        ADCLargeOverloadThreshChipB = 58
        ADCSmallOverloadThreshChipB = 47
        DecStepSizeFullTableCase2ChipB = 3
        DecStepSizeFullTableCase1ChipB = 3
        LargeLMTOverloadThreshChipB = 35
        SmallLMTOverloadThreshChipB = 25
        SettlingDelayChipB = 3
        EnergyLostThreshChipB = 3
        LowPowerThreshChipB = 15
        IncrementGainStepChipB
        FAGCLockLevelGainIncreaseUpperLimitChipB = 7
        FAGCLPThreshIncrementTimeChipB = 3
        DecPowMeasurementDurationChipB = 16
    end

    properties (Constant, Hidden, Access = private)
        % Register addresses in hexadecimal
        AttackDelay_Reg = '022'
        PeakOverloadWaitTime_Reg = '0FE'
        AGCLockLevel_Reg = '101'
        DecStepSizeFullTableCase3_Reg = '103'
        ADCSmallOverloadThresh_Reg = '104'
        ADCLargeOverloadThresh_Reg = '105'
        DecStepSizeFullTableCase2_Reg = '106'
        DecStepSizeFullTableCase1_Reg = '106'
        LargeLMTOverloadThresh_Reg = '108'
        SmallLMTOverloadThresh_Reg = '107'
        SettlingDelay_Reg = '111'
        EnergyLostThresh_Reg = '112'
        LowPowerThresh_Reg = '114'
        IncrementGainStep_Reg = '117'
        FAGCLockLevelGainIncreaseUpperLimit_Reg = '118'
        FAGCLPThreshIncrementTime_Reg = '11B'
        DecPowMeasurementDuration_Reg = '15C'

        % Register mask in binary
        AttackDelay_Mask = '11000000'
        PeakOverloadWaitTime_Mask = '11100000'
        AGCLockLevel_Mask = '10000000'
        DecStepSizeFullTableCase3_Mask = '11100011'
        DecStepSizeFullTableCase2_Mask = '10001111'
        DecStepSizeFullTableCase1_Mask = '11110000'
        LargeLMTOverloadThresh_Mask = '11000000'
        SmallLMTOverloadThresh_Mask = '11000000'
        SettlingDelay_Mask = '11100000'
        EnergyLostThresh_Mask = '11000000'
        LowPowerThresh_Mask = '10000000'
        IncrementGainStep_Mask = '00011111'
        FAGCLockLevelGainIncreaseUpperLimit_Mask = '11000000'
        DecPowMeasurementDuration_Mask = '11110000'

        % Bit-shifts to be applied
        DecStepSizeFullTableCase3_BitShift = 2
        DecStepSizeFullTableCase2_BitShift = 4
        IncrementGainStep_BitShift = 5
    end

    methods

        function set.AttackDelayChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 63}, ...
                               '', 'AttackDelay');
            obj.AttackDelay = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.AttackDelay_Reg, obj.AttackDelay_Mask, 0, obj.phyDevNameChipB);
            end
        end

        function set.PeakOverloadWaitTimeChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 31}, ...
                               '', 'PeakOverloadWaitTime');
            obj.PeakOverloadWaitTime = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.PeakOverloadWaitTime_Reg, obj.PeakOverloadWaitTime_Mask, 0, obj.phyDevNameChipB);
            end
        end

        function set.AGCLockLevelChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 127}, ...
                               '', 'AGCLockLevel');
            obj.AGCLockLevel = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.AGCLockLevel_Reg, obj.AGCLockLevel_Mask, 0, obj.phyDevNameChipB);
            end
        end

        function set.DecStepSizeFullTableCase3ChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 7}, ...
                               '', 'DecStepSizeFullTableCase3');
            obj.DecStepSizeFullTableCase3 = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.DecStepSizeFullTableCase3_Reg, obj.DecStepSizeFullTableCase3_Mask, obj.DecStepSizeFullTableCase3_BitShift, obj.phyDevNameChipB);
            end
        end

        function set.ADCLargeOverloadThreshChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 255}, ...
                               '', 'ADCLargeOverloadThresh');
            obj.ADCLargeOverloadThresh = value;
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('adi,gc-adc-large-overload-thresh', value, 0, obj.phyDevNameChipB);
            end
        end

        function set.ADCSmallOverloadThreshChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', obj.ADCLargeOverloadThresh}, ...
                               '', 'ADCSmallOverloadThresh');
            obj.ADCSmallOverloadThresh = value;
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('adi,gc-adc-small-overload-thresh', value, 0, obj.phyDevNameChipB);
            end
        end

        function set.DecStepSizeFullTableCase2ChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 7}, ...
                               '', 'DecStepSizeFullTableCase2');
            obj.DecStepSizeFullTableCase2 = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.DecStepSizeFullTableCase2_Reg, obj.DecStepSizeFullTableCase2_Mask, obj.DecStepSizeFullTableCase2_BitShift, obj.phyDevNameChipB);
            end
        end

        function set.DecStepSizeFullTableCase1ChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 15}, ...
                               '', 'DecStepSizeFullTableCase1');
            obj.DecStepSizeFullTableCase1 = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.DecStepSizeFullTableCase1_Reg, obj.DecStepSizeFullTableCase1_Mask, obj.phyDevNameChipB);
            end
        end

        function set.LargeLMTOverloadThreshChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 63}, ...
                               '', 'LargeLMTOverloadThresh');
            obj.LargeLMTOverloadThresh = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.LargeLMTOverloadThresh_Reg, obj.LargeLMTOverloadThresh_Mask, obj.phyDevNameChipB);
            end
        end

        function set.SmallLMTOverloadThreshChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', obj.LargeLMTOverloadThresh}, ...
                               '', 'SmallLMTOverloadThresh');
            obj.SmallLMTOverloadThresh = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.SmallLMTOverloadThresh_Reg, obj.SmallLMTOverloadThresh_Mask, obj.phyDevNameChipB);
            end
        end

        function set.SettlingDelayChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 31}, ...
                               '', 'SettlingDelay');
            obj.SettlingDelay = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.SettlingDelay_Reg, obj.SettlingDelay_Mask, obj.phyDevNameChipB);
            end
        end

        function set.EnergyLostThreshChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 63}, ...
                               '', 'SettlingDelay');
            obj.EnergyLostThresh = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.EnergyLostThresh_Reg, obj.EnergyLostThresh_Mask, obj.phyDevNameChipB);
            end
        end

        function set.LowPowerThreshChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 63}, ...
                               '', 'LowPowerThresh');
            obj.LowPowerThresh = value;
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('adi,gc-low-power-thresh', value, 0, obj.phyDevNameChipB);
            end
        end

        function set.IncrementGainStepChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 7}, ...
                               '', 'IncrementGainStep');
            obj.IncrementGainStep = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.IncrementGainStep_Reg, obj.IncrementGainStep_Mask, obj.IncrementGainStep_BitShift, obj.phyDevNameChipB);
            end
        end

        function set.FAGCLockLevelGainIncreaseUpperLimitChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 63}, ...
                               '', 'FAGCLockLevelGainIncreaseUpperLimit');
            obj.FAGCLockLevelGainIncreaseUpperLimit = value;
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('adi,fagc-lock-level-gain-increase-upper-limit', value, 0, obj.phyDevNameChipB);
            end
        end

        function set.FAGCLPThreshIncrementTimeChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 255}, ...
                               '', 'FAGCLPThreshIncrementTime');
            obj.FAGCLPThreshIncrementTime = value;
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('adi,fagc-lp-thresh-increment-time', value, 0, obj.phyDevNameChipB);
            end
        end

        function set.DecPowMeasurementDurationChipB(obj, value)
            validateattributes(value, { 'double', 'single', 'uint32' }, ...
                               { 'real', 'nonnegative', 'scalar', 'finite', 'nonnan', 'nonempty', 'integer', '>=', 0, '<=', 15}, ...
                               '', 'DecPowMeasurementDuration');
            obj.DecPowMeasurementDuration = value;
            if obj.ConnectedToDevice
                obj.setRegisterExtended(value, obj.DecPowMeasurementDuration_Reg, obj.DecPowMeasurementDuration_Mask, 0, obj.phyDevNameChipB);
            end
        end

        function WriteDebugAttributesFMComms5ChipB(obj)
            if obj.ConnectedToDevice
                obj.setDebugAttributeLongLong('adi,gc-adc-large-overload-thresh', obj.ADCLargeOverloadThreshChipB, 0, obj.phyDevNameChipB);
                obj.setDebugAttributeLongLong('adi,gc-adc-small-overload-thresh', obj.ADCSmallOverloadThreshChipB, 0, obj.phyDevNameChipB);
                obj.setDebugAttributeLongLong('adi,gc-low-power-thresh', obj.LowPowerThreshChipB, 0, obj.phyDevNameChipB);
                obj.setDebugAttributeLongLong('adi,fagc-lock-level-gain-increase-upper-limit', obj.FAGCLockLevelGainIncreaseUpperLimitChipB, 0, obj.phyDevNameChipB);
                obj.setDebugAttributeLongLong('adi,fagc-lp-thresh-increment-time', obj.FAGCLPThreshIncrementTimeChipB, 0, obj.phyDevNameChipB);
            end
        end

        function WriteToRegistersFMComms5ChipB(obj)
            if obj.ConnectedToDevice
                obj.setRegisterExtended(obj.AttackDelayChipB, obj.AttackDelay_Reg, obj.AttackDelay_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.PeakOverloadWaitTimeChipB, obj.PeakOverloadWaitTime_Reg, obj.PeakOverloadWaitTime_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.AGCLockLevelChipB, obj.AGCLockLevel_Reg, obj.AGCLockLevel_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.DecStepSizeFullTableCase3ChipB, obj.DecStepSizeFullTableCase3_Reg, obj.DecStepSizeFullTableCase3_Mask, obj.DecStepSizeFullTableCase3_BitShift, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.DecStepSizeFullTableCase2ChipB, obj.DecStepSizeFullTableCase2_Reg, obj.DecStepSizeFullTableCase2_Mask, obj.DecStepSizeFullTableCase2_BitShift, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.DecStepSizeFullTableCase1ChipB, obj.DecStepSizeFullTableCase1_Reg, obj.DecStepSizeFullTableCase1_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.LargeLMTOverloadThreshChipB, obj.LargeLMTOverloadThresh_Reg, obj.LargeLMTOverloadThresh_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.SmallLMTOverloadThreshChipB, obj.SmallLMTOverloadThresh_Reg, obj.SmallLMTOverloadThresh_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.SettlingDelayChipB, obj.SettlingDelay_Reg, obj.SettlingDelay_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.EnergyLostThreshChipB, obj.EnergyLostThresh_Reg, obj.EnergyLostThresh_Mask, 0, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.IncrementGainStepChipB, obj.IncrementGainStep_Reg, obj.IncrementGainStep_Mask, obj.IncrementGainStep_BitShift, obj.phyDevNameChipB);
                obj.setRegisterExtended(obj.DecPowMeasurementDurationChipB, obj.DecPowMeasurementDuration_Reg, obj.DecPowMeasurementDuration_Mask, 0, obj.phyDevNameChipB);
            end
        end

        function value = ReadFromRegisterFMComms5ChipB(obj, prop_name)
            if obj.ConnectedToDevice
                switch prop_name
                    case 'AttackDelay'
                        value = obj.getRegisterExtended(obj.AttackDelay_Reg, obj.AttackDelay_Mask, 0, obj.phyDevNameChipB);
                    case 'PeakOverloadWaitTime'
                        value = obj.getRegisterExtended(obj.PeakOverloadWaitTime_Reg, obj.PeakOverloadWaitTime_Mask, 0, obj.phyDevNameChipB);
                    case 'AGCLockLevel'
                        value = obj.getRegisterExtended(obj.AGCLockLevel_Reg, obj.AGCLockLevel_Mask, 0, obj.phyDevNameChipB);
                    case 'DecStepSizeFullTableCase3'
                        value = obj.getRegisterExtended(obj.DecStepSizeFullTableCase3_Reg, obj.DecStepSizeFullTableCase3_Mask, obj.DecStepSizeFullTableCase3_BitShift, obj.phyDevNameChipB);
                    case 'ADCSmallOverloadThresh'
                        value = obj.getRegisterExtended(obj.ADCSmallOverloadThresh_Reg, 0, obj.phyDevNameChipB);
                    case 'ADCLargeOverloadThresh'
                        value = obj.getRegisterExtended(obj.ADCLargeOverloadThresh_Reg, 0, obj.phyDevNameChipB);
                    case 'DecStepSizeFullTableCase2'
                        value = obj.getRegisterExtended(obj.DecStepSizeFullTableCase2_Reg, obj.DecStepSizeFullTableCase2_Mask, obj.DecStepSizeFullTableCase2_BitShift, obj.phyDevNameChipB);
                    case 'DecStepSizeFullTableCase1'
                        value = obj.getRegisterExtended(obj.DecStepSizeFullTableCase1_Reg, obj.DecStepSizeFullTableCase1_Mask, 0, obj.phyDevNameChipB);
                    case 'LargeLMTOverloadThresh'
                        value = obj.getRegisterExtended(obj.LargeLMTOverloadThresh_Reg, obj.LargeLMTOverloadThresh_Mask, 0, obj.phyDevNameChipB);
                    case 'SmallLMTOverloadThresh'
                        value = obj.getRegisterExtended(obj.SmallLMTOverloadThresh_Reg, obj.SmallLMTOverloadThresh_Mask, 0, obj.phyDevNameChipB);
                    case 'SettlingDelay'
                        value = obj.getRegisterExtended(obj.SettlingDelay_Reg, obj.SettlingDelay_Mask, 0, obj.phyDevNameChipB);
                    case 'EnergyLostThresh'
                        value = obj.getRegisterExtended(obj.EnergyLostThresh_Reg, obj.EnergyLostThresh_Mask, 0, obj.phyDevNameChipB);
                    case 'LowPowerThresh'
                        value = obj.getRegisterExtended(obj.LowPowerThresh_Reg, obj.LowPowerThresh_Mask, 0, obj.phyDevNameChipB);
                    case 'IncrementGainStep'
                        value = obj.getRegisterExtended(obj.IncrementGainStep_Reg, obj.IncrementGainStep_Mask, obj.IncrementGainStep_BitShift, obj.phyDevNameChipB);
                    case 'FAGCLockLevelGainIncreaseUpperLimit'
                        value = obj.getRegisterExtended(obj.FAGCLockLevelGainIncreaseUpperLimit_Reg, obj.FAGCLockLevelGainIncreaseUpperLimit_Mask, 0, obj.phyDevNameChipB);
                    case 'FAGCLPThreshIncrementTime'
                        value = obj.getRegisterExtended(obj.FAGCLPThreshIncrementTime_Reg, 0, 0, obj.phyDevNameChipB);
                    case 'DecPowMeasurementDuration'
                        value = obj.getRegisterExtended(obj.DecPowMeasurementDuration_Reg, obj.DecPowMeasurementDuration_Mask, 0, obj.phyDevNameChipB);
                    otherwise
                        error('Attempted to read unknown property %s\n', prop_name);
                end
            end
        end

    end
end
