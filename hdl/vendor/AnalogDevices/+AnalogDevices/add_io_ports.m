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
            'InterfaceID',    inout_id(rx.input,type), ...
            'InterfaceType',  inout(rx.input), ...
            'PortName',       inout_pn(rx.input), ...
            'PortWidth',      rx.width, ...
            'InterfaceConnection', rx.name, ...
            'IsRequired',     false);
    elseif strcmpi(rx.type,'data')        
        hRD.addInternalIOInterface( ...
            'InterfaceID',    inout_id_d(rx.input,root.chip,root.complex,type,rx.name), ...
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
disp(out);
end
%%
function out = inout_pn(in)
if in
    out = 'dut_data_valid_in';
else
    out = 'dut_data_valid_out';
end
disp(out);
end
%%
function out = inout_id_d(in,chip,complex,type,name)
num = name(end);
if strcmpi(type,'rx')
    if in
        if complex
            if strcmpi(name(end-1), 'i')
                out = sprintf('%s ADC Data I%s',chip,num);
            elseif strcmpi(name(end-1), 'q')
                out = sprintf('%s ADC Data Q%s',chip,num);
            else
                out = sprintf('%s ADC Data %s',chip,num);
            end
        else
            out = sprintf('%s ADC Data %s',chip,num);
        end
    else
        out = sprintf('IP Data %s OUT',num);
    end
else
    if ~in
        if complex
            if strcmpi(name(end-1), 'i')
                out = sprintf('%s DAC Data I%s',chip,num);
            elseif strcmpi(name(end-1), 'q')
                out = sprintf('%s DAC Data Q%s',chip,num);
            else
                out = sprintf('%s DAC Data %s',chip,num);
            end
        else
            out = sprintf('%s DAC Data %s',chip,num);
        end
    else
        out = sprintf('IP Data %s IN',num);
    end
end
disp(out);
end
%%
function out = inout_id(in,type)
if in
	if strcmpi(type,'rx')
           out = 'IP Valid Rx Data IN';
	else
           out = 'IP Valid Tx Data IN';
	end
else
	if strcmpi(type,'rx')
           out = 'IP Data Valid OUT';
	else
           out = 'IP Load Tx Data OUT';
	end
end
disp(out);
end
%%
function out = inout(in)
if in
    out = 'IN';
else
    out = 'OUT';
end
disp(out);
end

