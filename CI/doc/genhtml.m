mfiledir = '..\..\+adi\';
docdir = '..\..\doc\';
parts = {'AD9361'; 'AD9363'; 'AD9364'; ...
    'AD9371'; 'ADRV9009'; 'ADRV9361Z7035'; ...
    'ADRV9364Z7020'; 'ADRV9371'; 'FMComms2'; ...
    'FMComms3'; 'FMComms4'; 'PackRF'; 'Pluto'};
trx_files = {'Tx','Rx'};
for ii = 1:numel(parts)
    for jj = 1:numel(trx_files)
        dotmfilename = strcat(mfiledir, '+', parts{ii}, '\', trx_files{jj}, '.m');
        if isfile(dotmfilename)
            htmlfilename = strcat(docdir, parts{ii}, '_', trx_files{jj}, '.html');
            html = customDoc(dotmfilename);
            dlmwrite(htmlfilename, html, 'delimiter', '');
            use_local_css(htmlfilename)
            disp(htmlfilename);
        end
    end
end
publish('SysObjsProps.m','outputDir','..\..\doc');
publish('ADITTBHome.m','outputDir','..\..\doc');

%{
[filepath,name,ext] = fileparts(mfilename('fullpath'));
cd(filepath);
files = dir(filepath);

target = '../../doc/';

skip = {'NA'};

for f = {files.name}
    if strfind(f{:},'.mlx')>=0
        filename = f{:};
        if contains(filename,skip)
            continue;
        end
        htmlFilename = [filename(1:end-4),'.html'];
        disp(htmlFilename);
        matlab.internal.liveeditor.openAndConvert(filename,htmlFilename);
        movefile(htmlFilename,target);
    end
end
%}
