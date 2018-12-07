#!/usr/bin/python
import os,sys
import string
import traceback
import random
from collections import OrderedDict







def get_random_string(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def log_error(error_log, log_dir):

    try:
        error_id = get_random_string(6)
        log_file = log_dir + "/error-" + error_id + ".log"
        with open(log_file, "w") as FW:
            FW.write("%s" % (error_log))
        return {"taskstatus":0, "errormsg":"exception-error-" + error_id}
    except Exception, e:
        return {"taskstatus":0, "errormsg":"Unable to log error, check apache has write permission to log_dir!"}



def reset_sequence_value(coll_obj, sequence_name):
    seq_doc = coll_obj.find_and_modify(
        query={'_id': sequence_name},
        update={'$set': {'sequence_value': 0}},
        upsert=True,
        new=True
    )
    return




def order_json_obj(json_obj, ordr_dict):
    
    for k1 in json_obj:
        ordr_dict[k1] = ordr_dict[k1] if k1 in ordr_dict else 1000
        if type(json_obj[k1]) is dict:
            for k2 in json_obj[k1]:
                ordr_dict[k2] = ordr_dict[k2] if k2 in ordr_dict else 1000
                if type(json_obj[k1][k2]) is dict:
                    for k3 in json_obj[k1][k2]:
                        ordr_dict[k3] = ordr_dict[k3] if k3 in ordr_dict else 1000
                    json_obj[k1][k2] = OrderedDict(sorted(json_obj[k1][k2].items(),key=lambda x: float(ordr_dict.get(x[0]))))
                elif type(json_obj[k1][k2]) is list:
                    for j in xrange(0, len(json_obj[k1][k2])):
                        if type(json_obj[k1][k2][j]) is dict:
                            for k3 in json_obj[k1][k2][j]:
                                ordr_dict[k3] = ordr_dict[k3] if k3 in ordr_dict else 1000
                                for kk in json_obj[k1][k2][j].keys():
                                    ordr_dict[kk] = ordr_dict[kk] if kk in ordr_dict else 1000
                                keyList = sorted(json_obj[k1][k2][j].keys(), key=lambda x: float(ordr_dict[x]))
                                json_obj[k1][k2][j] = OrderedDict(sorted(json_obj[k1][k2][j].items(), key=lambda x: float(ordr_dict.get(x[0]))))
            json_obj[k1] = OrderedDict(sorted(json_obj[k1].items(),key=lambda x: float(ordr_dict.get(x[0]))))
    
    return OrderedDict(sorted(json_obj.items(), key=lambda x: float(ordr_dict.get(x[0]))))





