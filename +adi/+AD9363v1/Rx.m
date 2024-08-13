classdef Rx < adi.AD9361v1.Rx
    % adi.AD9363.Rx Receive data from the AD9363 transceiver
    %   The adi.AD9363.Rx System object is a signal source that can receive
    %   complex data from the AD9364.
    %
    %   rx = adi.AD9363.Rx;
    %   rx = adi.AD9363.Rx('uri','192.168.2.1');
    %
    %   <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/AD9363.pdf">AD9363 Datasheet</a>
    %
    %   See also adi.Pluto.Rx
       
    methods
        %% Constructor
        function obj = Rx(varargin)
            % Returns the matlabshared.libiio.base object
            obj = obj@adi.AD9361v1.Rx(varargin{:});
        end
    end
    
end

