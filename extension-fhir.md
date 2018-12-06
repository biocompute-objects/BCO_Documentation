_This document is part of the [BioCompute Object specification](bco-specification.md)_

_Back to [BCO domains](bco-domains.md)_

### 2.3.1 Extension to External References: SMART on FHIR Genomics

The external references **example** extension to FHIR resource demonstrates how specific data elements can be extracted from EHR systems or other secure FHIR endpoints via technologies such as SMART on FHIR Genomics (https://www.ncbi.nlm.nih.gov/pubmed/26198304) without compromising patient and providers’ information. This is because the portions being transferred contain no identifiable information about the patient. Instead there is a reference to the actual resource instance (via FHIR URL) through which all data is accessed.

The `fhir_extension` is defined as an array of endpoints from which to fetch resources. 

`fhir_endpoint` is a string containing the URL of the endpoint of the FHIR server containing the resource. `fhir_version` must be present showing the FHIR version used.

`fhir_resources` is an array of resources to fetch from the endpoint, where `fhir_resource` is a string containing the type of resource used according to the specified version. (a full list of permitted FHIR 3 resources is available at http://hl7.org/fhir/STU3/resourcelist.html) `fhir_id` is a string containing the server-specific identifier for the resource instance. 

The link to FHIR can also be added to the usability domain.  More on FHIR Genomics in release 3 of FHIR can be found here: https://www.hl7.org/fhir/genomics.html

SMART on FHIR Genomics provides a framework for EHR-based apps built on FHIR that integrate clinical and genomic information. For more information on how to use the SMART on FHIR Genomics apps, please visit http://projects.iq.harvard.edu/smartgenomics/.   

```json
    "extension_domain":{
        "fhir_extension": [
            {
                "fhir_endpoint": "http://fhirtest.uhn.ca/baseDstu3",
                "fhir_version": "3",
                "fhir_resources": [
                    {
                        "fhir_resource": "Sequence",
                        "fhir_id": "21376"
                    },
                    {
                        "fhir_resource": "DiagnosticReport",
                        "fhir_id": "6288583"
                    },
                    {
                        "fhir_resource": "ProcedureRequest",
                        "fhir_id": "25544"
                    },
                    {
                        "fhir_resource": "Observation",
                        "fhir_id": "92440"
                    },
                    {
                        "fhir_resource": "FamilyMemberHistory",
                        "fhir_id": "4588936"
                    }
                ]
            }
```
