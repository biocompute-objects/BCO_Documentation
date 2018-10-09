GitHub: https://github.com/biocompute-objects<cr>
	
OSF page: https://osf.io/r6s4u/ biocomputeobject.org

# BioCompute Object (BCO) specification document
  DRAFT version 1.2.0

#### BioCompute Object Consortium members (BCOC):
FDA: Vahan Simonyan, Mark Walderhaug, Ruth Bandler, Eric Donaldson, Elaine Thompson, Alin Voskanian, Anton Golikov, Konstantinos Karagiannis, Elaine Johanson, Adrian Myers, Errol Strain, Khaled Bouri, Tong Weida, Wenming Xiao, Md Shamsuzzaman

GW: Raja Mazumder, Charles Hadley S. King IV, Amanda Bell, Jeet Vora, Krista M. Smith, RobelKahsayDocumentation Community: Gil Alterovitz (Boston Children’s Hospital/Harvard Medical School, SMART/FHIR/HL7, GA4GH), Michael R. Crusoe (CWL), Marco Schito (C-Path), KonstantinosKrampis (CUNY), Alexander (Sasha) Wait Zaranek (Curoverse), John Quackenbush (DFCI/Harvard), Geet Duggal (DNAnexus), Singer Ma (DNAnexus), Yuching Lai (DDL), Warren Kibbe (Duke), Tony, Burdett (EBI), Helen Parkinson (EBI), Stuart Young (Engility Corp), Anupama Joshi (Epinomics), Vineeta Agarwala (Flatiron Health), James Hirmas (GenomeNext), David Steinberg (UCSC), Veronica Miller (HIV Forum), Dan Taylor (Internet 2), Paul Duncan (Merck), Jianchao Yao (Merck & Co., Inc., Boston, MA USA), Marilyn Matz (Paradigm4), Ben Busby (NCBI), Eugene Yaschenko (NCBI), Zhining Wang (NCI), Hsinyi (Steve) Tsang (NCI), Durga Addepalli (NCI/Attain), Heidi Sofia (NIH), Scott Jackson (NIST), Paul Walsh (NSilico Life Science), Toby Bloom (NYGC), Hiroki Morizono (CNMC), Jeremy Goecks (Oregon Health and Science University), Srikanth Gottipati (Otsuka-US), Alex Poliakov (Paradigm4), Keith Nangle (Pistoia Alliance), Jonas S Almeida (Stony Brook Univ, SUNY), Dennis A. Dean, II (Seven Bridges Genomics), Dustin Holloway (Seven Bridges Genomics), Nisha Agarwal (Solvuu), Stian Soiland-Reyes (UNIMAN), Carole Goble (UNIMAN), Susanna-Assunta Sansone (University of Oxford), Philippe Rocca-Serra (University of Oxford), Phil Bourne (Univ. of Virginia), Joseph Nooraga (Fred Hutchinson Cancer Research Center)

#### High-throughput Sequencing Computational Standards for Regulatory Sciences (HTS-CSRS) Project

Contact: Raja Mazumder (mazumder@gwu.edu) and Vahan Simonyan (vahansim@gmail.com)

## Table of Contents
 BIOCOMPUTE OBJECT CONSORTIUM MEMBERS (BCOC)
 High-throughput Sequencing Computational Standards for Regulatory Sciences (HTS-CSRS) Project
1 INTRODUCTION
	1.1 MISSION OF THE BIOCOMPUTE PROJECT 
	1.2 MOTIVATION 
		1.2.1 Limitations of the initial effort 
		1.3 AUDIENCE FOR THIS DOCUMENT
		1.4 POTENTIAL STAKEHOLDERS FOR THE BIOCOMPUTE PROJECT 
		1.5 BCO USER STORIES
		1.6 BCO COMMUNITY
2 BIOCOMPUTE OBJECT EXPLAINED 
		2.0 TOP LEVEL FIELDS
		2.0.1 BioCompute Object Identifier "BCO_id"
		2.0.2 Type “type”
		2.0.3 Digital signature "digital_signature"
		2.0.4 BCO version
	2.1 PROVENANCE DOMAIN "PROVENANCE_DOMAIN"
    		2.1.1 Name "name"
     	2.1.2 Structured name “structured_name"" 
		2.1.3 Version "version" 
		2.1.4 Review "review"
		2.1.5 Inheritance/derivation “derived_from”
		2.1.6 Obsolescence “obsolete”
		2.1.7 Embargo ‘embargo’
		2.1.8 Created ‘created’
		2.1.9 Modification ‘modified’
		2.1.10 Contributors "contributors"
		2.1.11 License “license” 
	2.2 USABILITY DOMAIN "USABILITY_DOMAIN"
	2.3 EXTENSION DOMAIN "EXTENSION_DOMAIN"
		2.3.1 Extension to External References: SMART on FHIR Genomics 
		2.3.2 Extension to External References: GitHub 
	2.4 DESCRIPTION DOMAIN "DESCRIPTION_DOMAIN"
		2.4.1 Keywords "keywords"
		2.4.2 External References "xref"
		2.4.3 Pipeline tools "pipeline_steps"
		2.5 EXECUTION DOMAIN "EXECUTION_DOMAIN"
		2.5.1 Script Access Type "script_access_type"
		2.5.2 Script "script".
		2.5.3 Pipeline Version "pipeline_version"

 2.5.4 Platform/Environment "platform"
 2.5.5 Script driver "script_driver"
 2.5.6 Algorithmic tools and Software Prerequisites "software_prerequisites"
 2.5.7 Domain Prerequisites "domain_prerequisites"
 2.5.8 Environmental parameters "env_parameters"
2.6 PARAMETRIC DOMAIN "PARAMETRIC_DOMAIN" 
2.7 INPUT AND OUTPUT DOMAIN "IO_DOMAIN" 2.7.1 Input Subdomain "input_subdomain"
2.7.2 Output Subdomain "output_subdomain"
2.8 ERROR DOMAIN, ACCEPTABLE RANGE OF VARIABILITY "ERROR_DOMAIN"
3 DATA TYPING
3.1 PRIMITIVE DATA TYPES 
3.2 EXTENSIBILITY THROUGH INHERITANCE AND INCLUSION OF DATA TYPES
3.3 BASE BIOCOMPUTE TYPE 
3.4 BCO EXPANDED VIEW EXAMPLE 
3.5 EXTERNAL REFERENCE DATABASE LIST
3.6 DATA LIFECYCLE TIMELINE
4 TITLE 21 CFR PART 11 
5 COMPATIBILITY
5.1 ISA for the experimental metadata 
ACKNOWLEDGEMENTS