# Doc Creation

Doc is create by leveraging Sphinx as the documentation engine. To create the entire documentation set you must generate the dynamic pages which document the system object APIs and the reference designs. Then the output targets can be run. Since doc gen requires sphinx and some plugins they need to be installed first and ideally in a virtual environment. The following commands will create a virtual environment and install the necessary packages:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r CI/doc/requirements_doc.txt
```

Next we can build the documentation. The following commands will build the documentation and place it in the *build* folder under the *CI/doc* folder:

```bash
make -C CI/doc gen_autodocs html
```

## Updating the System Object Documentation

The system object documentation is generated from the MATLAB code and comments, which requires use of MATLAB itself. By running the script gen_sysobj_doc.m within the *gen_pages* folder, it will create the necessary sysobjs.json file which sphinx will then use to create the individual component pages. This is done by running the following command from the root of the toolbox in MATLAB:

```matlab
cd CI/doc/gen_pages
gen_sysobj_doc
```
