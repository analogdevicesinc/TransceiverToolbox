classdef TestQPSKProfiles < matlab.unittest.TestCase
    % TestQPSKProfiles -- BOARD-FREE validation of the custom ADRV9002 modem
    % profile assets (modem_profiles/lvds_1p92_mhz + cmos_1p92_mhz) and the
    % rate-mode build configuration (qpsk_rate_mode_config) that let the SAME
    % QPSK modem run at the 1.92 MHz SSI / 240-ksym operating point and at the
    % 15.36 MHz SSI / 1.92-Msym design rate.
    %
    % These tests require NO hardware -- they only read+parse the shipped
    % profile JSON/BIN assets and exercise qpsk_rate_mode_config. They are a
    % PORT of the board-free tests in test/QPSKLvdsProfileTests.m, relocated
    % into the example's own test/ folder so the profiles resolve as a sibling
    % modem_profiles directory.
    %
    % WHY THESE MATTER (verified against live hardware this session):
    %   * The Jupiter QPSK design is VERIFIED clean at 1.92 MHz via the
    %     host-golden BIST method; the custom 1.92 MHz LVDS profile is the
    %     low-rate operating point. These checks guard the profile assets that
    %     drive it.
    %   * testLvdsProfileDeviceClockMatchesBoard guards the 40-MHz-reject root
    %     cause: a profile generated for a reference clock the board lacks is
    %     rejected by the driver's PLL validation on profile_config write (the
    %     2026-06-22 load failure + board wedge). The shipped profiles are now
    %     built for 38.4 MHz, which this board has.
    %
    % Run:  runtests('TestQPSKProfiles')

    properties (Constant)
        % BIST checks the first 120 bits ("ADI Hello World") of each packet
        % (referenced for context; not used by the board-free checks here).
        LvdsSsiHz = 1920000;    % the custom 1.92 MHz profile SSI rate
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
            % The example dir is the parent of this test/ folder; the profile
            % assets live in its modem_profiles subfolder.
            here = fileparts(mfilename('fullpath'));
            exampleDir = fileparts(here);
            testCase.profDir = fullfile(exampleDir, 'modem_profiles');
            addpath(exampleDir);
        end
    end

    methods (Test)
        function testProfileFilesValid(testCase)
            % BOARD-FREE: the LVDS (and CMOS) profile assets exist, parse, and
            % declare the expected 1.92 MHz configuration + SSI type.
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
            % (38.4 or 30.72 MHz). A profile built for a 40 MHz device clock
            % that this board does NOT have is rejected by the driver on the
            % profile_config write ("Failed to write attribute") -- a
            % PROFILE-GENERATION bug, not a design issue. FIX: regenerate the
            % 1.92 MHz LVDS profile in ADI TES with the device clock set to
            % 38.4 MHz, then the link test can run.
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
            % BOARD-FREE: the 'jupiter_lvds' VARIANT is correctly parameterized
            % to support the custom low-rate LVDS profile -- same JUPITER
            % reference design + 15.36 MHz synthesis IPCORE as stock 'jupiter'
            % (so it is a valid, buildable bitstream, NOT a sub-7.68 MHz
            % IPCORE), differing ONLY in integAvgLen, scaled to 2^12 for the
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
    end
end
