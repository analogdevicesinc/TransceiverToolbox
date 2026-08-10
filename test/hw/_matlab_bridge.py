"""Shared helper: launch ``runHWTests`` against a libIIO URI from pytest.

Each ``test/hw/test_*.py`` calls :func:`run_matlab_hw_tests` with the
MATLAB board reference name it targets (matching one of the entries in
``test/runHWTests.m``'s switch). The helper sets ``IIO_URI`` /
``board`` in the subprocess env, runs MATLAB in ``-batch`` mode, and
copies the MATLAB-side JUnit (``<board>_HWTestResults.xml``) into a
per-test JUnit so the workflow's aggregator picks it up.

``runHWTests.m`` exit codes (see test/runHWTests.m:103-121):
  0 = all passed, 2 = one or more failed, 3 = one or more Incomplete
  (e.g. CheckDevice's ``assumeFail`` when the board isn't reachable).

Treat 0 and 3 as non-failures at the pytest level; the JUnit itself
reflects skipped status and downstream reporters surface it. Anything
else (real failure or MATLAB crash) fails the test loudly.
"""

from __future__ import annotations

import os
import shutil
import subprocess
from pathlib import Path

import pytest

REPO_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_MATLAB = os.environ.get("MATLAB_BIN", "matlab")
_BATCH_BODY = "addpath(genpath('test')); runHWTests(getenv('board'))"


def run_matlab_hw_tests(
    iio_uri: str,
    matlab_board: str,
    *,
    junit_dest: Path,
    extra_env: dict[str, str] | None = None,
) -> None:
    """Launch MATLAB ``runHWTests(matlab_board)`` against ``iio_uri``.

    ``junit_dest`` is the file the workflow's ``--junitxml`` would
    write — we drop the MATLAB-produced JUnit there so the per-place
    aggregation picks it up under one filename. MATLAB's
    ``XMLPlugin.producingJUnitFormat`` output IS JUnit, so no format
    conversion is required.
    """
    env = {**os.environ}
    env["IIO_URI"] = iio_uri
    env["board"] = matlab_board
    if extra_env:
        env.update(extra_env)

    cmd = [DEFAULT_MATLAB, "-nodisplay", "-nosplash", "-batch", _BATCH_BODY]
    proc = subprocess.run(cmd, cwd=str(REPO_ROOT), env=env, check=False)

    # MATLAB writes <board>_HWTestResults.xml in cwd (REPO_ROOT). Copy
    # it into the requested junit path so the workflow can pick it up
    # via --junitxml's expected location AND the artifact upload globs.
    src = REPO_ROOT / f"{matlab_board}_HWTestResults.xml"
    if src.is_file():
        junit_dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(src, junit_dest)

    if proc.returncode == 0:
        return
    if proc.returncode == 3:
        # Incomplete = CheckDevice graceful skip; JUnit reflects it.
        pytest.skip(
            f"runHWTests reported Incomplete (exit 3) — board likely "
            f"unreachable at {iio_uri}; see JUnit for per-test detail"
        )
    raise AssertionError(
        f"runHWTests({matlab_board!r}) exited {proc.returncode}; "
        f"see {junit_dest} for per-test detail"
    )
