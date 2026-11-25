#!/bin/bash
# Run a command headless.
# MATLAB HDL workflows start Qt GUI components that abort with
# "no Qt platform plugin could be initialized" when no display exists.
# By default Qt is pointed at its offscreen platform, which needs no X server
# and keeps DISPLAY unset for child tools such as Vivado.
# Set USE_XVFB=1 to run under a virtual X display instead.
# If DISPLAY is already set, the command runs as-is.
# Usage: with_xvfb.sh <command> [args...]

if [ -n "$DISPLAY" ]; then
    exec "$@"
fi

if [ "${USE_XVFB:-0}" != "1" ] || ! command -v Xvfb >/dev/null 2>&1; then
    echo "Running headless with QT_QPA_PLATFORM=offscreen"
    export QT_QPA_PLATFORM=offscreen
    exec "$@"
fi

# Randomize the display number to avoid conflicts between parallel jobs
DISPLAY_ID=":$(shuf -i 10-1000 -n 1)"
Xvfb "$DISPLAY_ID" -nolisten tcp &
XVFB_PID=$!
export DISPLAY="$DISPLAY_ID"
export SWT_GTK3=0
sleep 2

"$@"
EC=$?

kill -9 "$XVFB_PID" 2>/dev/null || true
exit $EC
