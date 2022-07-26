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
<br/>

## Galaxy workflow attributes used by BCO

Proper annotation of the workflow is required BEFORE running it.
Notice the following in the example below:
* The Name of the workflow becomes the BCO Name
* The workflow version translates to a sequental digit and is included as the BCO version
* The workflow Annnotation block becomes the FIRST entry in the BCO Usability Domain
    * The annotation from the history (if included) becomes the second entry in the BCO Usability Domain
* The workflow License becomes the BCO License
* The workflow 'creator/s' are added to the BCO contributors specification
* The workflow Tags are added to the BCO description domain tags
* It is also possible to annotate each workflow step or tool individually. Depending on the tool or step this incfomation will also be included. 

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/workflow.png" class="img-fluid mx-auto d-block" alt="Workflow detail screen shot">
</div>
<br/>

## Galaxy history attributes used by BCO

* The Galaxy history will also contribute annotation and tags to the BCO 
<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/history.png" class="img-fluid mx-auto d-block" alt="history pane screen shot">
</div>
<br/>

## BCO Export from Galaxy

There are two methods for exporting a BCO from Galaxy. Download and Submission to a BCODB via API.

* From the User menue select "Workflow Invocations"
* Expand the invocation you would like to convert to a BCO

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/invocation.png" class="img-fluid mx-auto d-block" alt="workflow invocation detail">
</div>
<br/>

* Select the "Export" tab
<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/export.png" class="img-fluid mx-auto d-block" alt="invocation export detail">
</div>
<br/>

### Download BCO

Downloading a BCO from Galaxy will save the raw JSON file to your local drive. 
* Click "Download"

### Submission to a BCODB via API

Submission to the BCODB requires that a user already have an authenticated account at the URL they wish to submit to. Once
an account is verified you will need four peices of information to submit the BCO.

#### BCODB Root URL

This is the URL for the BCODD that you are submitting your object to. In most cases it will be the public server at 'https://biocomputeobject.org'. 

#### BCODB User API key

The BCODB User API key OR user Token is found on the [account page](https://biocomputeobject.org/). Expand the "Database, Groups, and Permissions" tab. You will find the token listed in the card for the server you want to submit to. 

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/token.png" class="img-fluid mx-auto d-block" alt="invocation export detail">
</div>
<br/>

#### BCODB Prefix

The BCO Prefix is explained [here](https://docs.biocomputeobject.org/top-level/) in the section '2.0.2 BioCompute Object Identifier “object_id”'. The default prefix "BCO" is for general use. Other Prefixs require special permission. Please see the [BCO Prefix Registry](https://biocomputeobject.org/prefix) for more information. 

#### BCODB User Name

The BCODB User Name is found on the [account page](https://biocomputeobject.org/). Expand the "Database, Groups, and Permissions" tab. You will find the username listed in the card for the server you want to submit to, just like the token.
<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/username.png" class="img-fluid mx-auto d-block" alt="invocation export detail">
</div>
<br/>

## Submission and next steps

The completed form should look something like the one below:

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/submit.png" class="img-fluid mx-auto d-block" alt="invocation export detail">
</div>
<br/>

Upon successful submission you should see the `objct_id` for the BCO just created:

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/draft_success.png" class="img-fluid mx-auto d-block" alt="invocation export detail">
</div>
<br/>

To find the object and modify further or publish go to the BCO Portal and search for the identifier Galaxy gave you.

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/search.png" class="img-fluid mx-auto d-block" alt="invocation export detail">
</div>
<br/>