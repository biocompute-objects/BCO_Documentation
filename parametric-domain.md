_This document is part of the [BioCompute Object specification](bco-specification.md)_

## 2.6 Parametric Domain "parametric_domain"

This represents the list of parameters customizing the computational flow which can affect the output of the calculations. These fields are custom to each type of analysis and are tied to a particular pipeline implementation. All BCOs should inherit from the fundamental BioCompute data type and as such inherit all of the core fields described in document. Specific BioCompute types introduce specific fields designed to customize the use of pipelines for a particular use pattern. Please refer to documentation of individual scripts and specific BCO descriptions for details.

```json
"parametric_domain": {
    "HIVE-hexagon" : { 
        "seed": 14,
        "minimum_match_len": 66, 
        "divergence_threshold_percent": 0.30
    },

    "HIVE-heptagon": {
        "minimum_coverage": 15, 
        "freq_cutoff": 0.10
    } 
}
```
