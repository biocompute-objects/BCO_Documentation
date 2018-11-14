_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.1 Provenance Domain "provenance_domain"

This section defines the fields of the `provenance_domain` part of the [BCO](bco-domains.md) structure.

Condensed example:

```json
"provenance_domain": {
        "name": "HCV1a ledipasvir resistance SNP detection", 
        "structured_name": "HCV1a [taxonomy:31646] ledipasvir [pubchem.compound:67505836] resistance SNP [so:0000694] detection",
        "version": "2.9",
        "review": [
        ],
        "derived_from" : null,
        "obsolete" : "2118-09-26T14:43:43-0400",
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

### 2.1.2  Structured name "structured_name"

Structured name is an optional templated computable text field designed to represent a BCO instance name in visible interfaces. This field can refer to other fields within the same or other objects. For example, a string like "HCV1a [taxonomy:$taxonomy] mutation detection" will be visualized as "HCV1a [taxonomy:31646] mutation detection" assuming the BCO has a field called "taxonomy" with value “31646”.

```json
"structured_name": "HCV1a [taxonomy:$taxonomy] mutation detection", 
"taxonomy": "31646",
```

=> `HCV1a [taxonomy:31646] mutation detection`

### 2.1.3 Version "version"

Records the versioning of this BCO instance object. In BCO versioning, a change in the BCO affecting the outcome of the computation should be deposited as a new BCO, not as a new version. If a parameter in a tool is changed within a BCO, which in turn changes the outcome of the pipeline and the original BCO, a new BCO, not a new version, will be created. 

In such cases the connection between the new object and the older one may or may not be (on author’s discretion) retained in the form of references. Changes that cannot affect the results of the computation can be incorporated into a new version of the existing BCO. Such changes might include name and title, comments, authors, validity dates, etc. 

```json
"version": "2.1",
```

### 2.1.4 Review "review"

Describes the status of an object in the review process. 
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
                "reviewer": {
                    "name": "Eric Donaldson", 
                    "affiliation": "FDA", 
                    "email": "Eric.Donaldson@fda.hhs.gov",
                    "contribution": "curatedBy"
                }
            }
        ]
```

### 2.1.5 Inheritance/derivation "derived_from"

If the object is derived from another, this field will specify the parent object, in the form of the ‘BCO_ID’. If the object inherits only from the base BioCompute Object or a type definition than the value here is null. 

```json
"derived_from" : null,
```

### 2.1.6 Obsolescence "obsolete" 

If the object has an expiration date this field will specify that using the ‘datetime’ type which is in ISO-8601 format as clarified by W3C [https://www.w3.org/TR/NOTE-datetime](https://www.w3.org/TR/NOTE-datetime). This field is optional.

```json
"obsolete" : "2118-09-26T14:43:43-0400"
```

### 2.1.7 Embargo "embargo"

If the object has a period of time that it is not public, that range can be specified using these fields.  Using the `datetime`’` type a start and end time are specified for the embargo. These fields are optional.

```json
"embargo" : {
    "start_time": "2000-09-26T14:43:43-0400",
    "end_time": "2000-09-26T14:43:45-0400"
},
```

### 2.1.8 Created "created"

Using the `datetime` type the time of initial creation of the BCO is recorded in ISO-8601 format as clarified by W3C [https://www.w3.org/TR/NOTE-datetime](https://www.w3.org/TR/NOTE-datetime).

```json
"created": "2017-01-20T09:40:17-0500"
```

### 2.1.9 Modification "modified"

Using the `datetime` type the time of most recent modification of the BCO is recorded

```json
"modified": "2018-03-21T18:31:48-0400"
```

### 2.1.10 Contributors "contributors"

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

### 2.1.11 License "license"

A space for Creative Commons licence or other licence information (text). The default or recommended licence can be _Creative Commons Attribution 4.0 International_ identified as https://spdx.org/licenses/CC-BY-4.0.html

```json
"license": "https://spdx.org/licenses/CC-BY-4.0.html"
```        
