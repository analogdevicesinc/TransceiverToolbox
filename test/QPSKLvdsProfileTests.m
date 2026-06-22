classdef QPSKLvdsProfileTests < matlab.unittest.TestCase
    % QPSKLvdsProfileTests -- the Jupiter QPSK composite design running the
    % custom LVDS 1.92 MHz ADRV9002 profile (modem_profiles/lvds_1p92_mhz),
    % i.e. the Jupiter at the same 240-ksym rate as the ZedBoard CMOS build
    % (two-radio prep). The QPSK modem is bit-identical to the stock build;
    % the design's clock-enable dividers are ratios, so it scales to the 8x
    % slower clock with easier timing -- no FPGA rebuild needed, only the
    % profile changes.
    %
    % IMPORTANT: load the LVDS profile at BOOT (devicetree/firmware), NOT at
    % runtime. A runtime profile load that changes the SSI rate shifts the
    % ADRV9002 SSI clock (= the FPGA adc_1_clk) under the running modem and
    % stalls the FPGA (observed 2026-06-22: it wedged the board). These tests
    % therefore do NOT load the profile live; testProfileFilesValid is a
    % board-free check of the profile assets, and testJupiterLvdsLink assumes
    % the profile is already deployed (it skips with instructions if not).
    %
    % Run (non-HW only):  runtests('QPSKLvdsProfileTests','ProcedureName','testProfileFilesValid')
    % Run (all, Jupiter): runtests('QPSKLvdsProfileTests')

    properties (Constant)
        % BIST checks the first 120 bits ("ADI Hello World") of each packet.
        BERGate = 0.01/100;     % < 0.01% on checked bits
        LvdsSsiHz = 1920000;    % the custom LVDS profile SSI rate
        % The Jupiter's ADRV9002 reference-clock options (kHz), read from the
        % live board's clock framework: adrv9002_refclk_mux0=30720,
        % mux1=38400; devicetree clock@0=38400000. A profile's
        % clocks.deviceClock_kHz MUST be one of these -- the reference clock
        % is fixed board hardware, and a profile built for any other value
        % (e.g. 40000) is rejected by the driver's PLL validation on the
        % profile_config write (root cause of the 2026-06-22 load failure +
        % board wedge).
        JupiterRefClkKHz = [38400 30720];
    end
    properties
        profDir
    end

    methods (TestClassSetup)
        function locate(testCase)
            here = fileparts(mfilename('fullpath'));
            testCase.profDir = fullfile(fileparts(here), ...
                'trx_examples','targeting','QPSKTxRxHDLExample','modem_profiles');
            addpath(fullfile(fileparts(here), ...
                'trx_examples','targeting','QPSKTxRxHDLExample'));
        end
    end

    methods (Test)
        function testProfileFilesValid(testCase)
            % BOARD-FREE: the LVDS (and CMOS) profile assets exist, parse, and
            % declare the expected LVDS / 1.92 MHz configuration.
            for p = {{'lvds_1p92_mhz', 2}, {'cmos_1p92_mhz', 1}}   % name, expected ssiType (2=LVDS,1=CMOS)
                name = p{1}{1}; wantSsi = p{1}{2};
                js = fullfile(testCase.profDir, [name '.json']);
                bn = fullfile(testCase.profDir, [name '.bin']);
                testCase.assertTrue(isfile(js), sprintf('missing profile %s', js));
                testCase.assertTrue(isfile(bn), sprintf('missing stream %s', bn));
                % stream image is a non-trivial binary
                d = dir(bn);
                testCase.verifyGreaterThan(d.bytes, 1024, ...
                    sprintf('%s stream image suspiciously small', name));
                % profile parses + has the ADRV9002 structure
                prof = jsondecode(fileread(js));
                for f = {'clocks','rx','tx'}
                    testCase.assertTrue(isfield(prof, f{1}), ...
                        sprintf('%s profile missing "%s"', name, f{1}));
                end
                % interface SSI rate = 1.92 MHz, and the SSI type matches
                rxcfg = prof.rx.rxChannelCfg(1).profile;
                testCase.verifyEqual(rxcfg.rxInterfaceSampleRate_Hz, testCase.LvdsSsiHz, ...
                    sprintf('%s rxInterfaceSampleRate != 1.92 MHz', name));
                testCase.verifyEqual(rxcfg.rxSsiConfig.ssiType, wantSsi, ...
                    sprintf('%s ssiType != %d', name, wantSsi));
                txcfg = prof.tx.txProfile(1);
                testCase.verifyEqual(txcfg.txInterfaceSampleRate_Hz, testCase.LvdsSsiHz, ...
                    sprintf('%s txInterfaceSampleRate != 1.92 MHz', name));
                fprintf('profile %-14s OK: ssiType=%d, SSI=%d Hz, stream=%d B\n', ...
                    name, rxcfg.rxSsiConfig.ssiType, rxcfg.rxInterfaceSampleRate_Hz, d.bytes);
            end
        end

        function testLvdsProfileDeviceClockMatchesBoard(testCase)
            % BOARD-FREE root-cause guard: the LVDS profile must be generated
            % for one of the Jupiter's actual ADRV9002 reference clocks
            % (38.4 or 30.72 MHz). The shipped lvds_1p92_mhz.json is built for
            % a 40 MHz device clock that this board does NOT have, so the
            % driver rejects profile_config ("Failed to write attribute") --
            % which is a PROFILE-GENERATION bug, not a design issue. FIX:
            % regenerate the 1.92 MHz LVDS profile in ADI TES with the device
            % clock set to 38.4 MHz, then this passes and the link test can run.
            js = fullfile(testCase.profDir, 'lvds_1p92_mhz.json');
            testCase.assertTrue(isfile(js), sprintf('missing profile %s', js));
            dc = jsondecode(fileread(js)).clocks.deviceClock_kHz;
            testCase.verifyTrue(ismember(dc, testCase.JupiterRefClkKHz), sprintf( ...
                ['lvds_1p92_mhz deviceClock_kHz=%d does not match the Jupiter ' ...
                 'ADRV9002 reference clock (%s kHz). Regenerate the profile in ' ...
                 'TES at 38.4 MHz -- the driver rejects a profile built for a ' ...
                 'reference clock the board lacks.'], dc, mat2str(testCase.JupiterRefClkKHz)));
        end

        function testJupiterLvdsRateModeConfig(testCase)
            % BOARD-FREE: the rebuilt 'jupiter_lvds' VARIANT is correctly
            % parameterized to support the custom low-rate LVDS profile -- same
            % JUPITER reference design + 15.36 MHz synthesis IPCORE as stock
            % 'jupiter' (so it is a valid, buildable bitstream, NOT a sub-7.68
            % MHz IPCORE), differing ONLY in integAvgLen, scaled to 2^12 for the
            % 240-ksym operating point. The two modes together support both the
            % stock 15.36 MHz and custom 1.92 MHz LVDS profiles.
            cfg = qpsk_rate_mode_config('jupiter_lvds');
            testCase.verifyEqual(cfg.symbolRateHz, 240e3, 'jupiter_lvds symbol rate = 240 ksym');
            testCase.verifyEqual(cfg.integAvgLen, 2^12, 'jupiter_lvds integAvgLen scales to 2^12');
            testCase.verifyEqual(cfg.multiple, '1', 'LVDS is 1:1');
            testCase.verifyEqual(cfg.ipcoreClockHz, 15.36e6, 'synthesize at 15.36 MHz (buildable, not sub-7.68)');
            testCase.verifyTrue(contains(cfg.referenceDesign, 'JUPITER'), 'JUPITER reference design');
            testCase.verifyEqual(cfg.project, 'jupiter_sdr');
            j = qpsk_rate_mode_config('jupiter');
            testCase.verifyEqual(j.integAvgLen, 2^15, 'stock jupiter keeps integAvgLen 2^15');
            testCase.verifyEqual(j.ipcoreClockHz, cfg.ipcoreClockHz, ...
                'jupiter and jupiter_lvds share the IPCORE/RD -> both are buildable bitstreams');
            fprintf('jupiter_lvds VARIANT: IPCORE=%.2f MHz, multiple=%s, integAvgLen=2^%d (vs jupiter 2^%d)\n', ...
                cfg.ipcoreClockHz/1e6, cfg.multiple, round(log2(cfg.integAvgLen)), round(log2(j.integAvgLen)));
        end

        function testJupiterLvdsLink(testCase)
            % HW (Jupiter): with the LVDS 1.92 MHz profile DEPLOYED AT BOOT,
            % the existing composite design must still decode -- verified by
            % the in-FPGA-Tx -> DAC -> cable -> ADC -> Rx BIST over the RF
            % cable loopback. Skips (with instructions) if the deployed
            % profile is not the 1.92 MHz LVDS one, since live loading is
            % unsafe (see class header).
            try
                [rc, out] = BistRegisters.sshExec( ...
                    'cat /sys/bus/iio/devices/iio:device2/in_voltage0_sampling_frequency', 8);
            catch ME
                assumeFail(testCase, sprintf('Jupiter unreachable: %s', ME.message));
                return
            end
            testCase.assumeEqual(rc, 0, 'Jupiter (BistRegisters.Host) not reachable over ssh');
            ssi = str2double(strtrim(out));
            testCase.assumeEqual(ssi, testCase.LvdsSsiHz, sprintf( ...
                ['deployed SSI is %g Hz, not the 1.92 MHz LVDS profile. Load ' ...
                 'modem_profiles/lvds_1p92_mhz at BOOT (devicetree/firmware), ' ...
                 'reboot, then re-run -- do NOT load it at runtime (wedges the FPGA).'], ssi));
            % Tx atten 0 dB (the measured byte/in-FPGA-Tx operating point)
            BistRegisters.sshExec( ...
                'echo 0 > /sys/bus/iio/devices/iio:device2/out_voltage0_hardwaregain 2>/dev/null', 8);
            % canonical reset-then-select: internal generator over the RF cable
            ByteDmaRegisters.selectMode('0x9D000000', 0, 0, 1);   % tx_data_source=gen, tx_src=in-FPGA, rx=cable
            pause(2);
            p0 = double(BistRegisters.read('0x9D000104', 8));
            e0 = double(BistRegisters.read('0x9D000108', 8));
            pause(10);
            p1 = double(BistRegisters.read('0x9D000104', 8));
            e1 = double(BistRegisters.read('0x9D000108', 8));
            dp = p1 - p0; de = e1 - e0;
            ber = de / max(1, dp * 120);
            fprintf('Jupiter LVDS 1.92 MHz: %d pkts/10s, BIST BER = %.5f%%\n', dp, 100*ber);
            testCase.verifyGreaterThan(dp, 5000, ...
                'LVDS link did not sustain packet sync at 1.92 MHz');
            testCase.verifyLessThan(ber, testCase.BERGate, ...
                sprintf('LVDS 1.92 MHz BIST BER %.5f%% exceeds gate', 100*ber));
        end
    end
end
