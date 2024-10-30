
---
title: PILARS implementation and guidance
bibliography: ./src/PILARS.bib

---
## About

This document contains implementation advice and notes on the [PILARS](./index.html).

 <p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://w3id.org/ldac/pilars">PILARS implementation and guidance</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://orcid.org/0000-0002-3545-944X ">Sefton et al.</a> is licensed under <a href="https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""></a></p> 

<br>

## Storage layout for [Protocol 1]

Very sensitive data might need to be stored on physically secured storage, such as hard drives stored in a safe or an air-gapped server, and a variety of storage systems might need to be combined for a large collection (e.g. public data stored in the cloud, access-controlled data kept locally). Encrypting sensitive data can allow technologists to work on the servers without being able to see the data, but the data might not be recoverable if the encryption keys are lost.

Storage directory-like hierarchies might group data together in collections or by rights-holder on similar paths, to aid in moving data between services using file-system tools (unlike approaches which completely obscure all meaning in paths using hash algorithms, for reasons such as optimising the storage address space). 

However, to avoid ambiguity in implementing [Protocol 1.2.2], a specification, for example, OCFL, might require that object paths on the storage root must not be nested within each other.

Deciding on the granularity of objects, [Protocol 1.2] involves considering a number of factors:

- Files with the same licensing conditions for re-use should be grouped together.

-  If some content might need to be withdrawn or withheld for cultural, ethical or legal reasons, then objects should be packaged so that this can be done without having to create new versions of objects.

<br>

### Applications notes

Regarding [Protocol 1.7]: Ideally, this is something that should not be necessary, but if not, then work to bring systems into line with PILARS:

-  Don’t design or build systems that don't have this exit pathway designed from the start.

-  Don't place data in systems that don't have this already.

-  Work to add this straight away if existing systems don't have this.

