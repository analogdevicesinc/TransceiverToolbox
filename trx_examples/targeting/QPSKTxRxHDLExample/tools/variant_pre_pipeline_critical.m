% variant_pre_pipeline_critical.m -- composite_pipeline_critical
%
% Add HDL Coder pipeline registers on the wide-multiplier / loop-filter paths
% identified as critical-timing. OutputPipeline=3 means HDL Coder will insert 3
% pipeline registers after the block's output. Sim semantics are unchanged
% (delay-equivalent); synthesis sees broken-up combinational paths → more
% timing slack → fixes the 6 ps WHS margin that's causing metastability.

sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);

% Pipeline ONLY forward-only blocks (no feedback loops). The CS/SS/AGC
% Loop_Filter blocks are inside feedback loops where extra latency exceeds
% the loop's delay budget (HDL check error: "Delay balancing unsuccessful.
% An extra N cycles of latency introduced by optimizations in the feedback
% loop cannot be offset using design delays for the loop latency budget").
% Phase_Ambiguity_{Estimator,Corrector} are forward-only — safe to pipeline.
critical = { ...
    [sys '/TxRxComposite/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator'], 3; ...
    [sys '/TxRxComposite/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector'], 3; ...
};

for k = 1:size(critical, 1)
    blk = critical{k,1};
    pipeN = critical{k,2};
    try
        old = hdlget_param(blk, 'OutputPipeline');
        hdlset_param(blk, 'OutputPipeline', pipeN);
        fprintf('  %s: OutputPipeline %d -> %d\n', strrep(blk, [sys '/'], ''), old, pipeN);
    catch err
        fprintf('  %s: FAILED (%s)\n', strrep(blk, [sys '/'], ''), err.message);
    end
end

save_system(sys, [], 'OverwriteIfChangedOnDisk', true);
fprintf('variant_pre_pipeline_critical: done.\n');
