import json
import os
import sys
import pathlib

# Give the project name from the command line# e.g.: py test.py adrv9009 zc706

HDL_PROJECTS_PATH = pathlib.Path(__file__).parent.resolve()
PROJECT_NAME = sys.argv[1]
if "pluto" not in PROJECT_NAME:
    CARRIER_NAME = sys.argv[2]

PROJECT_PATH = os.path.join(HDL_PROJECTS_PATH, "projects", PROJECT_NAME)
if "pluto" in PROJECT_NAME:
    CARRIER_PATH = PROJECT_PATH
else:
    CARRIER_PATH = os.path.join(PROJECT_PATH, CARRIER_NAME)

carriers_list = []
if "pluto" not in PROJECT_NAME:
    for file in os.listdir(PROJECT_PATH):
        d = os.path.join(PROJECT_PATH, file)
        if os.path.isdir(d):
            if "common" not in file:
                carriers_list.append(file)

in_file = os.path.join(CARRIER_PATH, "ports_properties.txt")
if "pluto" not in PROJECT_NAME:
    p_file = PROJECT_NAME + "_" + CARRIER_NAME + "_ports.json"
    n_file = PROJECT_NAME + "_" + CARRIER_NAME + "_nets.json"
else:
    p_file = PROJECT_NAME + "_ports.json"
    n_file = PROJECT_NAME + "_nets.json"

ports_out_file = open(p_file, "w")
nets_out_file = open(n_file, "w")

ports_dict = {
    PROJECT_NAME: {
        "chip": " ",
        "complex": " ",
        "fpga": " ",
        "supported_rd": " ",
        "ports": " ",
    }
}
net_dict = {PROJECT_NAME: {"nets": {"rx": " ", "tx": " "}}}

supported_rd_list = []


if "fmcomms2" in PROJECT_NAME:
    ports_dict[PROJECT_NAME]["chip"] = "AD9361"
    ports_dict[PROJECT_NAME]["complex"] = "true"
elif "adrv9361z7035" in PROJECT_NAME:
    ports_dict[PROJECT_NAME]["chip"] = "AD9361"
    ports_dict[PROJECT_NAME]["complex"] = "true"
elif "adrv9364z7020" in PROJECT_NAME:
    ports_dict[PROJECT_NAME]["chip"] = "AD9364"
    ports_dict[PROJECT_NAME]["complex"] = "true"
elif "pluto" in PROJECT_NAME:
    ports_dict[PROJECT_NAME]["chip"] = "AD9361"
    ports_dict[PROJECT_NAME]["complex"] = "true"
elif "adrv9371x" in PROJECT_NAME:
    ports_dict[PROJECT_NAME]["chip"] = "AD9371"
    ports_dict[PROJECT_NAME]["complex"] = "true"
elif "adrv9001" in PROJECT_NAME:
    ports_dict[PROJECT_NAME]["chip"] = "ADRV9002"
    ports_dict[PROJECT_NAME]["complex"] = "true"
elif "adrv9009" in PROJECT_NAME:
    ports_dict[PROJECT_NAME]["chip"] = "ADRV9009"
    ports_dict[PROJECT_NAME]["complex"] = "true"

key1 = "direction"
key2 = "MSB"
key3 = "LSB"
key4 = "name"
key5 = "net"

type1 = "valid"
type2 = "data"
type3 = "clk"
type4 = "rst"


with open(in_file) as fh:
    dir_list = []
    msb_list = []
    lsb_list = []
    name_list = []
    type_list = []
    net_list = []

    for line in fh:

        word_list = line.split()
        number_of_words = len(word_list)

        if key1 in line:

            dir = line.split(" ")[0]
            dir_value = line.split(" ")[1]
            if dir_value == "O":
                direction = "true"
            else:
                direction = "false"
            dir_list.append(direction)

        elif key2 in line:
            msb = line.split(" ")[0]
            if number_of_words == 2:
                msb_value = line.split(" ")[1]
            else:
                msb_value = 0
            msb_list.append(int(msb_value))
        elif key3 in line:
            lsb = line.split(" ")[0]
            if number_of_words == 2:
                lsb_value = line.split(" ")[1]
            else:
                lsb_value = 0
            lsb_list.append(int(lsb_value))
        elif key4 in line:
            name = line.split(" ")[0]
            name_value = line.split(" ")[1]
            name_list.append(name_value.rstrip())
            if type1 in name_value:
                type_list.append(type1)
            elif type2 in name_value:
                type_list.append(type2)
            elif type3 in name_value:
                type_list.append(type3)
            elif type4 in name_value:
                type_list.append(type4)
            else:
                type_list.append(
                    type1
                )  ## assign valid as data type for enable, sync and ovf signals
        elif key5 in line:
            net = line.split(" ")[0]
            if number_of_words == 2:
                net_value = line.split(" ")[1].rstrip()
            else:
                net_value = "nc"
            net_list.append(net_value)

dict_0 = {}
dict_1 = {}

rx_tx_dict = {"rx": " ", "tx": " "}

