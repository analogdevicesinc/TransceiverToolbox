# Hardware tests on labgrid

The lab's labgrid coordinator owns the boards. MATLAB never powers, flashes or boots anything;
it receives a booted board's libIIO URI and runs the `*Tests` classes against it.

## How a class asks for a board

Each hardware test class names the board it needs with a shared fixture from
[labgrid-matlab](https://github.com/tfcollins/labgrid-matlab) (git submodule at
`test/labgrid-matlab`; run `git submodule update --init --recursive` after cloning):

```matlab
classdef (SharedTestFixtures={labgrid.fixtures.BoardFixture("adrv9009")}) ...
        ADRV9009Tests < HardwareTests
```

The part is the coordinator's `daughter-board` tag (`ad9361`, `adrv9002`, `adrv9371`,
`adrv9009`, `fmcomms5`, `fmcomms8`, `pluto`, `adrv9009zu11eg`). While the fixture is active,
`IIO_URI` is set, which `HardwareTests.UpdateURIFromEnv` already reads.

| Situation | What happens |
|---|---|
| `IIO_URI` exported by `adi-lg request --run` (CI) | used as-is |
| no `IIO_URI`, `adi-lg` and `LG_COORDINATOR` available (your desk) | the fixture reserves + boots the board, releases it after the class |
| no board / no labgrid tooling | class is Incomplete (same as the old `CheckDevice` skip) |

## CI

`.github/workflows/hw-matlab.yml` calls labgrid-plugins' reusable `matlab-hw-request.yml`:
`board_map.yaml` maps coordinator place tags to the `runHWTests(board)` name, and each leg runs
`adi-lg request --part ... --run "matlab -batch ...runHWTests('<board>')"`. Trigger with the
`hw-test` PR label, `workflow_dispatch`, or the daily schedule. Results:
`<board>_HWTestResults.xml` (JUnit), `<board>_labgrid-summary.json`, `failures.txt`.

## At your desk

```matlab
setenv LG_COORDINATOR 10.0.0.41:20408          % and LG_ADI_LG_BIN if adi-lg is not on PATH
addpath(genpath('hdl')); addpath(genpath('test'));
runtests('ADRV9009Tests')                       % fixture boots the board, runs, releases
% or the CI entry point (no exit() call; returns 0 / 2 failed / 3 incomplete):
rc = runHWTests('zynq-zc706-adv7511-adrv9009');
```
