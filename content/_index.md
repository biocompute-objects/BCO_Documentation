---
title: "Home"
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

## Introduction

The U.S. Food and Drug Administration (FDA) and George Washington University (GW) have partnered to establish a framework for community-based standards development and harmonization of HTS computations and data formats. Standardized HTS data processing and data formats will promote interoperability and simplify the verification of bioinformatics protocols. To do this, a schema has been developed to represent instances of computational analysis as a BCO. A BCO includes: 

* Information about parameters and versions of the executable programs in a pipeline
* Reference to input and output test data for verification of the pipeline
* A usability domain
* Keywords
* A list of agents involved along with other important metadata, such as their specific contribution

Knowledge of input data is intended to be captured according to existing efforts, including [MIRAGE](https://en.wikipedia.org/wiki/Minimum_Information_Required_About_a_Glycomics_Experiment), [MIAPE](http://www.psidev.info/miape), and [STRENDA](https://www.beilstein-strenda-db.org/strenda/public/guidelines.xhtml), and to be in accordance with Minimum Information Standards. In addition to all the information captured in the BCO, the BCO itself must be independent of the execution environment, whether it is a local high-performance or a cloud-based infrastructure.
To facilitate a means for different stakeholders in the HTS communities to provide input on the BioCompute standard we follow the [Open-Stand.org principles for collaborative open standards development](https://open-stand.org/about-us/principles/).

## Example

A functional example of a BCO with associated input and output files, and including the optional empirical error domain: 
* [UVP-BCO](https://github.com/biocompute-objects/UVP-BCO)

## User Guide 

The [BioCompute Objects user guide](/user_guide) provides an introduction to implementing/writing a BCO for a pipeline and/or a workflow, and is taken from the [BioCompute Objects Specification Document](/IEEE_Docs/standard).

### Repository

Note that unless you are viewing a [release](https://github.com/biocompute-objects/BCO_Specification/releases) this is a draft subject to change.

Table of content:

* [BioCompute Object (BCO) User Guide](/user_guide)
  * [Introduction to BioCompute Objects](/introduction)
  * [BCO domains](/bco-domains)
    * [Top level fields](/top-level)
    * [Provenance domain](/provenance-domain)
    * [Usability domain](/usability-domain)
    * [FHIR extension](/extension-fhir)
    * [SCM extension](/extension-scm)
    * [Description domain](/description-domain)
    * [Execution domain](/execution-domain)
    * [Parametric domain](/parametric-domain)
    * [Input and Output domain](/io-domain)
    * [Error domain](/error-domain)
  * [BCO expanded view example HCV1a.json](HCV1a.json)

## Specification
### Current Release - 1.3.0

For developers and advanced users, the [BCO specification (1.3.0)](/IEEE_Docs/standard) provides authoritative documentation on the construction of BioCompute Objects using [JSON schema](https://json-schema.org/). 


### Previous Release

For developers and advanced users, the [BCO specification (v1.2)](https://github.com/biocompute-objects/BCO_Specification/blob/v1.2/BCO_Spec_V1.2.pdf) provides authoritative documentation on the construction of BioCompute Objects before the implementation of JSON schema.

See [releases](https://github.com/biocompute-objects/BCO_Specification/releases) for all releases of BCO object specification since moving to GitHub.

### Citation
This standard was originaly prepared by [The BioCompute Object working group](/BCO_Spec_V1.2#biocompute-object-consortium-members-bcoc) during preparation for the [2017 HTS Computational Standards for Regulatory Sciences Workshop](https://hive.biochemistry.gwu.edu/htscsrs/workshop_2017).

To reference the BCO standards, please use the following
citation inclusive of the DOI:

Simonyan, V., Goecks, J., & Mazumder, R. (2017). ***Biocompute Objects — A Step towards Evaluation and Validation of Biomedical Scientific Computations.*** PDA Journal of Pharmaceutical Science and Technology, 71(2), 136–146. doi: [10.5731/pdajpst.2016.006734](http://doi.org/10.5731/pdajpst.2016.006734)

## Support, Community and Contributing

To suggest changes to [this repository](#Repository) we welcome contributions as a [pull request](https://github.com/biocompute-objects/BCO_Specification/pulls) or [issue](https://github.com/biocompute-objects/BCO_Specification/issues) submission.

BCO_Specification is licensed under the [BSD 3-Clause "New" or "Revised" License](./LICENSE)

>A permissive license similar to the BSD 2-Clause License, but with a 3rd clause that prohibits others from using the name of the project or its contributors to promote derived products without written consent.

## Mailing List

As a subscriber to the BCO mailing list, you can post to it by sending a message tobiocomputels@hermes.gwu.edu (using the email address that is subscribed). This list is semi-automated and will send your message for review. 

To subscribe or unsubscribe, please visit https://hermes.gwu.edu/cgi-bin/wa?A0=BIOCOMPUTELS and click `Subscribe` or `Unsubscribe` on the lower right. You can also unsubscribe from the list at any time by sending an email to listserv@hermes.gwu.edu, in which the body says: `unsubscribe biocomputels`

This repository is in support of [2791-2020](https://standards.ieee.org/standard/2791-2020.html) - IEEE Approved Draft Standard for Bioinformatics Computations and Analyses Generated by High-Throughput Sequencing (HTS) to Facilitate Communication. Please also see our [OSF page](https://osf.io/h59uh/) or our [main page](https://biocomputeobject.org/) 
