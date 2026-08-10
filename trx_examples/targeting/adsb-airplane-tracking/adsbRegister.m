function reg = adsbRegister(uri, mode, offset, dataType)
%ADSBREGISTER AXI4-Lite accessor for the deployed ADS-B detector.
%
%   REG = ADSBREGISTER(URI,MODE,OFFSET,DATATYPE) returns a configured
%   libIIO AXI memory-mapped accessor for one of the DUT's registers. MODE
%   is 'read' or 'write', OFFSET is a hex offset string such as '0x10C'
%   (the values in ADSBFRAMECONSTANTS), and DATATYPE is the register's
%   hardware type, for example 'int16' or 'uint32'.
%
%   Call the returned object to transfer:
%       w = adsbRegister(uri,'write','0x100','int16');
%       w(threshold);
%       r = adsbRegister(uri,'read','0x10C','uint32');
%       count = r();
%
%   The adi.AD9361 System objects expose no register interface, so custom
%   IP registers go through matlabshared.libiio.aximm directly -- the same
%   approach used by trx_examples/targeting/loopback-delay-estimation.
%
%   See also ADSBFRAMECONSTANTS.

if nargin < 4
    dataType = 'uint32';
end

switch lower(mode)
    case 'read'
        reg = matlabshared.libiio.aximm.read('uri', uri);
    case 'write'
        reg = matlabshared.libiio.aximm.write('uri', uri);
    otherwise
        error('adsbRegister:BadMode', 'MODE must be ''read'' or ''write''.');
end

reg.AddressOffset = hex2dec(strrep(lower(char(offset)), '0x', ''));
reg.HardwareDataType = dataType;

end
