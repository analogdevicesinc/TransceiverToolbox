% rx_thr_03: lower the preamble-detection threshold to 0.03x (acquire the
% degraded cable-RF correlation peaks; cable locks only ~16/s at default).
sys='commhdlQPSKTxRxLoopback';
g=find_system(sys,'LookUnderMasks','all','FollowLinks','on','BlockType','Gain','Name','Gain');
thr='';
for i=1:numel(g)
  if contains(g{i},'Magnitude Squared and Moving Sum')
    v=get_param(g{i},'Gain');
    if contains(v,'Thresold')||contains(v,'Threshold'), thr=g{i}; end
  end
end
assert(~isempty(thr),'preamble threshold Gain not found');
set_param(thr,'Gain','fi(ThresoldGainFac*0.03,0,16,16)');
fprintf('rx_thr_03: preamble threshold x0.03\n');
