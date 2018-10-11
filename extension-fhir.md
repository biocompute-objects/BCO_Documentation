_This document is part of the [BioCompute Object specification](bco-specification.md)_


### 2.3.1 Extension to External References: SMART on FHIR Genomics

The external references include an optional extension to FHIR resource where specific data elements can be extracted from EHR systems or other secure FHIR endpoints via technologies such as SMART on FHIR Genomics (https://www.ncbi.nlm.nih.gov/pubmed/26198304) without compromising patient and providers’ information. This is because the portions being transferred contain no identifiable information about the patient. Instead there is a reference to the actual resource instance (via FHIR URL) through which all data is accessed.

The FHIR Endpoint URL coupled with the specific resource type and a unique FHIR identifier leads to a resource that can contain everything from the date and time of the procedure, specimen details, sequence information, linked sequence repositories, associated pedigrees, or even a set of observations linked from diagnostic reports. The link to FHIR can also be added to the usability domain.  More on FHIR Genomics in release 3 of FHIR can be found here: https://www.hl7.org/fhir/genomics.html

SMART on FHIR Genomics provides a framework for EHR-based apps built on FHIR that integrate clinical and genomic information. For more information on how to use the SMART on FHIR Genomics apps, please visit http://projects.iq.harvard.edu/smartgenomics/.   

```json
    "extension_domain":{
        "FHIR_extension": [
            {
                "FHIRendpoint_Resource": "Sequence",
                "FHIRendpoint_URL": "http://fhirtest.uhn.ca/baseDstu3",
                "FHIRendpoint_Ids": ["21376"]
            },
            {
                "FHIRendpoint_Resource": "DiagnosticReport",
                "FHIRendpoint_URL": "http://fhirtest.uhn.ca/baseDstu3",
                "FHIRendpoint_Ids": ["6288583"]
            },
            {
                "FHIRendpoint_Resource": "ProcedureRequest",
                "FHIRendpoint_URL": "http://fhirtest.uhn.ca/baseDstu3",
                "FHIRendpoint_Ids": ["25544"]
            },
            {
                "FHIRendpoint_Resource": "Observation",
                "FHIRendpoint_URL": "http://fhirtest.uhn.ca/baseDstu3",
                "FHIRendpoint_Ids": ["92440"]
            },
            {
                "FHIRendpoint_ResourceType": "FamilyMemberHistory",
                "FHIRendpoint_URL": "http://fhirtest.uhn.ca/baseDstu3",
                "FHIRendpoint_Ids": ["4588936"]
            }
        ],	
```
