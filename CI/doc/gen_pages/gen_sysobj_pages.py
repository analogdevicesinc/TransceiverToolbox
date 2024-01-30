from jinja2 import Environment, FileSystemLoader
import os
import json


def gen_sys_obj_pages(matlab):

    folder_of_this_file = os.path.dirname(__file__)

    source_folder = os.path.join(folder_of_this_file, "..", "source")

    _generated_folder = os.path.join(folder_of_this_file, "..", "source", "_generated")
    if not os.path.exists(_generated_folder):
        os.mkdir(_generated_folder)

    sys_obj_gen_folder = os.path.join(_generated_folder, "sysobjects")
    if not os.path.exists(sys_obj_gen_folder):
        os.mkdir(sys_obj_gen_folder)


    template_filename = "sysobj.html"

    # Data for template
    if not os.path.exists("sysobjs.json"):
        raise Exception("sysobjs.json not found. Run gen_sysobj_doc.m first.")
    with open("sysobjs.json") as f:
        objs = json.load(f)

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
        print("Generating doc page for", obj["name"])
        # Render template
        obj = cleanup(obj)
        output = template.render(obj=obj, disable_nav=matlab)
        # Write output
        output_filename = os.path.join(sys_obj_gen_folder, f"{obj['name']}.md")
        # output_filename = f"sysobjects/{obj['name']}.md"
        loc = os.path.join(output_filename)
        f = open(loc, "w")
        f.write(output)
        f.close()
        devices[obj["name"]] = output_filename

    # Create allsysobjs.md
    loc = os.path.join("allsysobjs.tmpl")
    template = env.get_template(loc)
    output = template.render(devices=devices, disable_nav=matlab)

    loc = os.path.join(source_folder, "objects.md")
    with open(loc, "w") as f:
        f.write(output)
    

    if matlab:
        # Generate index for objs
        loc = os.path.join("allsysobjs.tmpl")
        template = env.get_template(loc)
        output = template.render(devices=devices, disable_nav=matlab)

        loc = os.path.join("objects.md")
        with open(loc, "w") as f:
            f.write(output)

    return devices

if __name__ == "__main__":
    gen_sys_obj_pages(False)
