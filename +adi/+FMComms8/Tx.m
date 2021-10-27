classdef Tx < adi.ADRV9009ZU11EG.Tx
    % adi.FMComms8.Tx Transmit data from the FMComms8 evaluation board
    %   The adi.FMComms8.Tx System object is a signal sink that can
    %   transmit complex data from the FMComms8.
    %
    %   tx = adi.FMComms8.Tx;
    %   tx = adi.FMComms8.Tx('uri','192.168.2.1');
    %
    %   <a href="https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/EVAL-AD-FMCOMMS8.html">Product Page</a>
    %
    %   See also adi.FMComms8.Rx
    methods

        %% Constructor
        function obj = Tx(varargin)
            % Returns the matlabshared.libiio.base object
            coder.allowpcode('plain');
            obj = obj@adi.ADRV9009ZU11EG.Tx(varargin{:});
            obj.phyDevName = 'adrv9009-phy-c';
            obj.phyDevNameChipB = 'adrv9009-phy-d';
        end

    end

end
