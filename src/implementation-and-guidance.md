
---
title: PILARS implementation and guidance
bibliography: ./src/PILARS.bib

---
## About 

This document contains implementation advice and notes on the [PILARS Protocols](./).


 <p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://w3id.org/ldac/pilars">PILARS implementation and guidance</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://orcid.org/0000-0002-3545-944X ">Sefton et al</a> is licensed under <a href="https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""></a></p> 

## Storage layout for [Protocol 1]


Very sensitive data may need to be stored on physically secured storage such as hard drives stored in a safe or an air-gapped server, and a variety of storage systems may need to be combined for a large collection (e.g. public data stored in the cloud, access-controlled data kept locally). Encrypting sensitive data can allow technologists to work on the servers without being able to see the data, but the data may not be recoverable if the encryption keys are lost.

Storage directory-like hierarchies may group data together in collections or by rights-holder on similar paths; to aid in moving data between services using file-system tools (unlike approaches which completely obscure all meaning in paths using hash algorithms, for reasons such as optimising the storage address space). 

However, to avoid ambiguity in implementing [Protocol 1.2.2] a specification, for example OCFL, may require that object paths on the storage root must not be nested within each other.

Deciding on the granularity of objects  [Protocol 1.2] involves considering a number of factors:

- Files with the same licensing conditions for re-use should be grouped together

-  If some content may need to be withdrawn or withheld for cultural, ethical or legal reasons, then objects should be packaged so that this can be done without having create new versions of objects

-  The Size of [Storage Objects] – considerthe practicality of managing content and users who may be downloading [Storage Objects], if the size of the objects is likely to be probalematic, consider breakingn them into smaller 



### Storage Object notes

TODO: Reference OAIS concept of packages

### Applications notes

Regarding [Protocol 1.7]: Ideally this something that should not be necessary, but if not then work to bring systems into line with PILARS:
-  Don’t design or build systems that don't have this exit pathway designed from the start 
-  Don't place data in systems that don't have this already, and 
-  Work to add this straight away if existing systems don't have this.


