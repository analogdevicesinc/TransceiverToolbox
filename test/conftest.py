import os
import subprocess
from pathlib import Path
import pytest

# Locate MATLAB
class matlab_interface:
    def __init__(self, target_matlab_version=None, flags=None, runpath=None):
        self.target_matlab_version = target_matlab_version
        self.matlab_bin = self.find_matlab()
        if not flags:
            self.flags = ["-nodisplay", "-nodesktop", "-nosplash"]
        else:
            self.flags = flags
        if not runpath:
            self.runpath = Path(__file__).parent
        else:
            self.runpath = runpath

    def filter_releases(self, root):
        found_releases_str = []
        if not os.path.isdir(root):
            pytest.skip('MATLAB not found')
            # raise Exception("MATLAB root directory not found " + root)
        for folder in os.listdir(root):
            if "R20" in folder:
                found_releases_str.append(folder)

        if not found_releases_str:
            pytest.skip('MATLAB not found')
            # raise Exception("MATLAB not found")
        if self.target_matlab_version:
            if self.target_matlab_version in found_releases_str:
                return self.target_matlab_version
            pytest.skip('MATLAB not found')
            # raise Exception("MATLAB " + self.target_matlab_version + " not found")
        found_releases_str.sort()
        return found_releases_str[-1]

    def find_matlab(self):
        if "posix" in os.name:
            root = "/usr/local/MATLAB"
        else:
            root = "C:\Program Files\MATLAB"
        rel = self.filter_releases(root)
        return os.path.join(root, rel, "bin", "matlab")

    def run(self, cmd):
        subprocess.check_call(
            [self.matlab_bin, *(self.flags), "-batch", cmd],
            cwd=self.runpath,
            timeout=60,
        )


@pytest.fixture(scope="session", autouse=True)
def matlab(request):
    matlabapi = matlab_interface()
    yield matlabapi


if __name__ == "__main__":
    mi = matlab_interface()
    mi.find_matlab()
