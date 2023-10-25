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

% Check for deps
if ~isfolder('deps')
    error('deps folder with libad9361 not available')
else
    ps = [ps(:)',{'deps'}];
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

delete bsp.prj



