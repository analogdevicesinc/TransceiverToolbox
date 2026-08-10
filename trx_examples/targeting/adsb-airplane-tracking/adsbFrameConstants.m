function c = adsbFrameConstants()
%ADSBFRAMECONSTANTS Shared constants for the ADS-B targeting demo.
%
%   Describes the contract between the HDL_DUT frame-stream output and the
%   host-side code that consumes it, so the model, the live receiver and the
%   hardware test cannot drift apart.
%
%   c.SyncMarker    Word the DUT emits immediately before a frame burst.
%   c.WordsPerFrame Number of 16-bit words carrying one 112-bit squitter.
%   c.FrameBits     Bits in a Mode S extended squitter.
%   c.SamplingRate  AD9361 rate the detector timing assumes (4 samples per
%                   1 Mbps PPM symbol).
%   c.CenterFreq    ADS-B downlink frequency.
%   c.Reg*          AXI4-Lite register offsets, matching hdlworkflow.m.

c.SyncMarker    = hex2dec('5AA5');
c.WordsPerFrame = 7;
c.FrameBits     = 112;
c.SamplingRate  = 4e6;
c.CenterFreq    = 1090e6;

c.RegThreshold    = '0x100';
c.RegEnable       = '0x104';
c.RegDetectCount  = '0x108';
c.RegCRCPassCount = '0x10C';
c.RegLastMaxSync  = '0x110';

end
