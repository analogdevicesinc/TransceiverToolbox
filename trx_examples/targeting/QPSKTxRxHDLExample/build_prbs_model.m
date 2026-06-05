function build_prbs_model()
%BUILD_PRBS_MODEL  Construct commhdlPRBSLoopback.slx from scratch.
%   Builds the ADRV9002 PRBS digital-loopback interface-test model:
%     * PRBSLoopback  - the HDL DUT subsystem (in/out ports + a MATLAB
%                       Function block running PRBSEngine).
%     * a top-level loopback testbench that wires the DUT's Tx outputs back
%       to its Rx inputs through unit delays (models the bit-exact ADRV9002
%       SSI digital loopback) so the model both simulates standalone and is
%       HDL-targetable on the PRBSLoopback subsystem.
%
%   Run this in MATLAB (R2025b) with the QPSKTxRxHDLExample folder on the
%   path; it overwrites any existing commhdlPRBSLoopback.slx in pwd.
%
%   DUT for the HDL workflow: 'commhdlPRBSLoopback/PRBSLoopback'
%   (see hdlworkflow_prbs.m). Verify with PrbsLoopbackModelTest.

    model = 'commhdlPRBSLoopback';
    dut   = [model '/PRBSLoopback'];

    % ---- start clean ----
    if bdIsLoaded(model), close_system(model, 0); end
    if exist([model '.slx'], 'file'), delete([model '.slx']); end
    new_system(model);
    load_system(model);

    % ---- DUT subsystem ----
    add_block('built-in/Subsystem', dut);

    % Inports (DUT boundary -> HDL interface mapping done in hdlworkflow_prbs)
    addPort(dut, 'Inport',  'adc_dataInI', 1, 'int16');
    addPort(dut, 'Inport',  'adc_dataInQ', 2, 'int16');
    addPort(dut, 'Inport',  'adc_validIn', 3, 'boolean');
    addPort(dut, 'Inport',  'prbs_control', 4, 'uint32');

    % Outports
    addPort(dut, 'Outport', 'tx_dataOutI', 1, '');
    addPort(dut, 'Outport', 'tx_dataOutQ', 2, '');
    addPort(dut, 'Outport', 'tx_validOut', 3, '');
    addPort(dut, 'Outport', 'sample_count', 4, '');
    addPort(dut, 'Outport', 'bit_errors_I', 5, '');
    addPort(dut, 'Outport', 'bit_errors_Q', 6, '');
    addPort(dut, 'Outport', 'lock_status', 7, '');

    % MATLAB Function block running the PRBS engine
    fcn = [dut '/PRBSEngine'];
    add_block('simulink/User-Defined Functions/MATLAB Function', fcn);
    setMatlabFunctionScript(fcn, prbsEngineBlockScript());

    % Wire inports -> function -> outports
    connect(dut, 'adc_dataInI/1',  'PRBSEngine/1');
    connect(dut, 'adc_dataInQ/1',  'PRBSEngine/2');
    connect(dut, 'adc_validIn/1',  'PRBSEngine/3');
    connect(dut, 'prbs_control/1', 'PRBSEngine/4');
    connect(dut, 'PRBSEngine/1', 'tx_dataOutI/1');
    connect(dut, 'PRBSEngine/2', 'tx_dataOutQ/1');
    connect(dut, 'PRBSEngine/3', 'tx_validOut/1');
    connect(dut, 'PRBSEngine/4', 'sample_count/1');
    connect(dut, 'PRBSEngine/5', 'bit_errors_I/1');
    connect(dut, 'PRBSEngine/6', 'bit_errors_Q/1');
    connect(dut, 'PRBSEngine/7', 'lock_status/1');

    % ---- top-level loopback testbench ----
    % Control source: gen_enable=1 (bit1). Toggle reset/inject in tests.
    add_block('built-in/Constant', [model '/prbs_control'], ...
        'Value', '2', 'OutDataTypeStr', 'uint32');
    % Valid source: always-true ADC valid for sim (HW supplies the strobe).
    add_block('built-in/Constant', [model '/adc_valid'], ...
        'Value', '1', 'OutDataTypeStr', 'boolean');

    % Unit delays model the loopback round-trip latency (break direct feed).
    add_block('built-in/UnitDelay', [model '/loopI'], 'InitialCondition', '0');
    add_block('built-in/UnitDelay', [model '/loopQ'], 'InitialCondition', '0');

    % Scopes/terminators for observation in sim.
    add_block('built-in/Terminator', [model '/t_txValid']);
    add_block('built-in/Outport', [model '/o_sample_count']);
    add_block('built-in/Outport', [model '/o_bit_errors_I']);
    add_block('built-in/Outport', [model '/o_bit_errors_Q']);
    add_block('built-in/Outport', [model '/o_lock_status']);

    % Wire DUT into the loopback.
    connect(model, 'prbs_control/1', 'PRBSLoopback/4');
    connect(model, 'adc_valid/1',    'PRBSLoopback/3');
    connect(model, 'PRBSLoopback/1', 'loopI/1');   % txI -> delay
    connect(model, 'PRBSLoopback/2', 'loopQ/1');   % txQ -> delay
    connect(model, 'loopI/1', 'PRBSLoopback/1');   % delay -> adcI
    connect(model, 'loopQ/1', 'PRBSLoopback/2');   % delay -> adcQ
    connect(model, 'PRBSLoopback/3', 't_txValid/1');
    connect(model, 'PRBSLoopback/4', 'o_sample_count/1');
    connect(model, 'PRBSLoopback/5', 'o_bit_errors_I/1');
    connect(model, 'PRBSLoopback/6', 'o_bit_errors_Q/1');
    connect(model, 'PRBSLoopback/7', 'o_lock_status/1');

    % ---- solver / model config: single-rate discrete, fixed-step ----
    set_param(model, 'SolverType', 'Fixed-step', 'Solver', 'FixedStepDiscrete', ...
        'FixedStep', '1', 'StopTime', '5000');

    Simulink.BlockDiagram.arrangeSystem(dut);
    Simulink.BlockDiagram.arrangeSystem(model);
    save_system(model);
    close_system(model, 0);
    fprintf('Built %s.slx (DUT: %s)\n', model, dut);
