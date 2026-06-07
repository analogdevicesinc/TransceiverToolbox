% cfc_a10: shorten the Coarse Frequency Estimator averaging window to 2^10
% (baseline integAvgLen = 2^15 = 32768 sym ~= 29 packets, far too long to track
% the cable's time-varying Tx/Rx LO CFO -- it only removes the DC mean and dumps
% the residual on the carrier sync). Shorter window -> coarse stage tracks faster.
sys = 'commhdlQPSKTxRxLoopback';
b = find_system(sys,'LookUnderMasks','all','FollowLinks','on','BlockType','SubSystem','Name','QPSK Rx');
qrx=''; for i=1:numel(b), mi=get_param(b{i},'MaskInitialization'); if contains(mi,'integAvgLen = 2^15'), qrx=b{i}; end; end
assert(~isempty(qrx),'QPSK Rx mask (integAvgLen=2^15) not found');
mi = get_param(qrx,'MaskInitialization');
mi = strrep(mi,'integAvgLen = 2^15;','integAvgLen = 2^10;');
set_param(qrx,'MaskInitialization',mi);
assert(contains(get_param(qrx,'MaskInitialization'),'integAvgLen = 2^10;'),'overlay failed');
fprintf('cfc_a10: Coarse Frequency Estimator integAvgLen 2^15 -> 2^10 (%d sym)\n', 2^10);
