# [WIP] BioCompute Object (BCO) User Guide
### BCO_Spec_1.3.0

## BCO expanded view example 

BioCompute data types are defined as aggregates of the critical fields organized into a few domains: 
1) the identification and provenance domain
2) the usability domain
3) the extension domain (optional)
4) description domain
5) the execution domain
6) the parametric domain
7) the input and output domains
8) the error domain. 

Three of the domains in a BioCompute Object SHOULD become immutable upon assignment of the `bco_id`: 
   1) the Parametric Domain
   2) the Execution Domain and 
   3) the I/O Domain. 

# BioCompute Object Consortium members (BCOC):
**FDA:** Mark Walderhaug, Ruth Bandler, Eric Donaldson, Elaine Thompson, Alin Voskanian, Anton Golikov, Konstantinos Karagiannis, Elaine Johanson, Adrian Myers, Errol Strain, Khaled Bouri, Tong Weida, Wenming Xiao, Md Shamsuzzaman 

**GW:** [Raja Mazumder](https://orcid.org/0000-0001-8823-9945), [Charles Hadley S. King IV](https://orcid.org/0000-0003-1409-4549), [Amanda Bell](https://orcid.org/0000-0002-9920-565X), Jeet Vora, Krista M. Smith, Robel Kahsay

**Documentation Community:** Vahan Simonyan (Crispr Therapeutics), Gil Alterovitz (Boston Children’s Hospital/Harvard Medical School, SMART/FHIR/HL7, GA4GH), Michael R. Crusoe (CWL), Marco Schito (C-Path), Konstantinos Krampis (CUNY), Alexander (Sasha) Wait Zaranek (Curoverse), John Quackenbush (DFCI/Harvard), Geet Duggal (DNAnexus), Singer Ma (DNAnexus), Yuching Lai (DDL), Warren Kibbe (Duke), Tony Burdett (EBI), Helen Parkinson (EBI), Stuart Young (Engility Corp), Anupama Joshi (Epinomics), Vineeta Agarwala (Flatiron Health), James Hirmas (GenomeNext), David Steinberg (UCSC), Veronica Miller (HIV Forum), Dan Taylor (Internet 2), Paul Duncan (Merck), Jianchao Yao (Merck & Co., Inc., Boston, MA USA), Marilyn Matz (Paradigm4), Ben Busby (NCBI), Eugene Yaschenko (NCBI), Zhining Wang (NCI), Hsinyi (Steve) Tsang (NCI), Durga Addepalli (NCI/Attain), Heidi Sofia (NIH), Scott Jackson (NIST), Paul Walsh (NSilico Life Science), Toby Bloom (NYGC), Hiroki Morizono (CNMC), Jeremy Goecks (Oregon Health and Science University), Srikanth Gottipati (Otsuka-US), Alex Poliakov (Paradigm4), Keith Nangle (Pistoia Alliance), Jonas S Almeida (Stony Brook Univ,  SUNY), Dennis A. Dean, II (Seven Bridges Genomics), Dustin Holloway (Seven Bridges Genomics), Nisha Agarwal (Solvuu), Stian Soiland-Reyes (UNIMAN), Carole Goble (UNIMAN), Susanna-Assunta Sansone (University of Oxford), Philippe Rocca-Serra (University of Oxford), Phil Bourne (Univ. of Virginia), Joseph Nooraga (Fred Hutchinson Cancer Research Center)

