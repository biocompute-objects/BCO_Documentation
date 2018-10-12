_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.2 Usability Domain "usability_domain"

This field provides a space for the author to define the usability domain of the BCO. It is an array of free text values. This field is to aid in search-ability and provide a specific description of the object. The usability domain along with keywords can help determine when and how the BCO can be used. Novel use of the BCO could result in the creation of a new entry with a new usability domain.

```json
    "usability_domain": [

        "Identify baseline single nucleotide polymorphisms SNPs [SO:0000694], insertions [so:SO:0000667], and deletions [so:SO:0000045] that correlate with reduced ledipasvir [pubchem.compound:67505836] antiviral drug efficacy in Hepatitis C virus subtype 1 [taxonomy:31646]", 

        "Identify treatment emergent amino acid substitutions [so:SO:0000048] that correlate with antiviral drug treatment failure", 

        "Determine whether the treatment emergent amino acid substitutions [so:SO:0000048] identified correlate with treatment failure involving other drugs against the same virus", 

        "GitHub CWL example: https://github.com/mr-c/hive-cwl-examples/blob/master/workflow/hive-viral-mutation-detection.cwl#L20"]
]
```
