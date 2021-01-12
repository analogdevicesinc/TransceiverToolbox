# type:ignore
# flake8: noqa
import os
import sys
from glob import glob

from invoke import task
import shutil


@task
def download_mbeautifer(c):
    # Move to repo root
    abspath = os.path.abspath(__file__)
    dname = os.path.dirname(abspath)
    os.chdir(dname)
    os.chdir(os.path.dirname(os.getcwd()))
    os.chdir(os.path.dirname(os.getcwd()))
    c.run("git clone https://github.com/davidvarga/MBeautifier.git")


@task(
    download_mbeautifer,
    help={
        "mlpath": "Path to MATLAB root. This does not contain the release name. Default is /usr/local/MATLAB",
        "mlrelease": "Name of MATLAB release in form R{year}{a/b}. Default is R2020b",
    },
)
def format(c, mlpath="/usr/local/MATLAB", mlrelease="R2020b"):
    # Create script with lint operations
    f = open("linter.m", "w")
    for top in ["+adi", "trx_examples", "hdl", "test"]:
        folders = glob(top + "/*/")
        for folder in folders:
            cmd = "MBeautify.formatFiles('" + folder + "','*.m')"
            f.write(cmd + "\n")
    f.close()

    # Lint
    ml = os.path.join(mlpath, mlrelease, "bin", "matlab")
    if not os.path.exists(ml):
        raise Exception("MATLAB not found at: " + ml)
    c.run(ml + " -batch \"addpath('MBeautifier');linter;exit(0)\"")

    # Cleanup
    shutil.rmtree("MBeautifier")
    os.remove("linter.m")