rx_net_list = []
tx_net_list = []

ports_list = []
rx_ports_list = []
tx_ports_list = []

j = 0
k = 0

# ports list generation (first try)

# for i in range(len(dir_list)):
# if (("nc" not in net_list[i]) and ("os" not in name_list[i])):

# if (("adc_pack" in name_list[i]) or ("adc_fifo" in name_list[i]) or ("rx" in name_list[i]) or ("decimator" in name_list[i])):

# if (("dout_data" in name_list[i]) or ("fifo_wr_data" in name_list[i]) or ("dout_valid" in name_list[i]) or ("fifo_wr_en" in name_list[i]) or ("adc_valid_0" in name_list[i]) or ("adc_data" in name_list[i]) or ("data_out" in name_list[i]) or ("valid_out" in name_list[i]) or ("enable_out" in name_list[i])):
# dict_0 = {
# 'input' : dir_list[i],
# 'width' : msb_list[i] - lsb_list[i] + 1,
# 'name' : name_list[i],
# 'type' : type_list[i]}
# rx_ports_list.append(dict_0)
# j = j + 1
# if ("dac_upack" in name_list[i]) or ("dac_fifo" in name_list[i] or ("tx" in name_list[i]) or ("interpolator" in name_list[i])):

# if (("din_valid_in" in name_list[i]) or ("fifo_rd_valid" in name_list[i]) or ("din_valid" in name_list[i]) or ("fifo_rd_en" in name_list[i]) or ("dac_data" in name_list[i]) or ("fifo_rd_data" in name_list[i]) or ("data_out" in name_list[i]) or ("valid_out" in name_list[i]) or ("enable_out" in name_list[i])):
# dict_1 = {
# 'input' : dir_list[i],
# 'width' : msb_list[i] - lsb_list[i] + 1,
# 'name' : name_list[i],
# 'type' : type_list[i]}
# tx_ports_list.append(dict_1)
# k = k + 1

# netlist generation

# for i in range(len(net_list)):
# if ("nc" not in net_list[i] and "os" not in net_list[i]):
# if (("adc_pack" in net_list[i]) or ("adc_fifo" in net_list[i]) or ("rx" in net_list[i]) or ("decimator" in net_list[i])):
# if (("dout_data" in net_list[i]) or ("dout_valid" in net_list[i]) or ("adc_data" in net_list[i]) or ("adc_enable" in net_list[i]) or ("adc_valid" in net_list[i]) or ("data_out" in net_list[i]) or ("valid_out" in net_list[i]) or ("enable_out" in net_list[i])):
# if net_list[i] not in rx_net_list:
# rx_net_list.append(net_list[i])
# if ("dac_upack" in net_list[i]) or ("dac_fifo" in net_list[i] or ("tx" in net_list[i]) or ("interpolator" in net_list[i])):
# if (("fifo_rd_data" in net_list[i]) or ("fifo_rd_valid" in net_list[i]) or ("dac_valid" in net_list[i]) or ("dac_enable" in net_list[i]) or ("data_out" in net_list[i]) or ("valid_out" in net_list[i]) or ("enable_out" in net_list[i])):
# if net_list[i] not in tx_net_list:
# tx_net_list.append(net_list[i])


# ports generation
for i in range(len(dir_list)):
    if "os" not in name_list[i]:
        if ("pack" in name_list[i]) and ("_2_" not in name_list[i]):
            if ("fifo_wr_en" in name_list[i]) or ("fifo_wr_data" in name_list[i]):
                dict_0 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                rx_ports_list.append(dict_0)
                j = j + 1
            elif ("fifo_rd_valid" in name_list[i]) or ("fifo_rd_data" in name_list[i]):
                dict_1 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                tx_ports_list.append(dict_1)
                k = k + 1
            elif "fifo_rd_en" in name_list[i]:
                if (
                    ("adrv9371" in PROJECT_NAME)
                    or ("adrv9009" in PROJECT_NAME)
                    or ("adrv9001" in PROJECT_NAME)
                ):
                    dict_1 = {
                        "input": dir_list[i],
                        "width": msb_list[i] - lsb_list[i] + 1,
                        "name": name_list[i],
                        "type": type_list[i],
                    }
                    tx_ports_list.append(dict_1)
                    k = k + 1
        elif "adc_fifo" in name_list[i]:
            if ("dout_valid_0" in name_list[i]) or ("dout_data" in name_list[i]):
                dict_0 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                rx_ports_list.append(dict_0)
                j = j + 1
        elif "dac_fifo" in name_list[i]:
            if ("din_valid_in_0" in name_list[i]) or ("din_data" in name_list[i]):
                dict_1 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                tx_ports_list.append(dict_1)
                k = k + 1
        elif "tpl" in name_list[i]:
            if ("adc_valid_0" in name_list[i]) or ("adc_data" in name_list[i]):
                dict_0 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                rx_ports_list.append(dict_0)
                j = j + 1
            elif "dac_data" in name_list[i]:
                dict_1 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                tx_ports_list.append(dict_1)
                k = k + 1
        elif ("axi_adrv9001" in name_list[i]) and ("adrv9001" in PROJECT_NAME):
            if ("adc_1_valid_i0" in name_list[i]) or ("adc_1_data_" in name_list[i]):
                dict_0 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                rx_ports_list.append(dict_0)
                j = j + 1
            elif "dac_1_data_" in name_list[i]:
                dict_1 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                tx_ports_list.append(dict_1)
                k = k + 1
        elif ("axi_ad9361" in name_list[i]) and ("pluto" in PROJECT_NAME):
            if ("adc_valid_i0" in name_list[i]) or ("adc_data_" in name_list[i]):
                dict_0 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                rx_ports_list.append(dict_0)
                j = j + 1
            elif "dac_data_" in name_list[i]:
                dict_1 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                tx_ports_list.append(dict_1)
                k = k + 1
        elif ("logic_or" in name_list[i]) and ("pluto" in PROJECT_NAME):
            if "Op1" in name_list[i]:
                dict_1 = {
                    "input": dir_list[i],
                    "width": msb_list[i] - lsb_list[i] + 1,
                    "name": name_list[i],
                    "type": type_list[i],
                }
                tx_ports_list.append(dict_1)
                k = k + 1

