import glob

# Get list of HTML files
root = "source/_mlpages"
target = "source"


files = glob.glob(root + "/**/*.html", recursive=True)
files = sorted(files)

titles = {
    "SysObjsProps": "System Objects and Properties",
    "SystemObjects": "System Objects",
    "StateMgmt": "State Management",
    "ForDevs": "For Developers",
}

for f in files:
    filename = f.split("/")[-1]
    rstfile = filename[:-5] + ".rst"

    # Skip
    if filename in ["adi_bsp.html", "adi_ttb_home.html"]:
        continue

    # Handle devices
    if f.split("/")[-2] == "devices":
        # Create RST
        with open(target + "/" + rstfile, "w") as file:
            title = filename[:-4] + "\n"
            l = "*" * len(title) + "\n"
            file.write(title)
            file.write(l)
            file.write(".. raw:: html\n")
            file.write(f"   :file: _mlpages/devices/{filename}\n")
        with open(target + "/devices.rst", "a") as file:
            file.write(f"   {title[:-2]} <{rstfile}>\n")
        continue

    # Handle other pages
    with open(target + "/" + rstfile, "w") as file:
        sfile = filename.split(".")[0]
        if sfile in titles.keys():
            title = titles[sfile] + "\n"
        else:
            title = sfile + "\n"
        l = "*" * len(title) + "\n"
        file.write(title)
        file.write(l)
        file.write(".. raw:: html\n")
        file.write(f"   :file: _mlpages/{filename}\n")
    if rstfile in ["ForDevs.rst"]:
        continue
    with open(target + "/index.rst", "a") as file:
        file.write(f"   {title[:-1]} <{rstfile}>\n")

# Add to end
with open(target + "/index.rst", "a") as file:
    file.write(f"   Devices <devices.rst>\n")

with open(target + "/index.rst", "a") as file:
    file.write(f"   Developers <ForDevs.rst>\n")
   

