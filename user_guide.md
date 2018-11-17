# BioCompute Object (BCO) User Guide
### BCO_Spec_V1.2

## Data type for BCOs
The fundamentals of data typing (type primitives, class inheritance, etc.) that are used to define a BioCompute Object are described in detail in [primitives.json](/primitives.json) and [base_type_BioCompute.json](/base_type_BioCompute.json). Developers of BCO enabled platforms should reference these for details on how to support the creation of BCO programmatically or manually. BCOs are represented in JSON (JavaScript Object Notation) formatted text. The JSON format was chosen because it is both human and machine readable/writable. For a detailed description of JSON see www.json.org. 

The conceptual schema for BCO creation is built on top of two layers: the data definition layer and the BCO layer. The first layer is where all fundamental data types are defined. Complex types are composed of multiple atomic or complex types, like a character string. Using these principles one can construct a datum that has the ability to represent any level of complexity that is needed. A BCO is a federation of other objects.

## Primitive data types
When defining a field in a data type, one can place any number of constraints on the data and the field will be accepted as valid. So, if a data type field was being constructed for holding DNA sequencing information, one could restrain the type of characters that field would accept. This further refinement would ensure that only the characters used for representing nucleic acids would be accepted as input in this field (e.g. A, T, C, G). A list of the primitive types used in BCO data typing is below.

```JSON
{
    "primitives" : {
        "_comment": "primitive type hash with short descriptions",
        "_type" : {
            "string": "alphanumeric string",
            "integer": "integer number",
            "float": "floating point number", 
            "boolean": "can only be assigned true, false, or null",
            "date": "specified ISO 8601", 
            "time": "ISO 8601", 
            "dateTime": "ISO 8601",
            "blob": "binary data stored as a single object",
            "json" : "any json formatted subobject, the structure to json is not imposed by base biocompute type, but should follow guidelines of using the predefined primitives"
        }
    },
    "objectid": {
        "_type": "string",
        "_comment": ["a string of characters designed for unambiguous identification of resources and extensibility via the URI scheme (https://www.w3.org/wiki/UriSchemes)"],
        "_constraint": {
            "regex" : "url_regex"
        }
    },
    "version": {
        "_type": "string",
        "_comment": "suggestion major[.minor[.build_nunber]]"
    }, 
    "email":{ 
        "_type": "string",
        "_constraint": {
            "regex" : "email_regex"
        }
    },
    "keyval" : {
        "key" : {
            "_type" : "string"
        },
        "value" : {
            "_type" : "string"
        }
    },
        "value" : {
            "_type" : "string",
            "_multi_value" : true
        }
    },
    "uri": {
        "address": {
            "_type": "objectid"
        },
        "access_time": {
            "_type" : "dateTime",
            "_optional" : true
        },
        "sha1_chksum": {
            "_type": "string",
            "_optional" : true,
            "_constraint" : {
                "regex" : "[A-Za-z0-9]+"
            }
        }
    },
    "contribution": {
        "_type" : "string",
        "_multi_value" : true,
        "_comment": "taken from https://doi.org/10.1186/2041-1480-4-37",
        "_constraint" :{
           "_choice" : ["authoredBy", "contributedBy", "createdAt", "createdBy", "createdWith", "curatedBy", "derivedFrom", "importedBy", "importedFrom", "providedBy", "retrievedBy", "retrievedFrom", "sourceAccessedBy"]
        }
    },
    "contributor": {
        "_comment": [""],
        "name": {
            "_type": "string",
            "_optional" : true
        },
        "affiliation": {
            "_type": "string",
            "_optional" : true
        },
        "email" : {
            "_type" : "email",
            "_optional" : true
        },
        "contribution": {
            "_type": "contribution"
        },
        "orcid": {
            "_type": "objectid"
        }
    },
    "file": {
        "uri" : {
            "_type" : "uri"
        },
       "mediatype": { 
            "_type" : "string",
            "_optional" : true
        }
    },
    "xref" : {
        "namespace" : {
            "_type" : "string",
            "_comment" : "can be a prefix in identifiers.org or a db named in a source" 
        },
        "ids" : {
            "_type" : "string",
            "_multi_value" : true
        },
        "name" : {
            "_comment": "This can be the common name for the db",
            "_type" : "string",
            "_optional" :true
        },
        "access_time":{
            "_type": "dateTime",
            "_optional" : true
        }
    }
}
```
## Extensibility through inheritance and inclusion of data types

