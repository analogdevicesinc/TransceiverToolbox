function use_local_css(html_file)
    url_str = 'https://localhost:31515/static/help/includes/product/css/';
    contents = fileread(html_file);
    str_loc = strfind(contents, url_str);
    contents(str_loc:str_loc+numel(url_str)-1) = [];
    
    fid = fopen(html_file,'w');
    fprintf(fid, '%s', contents);
    fclose(fid);
end