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
    process(hRD, root.ports.rx);
end
if contains(type,'tx')
    process(hRD, root.ports.tx);
end


end

function process(hRD, rtx)
for i = 1:length(rtx)
    rx = rtx(i);
    if strcmpi(rx.type,'valid')
        hRD.addInternalIOInterface( ...
            'InterfaceID',    rx.m_name, ...
            'InterfaceType',  inout(rx.input), ...
            'PortName',       inout_pn(rx.input), ...
            'PortWidth',      rx.width, ...
            'InterfaceConnection', rx.name, ...
            'IsRequired',     false);
    elseif strcmpi(rx.type,'data')
        hRD.addInternalIOInterface( ...
            'InterfaceID',    rx.m_name, ...
            'InterfaceType',  inout(rx.input), ...
            'PortName',       inout_pn_d(rx.input,rx.name), ...
            'PortWidth',      rx.width, ...
            'InterfaceConnection', rx.name, ...
            'IsRequired',     false);        
    else
        error(sprintf('Unknown port type %s',rx.type));
    end
end
end

%%
function out = inout_pn_d(in,name)
persistent in_count;
if in
    if isempty(in_count) || (in_count == 4)
        in_count = 0;
    end
    out = sprintf('dut_data_in_%d',in_count);
    in_count=in_count+1;
else
    out = sprintf('dut_data_out_%s',name(end));
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
function out = inout(in)
if strcmp(in, 'true')
    out = 'IN';
else
    out = 'OUT';
end
end

