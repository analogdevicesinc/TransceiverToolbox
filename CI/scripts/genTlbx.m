function genTlbx(examples)

if nargin==0
    examples = 0;
end

% Lookup versioning info from adi.Version
cwd = pwd;
parts = strsplit(mfilename('fullpath'),filesep);
tbroot = strjoin(parts(1:end-3),filesep);
cd(tbroot);
v = adi.Version;
uuid = matlab.lang.internal.uuid;

%% Unpack verilog source
if ~examples
    cd('../../');
    cd('hdl/vendor/AnalogDevices/vivado');
    !find -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' _ {} \;
    !find . -name "*.zip" -type f -delete
    cd('../../../..');
    cd('CI/scripts');
end

%%
cd(fileparts((mfilename('fullpath'))));
cd('../..');
p = pwd;
cd(fileparts((mfilename('fullpath'))));

if examples
    fid  = fopen('bsp.tmpl','r');
else
    fid  = fopen('bsp_noexamples.tmpl','r');
end
f=fread(fid,'*char')';
fclose(fid);

f = strrep(f,'__REPO-ROOT__',p);
f = strrep(f,'__VERSION__',v.Release);
f = strrep(f,'__ML-RELEASE__',v.MATLAB);
f = strrep(f,'__APP-NAME__',v.AppName);
f = strrep(f,'__EXAMPLES-DIR__',v.ExamplesDir);
f = strrep(f,'__UUID__',uuid);

fid  = fopen('../../bsp.prj','w');
fprintf(fid,'%s',f);
fclose(fid);

cd('../..');
addpath(genpath(matlabshared.supportpkg.getSupportPackageRoot));
addpath(genpath('.'));
rmpath(genpath('.'));
if examples
    ps = {'doc',v.ExamplesDir};
else
    ps = {'doc'};
end
if isprop(v,'HasHDL') && v.HasHDL
    ps = [ps(:)',{'hdl'}];
end

paths = '';
for p = ps
    pp = genpath(p{:});
    ppF = pp;
    pp = pp(1:end-1);
    pp = strrep(pp,':','</matlabPath><matlabPath>');
    paths = [paths,['<matlabPath>',pp,'</matlabPath>']]; %#ok<AGROW>
    addpath(ppF);
end
rehash
projectFile = 'bsp.prj';
currentVersion = matlab.addons.toolbox.toolboxVersion(projectFile);
if examples
    outputFile = sprintf('AnalogDevices%s_v%s',v.ToolboxName,currentVersion);
else
    outputFile = sprintf('AnalogDevices%s_noexamples_v%s',v.ToolboxName,currentVersion);
end
matlab.addons.toolbox.packageToolbox(projectFile,outputFile)

if ~usejava('desktop')
    %% Update toolbox paths
    mkdir other
    movefile([outputFile,'.mltbx'], ['other/',outputFile,'.zip']);
    cd other
    unzip([outputFile,'.zip'],'out');
    cd('out')
    cd('metadata');
    fid  = fopen('configuration.xml','r');
    f=fread(fid,'*char')';
    fclose(fid);
    
    s = '</matlabPaths>';
    sections = strsplit(f,s);
    s1 = sections{1};
    s2 = sections{2};
    newfile = [s1,paths,s,s2];
    
    fid  = fopen('configuration.xml','w');
    fprintf(fid,'%s',newfile);
    fclose(fid);
    
    %% Repack
    cd('..');
    zip([outputFile,'.zip'], '*');
    movefile([outputFile,'.zip'],['../../',outputFile,'.mltbx']);
    cd('../..');
    rmdir('other','s');
end

delete bsp.prj



