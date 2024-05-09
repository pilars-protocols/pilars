# PILARS implementation and guidance

## About 

This document contains implementation advice and notes on the [PILARS protocols](./).


## Storage layout 


Very sensitive data may need to be stored on physically secured storage such as hard drives stored in a safe or an air-gapped server, and a variety of storage systems may need to be combined for a large collection (e.g. public data stored in the cloud, access-controlled data kept locally). Encrypting sensitive data can allow technologists to work on the servers without being able to see the data, but the data may not be recoverable if the encryption keys are lost.

Storage directory-like hierarchies may group data together in collections or by rights-holder on similar paths; to aid in moving data between services using file-system tools (unlike approaches which completely obscure all meaning in paths using hash algorithms, for reasons such as optimising the storage address space). 

However, to avoid ambiguity in implementing 1.2.2 Each object is a directory (or storage object equivalent) a specification, for example OCFL, may require that object paths on the storage root must not be nested within each other.

Deciding on the granularity of objects  1.2 Divide up data files into objects that form meaningful units, of smallest practical size  involves considering a number of factors:

## Licensing

files with the same licensing conditions for re-use should be grouped together

If some content may need to be withdrawn or withheld for cultural, ethical or legal reasons, then objects should be packaged so that this can be done without having create new versions of objects

Size of objects – TODO 

Principle 1.3 (that an ID resolution method is in place and documented) ensures that data can be referenced remotely and inter-object relationships within a repository are supported (this supports 2.5 Represent collections, archival series or other organising entities as storage-level objects); a Storage Object can be located without requiring the repository to be indexed.

The Oxford Common File Layout (OCFL) specification was developed to support a similar set of requirements to 1 Data is portable: assets are not locked in to a particular mode of storage or interface, and is being widely implemented in repository and digital library systems. LDaCA uses OCFL and has demonstrated that it works at the scale of tens of thousands of objects and millions of files. 

OCFL is a compliant implementation solution for the data portability

A simpler alternative based on different standards would be to:
Use a directory hierarchy on a POSIX-compliant storage system
Signal that directory is a Storage Object (1.2 Divide up data files into objects that form meaningful units …) by the presence of a Bagit manifest in a directory 
Bagit files nested below this Storage Object would not be considered Storage Objects in their own right in the context of the repository
Bagit provides checksums as per 2.4 Store checksum-metadata in a documented standard format alongside data to help ensure data integrity
Use a documented and implementable algorithm to map object IDs to a path and store a summary in the root of the directory hierarchy

### Storage Object notes

TODO: Reference OAIS concept of packages

### Applications notes

Regarding 1.7	If  data resides in systems, such as content management systems or database applications which do not inherently support all of the protocols 1 & 2  then put processes in place to export data to a system that does.

Ideally this something that should not be necessary, but if not then work to bring systems into line with PILARS:
Don’t design or build systems that don't have this exit pathway designed from the start, 
Don't place data in systems that don't have this already, and 
Work to add this straight away if existing systems don't have this.
Metadata Standards and Specifications
Why is Linked Data Metadata required?
Linked Data allows:
Any conceivable data structure to be described in metadata, and there is no limit to the size and scope of the description.
Extensibility: vocabularies to be mixed in as needed; from a core set for all data to domain-specific to project or even dataset-specific terms; this can be formalised using Profiles.
Interoperability with contemporary global research information systems architectures, discovery services etc.
Inter-object relationships to be expressed – so that the physical storage layout does not define the only way that resources can be explored.

NOTE: Linked data is often conflated with Open Access; the phrase Linked Open Data is very common. But the Linked Data principles can be applied to non-open access-controlled materials. Non-open materials have some impact on how catalogues and indexes are implemented; for example, using linked-data graphs such as triple stores that contain multiple items may make access-control-safe queries impossible to implement for reasons of complexity and performance; the reasoning to work out whether a particular metadata statement can be seen by a particular user could be very computationally expensive.

Vocabularies and metadata profiles
Communities can maintain schemas/vocabularies for specific domains (FAIR-R1.3) and to document metadata profiles. 

Documenting a profile can be as simple as writing a natural-language document to describe what is expected in a particular context, but can be further codified using Linked Data Schemas (or Ontologies or Vocabularies), from which documentation and validation services may be derived.


