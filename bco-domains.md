_This document is part of the [BioCompute Object specification](bco-specification.md)_

# BCO domains

A BCO JSON object is split into different parts, or _domains_, detailed below.

Condensed example:

```json
{
    "bco_spec_version" : "https://w3id.org/biocompute/spec/v1.2",
    "BCO_id": "https://example.com/bco/9487ae7e-c1aa-4a3c-b18f-3d3695b33ace",
    "type": "antiviral_resistance_detection", 
    "digital_signature": "d41d8cd98f00b204e9800998ecf8427e",
    "provenance_domain": {
    },
    "usability_domain": [
    ],
    "extension_domain":{
        "fhir_extension": [
        ],
        "github_extension": {
        }
    },
    "description_domain": {
    },
    "execution_domain": {
    }, 
    "parametric_domain": {
    }, 
    "io_domain": {
    }, 
    "error_domain": {
    }
}
```


## 2.0 Top Level Fields

The top level JSON object of a BCO include attributes to define the BCO itself.

Specification:

* [Top level fields](top-level.md)

The remaining top level fields details different _domains_ of the BCO, as listed below.

## 2.1 Provenance Domain "provenance_domain"

The `provenance_domain` defines the history, version and status of this BCO as part of the review process.

Specification:

* [Provenance domain](provenance-domain.md)


## 2.2 Usability Domain "usability_domain"

The `usability_domain` is meant to improve searchability by allowing free-text description of the BCO.

Specification:

* [Usability domain](usability-domain.md)


## 2.3 Extension Domain "extension_domain"

The `extension_domain` is for a user to add more structured information that is defined in the type definition. The `extension_domain` section is not evaluated by checks for BCO validity or computational correctness.

Specifications:

* [fhir extension](extension-fhir.md)
* [GitHub extension](extension-github.md)


## 2.4 Description Domain "description_domain"

The `description_domain` contain structured field for description of external references, the pipeline steps, and the relationship of I/O objects.

Specification:

* [Description domain](description-domain.md)

## 2.5 Execution Domain "execution_domain"

The `execution_domain` contains fields for execution of the BCO.

Specification:

* [Execution domain](execution-domain.md)


## 2.6 Parametric Domain "parametric_domain"

The `parametric_domain` represents the list of parameters customizing the computational flow which can affect the output of the calculations. 

Specification:

* [Parametric domain](parametric-domain.md)

## 2.7 Input and Output Domain "io_domain"

The `io_domain` represents the list of global input and output files created by the computational workflow.

Specification:

* [Input and Output domain](io-domain.md)


## 2.8 Error Domain, acceptable range of variability "error_domain"

The `error_domain` defines the empirical and algorithmic limits an d error sources of the BCO.

Specification:

* [Error domain](error-domain.md)
