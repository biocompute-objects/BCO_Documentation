_This document is part of the [BioCompute Object specification](bco-specification.md)_

### 2.3.2 Extension to External References: Software Configuration Management (SCM)

The external references **example** extension to a SCM repository demonstrates how a BioCompute Object software source code can be stored/deposited/downloaded. The BCO would contain link to the SCM repository where the information is stored and easily retrieved. The links to the SCM can be added to the usability domain as well.

```json
"extension_domain":{
        "scm_extension": {
            "scm_repository": "https://github.com/example/repo1",
            "scm_type": "git",
            "scm_branch": "c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21",
            "scm_path": "workflow/hive-viral-mutation-detection.cwl",
            "scm_preview": "https://github.com/example/repo1/blob/c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21/workflow/hive-viral-mutation-detection.cwl"
      }
}
```
