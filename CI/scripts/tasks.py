# type:ignore
# flake8: noqa
import os
import sys
from glob import glob

from invoke import task

@task
def download_mbeautifer(c):
    # Move to repo root
    abspath = os.path.abspath(__file__)
    dname = os.path.dirname(abspath)
    os.chdir(dname)
    os.chdir(os.path.dirname(os.getcwd()))
    os.chdir(os.path.dirname(os.getcwd()))
    c.run('git clone https://github.com/davidvarga/MBeautifier.git')

@task(download_mbeautifer)
def format(c):
    # Create script with lint operations
    f = open('linter.m','w')
    for top in ['+adi','trx_examples','hdl','test']:
        folders = glob(top+'/*/')
        for folder in folders:
            cmd = "MBeautify.formatFiles('"+folder+"','*.m')"
            f.write(cmd+'\n')
    f.close()

    # Lint
    c.run('/usr/local/MATLAB/R2020b/bin/matlab -batch "addpath(\'MBeautifier\');linter;exit(0)"')

    # Cleanup
    c.run('rm -rf MBeautifier')
    c.run('rm linter.m')



