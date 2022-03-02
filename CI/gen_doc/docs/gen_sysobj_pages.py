from jinja2 import Environment, FileSystemLoader
import os
import json


def gen_sys_obj_pages(matlab):

    template_filename = "sysobj.html"

    # Data for template
    f = open("sysobjs.json")
    objs = json.load(f)
    f.close()

    # Import template
    loc = os.path.dirname(__file__)
    loc = os.path.join(loc, "_templates")
    file_loader = FileSystemLoader(loc)
    env = Environment(loader=file_loader)

    loc = os.path.join(template_filename)
    template = env.get_template(loc)

    devices = {}

    def cleanup(obj):

        obj["dec"] = obj["dec"].replace("192.168.2.1", "ip:192.168.2.1")
        d = obj["dec"]
        ol = []
        for d in obj["dec"].split("<br>"):

            if "See also" in d:
                continue
            if "Documentation for" in d:
                continue
            if "doc adi." in d:
                continue

            ol.append(d)

        obj["dec"] = "<br>".join(ol)
        if ".Rx" in obj["name"]:
            obj["type"] = "Rx"
        else:
            obj["type"] = "Tx"

        return obj

    for obj in objs:
        # Render template
        obj = cleanup(obj)
        output = template.render(obj=obj, disable_nav=matlab)
        # Write output
        output_filename = f"sysobjects/{obj['name']}.md"
        loc = os.path.join(output_filename)
        f = open(loc, "w")
        f.write(output)
        f.close()
        devices[obj["name"]] = output_filename

    if matlab:
        # Generate index for objs
        loc = os.path.join("allsysobjs.tmpl")
        template = env.get_template(loc)
        output = template.render(devices=devices, disable_nav=matlab)

        loc = os.path.join("objects.md")
        with open(loc, "w") as f:
            f.write(output)

    ###############################################################################
    # HDL Refdesigns
    ###############################################################################
    from gen_hdl_refdesigns import update_hdl_refdesigns

    designs = update_hdl_refdesigns()

    # Update mkdocs.yml
    loc = os.path.join("mkdocs.tmpl")
    template = env.get_template(loc)
    output = template.render(devices=devices, designs=designs, matlab=matlab)

    loc = os.path.join("..", "mkdocs.yml")
    with open(loc, "w") as f:
        f.write(output)

    return devices, designs
