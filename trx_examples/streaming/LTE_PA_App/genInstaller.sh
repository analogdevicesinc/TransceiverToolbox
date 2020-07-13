#!/bin/bash
$1/$2/bin/matlab $3 -r 'genLTEPAInstaller' &
PID=$!

for ii in {1..500}
do
	if [ -f LTEPA/for_redistribution/LTEPAInstaller.install ]; then
		echo "Killing "$PID
		kill -9 $PID
		break
	fi
	sleep 1
done