end

% ===================== helpers =====================

function addPort(sys, kind, name, num, dtype)
    blk = [sys '/' name];
    add_block(['built-in/' kind], blk, 'Port', num2str(num));
    if ~isempty(dtype) && strcmp(kind, 'Inport')
        set_param(blk, 'OutDataTypeStr', dtype);
    end
end

function connect(sys, src, dst)
    add_line(sys, src, dst, 'autorouting', 'on');
end

function setMatlabFunctionScript(blockPath, script)
    % Inject code into a MATLAB Function (EML) block via the Stateflow API.
    sf = sfroot;
    chart = sf.find('-isa', 'Stateflow.EMChart', 'Path', blockPath);
    chart.Script = script;
end

function s = prbsEngineBlockScript()
    % Thin wrapper so the heavy lifting stays in the path function PRBSEngine
    % (lint-able + unit-testable). Port names/types come from this signature.
    % NB: wrapper name must differ from PRBSEngine to avoid shadowing the
    % path function it calls.
    s = sprintf([ ...
        'function [tx_dataOutI, tx_dataOutQ, tx_validOut, sample_count, bit_errors_I, bit_errors_Q, lock_status] = prbs_loopback_step(adc_dataInI, adc_dataInQ, adc_validIn, prbs_control)\n' ...
        '%%#codegen\n' ...
        '[tx_dataOutI, tx_dataOutQ, tx_validOut, sample_count, bit_errors_I, bit_errors_Q, lock_status] = ...\n' ...
        '    PRBSEngine(adc_dataInI, adc_dataInQ, adc_validIn, prbs_control);\n' ...
        'end\n']);
end
