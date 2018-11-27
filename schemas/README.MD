Following up on #5, this change introduces a draft BCO JSON schema.
 
 * [x]  Use [HCV1a.json](https://github.com/biocompute-objects/BCO_Specification/blob/cb06839d482b4b645eadf9160c48cb8a2162475f/HCV1a.json) to generate an initial draft with https://www.jsonschema.net
 * [x]  Resolve inconsistencies with [base_type_BioCompute.json](https://github.com/biocompute-objects/BCO_Specification/blob/cb06839d482b4b645eadf9160c48cb8a2162475f/base_type_BioCompute.json)
 * [x]  Resolve inconsistencies with *.md file
 * [x]  Review, in particular, the following nebulous domains: error_domain, extensions_domain, io_domain, and parameters_domain
 
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
 
 * [ ]  Should URI fields be validated as IRI?
   https://tools.ietf.org/html/rfc3987
 * [ ]  How should *_extension fields be handled?
   http://json-schema.org/draft-06/json-schema-release-notes.html#q-what-happened-to-all-the-discussions-around-re-using-schemas-with-additionalproperties
 
 The following definition for `extension_domain` failed to trigger validation errors when tested with the above jsonschema script. It may be the library doesn't support it (propertyNames test cases are sparse) or the definition is invalid.
 
 ```json
 "extension_domain": {
   "type": "object",
   "propertyNames": {
     "$comment": "Need to 'anyOf' these or else the enum and pattern conflict",
     "$comment": "https://github.com/json-schema-org/json-schema-spec/issues/214#issue-197927069",
     "anyOf": [
       {"enum": ["fhir_extension", "github_extension"]},
       {"pattern": "*_extension"}
     ]
   }
 },
 ```

