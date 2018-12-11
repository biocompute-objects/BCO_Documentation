# Schema Validation

The following script was used to test the schema against [HCV1a.json](https://github.com/biocompute-objects/BCO_Specification/blob/cb06839d482b4b645eadf9160c48cb8a2162475f/HCV1a.json):
 
 ```python
 import json
 import jsonref
 import os
 import sys
 
 from jsonschema import validate
 
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
 
 if __name__ == "__main__":
     main()
 ```
 
 The following commands were used to run the script:
 
 ```shell
 cd BCO_specification/
 python -m venv env
 source env/bin/activate
 pip install jsonschema jsonref
 python validate.py HCV1a.json $PWD/schemas/biocomputeobject.json
 ```