It is of the utmost importance to generate extensible metadata formats capable of providing the basis for more complex new types. There are two proposed ways to extend a data format: inheritance and inclusion. 

The concept of inheritance assumes that a more complex data type inherits all the field value pairs from another, simpler data type and extends the content only with additional field value pairs or customizes (redefines some characteristics) of existing fields. The concept of inclusion assumes that a particular field of an object is of a previously declared complex type and that it contains all the fields of a simpler data type. A single data type can inherit from multiple data types and can include multiple data types multiple times. 

Using these two paradigms, one can design a number of layered standard objects based on predefined objects and extend their functionality with specific fields. For example: imagine a metadata object of type bio-sample which has a predefined fundamental description applied to a generalized sample. This object can have its properties repeatedly inherited to create a human-sample object with increasingly specific information about particularities of that sample description. 

The two proposed extensibility models allow avoiding the overuse of optional field attributes that are present in conglomerated flat data type designs. Instead of designing wide and flat data types with all fields for different use-cases, one may choose to design more targeted types with specifically mandated fields inside. 

For example, having an optional tissue-location field in all biological-sample objects might lead to sparse population of the field as it will be unpopulated for all environmental, metagenomic, bacterial, and viral samples where the notion of a tissue is irrelevant. However, designing an inherited animal-sample data type can have a mandatory tissue location field for instances when it is important to know from which part of the animal a particular sample was collected. 

The power of the inheritance and inclusion methods to extend and implement new data types is evident when one considers the need to create new subtypes or a branch of existing types after the initial data -type structure is established. This step can be accomplished without modification of existing database objects by defining the new intermediates within the framework of the pre-defined metadata type hierarchy. 

The relationship implemented by inheritance subtyping is a is-a relationship. For example, the type "fish" can have three subtypes "eel", "shark" and "salmon". Each subtype is a variety of the "fish" supertype and inherits all "fish" characteristics but has some specific differences


