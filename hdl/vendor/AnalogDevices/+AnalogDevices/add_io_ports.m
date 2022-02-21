function root = add_io_ports(hRD,project,type,fpga)

[filepath,~,~] = fileparts(mfilename('fullpath'));
fileName = fullfile(filepath,'ports.json');
fid = fopen(fileName);
raw = fread(fid,inf);
str = char(raw');
fclose(fid);
data = jsondecode(str);

project = erase(project,'-');
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
    process(hRD, root.ports.rx, 'rx');
end
if contains(type,'tx')
    process(hRD, root.ports.tx, 'tx');
end


end

function process(hRD, rtx, type)
count = [-1 -1];
for i = 1:length(rtx)
    rx = rtx(i);
    if strcmpi(rx.type,'valid')
        hRD.addInternalIOInterface( ...
            'InterfaceID',    rx.m_name, ...
            'InterfaceType',  inout(rx.input), ...
            'PortName',       inout_pn(rx.input, type), ...
            'PortWidth',      rx.width, ...
            'InterfaceConnection', rx.name, ...
            'IsRequired',     false);
    elseif strcmpi(rx.type,'data')
        if strcmp(rx.input, 'true')
            count(1)=count(1)+1;
        else
            count(2)=count(2)+1;
        end
        hRD.addInternalIOInterface( ...
            'InterfaceID',    rx.m_name, ...
            'InterfaceType',  inout(rx.input), ...
            'PortName',       inout_pn_d(rx.input,count,type), ...
            'PortWidth',      rx.width, ...
            'InterfaceConnection', rx.name, ...
            'IsRequired',     false);        
    else
        error(sprintf('Unknown port type %s',rx.type));
    end
end
end

%%
function out = inout_pn_d(in,count,type)
if strcmp(in, 'true')
    out = sprintf('dut_data_in_%d_%s',count(1), type);
else
    out = sprintf('dut_data_out_%d_%s',count(2), type);
end
end
%%
function out = inout_pn(in, type)
    if strcmp(in, 'true')
        out = sprintf('dut_data_valid_in_%s', type);
    else
        out = sprintf('dut_data_valid_out_%s', type);
    end
end
%%
function out = inout(in)
if strcmp(in, 'true')
    out = 'IN';
else
    out = 'OUT';
end
end

