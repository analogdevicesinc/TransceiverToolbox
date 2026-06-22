function cfg = qpsk_rate_mode_config(mode)
%QPSK_RATE_MODE_CONFIG  Rate-scalable configuration for the QPSK modem.
%   cfg = QPSK_RATE_MODE_CONFIG(mode) returns the build/parameter settings
%   that let the SAME modem model run on BOTH the CMOS (ZedBoard ADRV9002)
%   and the LVDS (Jupiter) reference designs. mode is 'cmos' or 'jupiter';
%   if omitted it is read from getappdata(0,'QPSK_RATE_MODE') and defaults
%   to 'cmos'.
%
%   WHY THIS IS ALL THAT DIFFERS (verified against the deployed RTL):
%   The DUT model commhdlQPSKTxRxLoopback/TxRxComposite is BIT-IDENTICAL for
%   both platforms and decodes the SAME 7.68 MHz / 4-samples-per-symbol
%   signal in both modes. Only the reference-design integration changes:
%     * referenceDesign / project / carrier -- selects the radio + its
%       IPCORE clock (CMOS adc_1_clk = 30.72 MHz vs LVDS = 15.36 MHz). HDL
%       Coder then AUTO-GENERATES the Rx decode divider from
%       IPCORE_clk/7.68 MHz (enb_1_4 for CMOS, enb_1_2 for LVDS) -- this is
%       not a model parameter.
%     * multiple = the reference-design "Fast-slow clock ratio" (plugin_rd.m).
%       It sets the RATIO of the Tx-output sync_fast_to_slow rate-matcher that
%       crosses the DUT clock to the DAC clock. CMOS is a 30.72->15.36 (2:1)
%       crossing => multiple=2; LVDS is 1:1 => multiple=1. (The Rx-input
%       sync_slow_to_fast is a plain CDC with NO ratio -- correctly left at 1.)
%     * integAvgLen = the carrier-sync phase-estimate window, a SAMPLE count
%       (the ONLY rate-scaled model parameter). It scales as 2^15 / rateRatio
%       so the averaging TIME stays constant: at the 1.92 Msym design rate it
%       is 2^15; on the 8x-low stock CMOS profile (240 ksym) it is 2^12.
%   All other model parameters (SamplesPerSymbol, AGC gains, CSBnXTsamp /
%   SSBnXTsamp loop bandwidths, CFOChangeDetectThreshold, preamble threshold,
%   SearchSamples) are symbol-rate-NORMALIZED or structural and are IDENTICAL
%   in both modes -- they do not scale with the absolute rate.

if nargin < 1 || isempty(mode)
    mode = getappdata(0, 'QPSK_RATE_MODE');
    if isempty(mode), mode = 'cmos'; end
end

% Design symbol rate the model was tuned for, and the design integAvgLen.
designRsym   = 1.92e6;
designIntAvg = 2^15;

switch lower(mode)
    case 'jupiter'                      % LVDS, design rate
        cfg.mode            = 'jupiter';
        cfg.referenceDesign = 'JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)';
        cfg.project         = 'jupiter_sdr';
        cfg.carrier         = '';        % JUPITER carrier is the project default
        cfg.multiple        = '1';       % rx_clk == tx_clk (15.36 MHz), 1:1
        cfg.ipcoreClockHz   = 15.36e6;
        cfg.symbolRateHz    = designRsym;
    case 'cmos'                          % ZedBoard ADRV9002, stock CMOS profile
        cfg.mode            = 'cmos';
        cfg.referenceDesign = 'ADRV9002 ZED (RX & TX, BYTE DMA)';
        cfg.project         = 'adrv9001';
        cfg.carrier         = 'zed';
        cfg.multiple        = '2';       % rx_clk 30.72 -> tx_clk 15.36 (2:1)
        cfg.ipcoreClockHz   = 30.72e6;
        % Stock CMOS profile runs the SSI 8x below design (no design-rate CMOS
        % profile matched to the board API exists). Override to designRsym if a
        % 15.36 MHz-SSI CMOS profile becomes available.
        rsym = getappdata(0, 'QPSK_CMOS_RSYM');
        if isempty(rsym), rsym = 240e3; end
        cfg.symbolRateHz    = rsym;
    otherwise
        error('qpsk_rate_mode_config:badMode', ...
              'Unknown rate mode "%s" (use ''cmos'' or ''jupiter'')', mode);
end

% Rate-scaled CS phase-estimate window: keep the averaging TIME constant as the
% symbol rate changes (fewer samples at a lower rate). Clamp to a power of two.
cfg.rateRatio   = designRsym / cfg.symbolRateHz;
cfg.integAvgLen = 2^round(log2(designIntAvg / cfg.rateRatio));

cfg.refDesignParams = {'project', cfg.project, 'ref_design', 'rxtx', ...
    'preprocess', 'off', 'postprocess', 'off', 'number_of_inputs', '4', ...
    'number_of_bits', '16', 'number_of_valids', '1', 'multiple', cfg.multiple, ...
    'HDLVerifierAXI', 'off', 'HDLVerifierFDC', 'JTAG'};
end
