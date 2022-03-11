import json

board = {
    "fmcomms2": {
        "fpga": ["zed", "zc706", "zc702"],
        "supported_rd": ["rx", "tx", "rxtx"],
        "ports": [
            {
                "rx": [
                    {
                        "input": False,
                        "width": 1,
                        "name": "util_ad9361_adc_pack/fifo_wr_en",
                        "count": 1,
                        "type": "valid",
                    },
                    {
                        "input": True,
                        "width": 1,
                        "name": "util_ad9361_adc_fifo/dout_valid_0",
                        "count": 1,
                        "type": "valid",
                    },
                    {
                        "input": False,
                        "width": 16,
                        "name": "util_ad9361_adc_pack/fifo_wr_data_@",
                        "count": 4,
                        "type": "data",
                    },
                    {
                        "input": True,
                        "width": 16,
                        "name": "util_ad9361_adc_fifo/dout_data_@",
                        "count": 4,
                        "type": "data",
                    },
                ],
                "tx": [
                    {
                        "input": True,
                        "width": 1,
                        "name": "util_ad9361_dac_upack/fifo_rd_valid",
                        "count": 1,
                        "type": "valid",
                    },
                    {
                        "input": False,
                        "width": 1,
                        "name": "axi_ad9361_dac_fifo/din_valid_in_0",
                        "count": 1,
                        "type": "valid",
                    },
                    {
                        "input": False,
                        "width": 16,
                        "name": "axi_ad9361_dac_fifo/din_data_@",
                        "count": 4,
                        "type": "data",
                    },
                    {
                        "input": True,
                        "width": 16,
                        "name": "util_ad9361_dac_upack/fifo_rd_data_@",
                        "count": 4,
                        "type": "data",
                    },
                ],
            },
        ],
    }
}

with open("sample.json", "w") as outfile:
    json.dump(board, outfile, indent=4)
