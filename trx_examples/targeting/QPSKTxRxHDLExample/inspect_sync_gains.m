function inspect_sync_gains()
% Locate the carrier-sync and symbol-sync loop-filter Gain blocks in the
% Receiver so the BER-tuning variant overlays can target them precisely.
    here = fileparts(mfilename('fullpath')); addpath(here);
    addpath(fileparts(fileparts(fileparts(here))));
    load_system('commhdlQPSKTxRx');
    rx = 'commhdlQPSKTxRx/Receiver';

    report = @(label, sub) dumpGains(label, sub);
    fprintf('\n==== Synchronizer subsystems under Receiver ====\n');
    subs = find_system(rx, 'LookUnderMasks','all','FollowLinks','on', ...
        'BlockType','SubSystem','regexp','on','Name','(Carrier|Symbol|Loop Filter|Time)');
    for i=1:numel(subs), fprintf('  SUB: %s\n', subs{i}); end

    fprintf('\n==== Gain blocks under Carrier Synchronizer ====\n');
    dumpGainsUnder(rx, 'Carrier Synchronizer');
    fprintf('\n==== Gain blocks under Symbol Synchronizer ====\n');
    dumpGainsUnder(rx, 'Symbol Synchronizer');
end

function dumpGainsUnder(rx, name)
    s = find_system(rx, 'LookUnderMasks','all','FollowLinks','on', ...
        'BlockType','SubSystem','Name',name);
    if isempty(s), fprintf('  (no subsystem named "%s")\n', name); return; end
    g = find_system(s{1}, 'LookUnderMasks','all','FollowLinks','on','BlockType','Gain');
    for i=1:numel(g)
        try, v = get_param(g{i}, 'Gain'); catch, v = '?'; end
        fprintf('  GAIN  %-70s = %s\n', strrep(g{i}, [rx '/'], ''), v);
    end
end

function dumpGains(~,~)
end
