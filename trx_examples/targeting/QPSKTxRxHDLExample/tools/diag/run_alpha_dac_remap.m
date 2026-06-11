%% run_alpha_dac_remap — re-run HDL workflow with corrected Tx output IOInterface
%% mappings (ADRV9002 DAC Data I0/Q0 instead of IP Data 0/1 OUT).
%% Model unchanged; just re-run codegen + Vivado.

cd(fileparts(mfilename('fullpath')));
addpath(pwd);

fprintf('=== STEP 1: rebuild composite model (idempotent) ===\n');
build_composite

fprintf('\n=== STEP 2: launch HDL workflow with DAC remap ===\n');
hdlworkflow_loopback
