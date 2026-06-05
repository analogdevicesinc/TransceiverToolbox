function [txI, txQ, txValid, sampleCount, bitErrI, bitErrQ, lockStatus] = ...
        PRBSEngine(adcI, adcQ, adcValid, prbsControl) %#codegen
%PRBSENGINE  PRBS digital-loopback BIST engine for the ADRV9002 interface.
%   One step per sample clock. Generates an independent PRBS on the I lane
%   (PRBS-15) and Q lane (PRBS-9), drives them out the Tx data ports, and
%   checks the words returned on the Rx data ports through the ADRV9002 SSI
%   digital loopback. On a bit-exact link the checker locks and accumulates
%   zero bit errors; any nonzero count is a real digital-interface fault.
%
%   Data ports are uint16 raw 16-bit words: this is a bit-pattern loopback
%   test, so signedness is irrelevant and uint16 keeps the path HDL-native
%   (no typecast, which HDL Coder cannot synthesize). The reference-design
%   interface maps the 16 bits [0:15] regardless of signedness.
%
%   Inputs
%     adcI, adcQ   uint16  received words (ADRV9002 ADC Data I0/Q0)
%     adcValid     logical received-word valid (IP Valid Rx Data IN)
%     prbsControl  uint32  AXI control: bit0 reset, bit1 gen_enable,
%                          bit2 inject_error (single-bit Tx fault for self-test)
%   Outputs
%     txI, txQ     uint16  generated words (ADRV9002 DAC Data I0/Q0)
%     txValid      logical generated-word valid (IP Load Tx Data OUT)
%     sampleCount  uint32  valid samples scored since first lock
%     bitErrI      uint32  accumulated I-lane bit errors (post-lock)
%     bitErrQ      uint32  accumulated Q-lane bit errors (post-lock)
%     lockStatus   uint8   bit0 I locked, bit1 Q locked
%
%   HDL-Coder compatible: single rate, persistent state, integer ops only.
%   The bit-level work lives in the pure helpers PRBS15/9_GEN16 / _CHK16.

    N_LOCK = uint32(64);   % consecutive clean samples required to declare lock

    persistent hG15 hG9 hC15 hC9 cnt eI eQ consecI consecQ lockedI lockedQ
    if isempty(hG15)
        [hG15, hG9, hC15, hC9, cnt, eI, eQ, consecI, consecQ, lockedI, lockedQ] = ...
            local_reset();
    end

    ctrl   = uint8(bitand(prbsControl, uint32(255)));
    doReset = bitget(ctrl, 1);
    genEn   = bitget(ctrl, 2);
    inject  = bitget(ctrl, 3);

    if doReset
        [hG15, hG9, hC15, hC9, cnt, eI, eQ, consecI, consecQ, lockedI, lockedQ] = ...
            local_reset();
    end

    % ---- Generator: emit one 16-bit PRBS word per lane ----
    wI = uint16(0);
    wQ = uint16(0);
    if genEn
        [wI, hG15] = prbs15_gen16(hG15);
        [wQ, hG9]  = prbs9_gen16(hG9);
        if inject
            wI = bitxor(wI, uint16(1));    % flip one bit: proves the checker counts
        end
        txValid = true;
    else
        txValid = false;
    end
    txI = wI;
    txQ = wQ;

    % ---- Checker: descramble returned words, accumulate errors once locked ----
    if adcValid
        [errI, hC15] = prbs15_chk16(hC15, adcI);
        [errQ, hC9]  = prbs9_chk16(hC9, adcQ);

        if ~lockedI
            if errI == 0
                consecI = consecI + 1;
                if consecI >= N_LOCK, lockedI = true; end
            else
                consecI = uint32(0);
            end
        else
            eI = eI + uint32(errI);
        end

        if ~lockedQ
            if errQ == 0
                consecQ = consecQ + 1;
                if consecQ >= N_LOCK, lockedQ = true; end
            else
                consecQ = uint32(0);
            end
        else
            eQ = eQ + uint32(errQ);
        end

        if lockedI || lockedQ
            cnt = cnt + 1;
        end
    end

    sampleCount = cnt;
    bitErrI     = eI;
    bitErrQ     = eQ;
    ls = uint8(0);
    if lockedI, ls = bitor(ls, uint8(1)); end
    if lockedQ, ls = bitor(ls, uint8(2)); end
    lockStatus = ls;
end

function [hG15, hG9, hC15, hC9, cnt, eI, eQ, consecI, consecQ, lockedI, lockedQ] = ...
        local_reset() %#codegen
    hG15    = uint16(32767);   % 0x7FFF, nonzero PRBS-15 seed
    hG9     = uint16(511);     % 0x1FF,  nonzero PRBS-9 seed
    hC15    = uint16(0);       % checker self-syncs from received bits
    hC9     = uint16(0);
    cnt     = uint32(0);
    eI      = uint32(0);
    eQ      = uint32(0);
    consecI = uint32(0);
    consecQ = uint32(0);
    lockedI = false;
    lockedQ = false;
end
