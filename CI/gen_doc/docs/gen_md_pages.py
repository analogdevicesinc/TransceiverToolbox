from jinja2 import Environment, FileSystemLoader
import os
from os import listdir

# output_folder = "output"

# if not os.path.exists(output_folder):
#     os.makedirs(output_folder)


def gen_page(template_filename, disable_nav):
    # Import template
    loc = os.path.dirname(__file__)
    loc = os.path.join(loc, "_pages")
    print(loc)
    file_loader = FileSystemLoader(loc)
    env = Environment(loader=file_loader)

    template = env.get_template(template_filename)

    output = template.render(disable_nav=disable_nav)

    with open(template_filename, "w") as f:
        f.write(output)


def gen_toc(pages, devices, designs):
    # Import template
    loc = os.path.dirname(__file__)
    loc = os.path.join(loc, "_pages")
    file_loader = FileSystemLoader(loc)
    env = Environment(loader=file_loader)

    template = env.get_template("toc.tmpl")

    output = template.render(pages=pages, devices=devices, designs=designs)

    loc = os.path.dirname(__file__)
    loc = os.path.join(loc, "helptoc.xml")

    with open(loc, "w") as f:
        f.write(output)


def gen_pages_and_toc(matlab, devices, designs):

    template_filenames = listdir("_pages")

    pages = []
    for template_filename in template_filenames:
        if matlab and template_filename == "models.md":
            continue
        if template_filename in ["header.tmpl", "toc.tmpl"]:
            continue
        gen_page(template_filename, matlab)
        template_filename = template_filename.replace(".md", "")
        pages.append(template_filename)

    gen_toc(pages, devices, designs)
