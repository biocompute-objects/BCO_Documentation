---
title: "Top Level Domains"
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

_Back to [BCO domains](/bco-domains)_

## 2.0 Top Level Fields

These header fields uniquely define this BCO. These fields are required for every BCO and are represented at the top level object.

Condensed example:

```json
{
    "object_id": "https://example.com/BCO_948701/1.0",
    "spec_version" : "https://w3id.org/ieee/ieee-2791-schema/2791object.json",
    "etag": "d41d8cd98f00b204e9800998ecf8427e",    
    "provenance_domain": {
    },
    "...": { }
}
```

### 2.0.1 BCO version "spec_version"

The version of the BCO specification used to define the BCO. It is recomended that this value be a permalink as defined in the [w3id.org/biocompute](https://github.com/perma-id/w3id.org/tree/master/biocompute) repository. 

```json
"spec_version": "https://w3id.org/ieee/ieee-2791-schema/2791object.json" 
```

### 2.0.2 BioCompute Object Identifier "object_id"

A unique identifier that should be applied to each BCO instance. These can be assigned by a BCO database engine or manually generated. IDs should never be reused. It is RECOMMENDED that the BCO identifier is based on a [UUID](https://tools.ietf.org/html/rfc4122)s (sometimes called GUIDs) to ensure uniqueness, either as a location-independent URN (e.g. `urn:uuid:2bf8397b-9aa8-47f2-80a7-235653e8e824`) or as part of an identifier permalink, (e.g. `http://repo.example.com/bco/2bf8397b-9aa8-47f2-80a7-235653e8e824`). While the UUID is the preferred method, IDs expressed as a URN or URL are preferred.

The following is the RECOMMENDED format for a BCO `object_id`, and what has been implementated by the [BCODB](https://github.com/biocompute-objects/bco_api/releases):

The `"object_id"` consists of four different parts: 
````
|  <protocol>  |      <hostname>        | <BCO accession>  | <BCO version>  |
| ------------ | ---------------------- | ---------------- | -------------- |
|   https://   | biocomputeobject.org/  |   /BCO_000001    |     /1.5       |
````
1) Protocol: It is RECOMMENDED that this be `https` or at least `http` [see Scheme in RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986#section-3.1) for more detail on protocols.
2) Hostname: [see Host in RFC_3986](https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.2)
3) BCO Accession: composed of 2 parts separated by an underscore( `_`): 
     - the BCO Prefix: A 3-5 alphanumeric charaters. Preferably one registed via the [BioCompute Registry](/best_practices)
     - BCO identifier: a numeric identifier appended to the prefix
4) BCO version: This SHOULD be the version of the BCO, as recorded on the [Provenance Domain](/provenance-domain)

```json
"object_id": "https://biocomputeobject.org/BCO_000001/1.5"
```

### 2.0.3 ETag "etag"

A string-type, read-only value, protecting the object from internal or external alterations without proper validation. The string should be generated through the use of a SHA-256 hash function. Everything EXCEPT for the `etag`, `object_id` and `spec_version` should be included in the generation of the hash. For example:

```json
    "provenance_domain": {},
    "usability_domain": [],
    "extension_domain":{},
    "description_domain": {},
    "execution_domain": {}, 
    "parametric_domain": [], 
    "io_domain": {},
    "error_domain": {}
```
will generate the following:

```json
"etag": "584C7FE128717E1712426AB19CAAEA8BC1E27365B54285BBEA1221284C7D3A48"
```

### Additional domains

Additional description about the BCO itself is also provided in the [provenance domain](/provenance-domain), [description domain](/description-domain) and [usability domain](/usability-domain). Other [domains](/bco-domains) detail areas like execution and error ranges.

