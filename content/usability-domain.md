---
title: "Usability Domain"
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

## 2.2 Usability Domain "usability_domain"

This section defines the `usability_domain` part of the [BCO](/bco-domains) structure.

This field provides a space for the author to define the usability domain of the BCO. It is an array of free text values that should be consistant with terminology used in the [`name`](provenance_domain.md#2.1.1-name-name), external references ([`xref`](/description-domain.md#242-external-references-xref)), and [`keywords`](/description-domain.md#241-keywords-keywords) sections. The `usability_domain` can accept template language to indicate values from the [`external_references`](https://github.com/biocompute-objects/BCO_Specification/blob/master/external-references.md). The template takes the form of:
* `(SNP)[SO:0000694]` 

where ($term) and [$identifier] are an entry in the `external_references` section.

This field is to aid in search-ability and provide a specific **scientific use case** and a description of the function of the object. The usability domain along with keywords can help determine when and how the BCO can be used. It is recomended that a novel use of a specific BCO would result in the creation of a new entry with a new usability domain.

```json
    "usability_domain": [

        "Identify baseline single nucleotide polymorphisms (SNPs)[SO:0000694], (insertions)[SO:0000667], and (deletions)[SO:0000045] that correlate with reduced (ledipasvir)[pubchem.compound:67505836] antiviral drug efficacy in (Hepatitis C virus subtype 1)[taxonomy:31646]", 

        "Identify treatment emergent amino acid (substitutions)[SO:1000002] that correlate with antiviral drug treatment failure", 

        "Determine whether the treatment emergent amino acid (substitutions)[SO:1000002] identified correlate with treatment failure involving other drugs against the same virus", 

        "GitHub CWL example: https://github.com/mr-c/hive-cwl-examples/blob/master/workflow/hive-viral-mutation-detection.cwl#L20"]
]
```
