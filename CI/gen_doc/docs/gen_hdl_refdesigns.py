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

    def get_ml_name(input, ptype, rdtype, port_num, is_complex, chip):

        if ptype == "valid":
            if input:
                if rdtype == "rx":
                    out = "IP Valid Rx Data IN"
                else:
                    out = "IP Valid Tx Data IN"
            else:
                if rdtype == "rx":
                    out = "IP Data Valid OUT"
                else:
                    out = "IP Load Tx Data OUT"

        elif ptype == "data":
            if input:
                if is_complex:
                    numC = np.floor((port_num) / 2)
                    if rdtype == "rx":
                        if (port_num + 1) / 2 == (port_num + 1) // 2:
                            out = f"{chip} ADC Data I{int(numC)}"
                        else:
                            out = f"{chip} ADC Data Q{int(numC)}"
                    else:
                        out = f"IP Data {port_num} IN"
                else:
                    if rdtype == "rx":
                        out = f"{chip} ADC Data {port_num}"
                    else:
                        out = f"IP Data {port_num} IN"

            else:
                if is_complex:
                    numC = np.floor((port_num) / 2)
                    if rdtype == "rx":
                        out = f"IP Data {port_num} OUT"
                    else:
                        if (port_num + 1) / 2 == (port_num + 1) // 2:
                            out = f"{chip} DAC Data I{int(numC)}"
                        else:
                            out = f"{chip} DAC Data Q{int(numC)}"
                else:
                    if rdtype == "rx":
                        out = "IP Data Valid OUT"
                    else:
                        out = "IP Data Tx Data OUT"

        return out

    def cleanup(obj):

        print("--------------")
        for rd in obj["ports"]:
            for ports in rd:
                n_ports = []
                tmp_ports = rd[ports].copy()
                for port in tmp_ports:
                    if port["count"] > 1:
                        for i in range(port["count"]):
                            port["name"] = port["name"][:-1] + str(i)

                            mln = get_ml_name(
                                port["input"],
                                port["type"],
                                ports,
                                i,
                                obj["complex"],
                                obj["chip"],
                            )
                            print(mln)
                            port["ml_name"] = mln

                            n_ports.append(port.copy())
                    else:
                        mln = get_ml_name(
                            port["input"],
                            port["type"],
                            ports,
                            0,
                            obj["complex"],
                            obj["chip"],
                        )
                        port["ml_name"] = mln

                        n_ports.append(port)

                rd[ports] = n_ports

        return obj

    for obj in objs:
        # Render template
        objs[obj] = cleanup(objs[obj])
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
