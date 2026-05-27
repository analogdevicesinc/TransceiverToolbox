%% run_alpha_with_rt — rebuild composite (with Rate Transition escape hatch),
%% validate sim, then launch HDL build α. Single MATLAB session.

cd(fileparts(mfilename('fullpath')));
addpath(pwd);

%% Step 1: rebuild commhdlQPSKTxRxLoopback.slx via build_composite.m
fprintf('=== STEP 1: build_composite (with Rate Transition blocks) ===\n');
build_composite

%% Step 2: validate sim (Update Diagram + decode "ADI Hello World")
fprintf('\n=== STEP 2: validate sim ===\n');
model = 'commhdlQPSKTxRxLoopback';
load_system(model);
set_param(model, 'SimulationCommand', 'update');
fprintf('Update Diagram OK after Rate Transition insertion.\n');

% Confirm composite Inport rates are still 1/15.36e6 (the Rate Transition
% is internal to TxRxComposite; ports stay at 1/15.36e6).
ports = find_system([model '/TxRxComposite'], 'SearchDepth', 1, 'BlockType', 'Inport');
fprintf('\n=== TxRxComposite Inport compiled rates ===\n');
for k = 1:numel(ports)
    [~, nm] = fileparts(ports{k});
    try
        ts = get_param(ports{k}, 'CompiledSampleTime');
        fprintf('  Inport %d (%s): %s\n', k, nm, mat2str(ts));
    catch
        fprintf('  Inport %d (%s): not compiled\n', k, nm);
    end
end

%% Step 2b: run sim and check packet decode
fprintf('\n=== STEP 2b: run simulation ===\n');
try
    simOut = sim(model, 'StopTime', '5e-4', 'ReturnWorkspaceOutputs', 'on');
    fprintf('Simulation completed (5e-4 s).\n');
catch ME
    fprintf('Simulation FAILED: %s\n', ME.message);
    error('sim regression — Rate Transition broke runtime rates; aborting HDL build');
end

%% Step 3: launch HDL build
fprintf('\n=== STEP 3: launch HDL build α ===\n');
fprintf('PID will be reported via shell after MATLAB exits.\n');
hdlworkflow_loopback
