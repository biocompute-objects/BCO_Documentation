BioCompute
==========

Main website: http://biocomputeobject.org/

GitHub repository for BioCompute Objects:
https://github.com/biocompute-objects/

The Common Workflow Language (CWL) is a specification fBioCompute is a paradigm and a BioCompute Object (BCO) is an instance of that paradigm. High-throughput sequencing (HTS), also referred to as next-generation sequencing (NGS) or massively parallel sequencing (MPS), has increased the pace at which we generate, compute and share genomic data in biomedical sciences. As a result, scientists, clinicians and regulators are now faced with a new data paradigm that is less portable, more complex and most of all poorly standardized. BCOs use a simple JSON format to encode important information on the execution of computational pipelines, or for the creation of knowledgebases. BioCompute can be process oriented (for software pipelines) and/or product oriented (for knowledge bases). So error domain can include information to do QA and/or QC. The goal of using a BCO is to streamline communication of these details between stakeholders in academia, industry and regulatory agencies. 

The US Food and Drug Administration (FDA) and George Washington University (GW) have partnered to establish a framework for community-based standards development and harmonization of HTS computations and data formats. Standardized HTS data processing and data formats will promote interoperability and simplify the verification of bioinformatics protocols. To do this, a schema has been developed to represent instances of computational analysis as a BCO. A BCO includes: 
•	Information about parameters and versions of the executable programs in a pipeline
•	Reference to input and output test data for verification of the pipeline
•	A usability domain
•	Keywords
•	A list of agents involved along with other important metadata, such as their specific contribution

Knowledge of input data is intended to be captured according to existing efforts, including MIRAGE, MIAPE, and STRENDA, and to be in accordance with Minimum Information Standards. In addition to all the information captured in the BCO, the BCO itself must be independent of the execution environment, whether it is a local high-performance or a cloud-based infrastructure.

Additional, non-normative, information on BCOs:
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5510742/

## Specification

For developers and advanced users, the current [BCO specification (v1.2)](https://github.com/biocompute-objects/BCO_Spec_V1.2/blob/master/BCO_Spec_V1.2.pdf) provides authoritative documentation of the execution of BioCompute.

### Citation

To reference the BCO standards, please use the following
citation inclusive of the DOI:

Simonyan, V., Goecks, J., & Mazumder, R. (2017). ***Biocompute Objects — A Step towards Evaluation and Validation of Biomedical Scientific Computations.*** PDA Journal of Pharmaceutical Science and Technology, 71(2), 136–146. doi: [10.5731/pdajpst.2016.006734](http://doi.org/10.5731/pdajpst.2016.006734)

## Support, Community and Contributing

Please see our [OSF page](https://osf.io/h59uh/) or our [main page](http://biocomputeobject.org/)
