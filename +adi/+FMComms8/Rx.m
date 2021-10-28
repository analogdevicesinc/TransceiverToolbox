classdef Rx < adi.ADRV9009ZU11EG.Rx
    % adi.FMComms8.Tx Transmit data from the FMComms8 evaluation platform
    %   The adi.FMComms8.Tx System object is a signal source that can
    %   send complex data to the FMComms8.
    %
    %   tx = adi.FMComms8.Tx;
    %   tx = adi.FMComms8.Tx('uri','192.168.2.1');
    %
    %   <a href="https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/EVAL-AD-FMCOMMS8.html">Product Page</a>
    %
    %   See also adi.FMComms8.Tx
    methods

        %% Constructor
        function obj = Rx(varargin)
            % Returns the matlabshared.libiio.base object
            coder.allowpcode('plain');
            obj = obj@adi.ADRV9009ZU11EG.Rx(varargin{:});
            obj.phyDevName = 'adrv9009-phy-c';
            obj.phyDevNameChipB = 'adrv9009-phy-d';
        end

    end

end
