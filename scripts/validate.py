#!/usr/bin/env python 
# -*- coding: utf-8 -*-

################################################################################
                        ##Validate##
"""Used to test a BCO against the schema. The following commands were used to run the script:

    cd BCO_specification/
    python -m venv env
    source env/bin/activate
    pip install jsonschema jsonref
    python validate.py HCV1a.json $PWD/schemas/biocomputeobject.json

                        """
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
#print a validation mesage 
    print("Schema Valid")