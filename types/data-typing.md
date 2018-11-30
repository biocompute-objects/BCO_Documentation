_This document is part of the [BioCompute Object specification](bco-specification.md)_

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
