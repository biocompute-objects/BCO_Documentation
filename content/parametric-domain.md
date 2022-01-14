---
title: "Parametric Domain"
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

## 2.6 Parametric Domain "parametric_domain"

This optional domain represents the list of parameters customizing the computational flow which can affect the output of the calculations. These fields can be custom to each kind of analysis and are tied to a particular pipeline implementation. It is _recommended_ these fields be generated automatically, but that may not always be possible. Please refer to documentation of individual scripts and specific BCO descriptions for details. While this domain is NOT required, it is recommended that it be populated, and the values be NON-DEFAULT parameters.

```json
"parametric_domain": [
    {"param": "seed", "value": "14", "step": "1"},
    {"param":"minimum_match_len", "value": "66", "step": "1"},
    {"param": "divergence_threshold_percent", "value": 0.30, "step": "1"},
    {"param": "minimum_coverage", "value": "15", "step": "2"},
    {"param": "freq_cutoff", "value": 0.10, "step": "2"}
]	
```
