% rf_cs_wide: widen the carrier-sync loop BW ~2x (prop x2, integ x4) to track
% the Tx/Rx LO frequency offset of the cable RF loopback more aggressively.
sys = 'commhdlQPSKTxRxLoopback';
lfs = find_system(sys,'LookUnderMasks','all','FollowLinks','on','BlockType','SubSystem','Name','Loop Filter');
csLF=''; for i=1:numel(lfs), if contains(lfs{i},'Carrier Synchronizer'), csLF=lfs{i}; end; end
assert(~isempty(csLF),'Carrier Sync Loop Filter not found');
set_param([csLF '/Gain1'],'Gain','fi(CSLoopFilterPropGain*2/(2*pi),0,16,16)');
set_param([csLF '/Gain'], 'Gain','fi(CSLoopFilterIntegGain*4/(2*pi),0,16,16)');
fprintf('rf_cs_wide: carrier-sync loop BW ~x2 (prop x2, integ x4)\n');
