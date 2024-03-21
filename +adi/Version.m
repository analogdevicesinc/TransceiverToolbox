classdef Version
    %Version
    %   BSP Version information
    properties(Constant)
        HDL = 'hdl_2021_r2';
        Vivado = '2021.2';
        MATLAB = 'R2023b';
        Release = '23.2.1';
        AppName = 'Analog Devices, Inc. Transceiver Toolbox';
        ToolboxName = 'TransceiverToolbox';
        ToolboxNameShort = 'trx';
        ExamplesDir = 'trx_examples';
        HasHDL = true;
    end
    properties(Dependent)
        VivadoShort
    end
    
    methods
        function value = get.VivadoShort(obj)
            value = obj.Vivado(1:6); 
        end
    end
end

