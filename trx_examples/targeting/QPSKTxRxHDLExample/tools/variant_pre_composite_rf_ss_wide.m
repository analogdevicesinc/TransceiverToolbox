% rf_ss_wide: widen the symbol-sync (timing) loop BW ~2x (K1 x2, K2 x4) to
% track the cable fractional-delay timing offset faster.
sys = 'commhdlQPSKTxRxLoopback';
lfs = find_system(sys,'LookUnderMasks','all','FollowLinks','on','BlockType','SubSystem','Name','Loop Filter');
ssLF=''; for i=1:numel(lfs), if contains(lfs{i},'Symbol Synchronizer'), ssLF=lfs{i}; end; end
assert(~isempty(ssLF),'Symbol Sync Loop Filter not found');
set_param([ssLF '/K1'],'Gain','fi(SSLoopFilterPropGain*2,1,24,24)');
set_param([ssLF '/K2'],'Gain','fi(SSLoopFilterIntegGain*4,1,24,24)');
fprintf('rf_ss_wide: symbol-sync loop BW ~x2 (K1 x2, K2 x4)\n');
