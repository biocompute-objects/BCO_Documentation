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

The conceptual schema for BCO creation is built on top of two layers: the data definition layer and the BCO layer. The first layer is where all fundamental data types are defined. Complex types are composed of multiple atomic or complex types, like a character string. Using these principles one can construct a datum that has the ability to represent any level of complexity that is needed. A BCO is, essentially, a federation of other objects.

### 3.4.1 Primitive data types

When defining a field in a data type, one can place any number of constraints on the data and the field will be accepted as valid. So, if a data type field was being constructed for holding DNA sequencing information, one could restrain the type of characters that field would accept. This further refinement would ensure that only the characters used for representing nucleic acids would be accepted as input in this field (e.g. A, T, C, G). A list of the primitive types used in BCO data typing is below.

* [primitives.json](primitives.json)


### 3.4.2 Base BioCompute Type

The second layer is constructed with objects from first layer, producing a derived data type called the "base BioCompute type". Extending the same principles that allowed us to construct a string representing a DNA sequence from the primitive character type, one can construct a type definition that is the absolute minimum fields necessary to create a BCO. By taking the primitive BCO type and adding parametric and metadata fields unique to a particular instance, a BCO can be created. Below is the type definition for "BioCompute_base_type":

* [base_type_BioCompute.json](base_type_BioCompute.json)

### 3.4.3 Meaning associations

All data field values stored in the data format have an associated file name and/or absolute or relative field value location. The association and assignment of meaning to a particular data value can be ontological (derived from a name-value pair), or topological (derived from a location-value pair).

*As an example, in a name-value pair, the name of the field is explicitly specified. Examples of name-value pairing are: a JSON object; the mapping from ids to nodes in an XML document; or the association between the column names and columns of a CSV table. In a location-value pair, the name of the field is not specified but assumed, according to the order and positioning of the value assumes its meaning. An example of location-value pairing is a FASTQ file, where sequence and quality lines do not have explicit names, but their relative locations are used to identify the data line type.*

### 3.4.4 Atomic and complex data

Data values can be atomic, (not decomposable into smaller sets without the loss of meaning) or complex (containing other simpler values or topologies). Data structures of arbitrary complexity can be created using substructures and hybrids of name-value and location-value aggregations. Some fields may be declared parent fields of others and the field name value pairs can be allocated along the hierarchy of field types. It is important to note that atomicity of the field values here does not directly imply independent scientific interpretability of the atomic values: it only implies that such information cannot be fragmented into smaller more fundamental types. 

*For example, the value for a person's age is an atomic value and cannot be decomposed. However, a person's identity is a complex data which contains first name, last name, age, social security number, passport number and perhaps other simpler values which have a meaning in of their own.*

### 3.4.5 Fundamental and derived types

Primitive field types, such as numbers, strings, bit-fields, and uncharacterized blobs, are generally the most frequently used; this fact is reflected in computer science where these four types are chosen as fundamental units of data representation. A data type by itself does not carry physical interpretation; this interpretation comes from the value associations mentioned above. Other field types (sequences, alignments, etc.), whether atomic or complex types, are constructed using the fundamental types and adjusting their interpretive significance. Computable data types, such as references and formulas, are also useful for creating operational information infrastructures; such fields do not carry a value themselves but link to another value, in the same or another object, directly or through the usage of a transformation formula. 

In the person’s identity example mentioned in the previous section, the atomic subfields first name, last name, age, etc. are primitive data types such as strings and numbers. 

Data typing is the process of creating a derived data type as a collection of primitive field types and previously defined complex types. During this process, field attributes such as name, type, constraints, and default value are specified for each of the fields. 

*To construct the type "Identity" we define a collection of the fundamental fields that comprise this derived type. *

**_Identity:_**

* *First name is a free text string. *

* *Last name is a free text string. *

* *Age is a single whole number. *

* *Identity*: {Charles, Darwin, 208} *

#### Derived/computed fields

