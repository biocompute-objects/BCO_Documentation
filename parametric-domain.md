_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.6 Parametric Domain "parametric_domain"

This represents the list of **NON-default** parameters customizing the computational flow which can affect the output of the calculations. These fields can be custom to each type of analysis and are tied to a particular pipeline implementation. The `parametric_domain` is not used for running/reproducing a bco e.g. not used by the [`execution_domain`](../blob/master/BCO_Specification/execution-domain.md) It is _recommended_ these feilds be generated automatically, but that may not allways be possible. Please refer to documentation of individual scripts and specific BCO descriptions for details.

```json
"parametric_domain": [
    {"param": "seed", "value": "14", "step": "1"},
    {"param":"minimum_match_len", "value": "66", "step": "1"},
    {"param": "divergence_threshold_percent", "value": 0.30, "step": "1"},
    {"param": "minimum_coverage", "value": "15", "step": "2"},
    {"param": "freq_cutoff", "value": 0.10, "step": "2"}
]	
```
