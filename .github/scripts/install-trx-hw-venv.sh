#!/usr/bin/env bash
# Install TransceiverToolbox HW-CI Python deps into a persistent
# uv-managed venv at ~/.cache/trx-hw-ci/venv on the current runner.
#
# Mirror of pyadi-iio's install-pyadi-iio-venv.sh, but our deps are
# only what's needed for the labgrid boot lifecycle + the MATLAB
# bridge tests — no pyadi-iio, no matplotlib, no scipy:
#
#   adi-labgrid-plugins[kuiper]  registers labgrid resource/driver
#                                classes the env yamls reference; the
#                                pytest11 plugin auto-registers and
#                                drives HW_DAUGHTER / HW_CARRIER
#                                marker filtering.
#   pytest, pyyaml               minimal test runner deps.

set -euo pipefail

VENV="$HOME/.cache/trx-hw-ci/venv"

export PATH="$HOME/.local/bin:$PATH"

if [[ ! -x "$VENV/bin/python" ]]; then
    echo "Creating trx HW-CI venv at $VENV" >&2
    uv venv --quiet "$VENV"
fi

uv pip install --quiet --python "$VENV/bin/python" \
    -r test/hw/requirements_dev.txt
