#!/bin/bash
screen -S Installer -dm bash -c "$1/$2/bin/matlab $3 -r 'genLTEPAInstaller'"
echo "MATLAB launched"

for ii in {1..500}
do
        echo $ii
        echo "Active MATLAB session IDs: $(pidof MATLAB)"
        screen -list | grep Installer
        if [ -f LTEPA/for_redistribution/LTEPAInstaller.install ]; then
                echo "Generated installer found"
                echo "Stopping MATLAB"
                sleep 4
                screen -X -S Installer quit
                screen -list
                exit 0
        fi
        sleep 1
done
exit 1
