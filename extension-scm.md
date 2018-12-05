_This document is part of the [BioCompute Object specification](bco-specification.md)_

### 2.3.2 Extension to External References: Software Configuration Management (SCM)

The external references **example** extension to a SCM repository demonstrates how a BioCompute Object software source code can be stored/deposited/downloaded. The BCO would contain links to the SCM repository where the information is stored and easily retrieved. The links to the SCM can be added to the usability domain as well.

```json
"extension_domain":{
        "scm_extension": {
            "scm_repository": "https://github.com/example/repo1",
            "scm_type": "git",
            "scm_commit": "c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21",
            "scm_path": "workflow/hive-viral-mutation-detection.cwl",
            "scm_preview": "https://github.com/example/repo1/blob/c9ffea0b60fa3bcf8e138af7c99ca141a6b8fb21/workflow/hive-viral-mutation-detection.cwl"
      }
}
```
#### 2.3.2.1 SCM Repository "scm_repository"

The base url for the SCM repository.

#### 2.3.2.2 SCM Type "scm_type"

A classifier for the type of SCM database. This feild is a list of predefined values. Third-party scm types can be used, and if so the `other` value MUST be used. The options for this field include `git` (Git, including GitHub/GitLab), `svn` (Subversion), `hg` (mercurial) and `other`.

#### 2.3.2.3 SCM Commit "scm_commit"

This field is a reference to a revision within the scm repository. This SHOULD be a repository-wide commit identifier (e.g. afba51a222e199f5b58f9d19450f189055e93c44 or name of a tag (e.g. v1.0.0), but MAY be a name of a branch (e.g. master).

#### 2.3.2.4 SCM Path "scm_path"

This is the path from the repository to the source code referenced. `scm_path` should NOT start with `/`

#### 2.3.2.5 SCM Preview "scm_preview"

The full uri for the source code referenced by the BioCompute.