Derived/computed data types are produced during the output of the object instance and cannot be entered during instantiation of the object into the database. These fields are just the reproducible outcome of other field values through some kind of derivation mechanisms. For example: a taxonomy identifier is non-redundantly unique enough to recover different names, synonyms and relations for a taxonomic unit. However, a derived field "name" can be a useful informative construct derived and outputted every time where taxonomic identification is necessary. 

    TaxID: 9606

#### Virtual fields

Field values can be explicitly specified in an object instance or computable by other means. For example: the metadata object describing a file can have a field named "file-size" reflective of the actual file size in storage. The value of that field cannot be explicitly specified or computed from other values in the same object. Such virtual fields are descriptive and can be used for validation of the object itself and for definition of further constraints. 

#### Constraints

Field values can have explicit and implicit constraints determining the universe of possible values for that particular field. Implicit constraints may be derived from the actual data types where, for example, numeric fields can have only numeric values and strings can have only characters of a particular alphabet. Explicit constraints are those specifically targeting a particular field in a data format, further limiting the value to a smaller set of possible values. Implicit and explicit constraints can be validated either by ensuring their syntax conformance or by evaluation of validation expression criteria. Correlation constraints can be defined on a field as well, demanding a condition when constraints on one field depend on the value(s) of other fields. There can be a scale of constraint rigorousness depending on the impact due to violation of such constraints. Soft constraint nonconformity can signify potential devaluation of a particular field value pair while hard constraint violation in a single field value pair would invalidate the entirety of the data as a whole. 

Existence of static and dynamic constraints is necessitated by the changing nature of the interdependencies of local and global information. Static constraints are those whose validation expression depends only on the data itself while dynamic constraints depend on external or dynamically changeable information from local or global sources. An example of an explicit, dynamic, and correlated constraint-carrying field type is XREF (cross-reference) for which both the ID and the cross-referenced source must be included and the validity of the field can be evaluated only by inclusion of potentially changeable dynamic content of the external source. 

