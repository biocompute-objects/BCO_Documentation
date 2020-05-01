## BioCompute Registry

The [BioCompute Registry](https://biocomputeobject.org/tst/registry.html) is a domain registry for BCO IDs in which users can register their institution or organization. Similar to a website registry, this will allow the owner of that domain to use any domain organization of their choosing, and prevent naming collisions between groups. For example, the owner of “GW” can build BCOs GW_0001.1, GW01A, GW_<lastname>, or any other naming system of their preference, and these will not conflict with another registered domain, such as FDA_0001.1, etc. The BCO Registry registration numbers may not exceed five characters, and are recommended to be three characters. Any alphanumeric characters are acceptable.

A BCO may be registered only by the author of the object, and the domain must be approved by the domain holder. Until automated systems are in place, register a BCO by sending the BCO ID and email of the registrant to the [BioCompute Team](mailto:keeneyjg@gwu.edu). The following institutional domains have been reserved:

* GWU
* FDA
* NIH
* CDC
* NCI




## Preferred Ontologies

### Semantic Versioning
BCO versioning should adhere to [semantic versioning](https://semver.org/) to establish how version numbers are assigned and incremented. Given a version number MAJOR.MINOR.PATCH, when versioning a BCO increment the:
1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards-compatible manner, and
3. PATCH version when you make backwards-compatible bug fixes.
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

### PAV Ontology and PROV-O
To preserve the provenance of each BCO, the contribution type of the reviewers and contributors is a choice taken from PAV ontology: provenance, authoring and versioning, which also maps to the [PROV-O](https://www.w3.org/TR/prov-o/). The following are possible values for the status of an object in the review process:
* `unreviewed` flag indicates that the object has been submitted, but no further evaluation or verification has occurred.  
* `in-review` flag indicates that verification is underway. 
* `approved` flag indicates that the BCO has been verified and reviewed. 
* `suspended` flag indicates an object that was once valid is no longer considered valid. 
* `rejected` flag indicates that an error or inconsistency was detected in the BCO, and it has been removed or rejected.


### Namespace: CURIE
External references field contains a list of the databases and/or ontology IDs that are cross-referenced in the BCO. The external references are used to provide more specificity in the information related to BCO entries. Cross-referenced resources need to be available in the public domain. The external references are stored in the form of prefixed identifiers (CURIEs). These CURIEs map directly to the URIs maintained by identifiers.org. See Section 3.5 for a list of the CURIEs used in this example.





## General
* The required domains are defined by the IEEE <link>. However, a BioCompute Object is considered complete when an Error Domain exists.
* Versioning is allowed, but only if the changes do not affect the workflow or output. BCO versioning follows a minor.patch schema, no major versions are allowed (substantial changes result in a new BCO). Minor changes are things like a change of contact information for a contributor, patch changes are things like spelling and grammar fixes.
* In general, any step that does not transform data does not need to be included in the Description Domain as a formal step, and can be described instead in the Usability Domain. For example, arranging rows and columns in a table, or formatting a figure. Steps that transform data should comprise their own step in the Description Domain.
* The Usability Domain should contain enough information to enable a naïve user generally skilled in bioinformatics to understand the analysis. This means that references to commonly used resources (such as basic Unix commands, well known databases like NCBI, basic terms like “alignment,” etc.) do not need to be explained, but references to less well known resources (such as obscure python packages, etc.) should be described. Description should be tailored to the intended audience, and BCOs intended for public consumption should assume a basic level of bioinformatics proficiency.


