classdef Version
    %Version
    %   BSP Version information
    properties(Constant)
        HDL = 'hdl_2018_r2';
        Vivado = '2018.3';
        MATLAB = 'R2020b';
        Release = '20.1.2';
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

