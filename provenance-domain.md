_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.1 Provenance Domain "provenance_domain"

This section defines the fields of the `provenance_domain` part of the [BCO](bco-domains.md) structure.

Condensed example:

```json
"provenance_domain": {
        "name": "HCV1a ledipasvir resistance SNP detection", 
        "version": "2.9",
        "review": [
        ],
        "derived_from" : "https://github.com/biocompute-objects/BCO_Specification/blob/master/HCV1a.json",
        "obsolete_after" : "2118-09-26T14:43:43-0400",
        "embargo" : {
	},
        "created": "2017-01-24T09:40:17-0500", 
        "modified": "2018-09-21T14:06:14-0400", 
        "contributors": [
        ],
        "license": "https://spdx.org/licenses/CC-BY-4.0.html"
},
```

### 2.1.1 Name "name"

Name for the BCO. This public field should take free text value using common biological research terminology supporting external reference linkage identifiers whenever possible for use in the structured name.

```json
"name": "HCV1a ledipasvir resistance SNP detection"
```

### 2.1.2 Version "version"

Records the versioning of this BCO instance object. [Semantic Versioning 2.0.0](https://semver.org/#semantic-versioning-200) describes versioning as follows: 

>Given a version number MAJOR.MINOR.PATCH, increment the:
>
>1. MAJOR version when you make incompatible API changes,
>2. MINOR version when you add functionality in a backwards-compatible manner, and
>3. PATCH version when you make backwards-compatible bug fixes.
>Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

In BCO versioning, a change in the BCO affecting the outcome of the computation **MAJOR** should be deposited as a new BCO, not as a new version. If a parameter in a tool is changed within a BCO, which in turn changes the outcome of the pipeline and the original BCO, a new BCO, not a new version, will be created. 

In such cases the connection between the new object and the older one may or may not be (on author’s discretion) retained in the form of a reference using the [`derived_from`](provenance-domain.md#215-inheritancederivation-derived_from) field. Changes that cannot affect the results of the computation can be incorporated into a new version of the existing BCO (**MINOR** and **PATCH**). Such changes might include name and title, comments, authors, validity dates, etc. 

```json
"version": "2.1",
```

### 2.1.3 Review "review"

This is a list to hold reviewer identifiers and a description of the status of an object in the review process, including the subtype "reviewer", which contains field(s) for name, affiliation, email, and contribution of each reviewer. To further record author information, ORCID IDs are included as they allow for the author to curate their information after submission. ORCID identifiers must be valid and must have the prefix https://orcid.org/. The contribution type is a choice taken from PAV ontology: provenance, authoring and versioning, which also maps to the PROV-O.

The "status" key describes the status of an object in the review process and the following are the possible values: 
* `unreviewed` flag indicates that the object has been submitted, but no further evaluation or verification has occurred.  
* `in-review` flag indicates that verification is underway. 
* `approved` flag indicates that the BCO has been verified and reviewed. 
* `suspended` flag indicates an object that was once valid is no longer considered valid. 
* `rejected` flag indicates that an error or inconsistency was detected in the BCO, and it has been removed or rejected. 

The fields from the `contributor` object (described in section 2.1.10) is inherited to populate the reviewer section. 

```json
        "review": [
            {
                "status": "approved",
                "reviewer_comment": "Approved by GW staff. Waiting for approval from FDA Reviewer",
		"date": "2017-11-12T12:30:48-0400"
                "reviewer": {
                    "name": "Charles Hadley King", 
                    "affiliation": "George Washington University", 
                    "email": "hadley_king@gwu.edu",
                    "contribution": "curatedBy",
                    "orcid": "https://orcid.org/0000-0003-1409-4549"
                }
            },
            {
                "status": "approved",
                "reviewer_comment": "The revised BCO looks fine",
		"date": "2017-12-12T12:30:48-0400"
                "reviewer": {
                    "name": "Eric Donaldson", 
                    "affiliation": "FDA", 
                    "email": "Eric.Donaldson@fda.hhs.gov",
                    "contribution": "curatedBy"
                }
            }
        ]
```

### 2.1.4 Inheritance/derivation "derived_from"

If the object is derived from another, this field will specify the parent object, in the form of the ‘bco_id’. If the object inherits only from the base BioCompute Object or a type definition than the field is not included. 

```json
"derived_from" : "https://github.com/biocompute-objects/BCO_Specification/blob/master/HCV1a.json",
```

### 2.1.6 Obsolescence "obsolete_after" 

If the object has an expiration date this field will specify that using the ‘datetime’ type which is in ISO-8601 format as clarified by W3C [https://www.w3.org/TR/NOTE-datetime](https://www.w3.org/TR/NOTE-datetime). This field is optional.

```json
"obsolete_after" : "2118-09-26T14:43:43-0400"
```

### 2.1.5 Embargo "embargo"

If the object has a period of time that it is not public, that range can be specified using these fields.  Using the `datetime`’` type a start and end time are specified for the embargo. These fields are optional.

```json
"embargo" : {
    "start_time": "2000-09-26T14:43:43-0400",
    "end_time": "2000-09-26T14:43:45-0400"
},
```

### 2.1.6 Created "created"

Using the `datetime` type the time of initial creation of the BCO is recorded in ISO-8601 format as clarified by W3C [https://www.w3.org/TR/NOTE-datetime](https://www.w3.org/TR/NOTE-datetime).

```json
"created": "2017-01-20T09:40:17-0500"
```

### 2.1.7 Modification "modified"

Using the `datetime` type the time of most recent modification of the BCO is recorded

```json
"modified": "2018-03-21T18:31:48-0400"
```

### 2.1.8 Contributors "contributors"

This is a list to hold contributor identifiers and a description of their type of contribution, including a field for ORCIDs to record author information, as they allow for the author to curate their information after submission. ORCID identifiers must be [valid](https://support.orcid.org/hc/en-us/articles/360006897674-Structure-of-the-ORCID-Identifier) and must have the prefix `https://orcid.org/`. The `contribution` type is a choice taken from [PAV ontology](http://purl.org/pav/): provenance, authoring and versioning, which also maps to the [PROV-O](https://www.w3.org/TR/prov-o/).

```json
        "contributors": [
            {
                "name": "Charles Hadley King", 
                "affiliation": "George Washington University", 
                "email": "hadley_king@gwu.edu",
                "contribution": ["createdBy", "curatedBy"],
                "orcid": "https://orcid.org/0000-0003-1409-4549"
            },

            {
                "name": "Eric Donaldson", 
                "affiliation": "FDA", 
                "email": "Eric.Donaldson@fda.hhs.gov",
                "contribution": ["authoredBy"]
            }
        ]
```

### 2.1.9 License "license"

A space for Creative Commons licence or other licence information (text). The default or recommended licence can be _Creative Commons Attribution 4.0 International_ identified as https://spdx.org/licenses/CC-BY-4.0.html

```json
"license": "https://spdx.org/licenses/CC-BY-4.0.html"
```        
