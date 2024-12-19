#!/bin/bash
set -x

MLFLAGS="-nodisplay -nodesktop -nosplash"

if [ -z "$MLRELEASE" ]
then
	MLRELEASE=R2023b
fi
if [ -z "$DEMO" ]
then
	DEMO=""
fi
echo "Testing demo: $DEMO"

MLPATH=/opt/MATLAB

cd ../.. 
source /opt/Xilinx/Vivado/2022.2/settings64.sh
# Randomize DISPLAY number to avoid conflicts
export DISPLAY_ID=:$(shuf -i 10-1000 -n 1)
Xvfb :$DISPLAY_ID &
XVFB_PID=$!
export DISPLAY=$DISPLAY_ID
export SWT_GTK3=0
source /opt/Xilinx/Vivado/2022.2/settings64.sh
$MLPATH/$MLRELEASE/bin/matlab $MLFLAGS -r "addpath(genpath('test'));addpath(genpath('deps'));runDemoTests('$DEMO');"
EC=$?
sleep 5
kill -9 $XVFB_PID || true
exit $EC

