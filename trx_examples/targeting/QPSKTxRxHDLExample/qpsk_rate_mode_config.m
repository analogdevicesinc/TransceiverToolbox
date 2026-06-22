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
%
%   SUPPORTING BOTH LVDS PROFILES (stock 15.36 MHz + a custom low-rate LVDS
%   profile such as modem_profiles/lvds_1p92_mhz):
%     * The stock 'jupiter' bitstream ALREADY runs both -- the Rx decode divider
%       is a clock-ENABLE ratio, so when a profile lowers the ADRV9002 SSI clock
%       the modem clock-enables down and decodes the proportionally lower symbol
%       rate (the ZedBoard runs this exact 240-ksym point at 0.00064% BER). Its
%       integAvgLen is baked at 2^15: fine for a static single-clock link (the
%       cable-loopback test), 8x-slow for two-radio CFO at the low rate.
%     * 'jupiter_lvds' is the rebuilt VARIANT optimized for the low-rate profile:
%       identical JUPITER reference design + 15.36 MHz IPCORE as 'jupiter' (the
%       synthesis fabric clock; the modem clock-enables down to the runtime
%       adc_1_clk the profile sets -- the same way 'cmos' synthesizes at 30.72
%       MHz for its 8x-low profile), with integAvgLen scaled to 2^12 so the CS
%       window averages a constant TIME at 240 ksym. This is a valid, buildable
%       bitstream (NOT a sub-7.68 MHz IPCORE -- it synthesizes at 15.36 MHz),
%       so the two modes together support both profiles optimally.
%
%   PREREQUISITE: the custom profile must be generated for the board's ADRV9002
%   reference clock. The shipped modem_profiles/*.json are built for 40 MHz but
%   this Jupiter's reference is 38.4 MHz, so the driver rejects them on load --
%   regenerate in ADI TES at deviceClock=38.4 MHz. The unit-test guard
%   QPSKLvdsProfileTests/testLvdsProfileDeviceClockMatchesBoard enforces this.

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
    case 'jupiter_lvds'                 % LVDS, custom LOW-RATE profile (1.92 MHz SSI)
        % The "build a variant to support the custom LVDS profile" target. Same
        % JUPITER reference design and IPCORE as 'jupiter' (synthesizes at the
        % 15.36 MHz fabric clock, enb_1_2 decode divider) -- exactly like 'cmos'
        % keeps its 30.72 MHz IPCORE for the 8x-low CMOS profile. At runtime the
        % loaded 1.92 MHz LVDS profile lowers adc_1_clk and the modem
        % clock-enables down to the 240-ksym operating point; the ONE difference
        % from 'jupiter' is integAvgLen, which scales to 2^12 (below) so the CS
        % phase-estimate averages a constant TIME at the lower symbol rate.
        cfg.mode            = 'jupiter_lvds';
        cfg.referenceDesign = 'JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)';
        cfg.project         = 'jupiter_sdr';
        cfg.carrier         = '';
        cfg.multiple        = '1';       % LVDS 1:1
        cfg.ipcoreClockHz   = 15.36e6;
        rsym = getappdata(0, 'QPSK_LVDS_RSYM');
        if isempty(rsym), rsym = 240e3; end   % 1.92 MHz SSI / 8, like the CMOS 8x-low point
        cfg.symbolRateHz    = rsym;
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
              'Unknown rate mode "%s" (use ''cmos'', ''jupiter'', or ''jupiter_lvds'')', mode);
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