[Protocol 1.3] (that an ID resolution method is in place and documented) ensures that data can be referenced remotely and inter-object relationships within a repository are supported. This supports [Protocol 2.5], which means a [Storage Object](./index.html#storage-object) can be located without requiring the repository to be indexed using the ID-to-path algorithm.

The Oxford Common File Layout (OCFL) specification was developed to support a similar set of requirements to [Protocol 1], and is being widely implemented in repository and digital library systems. LDaCA uses OCFL and has demonstrated that it works at the scale of tens of thousands of objects and millions of files.

*OCFL is a compliant implementation solution for [Protocol 1] to ensure data portability.*

A simpler alternative storage based on different standards would be to:

-  Use a directory hierarchy on a POSIX-compliant storage system.

-  Signal that the directory is a Storage Object ([Protocol 1.2]) by the presence of a [BagIt] manifest in a directory.

   -  BagIt files nested below this Storage Object would not be considered Storage Objects in their own right in the context of the repository.

   -  BagIt provides checksums as per [Protocol 2.4].

-  Use a documented and implementable algorithm to map object IDs to a path and store a summary in the root of the directory hierarchy.

Note that neither this example using BagIt nor OCFL implement [Protocol 2].

<br>

## Metadata Standards and Specifications - [Protocol 2]

### Why is [Linked Data Metadata](./index.html#linked-data-metadata) required?

Linked Data allows:

-  any conceivable data structure to be described in metadata, and there is no limit to the size and scope of the description

-  extensibility: vocabularies to be mixed in as needed, from a core set for all data to domain-specific to project or even dataset-specific terms; this can be formalised using Profiles

-  interoperability with contemporary global research information systems architectures, discovery services, etc.

-  inter-object relationships to be expressed – so that the physical storage layout does not define the only way that resources can be explored.

**Note:** Linked data is often conflated with Open Access; the phrase Linked Open Data is very common. But the Linked Data principles can be applied to non-open access-controlled materials. Non-open materials have some impact on how catalogues and indexes are implemented; for example, using linked-data graphs such as triple stores that contain multiple items might make access-control-safe queries impossible to implement for reasons of complexity and performance; the reasoning to work out whether a particular metadata statement can be seen by a particular user could be very computationally expensive.

<br>

### Vocabularies and metadata profiles

Communities can maintain schemas/vocabularies for specific domains ([FAIR-R1.3]) and to document metadata profiles.

Documenting a profile can be as simple as writing a natural-language document to describe what is expected in a particular context, but can be further codified using Linked Data Schemas (or Ontologies or Vocabularies), from which documentation and validation services might be derived.

<br>

## Licenses

The [FAIR] principles mandate a [License](./index.html#license) for data ([FAIR-R1.1]).

Licenses might be based on copyright law, or rely on other mechanisms based on other rights (such as privacy or trade secrets). Licenses should reflect the will of rights holders, and will likely be administered, chosen or written by a [Data Steward or Custodian](./index.html#data-steward) authorised to act on behalf of the rights holders, or by the rights holder themselves.

It is important to have a license document independent of algorithms or configuration file(s), and independently of a particular authorisation system that might be built into a software application. Implemented processes are, of course, needed to make data available, and might include some automation. But to make data truly portable across systems and time, it is essential that human-readable documentation is available in case authorisation processes need to be rebuilt or redesigned.

For [Protocol 2.3.1], an access-control system might need to be put in place if there is non-open license data in the [Archival Repository](./index.html#archival-repository). An individual data access system might implement a range of solutions:

- lists of approved data licensees associated with logins local to the system

- a separate license management system or systems, where more than one data access system can consult to see if a user holds a particular license

- manual offline access, with direct transfer of data to approved applicants.

<br>

### Logical Structure: Collections

The concept of a Collection is very commonly used in repositories and digital archives to represent the ‘backbone’ of the way resources, including sub-collections and Objects, are organised.

The choice of whether to store Collections as a single [Storage Object](./index.html#storage-object) (e.g. a directory or directory-like node in a file hierarchy) or as a number of Storage Objects might be influenced by several factors:

-  the size of the object; finer granularity might be preferred to keep Storage Objects at a manageable size

-  how likely the content is to change or be withdrawn, for example, because a participant wishes to have content by or about them removed from an [Archival Repository](./index.html#archival-repository); a granularity of an Object per participant/creator or cohort might make withdrawing access more manageable, by updating a [License](./index.html#license)

-  whether there is a separation made between archival and dissemination-ready copies of files, as per OAIS (@OAISReferenceModel)

-  whether files are stored with, or separately from, annotations on those files (such as transcripts)

-  licensing of objects; from an implementation point of view, it is much simpler to have a single reuse license per Object than to try to administer very granular permissions.

To comply with [Protocol 2.5], [Repository Collection](./index.html#repository-collection) / [Repostory Object](./index.html#repository-object) relationships might be described using either exhaustive lists of members with a property, such as the Portland Common Data Model's `pcdm:hasMember` property, or by referencing the containing Collection from another Collection or Repository Object using the equivalent property `pcdm:memberOf`.

Fragmented Objects can be linked back together using the for presentation and access (this is one of the strengths of Linked Data), for example, a recording and verbatim transcript might be stored together in an Object available to a very limited cohort, while anonymised transcripts and audio might be in another Object made broadly available – but these can be cross-linked and presented as a single entity to authorised users.

A variety of virtual Collection-like aggregations of Objects can be created via metadata indexes using user interface devices, such as search facets, to comply with [Protocol 1] and [Protocol 2]; these should be designed so that the metadata on which they depend is stored with the data object, not solely in an application or workspace environment.

<br>

### Governance

The specifics of good governance are out of scope for these protocols, so we confine ourselves to some notes.

[Protocol 3.3] and [Protocol 3.4] together mean (at least) two things:

1. robust appraisal or sentencing practices

2. robust preservation processes have been established.

The Digital Preservation Handbook (@digitalpreservationcoalitionDigitalPreservationHandbook2015) has detailed practical advice about preservation-focussed archival practice.

<br>

## Compliant Metadata Specifications

Research Object Crate (RO-Crate) (@soiland-reyesPackagingResearchArtefacts2022) is a linked-data metadata specification based on widely used Linked Data [Open Specifications](./index.html#open-specifications). RO-Crate was developed as a packaging method for describing datasets and their contents – which is a good match for describing [Storage Objects](./index.html#storage-objects), and is now being widely adopted in various research contexts. RO-Crate has been demonstrated to work at scale in the Language Data Commons of Australia ([LDaCA](https://www.ldaca.edu.au/)) and [PARADISEC](https://www.paradisec.org.au/) as the basis for [Archival Repositories](./index.html#archival-repositories).

RO-CRATE supports [Protocol 2.5] via the inclusion of the Portland Common Data model, a schema for describing repositories with classes for Collections, Objects and Files (@DuraspacePcdm).

*RO-Crate is a compliant choice for [Protocol 2] in a PILARS implementation, and is used in both PARADISEC and LDaCA.*

<br>

## Software Implementation Approaches 

There are two important implementation approaches to storing metadata in storage systems, which are discussed in this [blog post](https://bibwild.wordpress.com/2023/03/21/ocfl-and-source-of-truth-two-options/) (@jrochkindOCFLSourceTruth2023):

1. The metadata in the store is treated as the source of truth (this is the approach implemented in the set of tools used by LDaCA).

2. A catalogue application maintains metadata, which is the source of truth, and exports data to the data store (the approach taken by PARADISEC).

[Protocol 1.7] deals with this; it is important for the overall goals of these protocols that there are systems in place to write well-described (annotated) data to commodity storage.

See the [RRKive Implementations page](https://www.rrkive.org/implementations/) for a list of compliant software that implements the PILARS.

<br>

## References

<div id="refs"></div>

<br>

[Return to top](#)
