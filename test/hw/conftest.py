"""Hardware-CI conftest for TransceiverToolbox.

Mirrors the pyadi-iio HW-CI lifecycle (see
pyadi-iio/test/conftest.py:86-224) but adapts it for MATLAB:

* No pytest-libiio. Resolved URI is exposed via an `iio_uri` session
  fixture instead of `config.option.uri`.
* Active only when ``LG_ENV`` is set (CI hardware runs); when unset
  every fixture/hook is a no-op so existing MATLAB unit/non-HW
  invocations are untouched.

Flow:

1. ``pytest_configure`` loads ``LG_ENV`` via labgrid ``Environment``,
   transitions the place's ``Strategy`` driver to ``"shell"``, polls
   the booted board for its DHCP-assigned IPv4, and stashes
   ``f"ip:{ip}"`` for the fixture.
2. The session-scoped ``iio_uri`` fixture returns that string. Bridge
   tests inject it directly into the MATLAB subprocess environment.
3. ``pytest_sessionfinish`` transitions the strategy to ``"powered_off"``
   regardless of pass/fail.
"""

from __future__ import annotations

import os
import re
import time
import warnings

import pytest

_LG_ENV = os.environ.get("LG_ENV")
_lg_strategy = None  # captured in pytest_configure for sessionfinish teardown
_resolved_uri: str | None = None


def _wait_for_ipv4(shell, timeout: int = 60) -> str:
    """Poll the booted board for a valid DHCP-assigned IPv4 address.

    ``shell.run()`` captures both stdout and stderr from the serial
    console, so transient errors like ``RTNETLINK answers: Network is
    unreachable`` can land in the output before the link is up —
    validate the line is dotted-quad before accepting it.
    """
    ipv4_re = re.compile(r"^\d{1,3}(?:\.\d{1,3}){3}$")
    deadline = time.time() + timeout
    while time.time() < deadline:
        out, _, _ = shell.run(
            "ip -4 -o route get 1.1.1.1 2>/dev/null "
            "| awk '{for(i=1;i<=NF;i++) if($i==\"src\") print $(i+1); exit}'"
        )
        for line in out or []:
            line = line.strip()
            if ipv4_re.match(line):
                return line
        time.sleep(2)
    return ""


def _do_labgrid_boot() -> None:
    """One attempt at full labgrid boot + IP-readiness + URI publish."""
    global _lg_strategy, _resolved_uri
    from labgrid import Environment  # lazy: only needed for HW runs

    env = Environment(_LG_ENV)
    target = env.get_target("main")
    _lg_strategy = target.get_driver("Strategy")

    # The transition target is read from the place's env (set in the
    # yaml as `transition_to` under the `Strategy` driver). Default is
    # `booted` — power-cycle + wait for the Linux marker, no file
    # updates over SSH. Override per-place via the env yaml if a lab
    # needs `shell` (BootFPGASoCSSH's full update-and-reboot loop).
    transition_to = os.environ.get("LG_TRANSITION_TO", "booted")
    _lg_strategy.transition(transition_to)

    # Resolve the board's libIIO URI. Two paths:
    #
    # 1. Shell-poll: pyadi-iio's path. Asks the booted board for its
    #    own DHCP-assigned IP via `ip route get`. Works on labs where
    #    the board reaches its final IP only after some user-space
    #    fixup (BootFabric's `udhcpc` step etc.).
    # 2. Resource fallback: read the place's `NetworkService.address`
    #    directly. Works on labs where the board has a stable IP the
    #    exporter already knows about (the Kuiper-on-SD case here).
    #
    # Try the shell path first; on any failure, fall back to the
    # resource. Both are equivalent when DHCP gives the configured IP.
    ip = ""
    try:
        shell = target.get_driver("CommandProtocol")
        ip = _wait_for_ipv4(shell, timeout=60)
    except Exception as e:  # noqa: BLE001
        warnings.warn(
            f"shell-based IP poll failed ({e!r}); falling back to "
            f"NetworkService.address",
            stacklevel=1,
        )
    if not ip:
        try:
            ns = target.get_resource("NetworkService")
            ip = ns.address
        except Exception as e:  # noqa: BLE001
            raise RuntimeError(
                f"could not resolve board IP (shell poll empty, "
                f"NetworkService lookup failed: {e!r})"
            ) from e
    if not ip:
        raise RuntimeError("could not resolve a board IP from shell or NetworkService")
    _resolved_uri = f"ip:{ip}"


def pytest_configure(config: pytest.Config) -> None:
    """When ``LG_ENV`` is set, boot the lab board and stash its URI.

    Wrapped in a small retry loop because the lab-side path is flaky:
    mDNS resolution of place hosts, SSH ControlMaster bring-up, etc.
    all surface as transient socket errors that succeed on a retry.
    """
    if not _LG_ENV:
        return
    attempts = 3
    last_err: Exception | None = None
    for i in range(1, attempts + 1):
        try:
            _do_labgrid_boot()
            return
        except Exception as e:  # noqa: BLE001
            last_err = e
            if i < attempts:
                time.sleep(10)
    pytest.fail(f"labgrid boot failed after {attempts} attempts: {last_err!r}")


def pytest_sessionfinish(session: pytest.Session, exitstatus: int) -> None:
    """Power the board off after the last test, regardless of pass/fail.

    The three strategies in use (BootFPGASoC, BootFPGASoCTFTP,
    BootFabric) all define ``Status.powered_off`` so the same string
    transition works across legs. Cleanup errors are warned, never
    re-raised, so a flaky power-off can't mask a real test failure.
    """
    if _lg_strategy is None:
        return
    try:
        _lg_strategy.transition("powered_off")
    except Exception as e:  # noqa: BLE001
        warnings.warn(f"strategy power-off failed: {e}", stacklevel=1)


@pytest.fixture(scope="session")
def iio_uri() -> str:
    """The libIIO URI of the booted board (``ip:<addr>``).

    Skips the test when no labgrid boot was performed (``LG_ENV``
    unset, or boot failed but pytest_configure didn't fail-hard for
    some reason).
    """
    if _resolved_uri is None:
        pytest.skip("no labgrid-resolved iio_uri (LG_ENV not set?)")
    return _resolved_uri