It is important to note that constraints may limit the universe of possible values to discrete or continuous subsets of a finite or infinite enumerable list of values. Actual implementations of constraints may vary from a form of numerical open (]min,max[, closed ([min,max] or mixed ([min,max[, ]min,max]) ranges, lists of ranges, lists of strings and possible values to mathematical expressions producing true or false Boolean values based on the computation of a formula. 

#### Single and multi-value

An additional level of empowering complexity can be achieved if fields are allowed to have multiple values. Unlike single-value fields, a multi-value field carries multiple values associated with a single name-value or location-value assignation. Using this paradigm, one can introduce notions of a list and an array into data format containers. The difference between these types is that an array’s children elements are topologically bound to their location in a row and therefore, are related to each other. In the list however, children elements of the same or of a different kind are simply a collection of non-coupled values. 

#### Public and private fields

Security and access control rights play an important role when considering data access patterns in modern collaborative information systems. Data can be shared in such environments for viewing and modifications. One may want to share only a subset of fields containing certain descriptive values broadcasting information about the existence of a particular metadata instance through a search and browsing engine. Thus, the researcher or collaborator who is interested in having access to your data may then ask for more complete (read or write) access to the dataset that was found through browsing its public properties. To satisfy this need, we can have an attribute called public for a field that declares it to be available for searching and browsing by other users. 

#### Uniqueness and key values

The importance of any particular field’s role in data format definition can vary within a local or global context. Some fields are unique within the given instance (object) of the data file and some are required to be unique within the global scope of such objects in some database. Such fields can be used as unique key identifiers of a whole data file within a known context. 

#### Incompleteness

Data formats can support both mandatory and optional fields. A valid data file must include all its mandatory fields without exception. Such fields are typically essential in representation of the underlying information and their absence can devalue or introduce ambiguities into interpretation of other fields. Optional fields are those carrying non-critical values; absence of those values does not devalue the interpretation of other fields. There are two possible approaches to optional fields: default value and undefined value. An empty optional field can be treated as having an agreed upon predefined default value or can simply call the value undefined or NULL which must be interpreted as non-equal to any other value, even to another undefined. Any operation performed with undefined values must also be assigned the value of undefined. 

#### Arbitrary key-value pairs

Certain file formats allow incorporation of arbitrary key value pairs without specific designation with the objective of adopting unstructured, descriptive, or information that may be useful in the future. Although the ultimate goal of such arbitrary fields is to maintain some level of extensibility in formats, those arbitrary fields usually end up containing a significant amount of ill structured and unverifiable, non-canonical information. By providing other means to extensibility, we strongly discourage using arbitrary key-value pairs for anything other than purely descriptive, non-critical information.

### 3.4.6 Extensibility through inheritance and inclusion of data types

It is of the utmost importance to generate extensible metadata formats capable of providing the basis for more complex new types. There are two proposed ways to extend a data format: inheritance and inclusion. 

The concept of inheritance assumes that a more complex data type inherits all the field value pairs from another, simpler data type and extends the content only with additional field value pairs or customizes (redefines some characteristics) of existing fields. The concept of inclusion assumes that a particular field of an object is of a previously declared complex type and that it contains all the fields of a simpler data type. A single data type can inherit from multiple data types and can include multiple data types multiple times. 

Using these two paradigms, one can design a number of layered standard objects based on predefined objects and extend their functionality with specific fields. For example: imagine a metadata object of type bio-sample which has a predefined fundamental description applied to a generalized sample. This object can have its properties repeatedly inherited to create a human-sample object with increasingly specific information about particularities of that sample description. 

The two proposed extensibility models allow avoiding the overuse of optional field attributes that are present in conglomerated flat data type designs. Instead of designing wide and flat data types with all possible fields for different use-cases, one may choose to design more targeted types with specifically mandated fields inside. 

*For example, having an optional tissue-location field in all biological-sample objects might lead to sparse population of the field as it will be unpopulated for all environmental, metagenomic, bacterial, and viral samples where the notion of a tissue is irrelevant. However, designing an inherited animal-sample data type can have a mandatory tissue location field for instances when it is important to know from which part of the animal a particular sample was collected.* 

The power of the inheritance and inclusion methods to extend and implement new data types is evident when one considers the need to create new subtypes or a branch of existing types after the initial data -type structure is established. This step can be accomplished without modification of existing database objects by defining the new intermediates within the framework of the pre-defined metadata type hierarchy.

The relationship implemented by inheritance subtyping is a is-a relationship. For example, the type "fish" can have three subtypes "eel", "shark" and "salmon". Each subtype is a variety of the "fish" supertype and inherits all "fish" characteristics but has some specific differences.

### 3.4.7 Data lifecycle timeline

Data objects are typically records stored in an information system: a file system or a database. The life of such a record starts at the moment of metadata file submission. Typical preprocessing steps include: files being parsed and validated regarding their conformity with data standards, application of quality control processes and designation of appropriate permissions for later use. Depending on the size and complexity of the data, as well as the load on the data processing subsystems, this period may take seconds to days for NGS data. After this initial preprocessing stage, objects become visible to the owner/submitter of the information. 

The user can then specify the validity start time before which the object is not to be accessed by anyone other than the user. This feature is useful for providing pre-publication delays or time fixed processing procedures. The user can also specify the validity end period after which the object is not to be used by anyone other than the owner of the record. 

Optional soft and hard expiration periods can be set. These properties signify when the object should become "expired" from the database and should be treated as "deleted," and when the record is actually deleted from the database, respectively. The timespan between these two time periods is the potential recovery period; during this period the deletion can be reverted by manual or electronic inquiry from the user to the DB administrator/manager. 

Another important milestone of the data existence is set by FDA’s mandate to maintain an archival copy of any review data used to make regulatory decisions. This copy does not necessarily reside in any easily accessible database or file system and is managed by a different set of regulations, the description of which lies outside the scope of this document.

## 3.5 Appendix VI Acknowledgements

This document began development during the 2017 HTS-CSRS workshop. The discussion during the workshop facilitated the refinement and completion of this document. The workshop participants were a major part of the initial BCO community, and the comments and suggestions collected during the sessions were incorporated into this document. The people who participated in the 2017 workshop, and therefore made significant contributions are listed here: [https://osf.io/h59uh/](https://osf.io/h59uh/)

