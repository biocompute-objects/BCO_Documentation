_This document is part of the [BioCompute Object specification](bco-specification.md)_

### 2.3.2 Extension to External References: GitHub

The external references also include an extension to GitHub repositories where HTS computational analysis pipelines, workflows, protocols, and tool or software source code can be stored/deposited/downloaded. The BCO would contain link to the GitHub repository where the information is stored and easily retrieved. The links to GitHub can be added to the usability domain.

```json
"extension_domain":{
    "github_extension": {
        "github_repository": "https://github.com/common-workflow-language/hive-cwl-examples", 
        "github_address":"https://github.com/common-workflow-language/hive-cwl-examples/blob/c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21/workflow/hive-viral-mutation-detection.cwl"
    }
}
```