[Protocol 1.3] (that an ID resolution method is in place and documented) ensures that data can be referenced remotely and inter-object relationships within a repository are supported (this supports [Protocol 2.5] this means a Storage Object can be located without requiring the repository to be indexed using the ID-to-path algorithm.

The Oxford Common File Layout (OCFL) specification was developed to support a similar set of requirements to [Protocol 1] and is being widely implemented in repository and digital library systems. LDaCA uses OCFL and has demonstrated that it works at the scale of tens of thousands of objects and millions of files. 

*OCFL is a compliant implementation solution for [Protocol 1] to ensure data portability*

A simpler alternative storage based on different standards would be to:
-  Use a directory hierarchy on a POSIX-compliant storage system
-  Signal that directory is a Storage Object [Protocol 1.2] by the presence of a [Bagit] manifest in a directory 
  -  Bagit files nested below this Storage Object would not be considered Storage Objects in their own right in the context of the repository
  -  Bagit provides checksums as per 2.4 Store checksum-metadata in a documented standard format alongside data to help ensure data integrity
-  Use a documented and implementable algorithm to map object IDs to a path and store a summary in the root of the directory hierarchy

Note that neither this example using BagIt nor OCFL implement [Protocol 2]

## Metadata Standards and Specifications - [Protocol 2]


### Why is Linked Data Metadata required?

Linked Data allows:
-  Any conceivable data structure to be described in metadata, and there is no limit to the size and scope of the description.
-  Extensibility: vocabularies to be mixed in as needed; from a core set for all data to domain-specific to project or even dataset-specific terms; this can be formalised using Profiles.
-  Interoperability with contemporary global research information systems architectures, discovery services etc.
-  Inter-object relationships to be expressed – so that the physical storage layout does not define the only way that resources can be explored.

NOTE: Linked data is often conflated with Open Access; the phrase Linked Open Data is very common. But the Linked Data principles can be applied to non-open access-controlled materials. Non-open materials have some impact on how catalogues and indexes are implemented; for example, using linked-data graphs such as triple stores that contain multiple items may make access-control-safe queries impossible to implement for reasons of complexity and performance; the reasoning to work out whether a particular metadata statement can be seen by a particular user could be very computationally expensive.

### Vocabularies and metadata profiles

Communities can maintain schemas/vocabularies for specific domains (FAIR-R1.3) and to document metadata profiles. 

Documenting a profile can be as simple as writing a natural-language document to describe what is expected in a particular context, but can be further codified using Linked Data Schemas (or Ontologies or Vocabularies), from which documentation and validation services may be derived.

## Licenses
The FAIR principles mandate a license for data [FAIR-R1.1]

Licenses may be based on Copyright law, or rely on other mechanisms based on other rights (such as privacy or trade secrets). Licenses should reflect the will of rights holders, and will likely be administered, chosen or written by a data custodian or steward authorised to act on behalf of the rights holders, or by the rights holder themselves.

It is important to have a license document independent of algorithms or configuration file(s) and independently of a particular authorization system that may be built into a software application. Implemented processes are, of course, needed to make data available, and may include some automation. But to make data truly portable across systems and time, it is essential that human-readable documentation is available in case authorization processes need to be rebuilt or redesigned.

For [Protocol 2.3.1] an access-control system may need to be put in place if there is non-open license data in the [Archival Repository]. An individual data access system may implement a range of solutions:

- Lists of approved data licensees associated with logins local to the systen

- A separate license management system or systems where more than one data access system can consult to see if a user holds a particular license.

- Manual offline access, with direct transfer of data to approved applicants



### Logical Structure: Collections

The concept of a Collection is very commonly used in repositories and digital archives to represent the ‘backbone’ of the way resources including sub-collections and Objects are organised.

The choice of whether to store Collections as a single Storage Object (eg  a directory  or directory-like node in a file heirarchy) in a or as a number of [Storage Object]s may be influenced by the several factors:

-  The size of the object, finer granularity may be preferred to keep Storage Objects at a manageable size.

-  How likely the content is to change or be withdrawn, for example because a participant wishes to have content by or about them removed from an Archival Repository, a granularity of on object per participant/creator or cohort may make withdrawing access more manageable, by updating a license

-  Whether there is a separation made between Archival and dissemination-ready copies of files as per OAIS @OAISReferenceModel,

-  Whether files are stored with or separately from annotations on those files (such as transcripts)
Licensing of objects; from an implementation point of view it is much simpler to have a single reuse license per object than to try to administer very granular permissions.

To comply with  [Protocol 2.5] [Repository Collection] / [Repostory Object] relationships may be described using either exhaustive lists of members with a property such as the Portland Common Data Model  `pcdm:hasMember` property or by referencing the containing Collection from another Collection or Repository Object using the equivalent `pcdm:memberOf`.

Fragmented objects can be linked back together using the for presentation and access (this is one of the strengths of Linked Data), for example, a recording and verbatim transcript may be stored together in an object available to a very limited cohort, while anonymised transcripts and audio may be in another object made broadly available – but these can be cross-linked and presented as a single entity to authorised users.

A variety of virtual collection-like aggregations of objects can be created via metadata indexes using user interface devices such as search facets, to comply with the 1 Data is Portable and 2. Data is Annotated; these should be designed so that the metadata on which they depend is stored with the data object, not solely in an application or workspace environment.

### Governance

The specifics of good governance are out of scope for these protocols, so we confine ourselves to some notes:

[Protocol 3.3] and [Protocol 3.4] together means (at least) two things: robust appraisal or sentencing practices, and robust preservation processes have been established.

The Digital Preservation Handbook [8] has detailed practical advice about preservation-focussed archival practice.


## Compliant PILAR software (TODO - make into a separate page on the RRKive site)

the Oni software stack used by LDaCA is based on these protocols 
Other repository software solutions such as Fedora which uses OCFL as a storage layer and its own Linked Data standards for describing collections and objects would also be considered PILAR compliant.


## Compliant Metadata Specifications

Research Object Crate (RO-Crate) @soiland-reyesPackagingResearchArtefacts2022 is a linked-data metadata specification based on widely used Linked Data Open Specifications. RO-Crate was developed as a packaging method for describing datasets and their contents – which is a good match for describing Storage Objects, and is now being widely adopted in various research contexts. RO-Crate has been demonstrated to work at scale in the Language Data Commons of Australia and PARADISEC as the basis for archival-repositories.

RO-CRATE supports Principle 2.5 Represent collections, archival series or other organising entities as storage-level objects ... via the inclusion of the Portland Common Data model; a schema for describing repositories with classes for Collections, Objects and Files @DuraspacePcdm.


*RO-Crate is a compliant choice for the [Protocol 2] in a PILAR implementation, and is used in both PARADISEC and LDaCA*

## Software Implementation Approaches 

There are two important implementation approaches to storing metadata in storage systems, which are discussed in this blog post: either the metadata in the store is treated as the source of truth (this is the approach implemented in the set of tools used by LDaCA) or a catalogue application maintains metadata which is the source of truth and exports data to the data store, the approach taken by PARADISEC.

[Protocol 1.7] deals with this; it is important for the overall goals of these protocols that there are systems in place to write well described (Annotated) data to commodity storage.