Licenses may be based on Copyright law, or rely on other mechanisms based on other rights (such as privacy or trade secrets). Licenses should reflect the will of rights holders, and will likely be administered, chosen or written by a data custodian or steward authorised to act on behalf of the rights holders, or by the rights holder themselves.

It is important to have a license document independent of algorithms or configuration file(s) and independently of a particular authorization system that may be built into a software application. Implemented processes are, of course, needed to make data available, and may include some automation. But to make data truly portable across systems and time, it is essential that human-readable documentation is available in case authorization processes need to be rebuilt or redesigned

### Logical Structure: Collections

The concept of a Collection is very commonly used in repositories and digital archives to represent the ‘backbone’ of the way resources including sub-collections and Objects are organised.

The choice of whether to store Collections as a single Storage Objects (eg directories)  in a storage system or as a number of Storage Objects may be influenced by the several factors:

-  The size of the object, finer granularity may be preferred to keep Storage Objects at a manageable size.

-  How likely the content is to change or be withdrawn, for example because a participant wishes to have content by or about them removed from an Archival Repository, a granularity of on object per participant/creator or cohort may make withdrawing access more manageable, by updating a license

-  Whether there is a separation made between Archival and dissemination-ready copies of files as per OAIS [3]

-  Whether files are stored with or separately from annotations on those files (such as transcripts)
Licensing of objects; from an implementation point of view it is much simpler to have a single reuse license per object than to try to administer very granular permissions.

To comply with  2.5 Represent Collections such as archival series or other organising entities as Storage Objects … as metadata-only Storage Objects referencing or referenced by other Storage Objects. Collection / Object relationships may be described using either exhaustive lists of members with a property such as the Portland Common Data Model  hasMember property or by referencing the containing Collection from another Collection or Repository Object

Fragmented objects can be linked back together using the for presentation and access (this is one of the strengths of Linked Data), for example, a recording and verbatim transcript may be stored together in an object available to a very limited cohort, while anonymised transcripts and audio may be in another object made broadly available – but these can be cross-linked and presented as a single entity to authorised users.

A variety of virtual collection-like aggregations of objects can be created via metadata indexes using user interface devices such as search facets, to comply with the 1 Data is Portable and 2. Data is Annotated; these should be designed so that the metadata on which they depend is stored with the data object, not solely in an application or workspace environment.

### Governance

The specifics of good governance are out of scope for these protocols, so we confine ourselves to some notes:

3.3 Processes are in place for ensuring data persistence for the defined periods that meet the repository purpose (including indefinitely) and 3.4 	Processes are in place for disposal/deaccessioning if appropriate to the purpose means (at least) two things: robust appraisal or sentencing practices, and robust preservation processes have been established.

The Digital Preservation Handbook [8] has detailed practical advice about preservation-focussed archival practice.


## Compliant PILAR software (TODO - make into a separate page on the RRKive site)

the Oni software stack used by LDaCA is based on these protocols 
Other repository software solutions such as Fedora which uses OCFL as a storage layer and its own Linked Data standards for describing collections and objects would also be considered PILAR compliant.



## Compliant Metadata Specifications

Research Object Crate (RO-Crate) [7] is a linked-data metadata specification based on widely used Linked Data Open Specifications. RO-Crate was developed as a packaging method for describing datasets and their contents – which is a good match for describing Storage Objects, and is now being widely adopted in various research contexts. RO-Crate has been demonstrated to work at scale in the Language Data Commons of Australia and PARADISEC as the basis for archival-repositories.

RO-CRATE supports Principle 2.5 Represent collections, archival series or other organising entities as storage-level objects ... via the inclusion of the Portland Common Data model; a schema for describing repositories with classes for Collections, Objects and Files [5].


RO-Crate is a compliant choice for the A (Annotated) in a PILAR implementation, and is used in both PARADISEC and LDaCA. 

Software Implementation Approaches 

There are two important implementation approaches to storing metadata in storage systems, which are discussed in this blog post: either the metadata in the store is treated as the source of truth (this is the approach implemented in the set of tools used by LDaCA) or a catalogue application maintains metadata which is the source of truth and exports data to the data store, the approach taken by PARADISEC.

1.7 If data resides in systems, such as content management systems or database applications which do not inherently support all of the protocols 1 & 2  then put processes in place to export data to a system that does. discusses this - it is important for the overall goals of these protocols that there are systems in place to write well described (Annotated) data to commodity storage.




TRUST?
https://ardc.edu.au/resource/trust-principles/ 


THe OAIS 