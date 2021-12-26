import sys
import json

def group_subnets_with_nacl(input_json, result):
    
    for subnet_index in range(len(input_json["public_subnet_config"])):
        if "nacl_ingress" not in input_json["public_subnet_config"][subnet_index].keys() and "nacl_egress" not in input_json["public_subnet_config"][subnet_index].keys():
            if input_json["default_public_subnet_nacl_present"]:
                result["default_public_subnet_nacl"].append(input_json["public_subnet_id"][subnet_index])
            else:
                result["default_nacl"].append(input_json["public_subnet_id"][subnet_index])

    for subnet_index in range(len(input_json["private_subnet_config"])):
        if "nacl_ingress" not in input_json["private_subnet_config"][subnet_index].keys() and "nacl_egress" not in input_json["private_subnet_config"][subnet_index].keys():
            if input_json["default_private_subnet_nacl_present"]:
                result["default_private_subnet_nacl"].append(input_json["private_subnet_id"][subnet_index])
            else:
                result["default_nacl"].append(input_json["private_subnet_id"][subnet_index])

    for subnet_index in range(len(input_json["protected_subnet_config"])):
        if "nacl_ingress" not in input_json["protected_subnet_config"][subnet_index].keys() and "nacl_egress" not in input_json["protected_subnet_config"][subnet_index].keys():
            if input_json["default_protected_subnet_nacl_present"]:
                result["default_protected_subnet_nacl"].append(input_json["protected_subnet_id"][subnet_index])
            else:
                result["default_nacl"].append(input_json["protected_subnet_id"][subnet_index])
    result["default_nacl"] = str(result["default_nacl"])
    result["default_public_subnet_nacl"] = str(result["default_public_subnet_nacl"])
    result["default_private_subnet_nacl"] = str(result["default_private_subnet_nacl"])
    result["default_protected_subnet_nacl"] = str(result["default_protected_subnet_nacl"])
    # result["default_public_subnet_nacl_present"] = str(input_json["default_public_subnet_nacl_present"])
    # result["default_private_subnet_nacl_present"] = str(input_json["default_private_subnet_nacl_present"])
    # result["default_protected_subnet_nacl_present"] = str(input_json["default_protected_subnet_nacl_present"])

    return result

def parse_input(input_json):
    result = {}
    result["public_subnet_id"] = json.loads(input_json["public_subnet_id"])
    result["private_subnet_id"] = json.loads(input_json["private_subnet_id"])
    result["protected_subnet_id"] = json.loads(input_json["protected_subnet_id"])
    result["default_public_subnet_nacl_present"] = json.loads(input_json["default_public_subnet_nacl_present"])
    result["default_private_subnet_nacl_present"] = json.loads(input_json["default_private_subnet_nacl_present"])
    result["default_protected_subnet_nacl_present"] = json.loads(input_json["default_protected_subnet_nacl_present"])
    result["public_subnet_config"] = json.loads(input_json["public_subnet_config"])
    result["private_subnet_config"] = json.loads(input_json["private_subnet_config"])
    result["protected_subnet_config"] = json.loads(input_json["protected_subnet_config"])
    return result

# def test_parse_input(input_json):
#     result = {}
#     result["public_subnet_id"] = str(json.loads(input_json["public_subnet_id"]))
#     result["private_subnet_id"] = str(json.loads(input_json["private_subnet_id"]))
#     result["protected_subnet_id"] = str(json.loads(input_json["protected_subnet_id"]))
#     result["default_public_subnet_nacl_present"] = str(json.loads(input_json["default_public_subnet_nacl_present"]))
#     result["default_private_subnet_nacl_present"] = str(json.loads(input_json["default_private_subnet_nacl_present"]))
#     result["default_protected_subnet_nacl_present"] = str(json.loads(input_json["default_protected_subnet_nacl_present"]))
#     result["public_subnet_config"] = str(json.loads(input_json["public_subnet_config"]))
#     result["private_subnet_config"] = str(json.loads(input_json["private_subnet_config"]))
#     result["protected_subnet_config"] = str(json.loads(input_json["protected_subnet_config"]))
#     return result

def main():
    input_str = json.dumps(sys.stdin.read())
    input_json = json.loads(json.loads(input_str))
    input_data = parse_input(input_json)
    result = {
        "default_nacl" : [],
        "default_public_subnet_nacl" : [],
        "default_private_subnet_nacl" : [],
        "default_protected_subnet_nacl" : []
    }
    result_json = json.dumps(group_subnets_with_nacl(input_data, result))
    # result_json = json.dumps(test_parse_input(input_json))
    print(result_json)



if __name__ == "__main__":
    main()