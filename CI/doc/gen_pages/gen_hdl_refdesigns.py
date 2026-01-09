from jinja2 import Environment, FileSystemLoader
import os
import json
import numpy as np


def update_hdl_refdesigns():

    template_filename = "refdesign.html"

    folder_of_this_file = os.path.dirname(__file__)
    source_folder = os.path.join(folder_of_this_file, "..", "source")

    ci_scripts_folder = os.path.join(folder_of_this_file, "..", "..", "scripts")

    _generated_folder = os.path.join(folder_of_this_file, "..", "source", "_generated")
    if not os.path.exists(_generated_folder):
        os.mkdir(_generated_folder)

    hdlrefdesigns_folder = os.path.join(_generated_folder, "hdlrefdesigns")
    if not os.path.exists(hdlrefdesigns_folder):
        os.mkdir(hdlrefdesigns_folder)


    with open(os.path.join(ci_scripts_folder, "ports.json")) as f:
        objs = json.load(f)

    # Import template
    loc = os.path.dirname(__file__)
    loc = os.path.join(loc, "_templates")
    file_loader = FileSystemLoader(loc)
    env = Environment(loader=file_loader)

    loc = os.path.join(template_filename)
    template = env.get_template(loc)

    designs = {}

    for obj in objs:

        print("Generating", obj)

        # Render template
        objs[obj]["name"] = obj

        if objs[obj]["name"] in ["fmcomms2", "adrv9361z7035", "adrv9364z7020", "pluto"]:
            objs[obj]["rd_image"] = "ad9361"
        elif objs[obj]["name"] in ["adrv9002"]:
            objs[obj]["rd_image"] = "adrv9001"
        else:
            objs[obj]["rd_image"] = "jesd"

        objs[obj]["hdl_rd_doc"] = f"https://analogdevicesinc.github.io/hdl/projects/{objs[obj]['name']}/index.html"


        output = template.render(obj=objs[obj])
        # Write output
        output_filename = os.path.join(hdlrefdesigns_folder, f"{obj}.md")
        loc = os.path.join(output_filename)
        f = open(loc, "w")
        f.write(output)
        f.close()
        designs[obj] = output_filename

    # # Update mkdocs.yml
    # loc = os.path.join("mkdocs.tmpl")
    # template = env.get_template(loc)
    # output = template.render(designs=designs)

    # loc = os.path.join("..", "mkdocs.yml")
    # with open(loc, "w") as f:
    #     f.write(output)
        
    # Create allrefdesigns.md
    loc = os.path.join("allrefdesigns.tmpl")
    template = env.get_template(loc)
    output = template.render(designs=designs)

    loc = os.path.join(source_folder, "allrefdesigns.md")
    with open(loc, "w") as f:
        f.write(output)

    return designs

if __name__ == "__main__":
    update_hdl_refdesigns()
