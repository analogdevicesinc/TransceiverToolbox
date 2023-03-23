classdef Version
    %Version
    %   BSP Version information
    properties(Constant)
        HDL = 'hdl_2021_r1';
        Vivado = '2021.1';
        MATLAB = 'R2022a';
        Release = '22.1.1';
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

