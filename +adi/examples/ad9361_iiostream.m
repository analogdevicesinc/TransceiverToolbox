clear;

[notfound,warnings]=loadlibrary('libiio1','iio.h');

uri = 'ip:pluto.local';
% Rx stream config
RxCfg.BWHz = 2e6;
RxCfg.FsHz = 2.5e6;
RxCfg.LOHz = 2.5e6;
RxCfg.RFPort = 'A_BALANCED';

% Tx stream config
TxCfg.BWHz = 1.5e6;
TxCfg.FsHz = 2.5e6;
TxCfg.LOHz = 2.5e6;
TxCfg.RFPort = 'A';

fprintf("* Acquiring IIO context\n");
iioCtxParams = libpointer;
iioCtx = adi.iio.iio_create_context(iioCtxParams, uri);
count = adi.iio.iio_context_get_devices_count(iioCtx);

fprintf("* Acquiring AD9361 streaming devices\n");
iioDevTx = adi.iio.iio_context_find_device(iioCtx, 'cf-ad9361-dds-core-lpc');
iioDevRx = adi.iio.iio_context_find_device(iioCtx, 'cf-ad9361-lpc');

fprintf("* Configuring AD9361 for streaming\n");
chid = 0;
fprintf("* Acquiring AD9361 phy channel %d\n", chid);
ad9361PhyDev = adi.iio.iio_context_find_device(iioCtx, 'ad9361-phy');
ad9361RxChn = adi.iio.iio_device_find_channel(ad9361PhyDev, ['voltage' num2str(chid)], false);
ad9361TxChn = adi.iio.iio_device_find_channel(ad9361PhyDev, ['voltage' num2str(chid)], true);

% Rx
rfPortSelectAttr = adi.iio.iio_channel_find_attr(ad9361RxChn, RxCfg.RFPort);
status = adi.iio.iio_attr_write_string(rfPortSelectAttr, RxCfg.RFPort);
assert(status==0);

rfBWAttr = adi.iio.iio_channel_find_attr(ad9361RxChn, 'rf_bandwidth');
status = adi.iio.iio_attr_write_longlong(rfBWAttr, RxCfg.BWHz);
assert(status==0);
fsAttr = adi.iio.iio_channel_find_attr(ad9361RxChn, 'sampling_frequency');
status = adi.iio.iio_attr_write_longlong(rfBWAttr, RxCfg.FsHz);
assert(status==0);

unloadlibrary('libiio1');