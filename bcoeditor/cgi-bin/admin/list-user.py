#!/usr/bin/env python
import os,sys
import string
import cgi
import commands

from optparse import OptionParser
import json
import time
import datetime
import bcrypt

import pymongo
from pymongo import MongoClient




__version__="1.0"
__status__ = "Dev"





#################################
def main():


    config_json = json.loads(open("conf/config.json", "r").read())
    client = MongoClient('mongodb://localhost:27017')
    mongo_db = client[config_json["dbinfo"]["mongodbname"]]
    mongo_cl_bco = mongo_db[config_json["dbinfo"]["mongoclname_bco"]]
    mongo_cl_counters = mongo_db[config_json["dbinfo"]["mongoclname_counters"]]
    mongo_cl_users = mongo_db[config_json["dbinfo"]["mongoclname_users"]]

    query_obj = {}
    print "#status,fname,lname,email"
    for doc in mongo_cl_users.find(query_obj):
        print "%s,%s,%s,%s" % (doc["status"],doc["fname"],doc["lname"],doc["email"])





if __name__ == '__main__':
        main()