# netlist generation  -- to be updated
for i in range(len(net_list)):
    if "nc" not in net_list[i] and "os" not in net_list[i]:
        if "pack" in net_list[i]:
            if ("fifo_wr_en" in net_list[i]) or ("fifo_wr_data" in net_list[i]):
                if net_list[i] not in rx_net_list:
                    rx_net_list.append(net_list[i])
            elif ("fifo_rd_valid" in net_list[i]) or ("fifo_rd_data" in net_list[i]):
                if net_list[i] not in tx_net_list:
                    tx_net_list.append(net_list[i])
            elif "fifo_rd_en" in net_list[i]:
                if (
                    ("adrv9371" in PROJECT_NAME)
                    or ("adrv9009" in PROJECT_NAME)
                    or ("adrv9001" in PROJECT_NAME)
                ):
                    if net_list[i] not in tx_net_list:
                        tx_net_list.append(net_list[i])
        elif "fifo" in net_list[i]:
            if ("dout_valid_0" in net_list[i]) or ("dout_data" in net_list[i]):
                if net_list[i] not in rx_net_list:
                    rx_net_list.append(net_list[i])
            elif ("din_valid_in_0" in net_list[i]) or ("din_data" in net_list[i]):
                if net_list[i] not in tx_net_list:
                    tx_net_list.append(net_list[i])
        elif "tpl" in net_list[i]:
            if ("adc_valid_0" in net_list[i]) or ("adc_data" in net_list[i]):
                if net_list[i] not in rx_net_list:
                    rx_net_list.append(net_list[i])
            elif "dac_data" in net_list[i]:
                if net_list[i] not in tx_net_list:
                    tx_net_list.append(net_list[i])
        elif ("axi_adrv9001" in net_list[i]) and ("adrv9001" in PROJECT_NAME):
            if ("adc_1_valid_i0" in net_list[i]) or ("adc_1_data_" in net_list[i]):
                if net_list[i] not in rx_net_list:
                    rx_net_list.append(net_list[i])
            elif "dac_1_data_" in net_list[i]:
                if net_list[i] not in tx_net_list:
                    tx_net_list.append(net_list[i])
        elif ("axi_ad9361" in net_list[i]) and ("pluto" in PROJECT_NAME):
            if ("adc_valid_i0" in net_list[i]) or ("adc_data_" in net_list[i]):
                if net_list[i] not in rx_net_list:
                    rx_net_list.append(net_list[i])
            elif "dac_data_" in net_list[i]:
                if net_list[i] not in tx_net_list:
                    tx_net_list.append(net_list[i])
        elif ("logic_or" in net_list[i]) and ("pluto" in PROJECT_NAME):
            if "Op1" in net_list[i]:
                if net_list[i] not in tx_net_list:
                    tx_net_list.append(net_list[i])


if j != 0:
    supported_rd_list.append("rx")
if k != 0:
    supported_rd_list.append("tx")
if (j != 0) and (k != 0):
    supported_rd_list.append("rx & tx")

ports_dict[PROJECT_NAME]["supported_rd"] = supported_rd_list
ports_dict[PROJECT_NAME]["fpga"] = carriers_list

rx_tx_dict["rx"] = rx_ports_list
rx_tx_dict["tx"] = tx_ports_list
ports_list.append(rx_tx_dict)
ports_dict[PROJECT_NAME]["ports"] = ports_list

net_dict[PROJECT_NAME]["nets"]["rx"] = rx_net_list
net_dict[PROJECT_NAME]["nets"]["tx"] = tx_net_list

json.dump(ports_dict, ports_out_file, indent=4)
json.dump(net_dict, nets_out_file, indent=4)

ports_out_file.close()
nets_out_file.close()
