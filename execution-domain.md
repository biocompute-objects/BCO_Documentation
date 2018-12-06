_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.5 Execution Domain "execution_domain"

This section defines the `execution_domain` part of the [BCO](bco-domains.md).

The fields required for execution of the BCO have been encapsulated together in order to clearly separate information needed for deployment, software configuration and running applications in a dependent environment. One byproduct of an accurate BCO definition is facilitation of reproducibility as defined by the *Oxford English Dictionary* as "the extent to which consistent results are obtained when produced repeatedly."

Condensed example:

```json
"execution_domain": {
        "script_access_type": "text",
        "script": [
        ],
        "script_driver": "manual",
        "software_prerequisites": [
        ],
        "external_data_endpoints": [
        ], 
        "environment_variables": {
        }
}
```

### 2.5.1  Script "script"

The Script field points to an internal or external reference to a script object that was used to perform computations for this BCO instance. This may be a reference to an object in GitHub, a computational service or any other type of script. 

```json
 "script": ["https://example.com/workflows/antiviral_resistance_detection_hive.py"]
```

### 2.5.2 Script driver "script_driver"

This field provides a space to indicate what kind of executable can be launched in order to perform a sequence of commands described in the script (see above) in order to run the pipeline. 

```json
"script_driver": "shell"
```

### 2.5.3 Algorithmic tools and Software Prerequisites "software_prerequisites" 

An optional multi-value field listing the minimal necessary prerequisites, library, tool versions needed to successfully run the script to produce BCO. The keys are `name`, `version`, and `uri`. 

```json
        "software_prerequisites": [
            {
                "name": "HIVE-hexagon", 
                "version": "babajanian.1",
                "uri": {
                    "address": "http://example.com/dna.cgi?cmd=dna-hexagon&cmdMode=-",
                    "access_time": "2017-01-24T09:40:17-0500",
                    "sha1_chksum": "d60f506cddac09e9e816531e7905ca1ca6641e3c"
                }
            }, 
            {
                "name": "HIVE-heptagon", 
                "version": "albinoni.2",
                "uri": {
                    "address": "http://example.com/dna.cgi?cmd=dna-heptagon&cmdMode=-",
                    "access_time": "2017-01-24T09:40:17-0500"
                }
            }
        ]
```

### 2.5.4 External Data Endpoints "external_data_endpoints"

An optional multi-value field listing the minimal necessary domain specific external data source access in order to successfully run the script to produce BCO. The values under this field present the requirements for network protocol endpoints used by a pipeline’s scripts, or other software. 

The key `url` defines an endpoint to be accessed. If the _path_ of the URL is `/` then any resource at the given domain may be accessed, while if the path is more specific than only resources which path prefix matches may be accessed.

The key `name` should describe the service that is accessed.

```json
"external_data_endpoints": [

    {"url": "protocol://domain:port/application/path","name": "generic name"},

    {"url": "ftp://data.example.com:21/",
    "name": "access to ftp server"},

    {"url": "http://eutils.ncbi.nlm.nih.gov/entrez/eutils",
    "name": "access to e-utils web service"}
]
```

### 2.5.5 Environment Variables "environment_variables"

Multi-value additional key value pairs useful to configure the execution environment on the target platform. For example, one might specify the number of compute cores, or available memory use of the script. The possible keys are specific to each platform. The "value" should be a JSON string.

```json
        "environment_variables": {
            "HOSTTYPE": "x86_64-linux",
            "EDITOR": "vim"
        }
    }
```
