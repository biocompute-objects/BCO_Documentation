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

    usage = "\n%prog  [options]"
    parser = OptionParser(usage,version="%prog " + __version__)
    msg = "Input JSON text"
    parser.add_option("-e","--email",action="store",dest="email",help=msg)

    (options,args) = parser.parse_args()
    
    for key in ([options.email]):
        if not (key):
            parser.print_help()
            sys.exit(0)
        
    email = options.email

    config_json = json.loads(open("conf/config.json", "r").read())
    client = MongoClient('mongodb://localhost:27017')
    mongo_db = client[config_json["dbinfo"]["mongodbname"]]
    mongo_cl_bco = mongo_db[config_json["dbinfo"]["mongoclname_bco"]]
    mongo_cl_counters = mongo_db[config_json["dbinfo"]["mongoclname_counters"]]
    mongo_cl_users = mongo_db[config_json["dbinfo"]["mongoclname_users"]]

    query_obj = {"email":email}
    res = mongo_cl_users.delete_one(query_obj)



if __name__ == '__main__':
        main()



