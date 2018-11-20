_This document is part of the [BioCompute Object specification](bco-specification.md)_


### 2.3.1 Extension to External References: SMART on FHIR Genomics

The external references **example** extension to FHIR resource demonstrates how specific data elements can be extracted from EHR systems or other secure FHIR endpoints via technologies such as SMART on FHIR Genomics (https://www.ncbi.nlm.nih.gov/pubmed/26198304) without compromising patient and providers’ information. This is because the portions being transferred contain no identifiable information about the patient. Instead there is a reference to the actual resource instance (via FHIR URL) through which all data is accessed.

`fhir_endpoint_resource` is a string containing the type of resource used. A full list of permitted FHIR resources is available at http://hl7.org/fhir/resourcelist.html. `fhir_endpoint` is an array of strings containing the URL of the endpoint of the FHIR server containing the resource. `fhir_endpoint_ids` is a string containing the server-specific identifier for the resource instance. The link to FHIR can also be added to the usability domain.  More on FHIR Genomics in release 3 of FHIR can be found here: https://www.hl7.org/fhir/genomics.html

SMART on FHIR Genomics provides a framework for EHR-based apps built on FHIR that integrate clinical and genomic information. For more information on how to use the SMART on FHIR Genomics apps, please visit http://projects.iq.harvard.edu/smartgenomics/.   

```json
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
                "fhir_endpoint_ids": ["4588936"]
            }
        ],	
```
