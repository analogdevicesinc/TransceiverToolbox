cd(fileparts((mfilename('fullpath'))));
p = pwd;

version = '20.1.2';
ml = ver('MATLAB');
ml = ml.Release(2:end-1);

tmpl_name = 'LTEPA.tmpl';
fid  = fopen(tmpl_name,'r');
f=fread(fid,'*char')';
fclose(fid);

f = strrep(f,'__REPO-ROOT__',p);
f = strrep(f,'__VERSION__',version);
f = strrep(f,'__ML-RELEASE__',ml);
f = strrep(f,'__SP-ROOT__',matlabshared.supportpkg.getSupportPackageRoot());

tmpl_name_parts = strsplit(tmpl_name, '.');
app_name = tmpl_name_parts{1};
projectfile = strcat(app_name, '.prj');
fid  = fopen(projectfile,'w');
for ii=1:size(f,2)
    fprintf(fid,'%s',f(ii));
end
fclose(fid);

fprintf('Starting deploytool to create installer for LTE PA app...\n');
deploytool('-package', projectfile);
delete(projectfile);
