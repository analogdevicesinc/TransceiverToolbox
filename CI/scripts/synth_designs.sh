#!/bin/bash

BOARD=$1
MLFLAGS="-nodisplay -nodesktop -nosplash"

if [ -z "$MLRELEASE" ]
then
	MLRELEASE=R2022b
fi

MLPATH=/usr/local/MATLAB

cd ../.. 
cp hdl/vendor/AnalogDevices/hdlcoder_board_customization.m test/hdlcoder_board_customization_local.m
sed -i "s/hdlcoder_board_customization/hdlcoder_board_customization_local/g" test/hdlcoder_board_customization_local.m
source /opt/Xilinx/Vivado/2021.2/settings64.sh
Xvfb :77 &
export DISPLAY=:77
export SWT_GTK3=0
source /opt/Xilinx/Vivado/2021.2/settings64.sh
$MLPATH/$MLRELEASE/bin/matlab $MLFLAGS -r "cd('test');runSynthTests('$BOARD');"
pidof Xvfb
if [ $? -eq 0 ]; then
    kill -9 `pidof Xvfb`
fi
