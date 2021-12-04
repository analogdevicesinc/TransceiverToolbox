function root = add_io_ports(hRD,project,type,fpga)

[filepath,~,~] = fileparts(mfilename('fullpath'));
fileName = fullfile(filepath,'ports.json');
fid = fopen(fileName);
raw = fread(fid,inf);
str = char(raw');
fclose(fid);
data = jsondecode(str);


if ~contains(fields(data),project)
    error(sprintf('No project found in database for %s',project));
end

root = getfield(data, project);

if ~contains(root.supported_rd,type)
    error(sprintf('No project found in database for %s',project));
end

if ~contains(root.fpga,fpga)
    error(sprintf('No project found in database for %s',fpga));
end


if contains(type,'rx')
    process(hRD, root.ports.rx, root, 'rx');
elseif contains(type,'tx')
    process(hRD, root.ports.tx, root, 'tx');
else
    process(hRD, root.ports.rx, root, 'rx');
    process(hRD, root.ports.tx, root, 'tx');
end


end

function process(hRD, rtx, root, type)
for i = 1:length(rtx)
    rx = rtx(i);
    if strcmpi(rx.type,'valid')
        hRD.addInternalIOInterface( ...
            'InterfaceID',    inout_id(rx.input), ...
            'InterfaceType',  inout(rx.input), ...
            'PortName',       inout_pn(rx.input), ...
            'PortWidth',      rx.width, ...
            'InterfaceConnection', rx.name, ...
            'IsRequired',     false);
    elseif strcmpi(rx.type,'data')
        for j=1:rx.count
            hRD.addInternalIOInterface( ...
                'InterfaceID',    inout_id_d(rx.input,j,root.chip,root.complex,type), ...
                'InterfaceType',  inout(rx.input), ...
                'PortName',       inout_pn_d(rx.input), ...
                'PortWidth',      rx.width, ...
                'InterfaceConnection', update_port(rx.name,j-1), ...
                'IsRequired',     false);
        end
    else
        error(sprintf('Unknown port type %s',rx.type));
    end
end
end

%%
function out = inout_pn_d(in)
if in
    out = 'dut_data_in';
else
    out = 'dut_data_out';
end
end
%%
function out = inout_pn(in)
if in
    out = 'dut_data_valid_in';
else
    out = 'dut_data_valid_out';
end
end
%%
function out = inout_id_d(in,num,chip,complex,type)

if strcmpi(type,'rx')
    if in
        if complex
            numC = floor((num-1)/2);
            if fix(num/2) == num/2 % even
                out = sprintf('%s ADC Data I%d',chip,numC);
            else
                out = sprintf('%s ADC Data Q%d',chip,numC);
            end
        else
            out = sprintf('%s ADC Data %d',chip,num-1);
        end
    else
        out = sprintf('IP Data %d OUT',num-1);
    end
else
    if ~in
        if complex
            numC = floor((num-1)/2);
            if fix(num/2) == num/2 % even
                out = sprintf('%s DAC Data I%d',chip,numC);
            else
                out = sprintf('%s DAC Data Q%d',chip,numC);
            end
        else
            out = sprintf('%s DAC Data %d',chip,num-1);
        end
    else
        out = sprintf('IP Data %d IN',num-1);
    end
end

end
%%
function out = inout_id(in)
if in
    out = 'IP Valid Rx Data IN';
else
    out = 'IP Data Valid OUT';
end
end
%%
function out = inout(in)
if in
    out = 'IN';
else
    out = 'OUT';
end
end
%%
function out = update_port(temp,num)
out = strrep(temp,'@',num2str(num));
end

