#!/bin/bash
# Run a command with a virtual X display.
# MATLAB HDL workflows start Qt GUI components that abort with
# "no Qt platform plugin could be initialized" when no display exists.
# If DISPLAY is already set, the command runs as-is; without Xvfb, Qt falls
# back to the offscreen platform.
# Usage: with_xvfb.sh <command> [args...]

if [ -n "$DISPLAY" ]; then
    exec "$@"
fi
if ! command -v Xvfb >/dev/null 2>&1; then
    echo "Xvfb not found; using Qt offscreen platform"
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