## Base BioCompute Type
The second layer is constructed with objects from first layer, producing a derived data type called the "base BioCompute type". Extending the same principles that allowed us to construct a string representing a DNA sequence from the primitive character type, one can construct a type definition that is the absolute minimum fields necessary to create a BCO. By taking the primitive BCO type and adding parametric and metadata fields unique to a particular instance, a BCO can be created. Below is the type definition for “BioCompute_base_type”:
```JSON
{
    "name" : "BioCompute_base_type",
    "title" : "Base type for all BioCompute Object types",
    "description" : "All BioCompute object types must inherit from this type in order to be compliant with BioCompute framework",
    "_comment" : [
        "Since JSON format do not allow comments '_comment' key is used for comments and should be ignored by parsers",
        "As any object of type 'type' it has its own fields: _type, _id, _inherits, name, title and description",
        "As base type this type inherits from none",
        "Identifier of the object since type itself is an object",
        "Type of this JSON object is 'type'",
        "For each field default value for '_multi_value', '_optional', and '_read_only' key is 'false' "
    ],
    "_fields" : {
        "_comment" : [
            "List of fields of the BioCompute Object type"
        ],

        "bco_id":{
            "_type" : "string",
            "_read_only" : true,
            "_comment" : [
                "A unique identifier that should be applied to each BCO instance, assigned by a BCO database engine.",
                "IDs should never be reused"
            ]
        },
        "type": {
            "_type": "_type",
            "_read_only" : true
        },
        "digital_signature" : {
            "_type" : "string",
            "_read_only" : true,
            "_comment" : ["Digital signature of BioCompute Object by Authority"],
            "_constraint" : {
                "regex" : "[A-Za-z0-9]+"
            }
        },
        "bco_spec_version" : {
            "_type" : "string",
            "_read_only" : true,
            "_comment" : ["The version of the BCO specification used to define this document."]
        },

        "provenance_domain": {
            "name" : {
                "_type" :"string",
                "_comment" : "Public searchable name for BioCompute Object"
            },
            "structured_name" :{
                "_type" :"string",
                "_optional" : true,
                "_comment" :[
                    "templated computable text field designed to represent a BCO instance name in visible interfaces.",
                    "This field can refer to other fields within the same or other objects."
                ]

            },
            "version" : {
                "_type" : "version",
                "_comment" : "version of this BioCompute Object"
            },
            "review" : {
                "_multi_value" : true,
                "_optional" : true,
                "status" : {
                    "_type" : "string",
                    "_constraint" : {
                        "_choice" : [ "unreviewed", "in-review", "approved", "rejected", "suspended" ]
                    },
                    "_comment" : "Current verification status of the BioCompute Object",
                    "_default_value" : "unreviewed"
                },
                "reviewer" : {
                    "_type": "contributor",
                    "_multi_value" : true
                },
                "date" : {
                    "_type" : "dateTime"
                },
                "reviewer_comment" : {
                    "_type" : "string",
                    "_optional" : true,
                }
            },
            "derived_from": {
                "_type": "objectid",
                "_optional" : true,
                "_comment" : ["value of _id field of another bio compute object"]
            },
            "obsolete_after" : {
                "_type": "datetime" , 
                "_optional" : true
            },
            "embargo" : {
                "start_time" : { 
                    "_type" : "datetime", 
                    "_optional" : true
                },
                "end_time" : { 
                    "_type" : "datetime", 
                    "_optional" : true
                }
            },
            "created" : {
                "_type" :"datetime",
                "_comment" : ["Date and time of the BioCompute Object creation"],
                "_read_only" : true
            },
            "modified" : {
                "_type" :"datetime",
                "_comment" : ["Date and time of the BioCompute Object was last modified"],
                "_read_only" : true
            },
            "contributors" : {
                "_type" : "contributor",
                "_multi_value" : true
            },
            "license" : {
                "_type" : "string",
                "_optional" : true,
                "_comment" : ["Creative Commons licence or other licence information (text) space. The default or recommended licence can be Attribution 4.0 International: for example https://spdx.org/licenses/CC-BY-4.0.html"]
            }
        },

        "usability_domain" : {
            "_type" : "string",
            "_comment" : ["Text from biospec"],
            "_multi_value" : true
        },

        "extension_domain":{
            "_type" : "json",
            "_optional" : true,
            "_comment" : [
                "all fields in this domain are BioCompute specific and should be defined in inherited BioCompute type",
                "This domain allows for the addition of "
            ]
        },

        "description_domain" : {
            "keywords" : {
                "_type" : "string",
                "_multi_value" : true
            },
            "xref" : {
                "_type" : "xref",
                "_optional" : true,
                "_multi_value" : true
            },
            "pipeline_steps" : {
                "tool" : {
                    "_multi_value" : true,
                    "name" : {
                        "_type" : "string",
                        "_comment" : ["this is a recognized name of the software tool"] 
                    },
                    "description" : {
                       "_type" : "string"
                    },
                    "step_number": {
                        "_type": "integer"
                    },
                    "version" : {
                       "_type" : "version"
                    },
                    "prerequisite" : {
                        "_multi_value" : true,
                        "_optional" : true,
                        "_comment" : "reference or required prereqs",
                        "name" : {
                            "_type" :"string",
                            "_comment" : ["Public searchable name for reference or prereq"]
                        },
                        "uri":{
                            "_type" : "uri"
                        }
                    },
                    "input_list" : {
                        "_type" : "uri",
                        "_multi_value" : true
                    },
                    "output_list" : {
                        "_type" : "uri",
                        "_multi_value" : true
                    }
                }
            }
        },

        "execution_domain" : {
            "script_access_type" : {
               "_type" :"string",
                "_constraint" : {
                    "_choice" : [ "URI", "text" ]
                }
            },
            "script" : {
               "_type" : "string"
            },
            "script_driver" : {
               "_type" : "string"
            },
            "pipeline_version" : {
                "_type" : "version"
            },
            "platform" : {
                "_type" : "string"
            },
            "software_prerequisites" : {
                "_multi_value" : true,
                "name" : {
                    "_type" : "string"
                }, 
                "version" : {
                    "_type" : "version"
                },  
                "uri" : {
                    "_type" : "uri",
                    "_optional" : true
                }
            },
            "domain_prerequisites" : {
                "_multi_value" : true,
                "name" : {
                    "_type" : "string"
                }, 
                "url" : {
                    "_type" : "string",
                    "_multi_value" : true
                }
            },
            "environment_variables" : {
                "_type" : "keyval",
                "_multi_value" : true
            }
        },
        
        "parametric_domain" : {
            "_type" : "json",
            "_comment" : [
                "all fields in this domain should be defined in inheriting BioCompute subtypes",
                "see example in bco_type_examples.json object parametric_domain_type_definition_examples"
            ]
        },

        "io_domain" : {
            "input_subdomain" : {
                "_type" : "json",
                "_comment" : "all fields in this domain are BioCompute specific and should be defined in inherited BioCompute type"
            },

            "output_subdomain" : {
                "_type" : "file",
                "_multi_value" : true,
                "_comment" : "output is a file object"
            }
        },
        "error_domain": {
            "empirical_error": {
                "_type" : "json",
                "_comment" : "all fields in this domain are BioCompute specific and should be defined in inherited BioCompute type"
            },
            "algorithmic_error": {
                "_type" : "json",
                "_comment" : "all fields in this domain are BioCompute specific and should be defined in inherited BioCompute type"
            }
        }
    }
}
```

