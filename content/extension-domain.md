---
title: "Extension to External References Example: Software Configuration Management (SCM)"
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

### 2.3 Extension Domain "extension_domain"

The Extension Domain allows a user to define additional fields and is optional. The Extension Domain is for the inclusion of any additional structured information. A valid JSON schema for each extension used in this domain is expected to be specified. The schema should be name spaced, and it is recommended that resolving the namespaced URI will provide the extension's JSON Schema. The URL should be provided in the required `extension_schema` field.
The following example is taken from [Extension to External References: Software Configuration Management (SCM) v1.1.0](https://github.com/biocompute-objects/extension_domain/blob/1.1.0/scm)
```json
"extension_domain":[
    {
        "extension_schema": "https://w3id.org/biocompute/extension_domain/1.1.0/scm/scm_extension.json",
        "scm_extension": {
            "scm_repository": "https://github.com/example/repo1",
            "scm_type": "git",
            "scm_commit": "c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21",
            "scm_path": "workflow/hive-viral-mutation-detection.cwl",
            "scm_preview": "https://github.com/example/repo1/blob/c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21/workflow/hive-viral-mutation-detection.cwl"
        }
    }
]
```
## SCM Repository "scm_repository"

The base url for the SCM repository.

## SCM Type "scm_type"

A classifier for the type of SCM database. This feild is a list of predefined values. Third-party scm types can be used, and if so the `other` value MUST be used. The options for this field include `git` (Git, including GitHub/GitLab), `svn` (Subversion), `hg` (mercurial) and `other`.

## SCM Commit "scm_commit"

This field is a reference to a revision within the scm repository. This SHOULD be a repository-wide commit identifier (e.g. afba51a222e199f5b58f9d19450f189055e93c44 or name of a tag (e.g. v1.0.0), but MAY be a name of a branch (e.g. master).

## SCM Path "scm_path"

This is the path from the repository to the source code referenced. `scm_path` should NOT start with `/`

## SCM Preview "scm_preview"

The full uri for the source code referenced by the BioCompute.