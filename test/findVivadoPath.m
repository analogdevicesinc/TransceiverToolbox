function pathname = findVivadoPath(vivado)
%FINDVIVADOPATH Locate the Vivado executable for a given version.
%   PATHNAME = FINDVIVADOPATH(VIVADO) returns the path to the Vivado
%   executable for version VIVADO (e.g. '2025.1'). The CUSTOM_VIVADO_PATH
%   environment variable takes precedence when set. Otherwise both install
%   layouts are checked:
%     2025.1 and later: <root>/<version>/Vivado/bin/vivado
%     2024.2 and older: <root>/Vivado/<version>/bin/vivado
%   If no candidate exists, the first candidate is returned so callers can
%   report a meaningful path.

pathname = getenv('CUSTOM_VIVADO_PATH');
if ~isempty(pathname)
    fprintf('Using custom Vivado path: %s\n', pathname);
    return;
end

if ispc
    candidates = { ...
        fullfile('C:\Xilinx', vivado, 'Vivado', 'bin', 'vivado.bat'), ...
        fullfile('C:\Xilinx', 'Vivado', vivado, 'bin', 'vivado.bat')};
else
    candidates = { ...
        ['/opt/Xilinx/', vivado, '/Vivado/bin/vivado'], ...
        ['/opt/Xilinx/Vivado/', vivado, '/bin/vivado'], ...
        ['/tools/Xilinx/', vivado, '/Vivado/bin/vivado'], ...
        ['/tools/Xilinx/Vivado/', vivado, '/bin/vivado']};
end

pathname = candidates{1};
for k = 1:numel(candidates)
    if exist(candidates{k}, 'file')
        pathname = candidates{k};
        return;
    end
end
end
