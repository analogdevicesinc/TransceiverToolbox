#!/bin/bash

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
Xvfb :77 &
export DISPLAY=:77
export SWT_GTK3=0
source /opt/Xilinx/Vivado/2022.2/settings64.sh
$MLPATH/$MLRELEASE/bin/matlab $MLFLAGS -r "addpath(genpath('test'));addpath(genpath('deps'));runDemoTests('$DEMO');"
EC=$?
pidof Xvfb
if [ $? -eq 0 ]; then
	kill -9 `pidof Xvfb`
fi
exit $EC