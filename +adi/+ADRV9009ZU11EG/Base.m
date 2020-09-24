classdef (Abstract, Hidden = true) Base < adi.ADRV9009.Base
    
    %adi.ADRV9009ZU11EG.Base Class
    %   This class contains shared parameters and methods between TX and RX
    %   classes
    
    properties
        %CenterFrequencyChipB Center Frequency Chip B
        %   RF center frequency, specified in Hz as a scalar. The
        %   default is 2.4e9.  This property is tunable.
        CenterFrequencyChipB = 2.4e9;
    end
    
    properties (Nontunable, Logical)
        %EnableFrequencyHoppingModeCalibrationChipB Enable Frequency Hopping Mode Calibration Chip B
        %   Option to enable frequency hopping mode VCO calibration, 
        %   specified as true or false. When this property is true, at
        %   initialization VCO calibration lookup table is populated
        EnableFrequencyHoppingModeCalibrationChipB = false;
    end
    
    methods
        % Check CenterFrequencyChipB
        function set.CenterFrequencyChipB(obj, value)
            validateattributes( value, { 'double','single' }, ...
                { 'real', 'positive','scalar', 'finite', 'nonnan', 'nonempty','integer','>=',70e6,'<=',6e9}, ...
                '', 'CenterFrequencyChipB');
            obj.CenterFrequencyChipB = value;
            if obj.ConnectedToDevice
                id = 'altvoltage0';
                obj.setAttributeLongLong(id,'frequency',value,true);
            end
        end
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
               
        function icon = getIconImpl(obj)
            icon = sprintf(['ADRV9009ZU11EG ',obj.Type]);
        end
        
    end
    
    %% External Dependency Methods
    methods (Hidden, Static)
        
        function bName = getDescriptiveName(~)
            bName = 'ADRV9009ZU11EG';
        end
        
    end
end

