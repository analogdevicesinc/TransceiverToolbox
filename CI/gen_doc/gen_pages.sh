

cp source/devices.tmpl source/devices.rst
cp source/index.tmpl source/index.rst

mkdir -p source/_mlpages/devices
cp ../../doc/*.html source/_mlpages/
mv source/_mlpages/AD*.html      source/_mlpages/devices/
mv source/_mlpages/FMComms*.html source/_mlpages/devices/
mv source/_mlpages/Pluto*.html   source/_mlpages/devices/
mv source/_mlpages/Pack*.html    source/_mlpages/devices/

python3 gen_pages.py
make html
