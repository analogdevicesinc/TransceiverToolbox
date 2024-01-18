[filepath,name,ext] = fileparts(mfilename('fullpath'));
cd(filepath);
cd(fullfile('..','..','..'));
files = dir(filepath);

mfiledir = fullfile('adi');
docdir = fullfile('doc');
parts = {'AD9361'; 'AD9363'; 'AD9364'; ...
    'AD9371'; 'ADRV9009'; 'ADRV9361Z7035'; ...
    'ADRV9364Z7020'; 'ADRV9371'; 'FMComms2'; ...
    'FMComms3'; 'FMComms4'; 'PackRF'; 'Pluto';...
    'ADRV9002'; 'FMComms8'; 'ADRV9009ZU11EG'};
trx_files = {'Tx','Rx'};

all_devs = [];
for ii = 1:numel(parts)
    for jj = 1:numel(trx_files)
        all_props = [];
        dotmfilename = strcat(mfiledir, '.', parts{ii}, '.', trx_files{jj});
        props = properties(dotmfilename);
        for prop = 1:length(props)

            if strcmpi(prop,"enIO")
                continue;
            end
            pdoc = help(strcat(dotmfilename,'.',props{prop}));
            
            pdocs = strsplit(pdoc,'\n');
            prop_title = pdocs{1};
            prop_description = strip(replace(strjoin(pdocs(2:end),'\n'),'\n',''));
            prop_description = int32(prop_description);
            prop_description(prop_description==10) = [];
            prop_description(prop_description==13) = [];
            prop_description = char(prop_description);
            prop_description = replace(prop_description,'    ',' ');
            prop_description = replace(prop_description,'  ',' ');
            
            s = struct('prop_name',props{prop},...
                'prop_title',prop_title,...
                'prop_description',prop_description);
            all_props = [all_props,s];
        end
        top_doc = help(dotmfilename);
        top_doc = strsplit(top_doc,'\n');
        top_doc = replace(top_doc,'\n','<br>');
        top_doc = strjoin(top_doc(2:end),'<br>');

%         top_doc = strip(replace(top_doc,'\n',''));
%         top_doc = int32(top_doc);
%         top_doc(top_doc==10) = [];
%         top_doc(top_doc==13) = [];
%         top_doc = char(top_doc);
%         top_doc = replace(top_doc,'    ',' ');
%         top_doc = replace(top_doc,'  ',' ');

        
        oname = struct('name',dotmfilename, 'dec',top_doc, 'props',all_props);
        all_devs = [all_devs, oname];
    end
end
%%
jsonText = jsonencode(all_devs,'PrettyPrint',true);
fid = fopen(fullfile('CI','gen_doc','docs','sysobjs.json'), 'w');
fprintf(fid, '%s', jsonText);
fclose(fid);

