import pytest


def test_hw_streaming(matlab):
    matlab.run("cd('..');disp(pwd);dl=adi.util.Downloader();dl.download_libad9361();")
    matlab.run("cd('..');disp(pwd);addpath(genpath('test'));addpath(genpath('deps'));runHWTests;")
