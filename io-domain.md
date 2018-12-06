_This document is part of the [BioCompute Object User Guide](user_guide.md)_


## 2.7 Input and Output Domain "io_domain"

This section defines the `io_domain` part of the [BCO](bco-domains.md).

This represents the list of global input and output files created by the computational workflow, excluding the intermediate files. These fields are pointers to objects that can reside in the system performing the computation or any other accessible system. Just like the fields of parametric domain, these fields are custom to every specific BCO implementation and can refer to named input output arguments of underlying pipelines. Please refer to documentation of individual scripts and specific BCO descriptions for further details.

Condensed exampled:

```json
"io_domain": {
        "input_subdomain": {
        }, 
        "output_subdomain": [
        ]
}, 
```

### 2.7.1 Input Subdomain "input_subdomain"

This field records the references and input files for the entire pipeline. Each type of input file is listed under a key for that type. The file types are specified when the BCO type is created. This allows the author to be very specific about a particular type of input file, if they so choose. For example: reference files have common names, and adding the common name here, in addition to the uri would make this more readable and understandable (eg, `"HCV reference version..."` or `"human reference GRCH38"`). For data integration workflows, the input files can be a table downloaded from a specific source which is then filtered for modified using rules described in the BCO.

```json
        "input_subdomain": [
            {
                "uri": {
                    "filename": "Hepatitis C virus genotype 1", 
                    "uri": "http://www.ncbi.nlm.nih.gov/nuccore/22129792",
                    "access_time": "2017-01-24T09:40:17-0500"
                }
            }, 
            {
                "uri": {
                    "filename": "Hepatitis C virus type 1b complete genome", 
                    "uri": "http://www.ncbi.nlm.nih.gov/nuccore/5420376",
                    "access_time": "2017-01-24T09:40:17-0500"
                }
            }
        ]
```

### 2.7.2 Output Subdomain "output_subdomain"

This field records the outputs for the entire pipeline. Each file should be an object with a key, and a title, URI, and media type ([https://www.iana.org/assignments/media-types/](https://www.iana.org/assignments/media-types/)) value.  

```json
        "output_subdomain": [
            {
                "mediatype": "text/csv", 
                "uri": { 
                    "uri": "http://example.com/data/514769/dnaAccessionBased.csv",
                    "access_time": "2017-01-24T09:40:17-0500"
                }
            },
            {
                "mediatype": "text/csv", 
                "uri": {
                    "uri": "http://example.com/data/514801/SNPProfile*.csv",
                    "access_time": "2017-01-24T09:40:17-0500"
                }
            }
        ]
```

