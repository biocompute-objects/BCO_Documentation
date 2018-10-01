# BioCompute Object (BCO) User Guide
## BCO_Spec_V1.2

## Introduction
BioCompute is a paradigm and a BioCompute Object (BCO) is an instance of that paradigm. High-throughput sequencing (HTS), also referred to as next-generation sequencing (NGS) or massively parallel sequencing (MPS), has increased the pace at which we generate, compute and share genomic data in biomedical sciences. As a result, scientists, clinicians and regulators are now faced with a new data paradigm that is less portable, more complex and most of all poorly standardized. BCOs use a simple JSON format to encode important information on the execution of computational pipelines, or for the creation of knowledge bases. BioCompute can be process oriented (for software pipelines) and/or product oriented (for knowledge bases). So error domain can include information to do QA and/or QC. The goal of using a BCO is to streamline communication of these details between stakeholders in academia, industry and regulatory agencies. 

The US Food and Drug Administration (FDA) and George Washington University (GW) originally partnered to establish a framework for community-based standards development and harmonization of HTS computations and data formats. Standardized HTS data processing and data formats will promote interoperability and simplify the verification of bioinformatics protocols. To do this, a schema has been developed to represent instances of computational analysis as a BCO. A BCO includes: 
* Information about parameters and versions of the executable programs in a pipeline
* Reference to input and output test data for verification of the pipeline
* A usability domain
* Keywords
* A list of authors along with other important metadata

In addition to all the information captured in the BCO, the BCO itself must be independent of the execution environment, whether it is a local high-performance or a cloud-based infrastructure.

Additional, non-normative, information on BCOs:
[https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5510742/]


### BCO community
The BioCompute Object working group facilitates a means for different stakeholders in the HTS communities to provide input on current practices on the BCO. This working group was formed during preparation for the 2017 HTS Computational Standards for Regulatory Sciences Workshop, and was initially made up of the workshop participants, both speakers and panelists. There has been a continual growth of the BCO working group as a direct result of the interaction between a variety of stakeholders from all interested communities in standardization of computational HTS data processing. The partnerships formed between universities, private genomic data companies, software platforms, government and regulatory institutions has been an easy point of entry for new individuals or institutions into the BCO project to participate in the discussion of best practices for the objects. 

