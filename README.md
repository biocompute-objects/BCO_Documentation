BioCompute
==========
BioCompute Portal: https://biocomputeobject.org

GitHub Organization for BioCompute Object Repositories:
https://github.com/biocompute-objects/

[![Gitter](https://badges.gitter.im/biocompute-objects/community.svg)](https://gitter.im/biocompute-objects/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
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

Functional examples of a BCO with associated input and output files, and including the optional empirical error domain: 
* [UVP-BCO](https://github.com/biocompute-objects/UVP-BCO)
Other BCO Examples:
* [HCV1a](//content/examples/HCV1a.json)
* [HIVE_metagenomics](//content/examples/HIVE_metagenomics.json)
* [glycosylation-sites-UniCarbKB.json](//content/examples/glycosylation-sites-UniCarbKB.json)

## User Guide 

The [BioCompute Objects user guide](/content/user_guide.md) provides an introduction to implementing/writing a BCO for a pipeline and/or a workflow, and is adapted from the [IEEE Standard for Bioinformatics Analyses Generated by High-Throughput Sequencing (HTS) to Facilitate Communication](https://standards.ieee.org/standard/2791-2020.html).

### Repository
This repository hosts the content used to generate the BioCompute Documentation site at https://docs.biocomputeobject.org/


## Specification
### Current Release - IEEE-2791-2020

For developers and advanced users, the BCO specification id derived from [IEEE-2791-2020](https://opensource.ieee.org/2791-object/ieee-2791-schema) provides authoritative documentation on the construction of BioCompute Objects using [JSON schema](https://json-schema.org/). 

### Citation

To reference the BioCompute Objects, please use the following citations inclusive of the DOI:

Simonyan, V., Goecks, J., & Mazumder, R. (2017). ***Biocompute Objects — A Step towards Evaluation and Validation of Biomedical Scientific Computations.*** PDA Journal of Pharmaceutical Science and Technology, 71(2), 136–146. doi: [10.5731/pdajpst.2016.006734](http://doi.org/10.5731/pdajpst.2016.006734)

Alterovitz G, Dean D A, Goble C, Crusoe M R, Soiland-Reyes S, Bell A, Hayes A, King, C H S, Taylor D, Johanson E, Thompson E E, Donaldson E, Morizono H, Tsang H S, Goecks J, Yao J, Almeida J S, Krampis K, Guo L, Walderhaug M, Walsh P, Kahsay R, Gottipati S, Bloom T, Lai Y, Simonyan V, Mazumder R. **Enabling Precision Medicine via standard communication of HTS provenance, analysis, and results**. PLOS Biology; 16(12): e3000099.2018. https://doi.org/10.1371/journal.pbio.3000099

Patel JA, Dean DA, King CH, Xiao N, Koc S, Minina E, Golikov A, Brooks P, Kahsay R, Navelkar R, Ray M, Roberson D, Armstrong C, Mazumder R, Keeney J. **Bioinformatics tools developed to support BioCompute Objects**. Database (Oxford).2021 March 31; [PMID: 33784373](https://www.ncbi.nlm.nih.gov/pubmed/27974626)).

## Support, Community and Contributing

To suggest changes to [this repository](#Repository), we welcome contributions as a [pull request](https://github.com/biocompute-objects/BCO_Specification/pulls) or [issue](https://github.com/biocompute-objects/BCO_Specification/issues) submission.

BCO_Specification is licensed under the [BSD 3-Clause "New" or "Revised" License](./LICENSE)

>A permissive license similar to the BSD 2-Clause License, but with a 3rd clause that prohibits others from using the name of the project or its contributors to promote derived products without written consent.
