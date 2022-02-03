---
title: "Description Domain"
menu: "main"
---

<script>
  ((window.gitter = {}).chat = {}).options = {
    room: 'biocompute-objects/BCO_Specification'
  };
</script>
<script src="https://sidecar.gitter.im/dist/sidecar.v1.js" async defer></script>

<div class="col-lg-6 offset-lg-3 text-center">
<img src="/images/logo.about.png" class="img-fluid mx-auto d-block" width="75%" alt="BioCompute Logo">
</div>

<br>

_This document is part of the [BioCompute Object User Guide](/user_guide)_

_Back to [BCO domains](/bco-domains)_

## 2.4 Description Domain "description_domain"


This section defines the fields of the `description_domain` part of the [BCO](/bco-domains) structure.

Structured field for description of external references, the pipeline steps, and the relationship of I/O objects. Information in this domain is not used for computation. This domain is meant to capture information that is currently being provided in FDA submission in a standardized format. It is possible that some of these fields be automatically generated from the execution_domain information, and that some of them may repeat. 

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
                "step_number": 1, 
                "name": "HIVE-hexagon", 
                "description": "Alignment of reads to a set of references", 
                "version": "1.3", 
                "prerequisite": [
                    {
                        "name": "Hepatitis C virus genotype 1", 
                        "uri": {
                            "uri": "http://www.ncbi.nlm.nih.gov/nuccore/22129792",
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
    }
```


### 2.4.1 Keywords "keywords"

This is a list of keywords to aid in search-ability and description of the experiment. This is required. 

```json
    "keywords": [
        "HCV1a", 
        "Ledipasvir", 
        "antiviral resistance", 
        "SNP", 
        "amino acid substitutions"
    ]
```

### 2.4.2 External References "xref"

This field contains a list of the databases and/or ontology IDs that are cross-referenced in the BCO. The external references are used to provide more specificity in the information related to BCO entries. Full path to resource is not necessary, only namespace and identifier. Cross-referenced resources need to be available in the public domain. The external references are stored in the form of prefixed identifiers (CURIEs). These CURIEs map directly to the URIs maintained by identifiers.org. If external resources were used that do not conform to the criteria for inclusion in the xref field, they should be listed elsewhere (e.g. Extension Domain).

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
        ] 
```

### 2.4.3 Platform/Environment "platform"

The multi-value reference to a particular deployment of an existing platform where this BCO can be reproduced. A platform can be a bioinformatic platform such as Galaxy or HIVE or it can be a software package such as CASAVA or apps that includes multiple algorithms and software. This is for informative purposes only. 

```json
    "platform": ["HIVE"]
```
### 2.4.4 Pipeline tools "pipeline_steps"

This is a required, structured domain for tracing the steps of a pipeline. Each individual tool (or a well defined and reusable script) is represented as a step, at the discretion of the author (e.g. a spot check of the data may not be officially included in pipeline_steps; however for minor steps like these it is recommended to mention them in the Usability Domain).

Steps can be run in parallel. While the standard does not mandate any particular numbering schema, it is best practices to pick the most logically intuitive numbering system, and to keep numbering unique (i.e. do not repeat step numbers), such that each step has its own, unique integer. For example, a user may run a somatic SNV profiling step at the same time as a structural CNV analysis. Assume that an alignment is step #2, and that SNV profiling and CNV analysis follow this step. The user might (arbitrarily) call the SNV profiling step #3, and the CNV analysis step #4, instead of number both as #3. The fact that they pull from the output of the same step (#2) can easily be detected programmatically and represented in whatever way is suitable (e.g. graphically), but both still retain a unique numbering value.

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

A list of text values to indicate any packages or prerequisites for running the tool used. This consists of a `name` and `uri`. The `uri` object consists of the `filename`, `uri`, `access_time`, and `sha1_chksum` properties. The `uri` is the only REQUIRED property but it is reccomended that in the `prerequisites` here the `access_time` is used as well. 

```json
    "prerequisite": [
        {
            "name": "Hepatitis C virus genotype 1", 
            "uri": {
                "uri": "http://www.ncbi.nlm.nih.gov/nuccore/22129792",
                "access_time": "2017-01-24T09:40:17-0500"
            }
        }, 
        {
            "name": "Hepatitis C virus type 1b complete genome", 
            "uri": {
                "uri": "http://www.ncbi.nlm.nih.gov/nuccore/5420376",
                "access_time": "2017-01-24T09:40:17-0500"
            }
        }, 
        {
            "name": "Hepatitis C virus (isolate JFH-1) genomic RNA", 
            "uri": {
                "uri": "http://www.ncbi.nlm.nih.gov/nuccore/13122261",
                "access_time": "2017-01-24T09:40:17-0500"
            }
        }, 
        {
            "name": "Hepatitis C virus clone J8CF, complete genome", 
            "uri": {
                "uri": "http://www.ncbi.nlm.nih.gov/nuccore/386646758",
                "access_time": "2017-01-24T09:40:17-0500"
            }
        }, 
        {
            "name": "Hepatitis C virus S52 polyprotein gene", 
            "uri": {
                "uri": "http://www.ncbi.nlm.nih.gov/nuccore/295311559",
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
            "uri": "https://hive.biochemistry.gwu.edu/dna.cgi?cmd=objFile&ids=514683",
            "access_time": "2017-01-24T09:40:17-0500"
        }, 
        {
            "uri": "https://hive.biochemistry.gwu.edu/dna.cgi?cmd=objFile&ids=514682",
            "access_time": "2017-01-24T09:40:17-0500"
        }
    ],
```

#### 2.4.4.7 Output List "output_list"

Each tool lists the URIs (expressed as a URN or URL) of the output files for that tool. 

```json
    "output_list": [
        {
            "uri": "https://hive.biochemistry.gwu.edudata/514769/allCount-aligned.csv",
            "access_time": "2017-01-24T09:40:17-0500"
        }
    ]
```
