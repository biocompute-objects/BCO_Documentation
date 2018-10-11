GitHub: https://github.com/biocompute-objects
	
OSF page: https://osf.io/r6s4u/ biocomputeobject.org

# BioCompute Object (BCO) specification document

* This version: [draft](https://github.com/biocompute-objects/BCO_Specification/tree/master)
* Previous version: [v1.2.0](https://github.com/biocompute-objects/BCO_Specification/releases/tag/v1.2)
* Latest release: https://github.com/biocompute-objects/BCO_Specification/releases/latest
* Latest editor's draft: https://github.com/biocompute-objects/BCO_Specification/tree/master

<!-- FIXME: Ideally permalinks for all of the above links, say registering https://w3id.org/bco/ -->

#### BioCompute Object Consortium members (BCOC):

**FDA:** Vahan Simonyan, Mark Walderhaug, Ruth Bandler, Eric Donaldson, Elaine Thompson, Alin Voskanian, Anton Golikov, Konstantinos Karagiannis, Elaine Johanson, Adrian Myers, Errol Strain, Khaled Bouri, Tong Weida, Wenming Xiao, Md Shamsuzzaman

**GW:** Raja Mazumder, Charles Hadley S. King IV, Amanda Bell, Jeet Vora, Krista M. Smith, Robel
Kahsay

**Documentation Community:** Gil Alterovitz (Boston Children’s Hospital/Harvard Medical School, SMART/FHIR/HL7, GA4GH), Michael R. Crusoe (CWL), Marco Schito (C-Path), Konstantinos
Krampis (CUNY), Alexander (Sasha) Wait Zaranek (Curoverse), John Quackenbush (DFCI/Harvard), Geet Duggal (DNAnexus), Singer Ma (DNAnexus), Yuching Lai (DDL), Warren Kibbe (Duke), Tony, Burdett (EBI), Helen Parkinson (EBI), Stuart Young (Engility Corp), Anupama Joshi (Epinomics), Vineeta Agarwala (Flatiron Health), James Hirmas (GenomeNext), David Steinberg (UCSC), Veronica Miller (HIV Forum), Dan Taylor (Internet 2), Paul Duncan (Merck), Jianchao Yao (Merck & Co., Inc., Boston, MA USA), Marilyn Matz (Paradigm4), Ben Busby (NCBI), Eugene Yaschenko (NCBI), Zhining Wang (NCI), Hsinyi (Steve) Tsang (NCI), Durga Addepalli (NCI/Attain), Heidi Sofia (NIH), Scott Jackson (NIST), Paul Walsh (NSilico Life Science), Toby Bloom (NYGC), Hiroki Morizono (CNMC), Jeremy Goecks (Oregon Health and Science University), Srikanth Gottipati (Otsuka-US), Alex Poliakov (Paradigm4), Keith Nangle (Pistoia Alliance), Jonas S Almeida (Stony Brook Univ, SUNY), Dennis A. Dean, II (Seven Bridges Genomics), Dustin Holloway (Seven Bridges Genomics), Nisha Agarwal (Solvuu), Stian Soiland-Reyes (UNIMAN), Carole Goble (UNIMAN), Susanna-Assunta Sansone (University of Oxford), Philippe Rocca-Serra (University of Oxford), Phil Bourne (Univ. of Virginia), Joseph Nooraga (Fred Hutchinson Cancer Research Center)

#### High-throughput Sequencing Computational Standards for Regulatory Sciences (HTS-CSRS) Project

Contact: Raja Mazumder (mazumder@gwu.edu) and Vahan Simonyan (vahansim@gmail.com)


# 1 Introduction

BioCompute is a paradigm and a BioCompute Object (BCO) is an instance of that paradigm. High-throughput sequencing (HTS), also referred to as next-generation sequencing (NGS) or massively parallel sequencing (MPS), has increased the pace at which we generate, compute and share genomic data in biomedical sciences. As a result, scientists, clinicians and regulators are now faced with a new data paradigm that is less portable, more complex and most of all poorly standardized. BCOs use a simple JSON format to encode important information on the execution of computational pipelines, or for the creation of knowledgebases. BioCompute can be process oriented (for software pipelines) and/or product oriented (for knowledge bases). So error domain can include information to do QA and/or QC. The goal of using a BCO is to streamline communication of these details between stakeholders in academia, industry and regulatory agencies. 

The US Food and Drug Administration (FDA) and George Washington University (GW) have partnered to establish a framework for community-based standards development and harmonization of HTS computations and data formats. Standardized HTS data processing and data formats will promote interoperability and simplify the verification of bioinformatics protocols. To do this, a schema has been developed to represent instances of computational analysis as a BCO. A BCO includes: 

* Information about parameters and versions of the executable programs in a pipeline

* Reference to input and output test data for verification of the pipeline
* A usability domain

* Keywords

* A list of agents involved along with other important metadata, such as their specific contribution

Knowledge of input data is intended to be captured according to existing efforts, including [MIRAGE](https://www.ncbi.nlm.nih.gov/pubmed/24653214), [MIAPE](https://www.ncbi.nlm.nih.gov/pubmed/17687369), and [STRENDA](https://www.beilstein-strenda-db.org/strenda/), and to be in accordance with [Minimum Information Standards](https://www.ncbi.nlm.nih.gov/pubmed/18688244). In addition to all the information captured in the BCO, the BCO itself must be independent of the execution environment, whether it is a local high-performance or a cloud-based infrastructure.

Additional, non-normative, information on BCOs:

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5510742/

## 1.1 Mission of the BioCompute project

* Develop BioCompute Objects that will facilitate communication of HTS computational analysis details with the FDA.

* Develop a community of stakeholders to create a versatile data harmonization framework that allows the standardized definition of platform-independent bioinformatics pipelines for execution, and is easily read by humans AND machines.

* Facilitate the development of tools and facilities implementing data typing, instantiation, deposition, storage, and distribution of validated BioCompute Objects through a BioCompute database, in order to enable reproducible scientific research and regulatory submissions of data and computations.

* Facilitate portability of pipelines for execution on Public Cloud infrastructure. 

## 1.2 Motivation

The unpredictability of tangible physical, chemical, and biological experiments due to the multitude of environmental and procedural factors is well documented. What is often systematically overlooked is that computational biology algorithms are affected by a multiplicity of parameters and are no less volatile. The complexities of computation protocols and interpretation of outcomes is only part of the challenge; there are also virtually no standardized and industry-accepted metadata schemas for reporting the computational pipelines and parameters together with their results. Thus, it is often impossible to reproduce the results of a previously performed computation due to missing information on parameters, versions, arguments, conditions, and procedures of application launch. The BCO concept has been developed specifically to satisfy regulatory research needs for evaluation, validation, and verification of bioinformatics pipelines; however, there is potential utility of BCO within the larger scientific community. This utility can be increased through the creation of a BCO database comprising records relevant to the U.S. Food and Drug Administration.

 A BioCompute Object database record will be similar to a GenBank record in form; however, instead of describing a sequence, the BioCompute record will include information related to parameters, dependencies, usage, and other information related to the specific computational instance. This mechanism will extend similar efforts and also serve as a collaborative ground to ensure interoperability between different platforms, industries, scientists, regulators, and other stakeholders interested in biocomputing.

 

For more information, see the project description on the [FDA Extramural Research](https://www.fda.gov/ScienceResearch/SpecialTopics/RegulatoryScience/ucm227223.htm) page. 

### 1.2.1 Limitations of the initial effort

* At the initial stages of BioCompute development, we address the challenges of HTS (NGS) bioinformatics. 
* BCOs could very easily be extended to other types of computational analysis, and at this stage, we are limiting our focus to HTS analysis and database creation.

## 1.3 Audience for this document

* Users performing HTS analysis with a regulatory science perspective
* HTS Platform Developers
* HTS related standard developers

## 1.4 Potential Stakeholders for the BioCompute project

* US Food and Drug Administration, as well as other Regulatory Agencies
* Medical product manufacturers and their suppliers
* Laboratories developing clinical testing protocols
* Bioinformatics tool and platform developers who wish to operate in a regulatory environment, including cloud service (PaaS, IaaS, SaaS, FaaS) providers
* Journals / Scientific Publishing / peer reviewing process
* US National Institutes of Health (NIH) (particularly initiatives such as NCI/ITCR)
* Public cloud companies operating in the Life Sciences sector including electronic health record (EHR) systems

## 1.5 BCO User stories

### Reproducibility and Interpretation use case

A pharmaceutical company is submitting NGS data and the FDA conducts a reanalysis of the data. The reanalysis does not concur with the original results. It can be very lengthy and costly to figure out the location of the discrepancies. Attaching a BioCompute Object with the initial submission would prevent most of the ambiguity surrounding the discrepancies. 

### Reusability use case

A regulatory decision has been made where a computational analysis has been used as evidence. New data emerges after the product has been on the market over a year and the regulators cannot reproduce the original environment with the configuration of tools and parameters of pipelines to reanalyze the initial submission data or replicate the initial conclusion.

### Collaboration use case

Authors and pharmaceutical scientists are unaware of how the regulatory industry is using workflows to analyze data. Openness and transparency are hindered by the lack of ability to communicate, not a lack of willingness. Scientific merit is compromised as a result of not having a common "language" for communicating computations.

### Accountability use case

A bioinformatics platform provider can use BCO as part of its verification and validation process. A customer submits NGS data provided by a third party sequencing provider. The sequencing data is poor quality. Reproducible pipelines, validated and verified as a "BCO", were used to demonstrate the fault lies in the sequencing step and not the bioinformatics pipeline.

### Versioning use case

One potential use case related to this is one of 'differential impact' of how different choices in the workflow affect the outcome of the computational analysis/experiment (e.g. changing expression estimation procedure). 

### Provenance use case

BCOs can serve as a history of what was computed. An example pertaining to provenance, from experience: data are generated and QC'ed as far as possible, and then passed on for analysis. The analysis diagnoses a problem with one or more samples (e.g., cryptic relatedness), which are then locally excluded from the analysis. But that exclusion is not reflected back to the original data, and the same bad samples are included in the next analysis. In this way, a record exists of which samples can be excluded in future analysis. 

### Data integration use case

A BCO can be used to provide clarity and transparency of the data integration process to both the new and existing collaborators. When new data is integrated into the existing data model, BCO can be used to describe data source information (eg- authors/contributors, data version etc), a QC workflow, data content, data modification if any. The BCO also allows reuse of the same workflow to integrate new data with same structure and source. BCO also provides a way to access and track data records which were eliminated in the integration/QC process due to rules or restrictions of the existing data model. Knowledgebases using BCOs in the form of ‘readme’ can provide provenance for every piece of data that is collected and presented to the user. Such granular tracking facilitates fair sharing of data and provides mechanisms for adherence to licensing requirements associated with specific datasets. 

## 1.6 BCO community

The BioCompute Object working group facilitates a means for different stakeholders in the HTS communities to provide input on current practices on the BCO. This working group was formed during preparation for the 2017 HTS Computational Standards for Regulatory Sciences Workshop, and was initially made up of the workshop participants, both speakers and panelists. There has been a continual growth of the BCO working group as a direct result of the interaction between a variety of stakeholders from all interested communities in standardization of computational HTS data processing. 

# 2 Data type for BCOs

The fundamentals of data typing (type primitives, class inheritance, etc.)  that are used to define BioCompute Objects are described in detail in section Appendix VI. Developers of BCO enabled platforms should reference this section for details on how to support the creation of BCO programmatically or manually. BCOs are represented in JSON (JavaScript Object Notation) formatted text. The JSON format was chosen because it is both human and machine readable/writable. For a detailed description of JSON see [www.json.org](http://www.json.org).

BioCompute data types are defined as aggregates of the critical fields organized into a few domains: the descriptive domain, the identification and provenance domain, the input and output domains, the parametric domain, the environmental domain, the execution domain, the prerequisite domain, the usability domain, and the error domain. At the time of submission to the BioCompute Object database an instance of BCO type is created, populated with actual values compliant with the data type definitions and assigned a unique identifier. The object could then be assigned a unique digital signature and a unique digital object identifier. (See security section, Appendix V.)

Three of the domains in a BioCompute Object become immutable upon assignment of the digital signature: 1) the Parametric Domain, 2) the Execution Domain and 3) the I/O Domain. Changing anything within these domains invalidates the verification and will break the digital signature. Required fields are indicated by the "vital": "True" flag, which is shown in the data typing section below (Appendix VI). 

## 2.0 Top Level Fields

The top level JSON object of a BCO include attributes to define the BCO itself.

Specification:

* [Top level fields](top-level.md)


## 2.2 Usability Domain "usability_domain"

The `usability_domain` is meant to improve searchability by allowing free-text description of the BCO.

<!-- TODO: Should this not also be part of top level? -->

Specification:

* [Usability domain](usability-domain.md)



## 2.3 Extension Domain "extension_domain"

The `extension_domain` is for a user to add more structured information that is defined in the type definition. The `extension_domain` section is not evaluated by checks for BCO validity or computational correctness.

Specifications:

* [FHIR extension](extension-fhir.md)
* [GitHub extension](extension-github.md)


## 2.4 Description Domain "description_domain"

The `description_domain` contain structured field for description of external references, the pipeline steps, and the relationship of I/O objects.

Specification:

* [Description domain](description-domain.md)

## 2.5 Execution Domain "execution_domain"

The `execution_domain` contains fields for execution of the BCO.

Specification:

* [Execution domain](execution-domain.md)


## 2.6 Parametric Domain "parametric_domain"

The `parametric_domain` represents the list of parameters customizing the computational flow which can affect the output of the calculations. 

Specification:

* [Parametric domain](parametric-domain.md)

## 2.7 Input and Output Domain "io_domain"

The `io_domain` represents the list of global input and output files created by the computational workflow.

Specification:

* [Input and Output domain](io-domain.md)


## 2.8 Error Domain, acceptable range of variability "error_domain"

The `error_domain` defines the empirical and algorithmic limits an d error sources of the BCO.

Specification:

* [Error domain](error-domain.md)


# 3 Appendices

## 3.1 Appendix-I: BCO expanded view example

Complete example:

* [HCV1a.json](HCV1a.json)

## 3.2 Appendix-II: External reference database list

This list contains the databases that are currently being used in our BCOs. We use the CURIEs that map to URIs maintained by *identifiers.org*. 

"*Identifiers.org* is an established resolving system the enables the referencing of data for the scientific community, with a current focus on the Life Sciences domain. *Identifiers.org* provides direct access to the identified data using one selected physical location (or resource). Where multiple physical locations are recorded in the [registry](http://identifiers.org/registry) the most stable one is selected for resolution. This allows the location independent referencing (and resolution if required) of data records."

In the entries below the "namespace" and identifier combine to become the CURIEs. 

    Recommended name: Taxonomy
    Namespace: taxonomy
    Identifier pattern: ^\d+$
    Registry identifier: MIR:00000006
    URI: http://identifiers.org/taxonomy/


    Recommended name: Sequence Ontology
    Namespace: so
    Identifier pattern: ^SO:\d{7}$
    Registry identifier: MIR:00000081
    URI: http://identifiers.org/so/

    Recommended name: PubMed
    Namespace: pubmed
    Identifier pattern: ^\d+$
    Registry identifier: MIR:00000015
    URI: http://identifiers.org/pubmed/

    Recommended name: PubChem-compound
    Namespace: pubchem.compound
    Identifier pattern: ^\d+$
    Registry identifier: MIR:00000034
    URI: http://identifiers.org/pubchem.compound/

For instance, the inline CURIE [taxonomy:31646] expands to http://identifiers.org/taxonomy/31646 as the namespace "taxonomy" corresponds to the prefix [http://identifiers.org/taxonomy/](http://identifiers.org/taxonomy/) to be augmented with the identifier "31646". Resolving the resulting URI will redirect (currently to [https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=31646](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=31646)) showing that term [taxonomy:31646] means "Hepatitis C virus subtype 1a” in the NCBI Taxonomy browser. Note that some identifier patterns result in a repetition when combined with the prefix, e.g. [so:SO:0000667]  expands to [http://identifiers.org/so/SO:0000667](http://identifiers.org/so/SO:0000667) 

### 3.2.2 Title 21 CFR Part 11

*Code of Federal Regulations Title 21 Part 11: Electronic Records - Electronic Signatures*

BioCompute project is being developed with Title 21 CFR Part 11 compliance in mind. The digital signatures incorporated into the format will provide the basis for provenance of BioCompute Object integrity using NIST proposed encryption algorithms. Execution domain and parametric domain (that have a potential impact on a result of computation) and identity domain will be used to create hash values and digital signature encryption keys which later can be used for computer or human validation of transmitted objects. 

Discussions are now taking place to consider relevance of BioCompute Objects with relation to Title 21 CFR part 11. We encourage continuous input from BioCompute stakeholders on this subject now and while the concept is becoming more mature and more widely accepted by scientific and regulatory communities.

Relevant document link:

[Part 11: Electronic Records](http://www.fda.gov/RegulatoryInformation/Guidances/ucm125067.htm)

## 3.3 Appendix IV - Compatibility

### 3.3.1 ISA for the experimental metadata

ISA is a metadata framework to manage an increasingly diverse set of life science, environmental and biomedical experiments that employ one or a combination of technologies. Built around the **Investigation** (the project context), **Study** (a unit of research) and **Assay** (analytical measurements) concepts, ISA helps to provide rich descriptions of experimental metadata (i.e. sample characteristics, technology and measurement types, sample-to-data relationships) so that the resulting data and discoveries are reproducible and reusable. The ISA Model and Serialization Specifications define an Abstract Model of the metadata framework that has been implemented in two format specifications, ISA-Tab and ISA-JSON ([http://isa-tools.org/format/specification](http://isa-tools.org/format/specification)), both of which have supporting tools and services associated with them, including by a programmable Python AP ([http://isa-tools.org](http://isa-tools.org/format/specification)) and a varied user community and contributors ([http://www.isacommons.org](http://www.isacommons.org)). ISA focuses on structuring experimental metadata; raw and derived data files, codes, workflows etc are considered as external file that are referenced. An example, along its complementarity with other models and a computational workflow is illustrated in this paper, which shows how to explicitly declare elements of experimental design, variables, and findings: [http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0127612](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0127612) 


## 3.4 Appendix V Data typing

The conceptual schema for BCO creation can be defined in `???` schema language. <!-- TODO: What to call this language? -->

Specifications:

* [Data Typing](data-typing.md)

## 3.5 Appendix VI Acknowledgements

This document began development during the 2017 HTS-CSRS workshop. The discussion during the workshop facilitated the refinement and completion of this document. The workshop participants were a major part of the initial BCO community, and the comments and suggestions collected during the sessions were incorporated into this document. The people who participated in the 2017 workshop, and therefore made significant contributions are listed here: [https://osf.io/h59uh/](https://osf.io/h59uh/)

