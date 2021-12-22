from jinja2 import Environment, FileSystemLoader
import os
import json

template_filename = "sysobj.html"

# Data for template
f = open('sysobjs.json')
objs = json.load(f)
f.close()

# Import template
loc = os.path.dirname(__file__)
loc = os.path.join(loc, "_templates")
file_loader = FileSystemLoader(loc)
env = Environment(loader=file_loader)

loc = os.path.join(template_filename)
template = env.get_template(loc)

for obj in objs:
    # Render template
    print(obj)
    output = template.render(obj=obj)
    # Write output
    output_filename = f"sysobjects/{obj['name']}.md"
    loc = os.path.join(output_filename)
    f = open(loc, 'w')
    f.write(output)
    f.close()
    # break

# output = template.render(data=data)

# with open(output_filename, "w") as f:
#     f.write(output)