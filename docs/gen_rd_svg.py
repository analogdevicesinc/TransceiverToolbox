import os

def gen_rd_svg():
    refs = ["rd_ad9361","rd_adrv9001","rd_jesd"]
    css_out = ""

    for ref in refs:

        with open(f"assets/{ref}.svg", "r") as f:
            svg = f.read()

        selectable_boxes = {
            "AXIAD9361Box": {"link": "https://wiki.analog.com/resources/fpga/docs/axi_ad9361"},
            "AXIADRV9002Box": {"link": "https://wiki.analog.com/resources/eval/user-guides/adrv9002/axi_adrv9002"},
            "TxDMAEngineBox": {"link": "https://wiki.analog.com/resources/fpga/docs/axi_dmac"},
            "TxUPACKBox": {"link": "https://wiki.analog.com/resources/fpga/docs/util_upack"},
            "TxFIFOBox": {"link": "https://wiki.analog.com/resources/fpga/docs/util_rfifo"},
            "RxDMAEngineBox": {"link": "https://wiki.analog.com/resources/fpga/docs/axi_dmac"},
            "CPACKBox": {"link": "https://wiki.analog.com/resources/fpga/docs/util_cpack"},
            "RxFIFOBox": {"link": "https://wiki.analog.com/resources/fpga/docs/util_rfifo"},
            "RxJESDTPL": {"link": "https://wiki.analog.com/resources/fpga/peripherals/jesd204/jesd204_tpl_adc"},
            "TxJESDTPL": {"link": "https://wiki.analog.com/resources/fpga/peripherals/jesd204/jesd204_tpl_dac"},
            "RxJESDLink": {"link": "https://wiki.analog.com/resources/fpga/peripherals/jesd204/axi_jesd204_rx"},
            "TxJESDLink": {"link": "https://wiki.analog.com/resources/fpga/peripherals/jesd204/axi_jesd204_tx"},
            "RxJESDPHY": {"link": "https://wiki.analog.com/resources/fpga/docs/axi_adxcvr"},
            "TxJESDPHY": {"link": "https://wiki.analog.com/resources/fpga/docs/axi_adxcvr"},
        }


        # "TxCustomIPBox",
        # CarrierBox
        # AXIInterconnectBox
        # ZynqBox
        # DDRxBox
        # InterruptsBox
        # UARTBox
        # EthernetBox
        # RxCustomIPBox
        # CustomIPOutline


        # Parse each g tag
        output = ""
        for i, sec in enumerate(svg.split("<g")):
            if i == 0:
                output += sec
                continue

            # Extra text
            # if '"AXIAD9361Interface"' in sec:
            #     print(id)
            #     output += '<g><text x="605" y="327" class="large" text-anchor="start" font-size="14" transform="rotate(-90,605,327)" fill="red">AXI-AD9361 Interface</text></g>'
            #     css_out += '#AXIAD9361Interface {fill: none; stroke: none;}\n'

            o = "<g" + sec
            loc = o.find("</g>") + 4
            gtag = o[:loc]
            post_gtag = o[loc:]
            # print(gtag)
            loc = gtag.find("id=") + 4
            id = gtag[loc : gtag.find('"', loc)]
            if id == "CarrierBox":
                css_out += (
                    f"\n#{id} > rect {{\n"
                    + "    fill: var(--md-default-fg-color--light);\n"
                    + "}\n"
                )


            if not id or id not in selectable_boxes:
                output += o
                continue
            # Add link wrapper
            output += f'<a xlink:href="{selectable_boxes[id]["link"]}">{gtag}</a>{post_gtag}'
            # output += o
            # print(sec)
            # Add css to change fill color
            css_out += f"#{id} > rect {{\n" + "    stroke: white;\n" + "}\n"
            css_out += f"\n#{id}:hover > rect {{\n" + "    fill: rgb(0, 174, 255);\n" + "}\n"



        with open(f"assets/{ref}_custom.svg", "w") as f:
            f.write(output)

        css_out += "\n#FPGACarrierText {\n" + "    fill: var(--rd-title-color);\n" + "}\n"
        css_out += "\n#CarrierBox > rect {\n" + "    fill: none;\n    stroke: black\n" + "}\n"
        css_out += (
            "\n#CustomIPOutline > rect {\n" + "    stroke: var(--rd-title-color);\n" + "}\n"
        )
        css_out += ("\n#CustomIPIntegrationText {\n" + "    fill: var(--rd-title-color);\n" + "}\n")

    with open("stylesheets/rd_style.css", "w") as f:
        f.write(css_out)
