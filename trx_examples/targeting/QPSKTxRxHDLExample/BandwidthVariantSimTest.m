classdef BandwidthVariantSimTest < matlab.unittest.TestCase
    %BandwidthVariantSimTest  Cheap MATLAB-only TDD filter for bandwidth
    %  variants. For each candidate SamplesPerSymbol value, this test:
    %    1. Overrides Params.SamplesPerSymbol in commhdlQPSKTxRxParameters.m
    %    2. Generates a clean Tx waveform via QPSKRxChainTest.genTxWaveform
    %       (which is already SPS-parameterised via the Params struct).
    %    3. Pushes it through demodPlutoCapture (also SPS-parameterised).
    %    4. Asserts BER < 1%.
    %    5. Restores commhdlQPSKTxRxParameters.m at teardown.
    %
    %  Costs ~5 s per variant. If a variant fails this, the *algorithm* is
    %  broken at that SPS (Farrow interp / sync gains / RRC span) and a
    %  ~30-minute HDL build would be pointless. If it passes, the algorithm
    %  is sound; we can proceed to a Simulink + HDL build for that variant.

    properties (TestParameter)
        % {sps, RsymHz, label, bitrateAtBaseUTx, comment}
        variant = struct( ...
            'V0_baseline_sps4',  {{4, 1.92e6, 'baseline',  3.84e6}}, ...
            'V1_halfSPS_sps2',   {{2, 3.84e6, 'half-SPS',  7.68e6}}, ...
            'V2_sps2_fastRsym',  {{2, 7.68e6, 'sps2-fast',1.536e7}}, ...
            'V3_quarterSPS_sps1',{{1, 7.68e6, 'sps1-aggr',1.536e7}}, ...
            'V4_sps8_slow',      {{8, 0.96e6, 'sps8-ctl',  1.92e6}}  ...
        );
    end

    properties
        ParamFile
        ParamBackup
    end

    methods (TestClassSetup)
        function discoverParamFile(testCase)
            here = fileparts(mfilename('fullpath'));
            testCase.ParamFile = fullfile(here, 'commhdlQPSKTxRxParameters.m');
            testCase.assertTrue(isfile(testCase.ParamFile), ...
                'Cannot find commhdlQPSKTxRxParameters.m next to this test');
            testCase.ParamBackup = fileread(testCase.ParamFile);
        end
        function determinism(testCase)
            o = rng; testCase.addTeardown(@() rng(o)); rng(101,'twister');
        end
    end

    methods (Test)
        function testVariant(testCase, variant)
            sps   = variant{1};
            Rsym  = variant{2};
            label = variant{3};

            % --- Restore Parameters.m no matter what ---
            testCase.addTeardown(@() fwrite_text(testCase.ParamFile, testCase.ParamBackup));

            % --- Patch SamplesPerSymbol in Parameters.m ---
            newSrc = regexprep(testCase.ParamBackup, ...
                'Params\.SamplesPerSymbol\s*=\s*\d+\s*;', ...
                sprintf('Params.SamplesPerSymbol         = %d;', sps), 'once');
            fwrite_text(testCase.ParamFile, newSrc);
            rehash;   % so the next call sees the new file content

            % sanity: confirm the override is live
            P = commhdlQPSKTxRxParameters();
            testCase.assertEqual(P.SamplesPerSymbol, sps, ...
                sprintf('SPS override didn''t stick (got %d, want %d)', P.SamplesPerSymbol, sps));
            fprintf('\n=== Variant %s   SPS=%d   Rsym=%.3g   (=> %d Mbps @ U=1 base) ===\n', ...
                label, sps, Rsym, 2*Rsym/1e6);

            % --- Generate clean Tx waveform at the new SPS ---
            nframes = 14;
            tx = QPSKRxChainTest.genTxWaveform(nframes);

            % --- Run offline receiver. demodPlutoCapture uses C.SamplesPerSymbol
            %     and a hard-coded Rsym=1.92e6 internally for the resample target
            %     (line 17: Fs4 = sps*Rsym = sps*1.92e6). So the input waveform's
            %     sample rate (Fs) must be passed correctly. genTxWaveform produces
            %     at sps × Rsym × 2 (the 2x is the resample at line 125). Compute that.
            Rsym_genTx = 1.92e6;            % gen uses this internally for symbol clock
            Fs_capture = sps * Rsym_genTx * 2;  % 2x upsample at end of genTxWaveform

            ber = demodPlutoCapture(tx, Fs_capture);
            fprintf('   offline-demod BER = %.4f%%  (nframes=%d, Fs=%.3g)\n', 100*ber, nframes, Fs_capture);

            testCase.verifyLessThan(ber, 0.01, ...
                sprintf('variant %s: BER %.4f%% (need <1%%)', label, 100*ber));
        end
    end
end

% --- helpers ---
function fwrite_text(path, txt)
    fid = fopen(path, 'w');
    fwrite(fid, txt);
    fclose(fid);
end
