import json

# open ports.json file and parse
ports_json_file = 'ports.json'
with open(ports_json_file) as json_file:
    ports = json.load(json_file)

    tmp_key = "m_name"
    for key0 in ports.keys():
        for key1 in ports[key0]['ports'][0].keys():
            if (key1 == "rx"):
                for ii in range(0, len(ports[key0]['ports'][0][key1])):
                    tmp_dict = ports[key0]['ports'][0][key1][ii]
                    if (tmp_dict['type'].lower() == "data"):
                        if (tmp_dict['input'] == "true"):
                            if tmp_key not in tmp_dict:
                                tmp_list = tmp_dict['name'].split("_")
                                last_ele = tmp_list[-1]
                                if (len(last_ele) == 1):
                                    res = divmod(int(last_ele), 2)
                                    if res[1]:
                                        i_or_q = "Q"
                                    else:
                                        i_or_q = "I"
                                    tmp_dict[tmp_key] = f"{ports[key0]['chip']} ADC Data {i_or_q}{res[0]}"
                                elif (len(last_ele) == 2):
                                    tmp_dict[tmp_key] = f"{ports[key0]['chip']} ADC Data {last_ele.upper()}"                                
                        elif (tmp_dict['input'] == "false"):
                            if tmp_key not in tmp_dict:                            
                                tmp_list = tmp_dict['name'].split("_")
                                last_ele = tmp_list[-1]
                                tmp_dict[tmp_key] = f"IP Data {last_ele.upper()} OUT"
                    elif (tmp_dict['type'].lower() == "valid"):
                        if (tmp_dict['input'] == "true"):
                            tmp_dict[tmp_key] = f"IP Valid Rx Data IN"
                        elif (tmp_dict['input'] == "false"):
                            tmp_dict[tmp_key] = f"IP Data Valid OUT"
                    ports[key0]['ports'][0][key1][ii] = tmp_dict
            elif (key1 == "tx"):
                for ii in range(0, len(ports[key0]['ports'][0][key1])):
                    tmp_dict = ports[key0]['ports'][0][key1][ii]
                    if (tmp_dict['type'].lower() == "data"):
                        if (tmp_dict['input'] == "false"):
                            if tmp_key not in tmp_dict:                            
                                tmp_list = tmp_dict['name'].split("_")
                                last_ele = tmp_list[-1]
                                if (len(last_ele) == 1):
                                    res = divmod(int(last_ele), 2)
                                    if res[1]:
                                        i_or_q = "Q"
                                    else:
                                        i_or_q = "I"
                                    tmp_dict[tmp_key] = f"{ports[key0]['chip']} DAC Data {i_or_q}{res[0]}"
                                elif (len(last_ele) == 2):
                                    tmp_dict[tmp_key] = f"{ports[key0]['chip']} DAC Data {last_ele.upper()}"
                        elif (tmp_dict['input'] == "true"):
                            if tmp_key not in tmp_dict:                            
                                tmp_list = tmp_dict['name'].split("_")
                                last_ele = tmp_list[-1]
                                tmp_dict[tmp_key] = f"IP Data {last_ele.upper()} IN"
                    elif (tmp_dict['type'].lower() == "valid"):
                        if (tmp_dict['input'] == "true"):
                            tmp_dict[tmp_key] = f"IP Valid Tx Data IN"
                        elif (tmp_dict['input'] == "false"):
                            tmp_dict[tmp_key] = f"IP Load Tx Data OUT"
                    ports[key0]['ports'][0][key1][ii] = tmp_dict

with open(ports_json_file, 'w') as json_file:
    json.dump(ports, json_file, indent = 4)