## BCO expanded view example 
Three of the domains in a BioCompute Object become immutable upon assignment of the digital signature: 1) the Parametric Domain, 2) the Execution Domain and 3) the I/O Domain. Changing anything within these domains invalidates the verification and will break the digital signature. Required fields are indicated by the "vital": "True" flag, which is shown in the data typing section above.

```JSON
{
    "bco_id": "https://github.com/biocompute-objects/BCO_Spec_V1.2/blob/hadley_local/HCV1a.json",
    "type": "antiviral_resistance_detection", 
    "digital_signature": "905d7fce3f3ac64c8ea86f058ca71658",
    "bco_spec_version" : "https://w3id.org/biocompute/spec/v1.2",
    "provenance_domain": {
        "name": "HCV1a ledipasvir resistance SNP detection", 
        "structured_name": "HCV1a [taxonomy:31646] ledipasvir [pubchem.compound:67505836] resistance SNP [so:0000694] detection",
        "version": "2.9",
        "review": [
            {
                "status": "approved",
                "reviewer_comment": ["Approved by GW staff. Waiting for approval from FDA Reviewer"],
                "reviewer": {
                    "name": "Charles Hadley King", 
                    "affiliation": "George Washington University", 
                    "email": "hadley_king@gwu.edu",
                    "contribution": ["curatedBy"],
                    "orcid": "https://orcid.org/0000-0003-1409-4549"
                }
            },
            {
                "status": "approved",
                "reviewer_comment": ["The revised BCO looks fine"],
                "reviewer": {
                    "name": "Eric Donaldson", 
                    "affiliation": "FDA", 
                    "email": "Eric.Donaldson@fda.hhs.gov",
                    "contribution": ["curatedBy"]
                }
            }
        ],
        "derived_from" : null,
        "obsolete_after" : "2118-09-26T14:43:43-0400",
        "embargo" : {
            "start_time": "2000-09-26T14:43:43-0400",
            "end_time": "2000-09-26T14:43:45-0400"
		},
        "created": "2017-01-24T09:40:17-0500", 
        "modified": "2018-09-21T14:06:14-0400", 
        "contributors": [
            {
                "name": "Charles Hadley King", 
                "affiliation": "George Washington University", 
                "email": "hadley_king@gwu.edu",
                "contribution": ["createdBy", "curatedBy"],
                "orcid": "https://orcid.org/0000-0003-1409-4549"
            },
            {
                "name": "Eric Donaldson", 
                "affiliation": "FDA", 
                "email": "Eric.Donaldson@fda.hhs.gov",
                "contribution": ["authoredBy"]
            }
        ],
        "license": "https://spdx.org/licenses/CC-BY-4.0.html"
    },
    "usability_domain": [
        "Identify baseline single nucleotide polymorphisms SNPs [SO:0000694], insertions [SO:0000667], and deletions [SO:0000045] that correlate with reduced ledipasvir [pubchem.compound:67505836] antiviral drug efficacy in Hepatitis C virus subtype 1 [taxonomy:31646]", 
        "Identify treatment emergent amino acid substitutions [SO:1000002] that correlate with antiviral drug treatment failure", 
        "Determine whether the treatment emergent amino acid substitutions [SO:1000002] identified correlate with treatment failure involving other drugs against the same virus", 
        "GitHub CWL example: https://github.com/mr-c/hive-cwl-examples/blob/master/workflow/hive-viral-mutation-detection.cwl#L20"
	],
    "extension_domain":{
	    "extension_domain":{
	        "fhir_extension": [
	            {
	                "fhir_endpoint_resource": "Sequence",
	                "fhir_endpoint_url": "http://fhirtest.uhn.ca/baseDstu3",
	                "fhir_endpoint_ids": ["21376"]
	            },
	            {
	                "fhir_endpoint_resource": "DiagnosticReport",
	                "fhir_endpoint_url": "http://fhirtest.uhn.ca/baseDstu3",
	                "fhir_endpoint_ids": ["6288583"]
	            },
	            {
	                "fhir_endpoint_resource": "ProcedureRequest",
	                "fhir_endpoint_url": "http://fhirtest.uhn.ca/baseDstu3",
	                "fhir_endpoint_ids": ["25544"]
	            },
	            {
	                "fhir_endpoint_resource": "Observation",
	                "fhir_endpoint_url": "http://fhirtest.uhn.ca/baseDstu3",
	                "fhir_endpoint_ids": ["92440"]
	            },
	            {
	                "fhir_endpoint_resource": "FamilyMemberHistory",
	                "fhir_endpoint_url": "http://fhirtest.uhn.ca/baseDstu3",
	                "fhir_endpoint_idsr": ["4588936"]
	            }
	        ],
        "github_extension": {
            "github_repository": "https://github.com/common-workflow-language/hive-cwl-examples", 
            "github_URI":"https://github.com/common-workflow-language/hive-cwl-examples/blob/c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21/workflow/hive-viral-mutation-detection.cwl"
            }
    },
    "description_domain": {
        "keywords": [
                 "HCV1a", 
                 "Ledipasvir", 
                 "antiviral resistance", 
                 "SNP", 
                 "amino acid substitutions"
                ]
            }
        ], 
        "xref": [
            {
                "namespace": "pubchem.compound",
                "name": "PubChem-compound",
                "ids": ["67505836"], 
                "access_time": "2018-13-02T10:15-05:00"
            },
            {
                "namespace": "pubmed",
                "name": "PubMed",
                "ids": ["26508693"], 
                "access_time": "2018-13-02T10:15-05:00"
            },
            {
                "namespace": "so",
                "name": "Sequence Ontology",
                "ids": ["SO:000002", "SO:0000694", "SO:0000667", "SO:0000045"],
                "access_time": "2018-13-02T10:15-05:00"
            },
            {
                "namespace": "taxonomy",
                "name": "Taxonomy",
                "ids": ["31646"], 
                "access_time": "2018-13-02T10:15-05:00"
            }
        ], 
        "pipeline_steps": {
            "tool": [
                {
                    "step_number": "1", 
                    "name": "HIVE-hexagon", 
                    "description": "Alignment of reads to a set of references", 
                    "version": "1.3", 
                    "prerequisite": [
                        {
                            "name": "Hepatitis C virus genotype 1", 
                            "uri": {
                                "address": "http://www.ncbi.nlm.nih.gov/nuccore/22129792",
                                "access_time": "2017-01-24T09:40:17-0500"
                            }
                        }, 
                        {
                            "name": "Hepatitis C virus type 1b complete genome", 
                            "uri": {
                                "address": "http://www.ncbi.nlm.nih.gov/nuccore/5420376",
                                "access_time": "2017-01-24T09:40:17-0500"
                            }
                        }, 
                        {
                            "name": "Hepatitis C virus (isolate JFH-1) genomic RNA", 
                            "uri": {
                                "address": "http://www.ncbi.nlm.nih.gov/nuccore/13122261",
                                "access_time": "2017-01-24T09:40:17-0500"
                            }
                        }, 
                        {
                            "name": "Hepatitis C virus clone J8CF, complete genome", 
                            "uri": {
                                "address": "http://www.ncbi.nlm.nih.gov/nuccore/386646758",
                                "access_time": "2017-01-24T09:40:17-0500"
                            }
                        }, 
                        {
                            "name": "Hepatitis C virus S52 polyprotein gene", 
                            "uri": {
                                "address": "http://www.ncbi.nlm.nih.gov/nuccore/295311559",
                                "access_time": "2017-01-24T09:40:17-0500"
                            }
                        }
                    ], 
                    "input_list": [
                        {
                            "address": "https://hive.biochemistry.gwu.edu/dna.cgi?cmd=objFile&ids=514683",
                            "access_time": "2017-01-24T09:40:17-0500"
                        }, 
                        {
                            "address": "https://hive.biochemistry.gwu.edu/dna.cgi?cmd=objFile&ids=514682",
                            "access_time": "2017-01-24T09:40:17-0500"
                        }
                    ],
                    "output_list": [
                        {
                            "address": "https://hive.biochemistry.gwu.edudata/514769/allCount-aligned.csv",
                            "access_time": "2017-01-24T09:40:17-0500"
                        }
                    ]
                },
                {
                    "step_number": "2", 
                    "name": "HIVE-heptagon", 
                    "description": "variant calling", 
                    "version": "1.3", 
                    "prerequisites": null, 
                    "input_list": [
                        {
                            "address": "https://hive.biochemistry.gwu.edudata/514769/dnaAccessionBased.csv",
                            "access_time": "2017-01-24T09:40:17-0500"
                        }
                    ], 
                    "output_list": [
                        {
                            "address": "https://hive.biochemistry.gwu.edudata/514801/SNPProfile.csv",
                            "access_time": "2017-01-24T09:40:17-0500"
                        }, 
                        {
                            "address": "https://hive.biochemistry.gwu.edudata/14769/allCount-aligned.csv",
                            "access_time": "2017-01-24T09:40:17-0500"
                        }
                    ]
                }
            ]
        }
    },
    "execution_domain": {
        "script_access_type": "text",
        "script": {"https://example.com/workflows/antiviral_resistance_detection_hive.py"},
        "script_driver": "manual",
        "pipeline_version": "2.0", 
        "platform": "hive", 
        "software_prerequisites": [
            {
                "name": "HIVE-hexagon", 
                "version": "babajanian.1",
                "uri": {
                    "address": "https://hive.biochemistry.gwu.edu/dna.cgi?cmd=dna-hexagon&cmdMode=-",
                    "access_time": "2017-01-24T09:40:17-0500",
                    "sha1_chksum": null
                }
            }, 
            {
                "name": "HIVE-heptagon", 
                "version": "albinoni.2",
                "uri": {
                    "address": "https://hive.biochemistry.gwu.edu/dna.cgi?cmd=dna-heptagon&cmdMode=-",
                    "access_time": "2017-01-24T09:40:17-0500",
                    "sha1_chksum": null
                }
            }
        ],
        "domain_prerequisites": [
            {
                "name": "HIVE", 
                "url": "https://hive.biochemistry.gwu.edu/dna.cgi?cmd=login"
            }, 
            {
                "name": "access to ftp", 
                "url": "ftp://:22/"
            }, 
            {
                "name": "access to e-utils", 
                "url": "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/"
            },
			{
				"name": "generic name",
			    "url": "protocol://domain:port/application/path",
				}
        ], 
        "env_parameters": {
            "key": "HOSTTYPE", 
            "value" : "x86_64-linux"
        }
    }, 
    "parametric_domain": {
        "HIVE-hexagon" : { 
            "seed": 14,
            "minimum_match_len": 66, 
            "divergence_threshold_percent": 0.30
        },
        "HIVE-heptagon": {
            "minimum_coverage": 15, 
            "freq_cutoff": 0.10
        } 
    }, 
    "io_domain": {
        "input_subdomain": {
            "subject": [
                {
                    "name": "Hepatitis C virus genotype 1", 
                    "uri": {
                        "address": "http://www.ncbi.nlm.nih.gov/nuccore/22129792",
                        "access_time": "2017-01-24T09:40:17-0500"
                    }
                }, 
                {
                    "name": "Hepatitis C virus type 1b complete genome", 
                    "uri": {
                        "address": "http://www.ncbi.nlm.nih.gov/nuccore/5420376",
                        "access_time": "2017-01-24T09:40:17-0500"
                    }
                }, 
                {
                    "name": "Hepatitis C virus (isolate JFH-1) genomic RNA", 
                    "uri": {
                        "address": "http://www.ncbi.nlm.nih.gov/nuccore/13122261",
                        "access_time": "2017-01-24T09:40:17-0500"
                    }
                }, 
                {
                    "name": "Hepatitis C virus clone J8CF, complete genome", 
                    "uri": {
                        "address": "http://www.ncbi.nlm.nih.gov/nuccore/386646758",
                        "access_time": "2017-01-24T09:40:17-0500"
                    }
                }, 
                {
                    "name": "Hepatitis C virus S52 polyprotein gene", 
                    "uri": {
                        "address": "http://www.ncbi.nlm.nih.gov/nuccore/295311559",
                        "access_time": "2017-01-24T09:40:17-0500"
                    }
                }
            ],
            "query": [
                {
                    "name": "HCV1a_drug_resistant_sample0001-01", 
                    "uri": {
                        "address": "https://hive.biochemistry.gwu.edunuc-read/514682",
                        "access_time": "2017-01-24T09:40:17-0500"
                    }
                }, 
                {
                    "name": "HCV1a_drug_resistant_sample0001-02", 
                    "uri": {
                        "address": "https://hive.biochemistry.gwu.edunuc-read/514683",
                        "access_time": "2017-01-24T09:40:17-0500"
                    }
                }
            ]
        }, 
        "output_subdomain": [
            {
               "mediatype": "text/csv", 
                "uri": { 
                    "address": "https://hive.biochemistry.gwu.edudata/514769/dnaAccessionBased.csv",
                    "access_time": "2017-01-24T09:40:17-0500"
                }
            }, 
            {
               "mediatype": "text/csv", 
                "uri": {
                    "address": "https://hive.biochemistry.gwu.edudata/514801/SNPProfile*.csv",
                    "access_time": "2017-01-24T09:40:17-0500"
                }
            }
        ]
    }, 
    "error_domain": {
        "empirical_error": {
            "false negative alignment hits": "<0.0010", 
            "false discovery": "<0.05"
        }, 
        "algorithmic_error": {
            "false positive mutation calls discovery": "<0.0005", 
            "false_positive_mutation_calls_discovery": "<0.00005", 
            "false_discovery": "0.005"
        }
    }
}
```

