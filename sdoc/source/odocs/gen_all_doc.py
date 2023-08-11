from gen_md_pages import gen_pages_and_toc
from gen_sysobj_pages import gen_sys_obj_pages
from gen_rd_svg import gen_rd_svg
import os

if __name__ == "__main__":
    gen_rd_svg()
    matlab = bool(os.environ.get("MATLAB"))
    devices, designs = gen_sys_obj_pages(matlab)
    gen_pages_and_toc(matlab, devices, designs)
