"""Hardware test: ADRV9371 + ZC706 (Kuiper image ``zynq-zc706-adv7511-adrv9371``).

Marked with ``iio_hardware(["adrv9371"])`` so
``adi_lg_plugins.pytest_plugin`` filters this test out when the
discovered place's ``daughter-board`` tag is not ``adrv9371`` —
i.e. only the ``bq`` shard runs it.
"""

from __future__ import annotations

from pathlib import Path

import pytest

from ._matlab_bridge import run_matlab_hw_tests

MATLAB_BOARD = "zynq-zc706-adv7511-adrv9371"


@pytest.mark.iio_hardware(["adrv9371"])
def test_adrv9371_zc706_runHWTests(iio_uri, tmp_path: Path) -> None:
    """Run ``runHWTests('zynq-zc706-adv7511-adrv9371')`` against the booted board."""
    run_matlab_hw_tests(
        iio_uri,
        MATLAB_BOARD,
        junit_dest=tmp_path / "matlab-junit.xml",
    )