## Data type for BCOs
The fundamentals of data typing (type primitives, class inheritance, etc.) that are used to define a BioCompute Object are described in detail in [primitives.json](https://github.com/biocompute-objects/BCO_Spec_V2.0/blob/master/primitives.json) and [base_type_BioCompute.json](https://github.com/biocompute-objects/BCO_Spec_V2.0/blob/master/base_type_BioCompute.json). Developers of BCO enabled platforms should reference these for details on how to support the creation of BCO programmatically or manually. BCOs are represented in JSON (JavaScript Object Notation) formatted text. The JSON format was chosen because it is both human and machine readable/writable. For a detailed description of JSON see www.json.org. 

The conceptual schema for BCO creation is built on top of two layers: the data definition layer and the BCO layer. The first layer is where all fundamental data types are defined. Complex types are composed of multiple atomic or complex types, like a character string. Using these principles one can construct a datum that has the ability to represent any level of complexity that is needed. A BCO is a federation of other objects.

3.1 Primitive data types
When defining a field in a data type, one can place any number of constraints on the data and the field will be accepted as valid. So, if a data type field was being constructed for holding DNA sequencing information, one could restrain the type of characters that field would accept. This further refinement would ensure that only the characters used for representing nucleic acids would be accepted as input in this field (e.g. A, T, C, G). A list of the primitive types used in BCO data typing is below.

```JSON
{
    "primitives" : {
        "_comment": "primitive type hash with short descriptions",
        "_type" : {
            "string": "alphanumeric string",
            "integer": "integer number",
            "float": "floating point number", 
            "boolean": "can only be assigned true, false, or null",
            "date": "specified ISO 8601", 
            "time": "ISO 8601", 
            "dateTime": "ISO 8601",
            "blob": "binary data stored as a single object",
            "json" : "any json formatted subobject, the structure to json is not imposed by base biocompute type, but should follow guidelines of using the predefined primitives"
        }
    },
    "objectid": {
        "_type": "string",
        "_comment": ["a string of characters designed for unambiguous identification of resources and extensibility via the URI scheme (https://www.w3.org/wiki/UriSchemes)"],
        "_constraint": {
            "regex" : "url_regex"
        }
    },
    "version": {
        "_type": "string",
        "_comment": "suggestion major[.minor[.build_nunber]]"
    }, 
    "email":{ 
        "_type": "string",
        "_constraint": {
            "regex" : "email_regex"
        }
    },
    "keyval" : {
        "key" : {
            "_type" : "string"
        },
        "value" : {
            "_type" : "string"
        }
    },
    "keymap" : {
        "key" : {
            "_type" : "string"
        },
        "value" : {
            "_type" : "string",
            "_multi_value" : true
        }
    },
    "uri": {
        "address": {
            "_type": "objectid"
        },
        "access_time": {
            "_type" : "dateTime",
            "_optional" : true
        },
        "sha1_chksum": {
            "_type": "string",
            "_optional" : true,
            "_constraint" : {
                "regex" : "[A-Za-z0-9]+"
            }
        }
    },
    "contribution": {
        "_type" : "string",
        "_multi_value" : true,
        "_comment": "taken from https://doi.org/10.1186/2041-1480-4-37",
        "_constraint" :{
           "_choice" : ["authoredBy", "contributedBy", "createdAt", "createdBy", "createdWith", "curatedBy", "derivedFrom", "importedBy", "importedFrom", "providedBy", "retrievedBy", "retrievedFrom", "sourceAccessedBy"]
        }
    },
    "contributor": {
        "_comment": [""],
        "name": {
            "_type": "string",
            "_optional" : true
        },
        "affiliation": {
            "_type": "string",
            "_optional" : true
        },
        "email" : {
            "_type" : "email",
            "_optional" : true
        },
        "contribution": {
            "_type": "contribution"
        },
        "orcid": {
            "_type": "objectid"
        }
    },
    "file": {
        "uri" : {
            "_type" : "uri"
        },
       "mediatype": { 
            "_type" : "string",
            "_optional" : true
        }
    },
    "xref" : {
        "namespace" : {
            "_type" : "string",
            "_comment" : "can be a prefix in identifiers.org or a db named in a source" 
        },
        "ids" : {
            "_type" : "string",
            "_multi_value" : true
        },
        "name" : {
            "_comment": "This can be the common name for the db",
            "_type" : "string",
            "_optional" :true
        },
        "access_time":{
            "_type": "dateTime",
            "_optional" : true
        }
    }
}
````

BioCompute data types are defined as aggregates of the critical fields organized into a few domains: 
1) the identification and provenance domain
2) the usability domain
3) the extension domain
4) description domain
5) the execution domain
6) the parametric domain
7) the input and output domains
8) the error domain. 

At the time of submission to the BioCompute Object database an instance of BCO type is created, populated with actual values compliant with the data type definitions and assigned a unique identifier. The object could then be assigned a unique digital signature and a unique digital object identifier. 

Three of the domains in a BioCompute Object become immutable upon assignment of the digital signature: 
   1) the Parametric Domain
   2) the Execution Domain and 
   3) the I/O Domain. 
   
Changing anything within these domains invalidates the verification and will break the digital signature. Required fields are indicated by the "vital": "True" flag, which is shown in the data typing section below. 

# BioCompute Object Consortium members (BCOC):
**FDA:** Mark Walderhaug, Ruth Bandler, Eric Donaldson, Elaine Thompson, Alin Voskanian, Anton Golikov, Konstantinos Karagiannis, Elaine Johanson, Adrian Myers, Errol Strain, Khaled Bouri, Tong Weida, Wenming Xiao, Md Shamsuzzaman 

**GW:** [Raja Mazumder](https://orcid.org/0000-0001-8823-9945), [Charles Hadley S. King IV](https://orcid.org/0000-0003-1409-4549), [Amanda Bell](https://orcid.org/0000-0002-9920-565X), Jeet Vora, Krista M. Smith, Robel Kahsay

**Documentation Community:** Vahan Simonyan (Crispr Therapeutics), Gil Alterovitz (Boston Children’s Hospital/Harvard Medical School, SMART/FHIR/HL7, GA4GH), Michael R. Crusoe (CWL), Marco Schito (C-Path), Konstantinos Krampis (CUNY), Alexander (Sasha) Wait Zaranek (Curoverse), John Quackenbush (DFCI/Harvard), Geet Duggal (DNAnexus), Singer Ma (DNAnexus), Yuching Lai (DDL), Warren Kibbe (Duke), Tony Burdett (EBI), Helen Parkinson (EBI), Stuart Young (Engility Corp), Anupama Joshi (Epinomics), Vineeta Agarwala (Flatiron Health), James Hirmas (GenomeNext), David Steinberg (UCSC), Veronica Miller (HIV Forum), Dan Taylor (Internet 2), Paul Duncan (Merck), Jianchao Yao (Merck & Co., Inc., Boston, MA USA), Marilyn Matz (Paradigm4), Ben Busby (NCBI), Eugene Yaschenko (NCBI), Zhining Wang (NCI), Hsinyi (Steve) Tsang (NCI), Durga Addepalli (NCI/Attain), Heidi Sofia (NIH), Scott Jackson (NIST), Paul Walsh (NSilico Life Science), Toby Bloom (NYGC), Hiroki Morizono (CNMC), Jeremy Goecks (Oregon Health and Science University), Srikanth Gottipati (Otsuka-US), Alex Poliakov (Paradigm4), Keith Nangle (Pistoia Alliance), Jonas S Almeida (Stony Brook Univ,  SUNY), Dennis A. Dean, II (Seven Bridges Genomics), Dustin Holloway (Seven Bridges Genomics), Nisha Agarwal (Solvuu), Stian Soiland-Reyes (UNIMAN), Carole Goble (UNIMAN), Susanna-Assunta Sansone (University of Oxford), Philippe Rocca-Serra (University of Oxford), Phil Bourne (Univ. of Virginia), Joseph Nooraga (Fred Hutchinson Cancer Research Center)

