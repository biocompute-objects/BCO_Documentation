---
title: "BCO Domains"
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

# BCO domains

A BCO JSON object is split into different parts, or _domains_, detailed below.

Condensed example:

```json
{
    "spec_version" : "https://w3id.org/biocompute/1.3.0/",
    "object_id": "https://example.com/bco/9487ae7e-c1aa-4a3c-b18f-3d3695b33ace",
    "type": "antiviral_resistance_detection", 
    "etag": "584C7FE128717E1712426AB19CAAEA8BC1E27365B54285BBEA1221284C7D3A48",
    "provenance_domain": {
    },
    "usability_domain": [
    ],
    "extension_domain":{
        "fhir_extension": [
        ],
        "scm_extension": {
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

Definition:

* [Top level fields](/top-level)

The remaining top level fields details different _domains_ of the BCO, as listed below.

## 2.1 Provenance Domain "provenance_domain"

The `provenance_domain` defines the history, version and status of this BCO as part of the review process.

Definition:

* [Provenance domain](/provenance-domain)


## 2.2 Usability Domain "usability_domain"

The `usability_domain` is meant to improve searchability by allowing free-text description of the BCO.

Definition:

* [Usability domain](/usability-domain)


## 2.3 Extension Domain "extension_domain"

The `extension_domain` is a space for a user to add additional structured information that is not defined in the BioCompute shcema. The `extension_domain` section is not evaluated by checks for BCO validity or computational correctness and as such is the place to add *ANY* type of additional **structured** information. We provide two examples that are neither exclusive nor exhaustive.

Definitions:

* [fhir extension](/extension-fhir)
* [scm extension](/extension-scm)


## 2.4 Description Domain "description_domain"

The `description_domain` contain structured field for description of external references, the pipeline steps, and the relationship of I/O objects.

Definition:

* [Description domain](/description-domain)

## 2.5 Execution Domain "execution_domain"

The `execution_domain` contains fields for execution of the BCO.

Definition:

* [Execution domain](/execution-domain)


## 2.6 Parametric Domain "parametric_domain"

The `parametric_domain` represents the list of parameters customizing the computational flow which can affect the output of the calculations. 

Definition:

* [Parametric domain](/parametric-domain)

## 2.7 Input and Output Domain "io_domain"

The `io_domain` represents the list of global input and output files created by the computational workflow.

Definition:

* [Input and Output domain](/io-domain)


## 2.8 Error Domain, acceptable range of variability "error_domain"

The `error_domain` defines the empirical and algorithmic limits an d error sources of the BCO.

Definition:

* [Error domain](/error-domain)
