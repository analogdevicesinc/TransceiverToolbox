#!/bin/bash

BOARD=$1
MLFLAGS="-nodisplay -nodesktop -nosplash"

if [ -z "$MLRELEASE" ]
then
	MLRELEASE=R2023b
fi

MLPATH=/opt/MATLAB

cd ../.. 
cp hdl/vendor/AnalogDevices/hdlcoder_board_customization.m test/hdlcoder_board_customization_local.m
sed -i "s/hdlcoder_board_customization/hdlcoder_board_customization_local/g" test/hdlcoder_board_customization_local.m
source /opt/Xilinx/Vivado/2022.2/settings64.sh
# Randomize DISPLAY number to avoid conflicts
export DISPLAY_ID=:$(shuf -i 10-1000 -n 1)
Xvfb :$DISPLAY_ID &
export DISPLAY=:$DISPLAY_ID
export SWT_GTK3=0
source /opt/Xilinx/Vivado/2022.2/settings64.sh
$MLPATH/$MLRELEASE/bin/matlab $MLFLAGS -r "cd('test');runSynthTests('$BOARD');"
EC=$?
pidof Xvfb
if [ $? -eq 0 ]; then
    kill -9 `pidof Xvfb`
fi
exit $EC
