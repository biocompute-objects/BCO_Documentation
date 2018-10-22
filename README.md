BioCompute
==========

Main website: http://biocomputeobject.org/

GitHub repository for BioCompute Objects:
https://github.com/biocompute-objects/

The US Food and Drug Administration (FDA) and George Washington University (GW) have partnered to establish a framework for community-based standards development and harmonization of HTS computations and data formats. Standardized HTS data processing and data formats will promote interoperability and simplify the verification of bioinformatics protocols. To do this, a schema has been developed to represent instances of computational analysis as a BCO. A BCO includes: 

* Information about parameters and versions of the executable programs in a pipeline
* Reference to input and output test data for verification of the pipeline
* A usability domain
* Keywords
* A list of agents involved along with other important metadata, such as their specific contribution

Knowledge of input data is intended to be captured according to existing efforts, including [MIRAGE](https://en.wikipedia.org/wiki/Minimum_Information_Required_About_a_Glycomics_Experiment), [MIAPE](http://www.psidev.info/miape), and [STRENDA](https://www.beilstein-strenda-db.org/strenda/public/guidelines.xhtml), and to be in accordance with Minimum Information Standards. In addition to all the information captured in the BCO, the BCO itself must be independent of the execution environment, whether it is a local high-performance or a cloud-based infrastructure.
To facilitate a means for different stakeholders in the HTS communities to provide input on the BioCompute standard we follow the [Open-Stand.org principles for collaborative open standards development](https://open-stand.org/about-us/principles/).


## User Guide 

The [BioCompute Objects user guide](/user_guide.md) provides an introduction to implementing/writing a BCO for a pipeline and/or a workflow, and is taken from the [BioCompute Objects Specification Document](/BCO_Spec_V1.2.md). This document was originaly written by [The BioCompute Object working group](/BCO_Spec_V1.2.md#biocompute-object-consortium-members-bcoc) during preparation for the [2017 HTS Computational Standards for Regulatory Sciences Workshop](https://hive.biochemistry.gwu.edu/htscsrs/workshop_2017).

## Specification

For developers and advanced users, the current [BCO specification (v1.2)](https://github.com/biocompute-objects/BCO_Specification/blob/v1.2/BCO_Spec_V1.2.pdf) provides authoritative documentation of the construction of BioCompute Objects.

See [releases](https://github.com/biocompute-objects/BCO_Specification/releases) for all releases of BCO object specification since moving to GitHub.

### Repository

This repository contains the document that make up the release of the BCO specification. 

Note that unless you are viewing a [release](https://github.com/biocompute-objects/BCO_Specification/releases) this is a draft subject to change.

Table of content:

* [BioCompute Object (BCO) specification document](bco-specification.md)
  * [Introduction to BioCompute Objects](introduction.md)
  * [BCO domains](bco-domains.md)
    * [Top level fields](top-level.md)
    * [Provenance domain](provenance-domain.md)
    * [Usability domain](usability-domain.md)
    * [FHIR extension](extension-fhir.md)
    * [GitHub extension](extension-github.md)
    * [Description domain](description-domain.md)
    * [Execution domain](execution-domain.md)
    * [Parametric domain](parametric-domain.md)
    * [Input and Output domain](io-domain.md)
    * [Error domain](error-domain.md)
  * [BCO expanded view example HCV1a.json](HCV1a.json)
  * [Data Typing](data-typing.md)
    * [Primitive data types primitives.json](primitives.json)
    * [Base BioCompute Type base_type_BioCompute.json](base_type_BioCompute.json)

### Citation

To reference the BCO standards, please use the following
citation inclusive of the DOI:

Simonyan, V., Goecks, J., & Mazumder, R. (2017). ***Biocompute Objects — A Step towards Evaluation and Validation of Biomedical Scientific Computations.*** PDA Journal of Pharmaceutical Science and Technology, 71(2), 136–146. doi: [10.5731/pdajpst.2016.006734](http://doi.org/10.5731/pdajpst.2016.006734)

## Support, Community and Contributing

To suggest changes to [this repository](#Repository) and friends we welcome contributions as a [pull request](https://github.com/biocompute-objects/BCO_Specification/pulls), [issue](https://github.com/biocompute-objects/BCO_Specification/issues).

<!-- TODO: Something about license and IP transfer? -->


Please also see our [OSF page](https://osf.io/h59uh/) or our [main page](http://biocomputeobject.org/) 

<!-- something about mailing list? -->