BioCompute data types are defined as aggregates of the critical fields organized into a few domains: 
1) the identification and provenance domain
2) the usability domain
3) the extension domain
4) description domain
5) the execution domain
6) the parametric domain
7) the input and output domains
8) the error domain. 

At the time of submission to the BioCompute Object database values are validated for compliance with data type definitions and an uniquely identified instance of BCO type is created.  The object could then be assigned a unique digital signature and a unique digital object identifier. 

Three of the domains in a BioCompute Object become immutable upon assignment of the digital signature: 
   1) the Parametric Domain
   2) the Execution Domain and 
   3) the I/O Domain. 
   
Changing anything within these domains invalidates the verification and will break the digital signature. Required fields are indicated by the "vital": "True" flag, which is shown in the data typing section below. 

# BioCompute Object Consortium members (BCOC):
**FDA:** Mark Walderhaug, Ruth Bandler, Eric Donaldson, Elaine Thompson, Alin Voskanian, Anton Golikov, Konstantinos Karagiannis, Elaine Johanson, Adrian Myers, Errol Strain, Khaled Bouri, Tong Weida, Wenming Xiao, Md Shamsuzzaman 

**GW:** [Raja Mazumder](https://orcid.org/0000-0001-8823-9945), [Charles Hadley S. King IV](https://orcid.org/0000-0003-1409-4549), [Amanda Bell](https://orcid.org/0000-0002-9920-565X), Jeet Vora, Krista M. Smith, Robel Kahsay

**Documentation Community:** Vahan Simonyan (Crispr Therapeutics), Gil Alterovitz (Boston Children’s Hospital/Harvard Medical School, SMART/FHIR/HL7, GA4GH), Michael R. Crusoe (CWL), Marco Schito (C-Path), Konstantinos Krampis (CUNY), Alexander (Sasha) Wait Zaranek (Curoverse), John Quackenbush (DFCI/Harvard), Geet Duggal (DNAnexus), Singer Ma (DNAnexus), Yuching Lai (DDL), Warren Kibbe (Duke), Tony Burdett (EBI), Helen Parkinson (EBI), Stuart Young (Engility Corp), Anupama Joshi (Epinomics), Vineeta Agarwala (Flatiron Health), James Hirmas (GenomeNext), David Steinberg (UCSC), Veronica Miller (HIV Forum), Dan Taylor (Internet 2), Paul Duncan (Merck), Jianchao Yao (Merck & Co., Inc., Boston, MA USA), Marilyn Matz (Paradigm4), Ben Busby (NCBI), Eugene Yaschenko (NCBI), Zhining Wang (NCI), Hsinyi (Steve) Tsang (NCI), Durga Addepalli (NCI/Attain), Heidi Sofia (NIH), Scott Jackson (NIST), Paul Walsh (NSilico Life Science), Toby Bloom (NYGC), Hiroki Morizono (CNMC), Jeremy Goecks (Oregon Health and Science University), Srikanth Gottipati (Otsuka-US), Alex Poliakov (Paradigm4), Keith Nangle (Pistoia Alliance), Jonas S Almeida (Stony Brook Univ,  SUNY), Dennis A. Dean, II (Seven Bridges Genomics), Dustin Holloway (Seven Bridges Genomics), Nisha Agarwal (Solvuu), Stian Soiland-Reyes (UNIMAN), Carole Goble (UNIMAN), Susanna-Assunta Sansone (University of Oxford), Philippe Rocca-Serra (University of Oxford), Phil Bourne (Univ. of Virginia), Joseph Nooraga (Fred Hutchinson Cancer Research Center)

