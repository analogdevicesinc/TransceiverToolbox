% rf_cs_narrow: narrow the carrier-sync loop BW ~0.5x (prop x0.5, integ x0.25)
% to reduce phase-noise-induced jitter if the LO offset is small.
sys = 'commhdlQPSKTxRxLoopback';
lfs = find_system(sys,'LookUnderMasks','all','FollowLinks','on','BlockType','SubSystem','Name','Loop Filter');
csLF=''; for i=1:numel(lfs), if contains(lfs{i},'Carrier Synchronizer'), csLF=lfs{i}; end; end
assert(~isempty(csLF),'Carrier Sync Loop Filter not found');
set_param([csLF '/Gain1'],'Gain','fi(CSLoopFilterPropGain*0.5/(2*pi),0,16,16)');
set_param([csLF '/Gain'], 'Gain','fi(CSLoopFilterIntegGain*0.25/(2*pi),0,16,16)');
fprintf('rf_cs_narrow: carrier-sync loop BW ~x0.5 (prop x0.5, integ x0.25)\n');
