_This document is part of the [BioCompute Object User Guide](user_guide.md)_

_Back to [BCO domains](bco-domains.md)_

## 2.6 Parametric Domain "parametric_domain"

This represents the list of **NON-default** parameters customizing the computational flow which can affect the output of the calculations. These fields can be custom to each kind of analysis and are tied to a particular pipeline implementation. The `parametric_domain` is not used for running/reproducing a bco e.g. not used by the [`execution_domain`](/execution-domain.md). It is _recommended_ these feilds be generated automatically, but that may not allways be possible. Please refer to documentation of individual scripts and specific BCO descriptions for details. While this domain is NOT required, it is reccommended that it be populated. 

```json
"parametric_domain": [
    {"param": "seed", "value": "14", "step": "1"},
    {"param":"minimum_match_len", "value": "66", "step": "1"},
    {"param": "divergence_threshold_percent", "value": 0.30, "step": "1"},
    {"param": "minimum_coverage", "value": "15", "step": "2"},
    {"param": "freq_cutoff", "value": 0.10, "step": "2"}
]	
```
