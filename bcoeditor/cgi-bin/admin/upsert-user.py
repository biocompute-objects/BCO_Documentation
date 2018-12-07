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
    parser.add_option("-f","--fname",action="store",dest="fname",help=msg)
    parser.add_option("-l","--lname",action="store",dest="lname",help=msg)
    parser.add_option("-e","--email",action="store",dest="email",help=msg)
    parser.add_option("-p","--password",action="store",dest="password",help=msg)
    parser.add_option("-s","--status",action="store",dest="status",help=msg)


    (options,args) = parser.parse_args()
    
    for key in ([options.fname,options.lname,options.email,options.password, options.status]):
        if not (key):
            parser.print_help()
            sys.exit(0)
        

    config_json = json.loads(open("conf/config.json", "r").read())
    client = MongoClient('mongodb://localhost:27017')
    mongo_db = client[config_json["dbinfo"]["mongodbname"]]
    mongo_cl_bco = mongo_db[config_json["dbinfo"]["mongoclname_bco"]]
    mongo_cl_counters = mongo_db[config_json["dbinfo"]["mongoclname_counters"]]
    mongo_cl_users = mongo_db[config_json["dbinfo"]["mongoclname_users"]]

    options.password = bcrypt.hashpw(options.password.encode('utf-8'), bcrypt.gensalt())
    if options.status not in ["0", "1"]:
        print "\n\tValue for status can only be 0/1\n\n"
        sys.exit()


    query_obj = {'email': options.email}
    update_obj = {
        "fname":options.fname,
        "lname":options.lname,
        "email":options.email,
        "password":options.password,
        "status":int(options.status)
    }
    result = mongo_cl_users.update_one(query_obj, {'$set': update_obj}, upsert=True)
            



if __name__ == '__main__':
        main()



