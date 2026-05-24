# Analog Devices, Inc. Transceiver Toolbox

Toolbox created by ADI to be used with MATLAB and Simulink with ADI transceivers.

License : [![License](https://img.shields.io/badge/license-ADI_BSD-blue.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/blob/master/LICENSE)
Latest Release : [![GitHub release](https://img.shields.io/github/release/analogdevicesinc/TransceiverToolbox.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest)
Downloads :  [![Github All Releases](https://img.shields.io/github/downloads/analogdevicesinc/TransceiverToolbox/total.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest)

As with many open source packages, we use [GitHub](https://github.com/analogdevicesinc/TransceiverToolbox) to do develop and maintain the source, and [Jenkins](https://jenkins.com/) for continuous integration.
  - If you want to just use TransceiverToolbox, we suggest using the [latest release](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest).
  - If you think you have found a bug in the release, or need a feature which isn't in the release, try the latest **untested** builds from the master branch.

| HDL Branch        | MATLAB Release |  Installer Package  |
|:-----------------:|:--------------:|:-------------------:|
| 2022_R2           | R2023b         | <a href="https://github.com/analogdevicesinc/TransceiverToolbox/releases/tag/latest"><img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" data-canonical-src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" height="40" /></a>|

If you use it, and like it - please let us know. If you use it, and hate it - please let us know that too.

## Supported Tools and Releases

We provide support across two releases of MATLAB. This does not mean older releases will not work but they are not maintained. Currently supported tools are:
- Bug fixes only: MATLAB R2022b with Vivado 2021.2
- Bug fixes and new features: MATLAB R2023b with Vivado 2022.2

## Support and Documentation

All support questions should be posted in our [EngineerZone](https://ez.analog.com/sw-interface-tools) forums. Documentation is included within the toolbox but additional documentation is available on the [ADI Wiki](https://wiki.analog.com/resources/tools-software/transceiver-toolbox).

## Building & Installing

If you don't want to use the toolbox installers you can manually build the toolbox. Should be a quick matter of `make build`:

```
rgetz@pinky:~/TransceiverToolbox$ make -C CI/scripts/ build 
```

Then simply add the `hdl` folder to your MATLAB path `addpath(genpath('hdl'))`

## Hardware Testing with labgrid

The MATLAB hardware tests (`runHWTests`) connect to a board over a libIIO URI
and honour the `IIO_URI` environment variable. They assume the board is already
powered, booted, and reachable.

[adi-labgrid-plugins](https://github.com/analogdevicesinc/adi-labgrid-plugins)
can provision that board automatically — power it, boot the FPGA/SoC, and hand
MATLAB the booted URI — both locally and in GitHub Actions. The integration
mirrors the
[pyadi-iio hardware-CI pattern](https://github.com/analogdevicesinc/pyadi-iio):
a thin `test/hw/conftest.py` boots the board via labgrid and exposes an
`iio_uri` fixture; per-board bridge tests in `test/hw/test_*.py` carry
`@pytest.mark.iio_hardware([chip])` markers and subprocess `runHWTests`.

Per-place env yamls live in [`test/hw/env/`](test/hw/env/) — one file per
coordinator place, declaring the labgrid drivers + boot strategy inline.

### Run locally

```bash
pip install -r test/hw/requirements_dev.txt

# Acquire the lab place, run the marker-filtered bridge test, release.
labgrid-client -x $LG_COORDINATOR -p nemo acquire
LG_COORDINATOR=10.0.0.41:20408 LG_ENV=test/hw/env/nemo.yaml \
    HW_DAUGHTER=adrv9009 \
    MATLAB_BIN=/mnt/onetb/MATLAB/R2025b/bin/matlab \
    pytest test/hw/ -v --junitxml=junit-nemo.xml
labgrid-client -x $LG_COORDINATOR -p nemo release
```

The `conftest.py` transitions the place's `Strategy` driver to `shell`, polls
the booted board for its DHCP-assigned IP, and yields `iio_uri = "ip:<addr>"`.
Bridge tests use it to launch MATLAB (`matlab -batch "runHWTests(getenv('board'))"`)
and copy MATLAB's `<board>_HWTestResults.xml` into a per-test JUnit. On
session finish the strategy transitions back to `powered_off`.

When `LG_ENV` is unset, `conftest.py` is a no-op and the bridge tests skip
cleanly — existing non-labgrid invocations (`make test`, plain `runHWTests` in
a MATLAB session, etc.) are completely unaffected.

### CI

[`.github/workflows/hardware-test.yml`](.github/workflows/hardware-test.yml)
mirrors pyadi-iio's standalone workflow: a `preflight` job probes the
coordinator, intersects against `test/hw/env/*.yaml`, and emits a per-place
matrix; each `hw-coord (<place>)` shard runs on its `hw-<place>` self-hosted
runner, acquires the place, runs the marker-filtered pytest, releases. On
PRs the workflow is gated on the `hw-test` label.

