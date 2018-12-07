#!/usr/bin/env python
import os,sys
import string
import cgi
import commands

from optparse import OptionParser
import json
import time
import datetime

import pymongo
from pymongo import MongoClient




__version__="1.0"
__status__ = "Dev"





#################################
def main():
	
    usage = "\n%prog  [options]"
    parser = OptionParser(usage,version="%prog " + __version__)
    parser.add_option("-o","--bcoid",action="store",dest="bcoid",help="Id object")

        
    (options,args) = parser.parse_args()
    for key in ([options.bcoid]):
        if not (key):
            parser.print_help()
            sys.exit(0)
    
    bco_id = int(options.bcoid)
    
    config_json = json.loads(open("conf/config.json", "r").read())
    client = MongoClient('mongodb://localhost:27017')
    DBH = client[config_json["dbinfo"]["mongodbname"]]
    
    res = DBH.c_dataobject.delete_one({"bco_id":bco_id})



if __name__ == '__main__':
        main()



