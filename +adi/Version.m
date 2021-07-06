classdef Version
    %Version
    %   BSP Version information
    properties(Constant)
        HDL = 'hdl_2019_r2';
        Vivado = '2019.1';
        MATLAB = 'R2021a';
        Release = '21.1.1';
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

