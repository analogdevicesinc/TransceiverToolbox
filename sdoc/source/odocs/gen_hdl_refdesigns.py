from jinja2 import Environment, FileSystemLoader
import os
import json
import numpy as np


def update_hdl_refdesigns():

    template_filename = "refdesign.html"

    # Data for template
    f = open("ports.json")
    objs = json.load(f)
    f.close()

    # Import template
    loc = os.path.dirname(__file__)
    loc = os.path.join(loc, "_templates")
    file_loader = FileSystemLoader(loc)
    env = Environment(loader=file_loader)

    loc = os.path.join(template_filename)
    template = env.get_template(loc)

    designs = {}

    for obj in objs:
        # Render template
        objs[obj]["name"] = obj

        if objs[obj]["name"] in ["fmcomms2", "adrv9361z7035", "adrv9364z7020", "pluto"]:
            objs[obj]["rd_image"] = "ad9361"
        elif objs[obj]["name"] in ["adrv9002"]:
            objs[obj]["rd_image"] = "adrv9001"
        else:
            objs[obj]["rd_image"] = "jesd"

        output = template.render(obj=objs[obj])
        # Write output
        output_filename = f"hdlrefdesigns/{obj}.md"
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
    return designs
