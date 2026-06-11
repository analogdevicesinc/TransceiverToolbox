here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
fts='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer';
% find the coarse frequency block(s)
fprintf('=== Subsystems under Freq & Time Synchronizer ===\n');
s=find_system(fts,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','SubSystem');
for i=1:numel(s), fprintf('  %s\n', strrep(s{i},[fts '/'],'')); end
% locate anything "Coarse" / "Frequency"
cf=find_system(fts,'LookUnderMasks','all','FollowLinks','on','Regexp','on','Name','[Cc]oarse|Frequency Compensat|Frequency Estimat');
fprintf('\n=== Coarse/Frequency blocks ===\n');
for i=1:numel(cf), fprintf('  %s\n', strrep(cf{i},'commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/','')); end
