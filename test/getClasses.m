function sysobjs = getClasses()
    cpwd = pwd;
    [filepath,~,~] = fileparts(mfilename('fullpath'));
    cd(filepath)
    cd('..');

    filelist = dir(fullfile('+adi', ['**',filesep,'/*.*']));
    
    sysobjs = {};

    for fi = 1:length(filelist)
        name = filelist(fi).name;
        if strcmp(name,'Rx.m') || strcmp(name,'Tx.m')
            ffile = [filelist(fi).folder, filesep, name];
            parts = strsplit(ffile,filesep);
            name = parts{end-1}; name = name(2:end);
            if strcmp(name,'common')
                continue;
            end
            if strcmp(name,'AD916x')
                continue
            end
            rxtx = parts{end}; rxtx = rxtx(1:end-2);
            sysobjs = [sysobjs(:)', {[name,'.',rxtx]}];
        end
    end
    cd(cpwd);
end