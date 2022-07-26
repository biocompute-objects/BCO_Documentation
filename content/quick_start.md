---
title: "Quick Start"
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

## Creating a BCO on Galaxy

Galaxy has an extensive workflow system. They define a [workflow](https://galaxyproject.org/learn/advanced-workflow/) as ".. a series of tools and dataset actions that run in sequence as a batch operation". An instance of a Galaxy workflow is known as an "invocation". Since a BCO is a record of a specific instance of a computation, the Galaxy invocations are used to generate the Galaxy BCOs. 
The first step in creating a well documented Galaxy BCO is to follow the [Best Practices for Maintaining Galaxy Workflows](https://planemo.readthedocs.io/en/latest/best_practices_workflows.html).

Proper annotation of the workflow is required BEFORE running it.

Notice the following in the example below:
* The Name of the workflow: Becomes the BCO Name
* The workflow version: Translated to a sequental digit and included as the BCO version
* The workflow Annnotation block: Becomes the FIRST entry in the BCO Usability Domain
    * The annotation from the history (if included) becomes the second entry in the BCO Usability Domain
* 

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/workflow.png" class="img-fluid mx-auto d-block" alt="">
</div>


