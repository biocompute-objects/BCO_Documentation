_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.0 Top Level Fields

These header fields uniquely define this BCO. These fields are required for every BCO and are represented at the top level object.

Condensed example:

```json
{
    "bco_spec_version" : "https://w3id.org/biocompute/spec/v1.2",
    "bco_id": "https://example.com/bco/9487ae7e-c1aa-4a3c-b18f-3d3695b33ace",
    "digital_signature": "d41d8cd98f00b204e9800998ecf8427e",    
    "provenance_domain": {
    },
    "...": { }
}
```

### 2.0.1 BCO version "bco_spec_version"

The version of the BCO specification used to define this document. It is recomended that this value be a permalink as defined in the [w3id.org/biocompute](https://github.com/perma-id/w3id.org/tree/master/biocompute) repository. 

```json
"bco_spec_version": "https://w3id.org/biocompute/spec/v1.2" 
```

### 2.0.2 BioCompute Object Identifier "bco_id"

A unique identifier that should be applied to each BCO instance. These can be assigned by a BCO database engine. IDs should never be reused. It is RECOMMENDED that the BCO identifier is based on a [UUID](https://tools.ietf.org/html/rfc4122)s (sometimes called GUIDs) to ensure uniqueness, either as a location-independent URN (e.g. urn:uuid:2bf8397b-9aa8-47f2-80a7-235653e8e824) or as part of an identifier permalink, (e.g. http://repo.example.com/bco/2bf8397b-9aa8-47f2-80a7-235653e8e824). While the UUID is the preferred method, IDs expressed as a URN or URL are also acceptable.

```json
"bco_id": "https://github.com/biocompute-objects/BCO_Specification/blob/master/HCV1a.json"
```

### 2.0.3 Digital signature "digital_signature"

A string-type, read-only value, protecting the object from internal or external alterations without proper validation. The string should be generated through the use of a SHA-256 hash function. Everything EXCEPT for the `digital_signature`, `bco_id` and `bco_spec_version` should be included in the generation of the hash. For example:

```json
    "provenance_domain": {...},
    "usability_domain": [...],
    "extension_domain":{...},
    "description_domain": {...},
    "execution_domain": {...}, 
	"parametric_domain": [...], 
    "io_domain": {...},
    "error_domain": {...}
```
will generate the following:

```json
"digital_signature": "5986B05969341343E77A95B4023600FC8FEF48B7E79F355E58B0B404A4F50995"
```

### Additional domains

Additional description about the BCO itself is also provided in the [provenance domain](provenance-domain.md), [description domain](description-domain.md) and [usability domain](usability-domain.md). Other [domains](bco-domains.md) detail areas like execution and error ranges.

