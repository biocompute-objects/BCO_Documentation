#!/usr/bin/env python
import os,sys
import string
import cgi
import commands
import util

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
	
    config_json = json.loads(open("conf/config.json", "r").read())
    client = MongoClient('mongodb://localhost:27017')
    DBH = client[config_json["dbinfo"]["mongodbname"]]
   

    util.reset_sequence_value(DBH, "bcoid")






if __name__ == '__main__':
        main()



