#!/usr/bin/env python 
# -*- coding: utf-8 -*-

################################################################################
                        ##Validate##
"""used to test the schema against HCV1a.json"""
################################################################################
import json
import jsonref
import os
import sys

from jsonschema import validate
#______________________________________________________________________________#
def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('json', type=argparse.FileType('r'), help="json to validate")
    parser.add_argument('schema', type=argparse.FileType('r'), help="root json schema to validate against")
    args = parser.parse_args()
    base_uri = 'file://{}/'.format(os.path.dirname(args.schema.name))
    data = json.load(args.json)
    schema = jsonref.load(args.schema, base_uri=base_uri, jsonschema=True)
    return validate(data, schema)
#______________________________________________________________________________#
if __name__ == "__main__":
    main()