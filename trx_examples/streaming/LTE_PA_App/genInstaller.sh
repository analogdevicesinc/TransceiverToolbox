#!/bin/bash
screen -S Installer -dm bash -c "$1/$2/bin/matlab $3 -r 'genLTEPAInstaller'"
echo "MATLAB launched"

echo "Active MATLAB session ID: $(pidof MATLAB)"
screen -list | grep Installer
if [ -f LTEPAinstaller/LTEPAInstaller ]; then
	echo "Generated installer found"
	echo "Stopping MATLAB"
	screen -X -S Installer quit
	screen -list
	exit 0
fi
