function [Number_of_inputs, Number_of_valids, Data_width] = set_params(project, design)

    switch lower(project)
        case 'adrv9002'
            Number_of_inputs = '4';
            Number_of_valids = '1';
            Data_width = '16';
        case 'adrv9009'
            Number_of_inputs = '4';
            Number_of_valids = '1';
            Data_width = '32'; % 32-16 bit hybrid
        case 'fmcomms8'
            Number_of_inputs = '8';
            Number_of_valids = '1';
            Data_width = '32'; % 32-16 bit hybrid
        case {'pluto'}
            Number_of_inputs = '2';
            Number_of_valids = '1';
            Data_width = '16';
        case {'adrv9361-z7035', 'adrv9364-z7020', 'fmcomms2', 'fmcomms5'}
            Number_of_inputs = '4';
            Number_of_valids = '1';
            Data_width = '16';
        case 'adrv9371'
            Number_of_inputs = '4';
            Number_of_valids = '1';
            Data_width = '32';
        otherwise
            Number_of_inputs = '0';
            Number_of_valids = '0';
            Data_width = '0';
    end
end
