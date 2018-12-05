_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.4 Description Domain "description_domain"


This section defines the fields of the `description_domain` part of the [BCO](bco-domains.md) structure.

Structured field for description of external references, the pipeline steps, and the relationship of I/O objects. Information in this domain is not used for computation. This domain is meant to capture information that is currently being provided in FDA submission in journal format. It is possible that in the future this field can be semi-automatically generated from the execution_domain information. 

Condensed example:

```json
"description_domain": {
        "keywords": [
        ], 
        "xref": [
        ],
        "platform": ["HIVE"],
        "pipeline_steps": [
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
                    }
                ], 
                "input_list": [
                ],
                "output_list": [
                ]
            }
        ]
    
},
```


### 2.4.1 Keywords "keywords"

This is a list of keywords to aid in search-ability and description of the object. This is required. 

```json
        "keywords": [
                        "HCV1a", 
                        "Ledipasvir", 
                        "antiviral resistance", 
                        "SNP", 
                        "amino acid substitutions"
```

### 2.4.2 External References "xref"

This field contains a list of the databases and/or ontology IDs that are cross-referenced in the BCO. The external references are used to provide more specificity in the information related to BCO entries. Cross-referenced resources need to be available in the public domain. The external references are stored in the form of prefixed identifiers (CURIEs). These CURIEs map directly to the URIs maintained by identifiers.org. See Appendix-II for a list of the CURIEs used in this example. 

```json
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
```

### 2.4.3 Platform/Environment "platform"

The multi-value reference to a particular deployment of an existing platform where this BCO can be reproduced. A platform can be a bioinformatic platform such as Galaxy or HIVE or it can be a software package such as CASAVA or apps that includes multiple algorithms and software. This is for informative purposes only. 

```json
"platform": ["HIVE"]
```
### 2.4.4 Pipeline tools "pipeline_steps"

This is an optional structured domain for recording the specifics of a pipeline. Each individual tool (or a well defined and reusable script) is represented as a step, at the discretion of the author. Parallel processes are given the same step number. This is required.

#### 2.4.4.1 Step Number "step_number"

This is a non-negative integer value representing the position of the tool in a one-dimensional representation of the pipeline. The number is a suggestion for a [partial order](https://en.wikipedia.org/wiki/Partially_ordered_set) for presentation purposes, e.g. parallel computations assigned the same number based on their first possible execution. Actual execution order might differ from the step number. Gaps are allowed (e.g. step 20 follows step 10). 

```json
"step_number": 1
```

#### 2.4.4.2 Name "name"

Name for the specific tool. This field is a string (A-z, 0-1) and should be a single uniquely identifying word for the tool. 

```json
"name": "HIVE-hexagon"
```

#### 2.4.4.2 Tool Description "description"

A free text field for describing the specific use/purpose of the tool.

```json
"description": "Alignment of reads to a set of references",
```

#### 2.4.4.3 Tool Version "version"

The version assigned to the instance of the tool used corresponding to the upstream release.

```json
"version": "1.3",
```

#### 2.4.4.4 Tool Prerequisites "prerequisite"

A list of text values to indicate any packages or prerequisites for running the tool used. 

```json
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
                    ]
```

#### 2.4.4.6 Input List "input_list"

Each tool lists the URIs (expressed as a URN or URL) of the input files. These are a catchall for read files, reference files or any other type of input. All of these fields are optional and for descriptive purposes, therefore the structure here is less rigid than in other fields. 

```json
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
```

#### 2.4.4.7 Output List "output_list"

Each tool lists the URIs (expressed as a URN or URL) of the output files for that tool. 

```json
                    "output_list": [
                        {
                            "address": "https://hive.biochemistry.gwu.edudata/514769/allCount-aligned.csv",
                            "access_time": "2017-01-24T09:40:17-0500"
                        }
                    ]
```
