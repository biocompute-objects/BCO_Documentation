_This document is part of the [BioCompute Object specification](bco-specification.md)_

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
