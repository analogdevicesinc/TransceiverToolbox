classdef IIOv1JESD204Device < adi.common.JESD204
    % IIOv1JESD204Device Smallest device class on adi.common.JESD204
    %   For test/IIOv1EmuTests.m only: the toolbox has no class that
    %   derives from adi.common.JESD204. It connects to the device
    %   axi-ad9081-rx-hpc of test/emu/ad9081.xml, opens no buffer and
    %   writes no attribute.

    properties (Nontunable, Hidden)
        devName = 'axi-ad9081-rx-hpc';
        phyDevName = 'axi-ad9081-rx-hpc';
    end

    properties (Hidden, Nontunable, Access = protected)
        isOutput = false;
    end

    methods (Hidden, Access = {?handle})
        function status = configureChanBuffers(~)
            % called by adi.common.IIOBase at setup: nothing to configure
            status = 0;
        end
    end

    methods (Hidden, Access = protected)
        function stepImpl(~)
        end
    end

end
