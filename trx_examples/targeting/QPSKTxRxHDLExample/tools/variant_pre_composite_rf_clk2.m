% rf_clk2: set the ADI ref-design 'Fast-slow clock ratio' (multiple) from 1 to
% 2, to match the actual IPCORE_CLK(adc_1_clk ~125MHz)/sample-rate(15.36MHz)~8
% ratio. A wrong ratio makes the data/valid clock-enable aperiodic -> sample
% slips (the suspected RF-acquisition + BER-floor cause).
wfFile = 'hdlworkflow_loopback.m';
txt = fileread(wfFile);
txt2 = strrep(txt, '''multiple'',''1''', '''multiple'',''2''');
if strcmp(txt,txt2)
  txt2 = regexprep(txt, '''multiple''\s*,\s*''1''', '''multiple'',''2''');
end
assert(~strcmp(txt,txt2), 'could not find multiple,1 in workflow');
fid=fopen(wfFile,'w'); fwrite(fid,txt2); fclose(fid);
fprintf('rf_clk2: ref-design multiple 1->2\n');
