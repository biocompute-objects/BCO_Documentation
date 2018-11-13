_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.0 Top Level Fields

These header fields uniquely define this BCO. These fields are required for every BCO and are represented at the top level object.

Condensed example:

```json
{
    "bco_spec_version" : "v1.2",
    "BCO_id": "https://example.com/bco/9487ae7e-c1aa-4a3c-b18f-3d3695b33ace",
    "type": "antiviral_resistance_detection", 
    "digital_signature": "d41d8cd98f00b204e9800998ecf8427e",
    
    "provenance_domain": {
    },
    "...": { }
}
```


### 2.0.4 BCO version "bco_spec_version"

The version of the BCO specification used to define this document.

```json
"bco_spec_version": "v1.1-draft1" 
```

### 2.0.1 BioCompute Object Identifier "BCO_id"

A unique identifier that should be applied to each BCO instance. These can be assigned by a BCO database engine. IDs should never be reused. It is RECOMMENDED that the BCO identifier is based on a [UUID](https://tools.ietf.org/html/rfc4122)s (sometimes called GUIDs) to ensure uniqueness, either as a location-independent URN (e.g. urn:uuid:2bf8397b-9aa8-47f2-80a7-235653e8e824) or as part of an identifier permalink, (e.g. http://repo.example.com/bco/2bf8397b-9aa8-47f2-80a7-235653e8e824). While the UUID is the preferred method, IDs expressed as a URN or URL are also acceptable.

```json
"BCO_id":"https://github.com/biocompute-objects/BCO_Spec_V2.0/blob/master/HCV1a/HCV1a.json"
```

### 2.0.2 Type "type"

As any object of type 'type,' it has its own fields: _type, _id, _inherits, name, title and description. Type of this JSON object is "antiviral_resistance_detection"

```json
"type": "antiviral_resistance_detection"
```

### 2.0.3 Digital signature "digital_signature"

A string-type, read-only value generated and stored by a BCO database, protecting the object from internal or external alterations without proper validation. The string can be generated through the use of an MD5 SHA-256 or implementation specific hash function. 

```json
"digital_signature": "905d7fce3f3ac64c8ea86f058ca71658"
```

This value should not be submitted during deposition but can be read during downloading or transferring validated BCOs. The BCO server can provide an API validating the signature versus BCO content, allowing users to validate the signature "offline" on their own. The server will also must provide a reference to the signature creation algorithm, facilitating for greater interoperability.

### Additional domains

Additional description about the BCO itself is also provided in the [provenance domain](provenance-domain.md), [description domain](description-domain.md) and [usability domain](usability-domain.md). Other [domains](bco-domains.md) detail areas like execution and error ranges.

