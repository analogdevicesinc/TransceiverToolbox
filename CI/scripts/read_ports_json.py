import json

# open ports.json file and parse
ports_json_file = 'ports.json'
with open(ports_json_file) as json_file:
    ports = json.load(json_file)
    tmp_key = "m_name"
    for key0 in ports.keys():
        m_names = dict()
        for key1 in ports[key0]['ports'][0].keys():
            if (key1 == "rx"):
                for ii in range(0, len(ports[key0]['ports'][0][key1])):
                    tmp_dict = ports[key0]['ports'][0][key1][ii]
                    if tmp_key not in tmp_dict:           
                        if (tmp_dict['type'].lower() == "data"):
                            if (tmp_dict['input'] == "true") :
                                tmp_list = tmp_dict['name'].split("_")
                                last_ele = tmp_list[-1]  
                                ip = ""
                                if (len(last_ele) == 2) :
                                    ip = f"{ports[key0]['chip']} ADC Data {last_ele.upper()}"   
                                else :
                                    ip = f"{ports[key0]['chip']} ADC Data 0 IN"
                                    if ip in m_names :
                                        m_names[ip] += 1
                                        ip = f"{ports[key0]['chip']} ADC Data {m_names[ip]} IN"
                                    else :
                                        m_names[ip] = 0
                                tmp_dict[tmp_key] = ip                                    
                            elif (tmp_dict['input'] == "false"):
                                if tmp_key not in tmp_dict:  
                                    ip = f"IP Data 0 OUT"
                                    if ip in m_names :
                                        m_names[ip] += 1
                                        tmp_dict[tmp_key] = f"IP Data {m_names[ip]} OUT"
                                    else :
                                        m_names[ip] = 0
                                        tmp_dict[tmp_key] = ip

                        elif (tmp_dict['type'].lower() == "valid"):
                            if (tmp_dict['input'] == "true"):
                                tmp_dict[tmp_key] = f"IP Valid Rx Data IN"
                            elif (tmp_dict['input'] == "false"):
                                tmp_dict[tmp_key] = f"IP Data Valid OUT"
                    ports[key0]['ports'][0][key1][ii] = tmp_dict

            elif (key1 == "tx"):
                for ii in range(0, len(ports[key0]['ports'][0][key1])):
                    tmp_dict = ports[key0]['ports'][0][key1][ii]
                    if tmp_key not in tmp_dict :                       
                        if (tmp_dict['type'].lower() == "data") :                            
                            if (tmp_dict['input'] == "false"): 
                                tmp_list = tmp_dict['name'].split("_")
                                last_ele = tmp_list[-1] 
                                ip = "" 
                                if (len(last_ele) == 2):
                                    ip = f"{ports[key0]['chip']} DAC Data {last_ele.upper()}"
                                else:    
                                    ip = f"{ports[key0]['chip']} DAC Data 0 OUT"
                                    if ip in m_names :
                                        m_names[ip] += 1
                                        ip = f"{ports[key0]['chip']} DAC Data {m_names[ip]} OUT"
                                    else :
                                        m_names[ip] = 0
                                tmp_dict[tmp_key] = ip                                    
                            elif (tmp_dict['input'] == "true"):
                                if tmp_key not in tmp_dict:  
                                    ip = f"IP Data 0 IN"
                                    if ip in m_names :
                                        m_names[ip] += 1
                                        tmp_dict[tmp_key] = f"IP Data {m_names[ip]} IN"
                                    else :
                                        m_names[ip] = 0
                                        tmp_dict[tmp_key] = ip

                        elif (tmp_dict['type'].lower() == "valid"):
                            if (tmp_dict['input'] == "true"):
                                tmp_dict[tmp_key] = f"IP Valid Tx Data IN"
                            elif (tmp_dict['input'] == "false"):
                                tmp_dict[tmp_key] = f"IP Load Tx Data OUT"
                    ports[key0]['ports'][0][key1][ii] = tmp_dict

with open(ports_json_file, 'w') as json_file:
    json.dump(ports, json_file, indent = 4)