
---
title: Protocols for Implementing Long-term Archival Repositories Services (PILARS)
bibliography: ./src/PILARS.bib
---

## Status

Persistent ID (will always link to the latest version): &lt;<a href="http://w3id.org/ldac/pilars">http://w3id.org/ldac/pilars</a>>

To cite this document:  (pending a publication) please use this:

Sefton, P., et al. (2024). Protocols for Implementing Long-term Archival Repositories Services (PILARS). Retrieved from <a href="http://w3id.org/ldac/pilars">http://w3id.org/ldac/pilars</a>
  
This is a working draft which has been created by the below contributors.

We will be collecting feedback until the end of June 2024. <a href="https://github.com/Language-Research-Technology/pilars">Contribute at Github</a>

More information and background is available at <a href="https://rrkive.org">(RRKive.org)</a>

 <p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://w3id.org/ldac/pilars">Protocols for Implementing Long-term Archival Repositories Services (PILARS)</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="[0000-0002-3545-944X](https://orcid.org/0000-0002-3545-944X) ">Sefton et al</a> is licensed under <a href="https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""></a></p> 



## Editor

Peter Sefton p.sefton@uq.edu.au, University of Queensland, [0000-0002-3545-944X](https://orcid.org/0000-0002-3545-944X) 

## Contributors

Moises Sacal Bonequi m.sacalbonequi@uq.edu.au, University of Queensland  [0000-0002-4438-2755](https://orcid.org/0000-0002-4438-2755)

Alex Ip, alex.ip@aarnet.edu.au, AARNet [0000-0001-8937-8904](https://orcid.org/0000-0001-8937-8904) 

Michael Lynch, m.lynch@sydney.edu.au, University of Sydney [0000-0001-5152-5307](https://orcid.org/0000-0001-5152-5307)

Amanda Lawrence, amanda.lawrence@rmit.edu.au, RMIT   [0000-0003-2194-8178](https://orcid.org/0000-0003-2194-8178) 

Julia Colleen Miller, julia.miller@anu.edu.au, The Australian National University http://orcid.org/[0000-0002-8827-3825](https://orcid.org/0000-0002-8827-3825) 

Sam Hames, s.hames@uq.edu.au, University of Queensland [0000-0002-1824-2361](https://orcid.org/0000-0002-1824-2361) 

Marissa Takahashi, marissa.takahashi@qut.edu.au, Queensland University of Technology [0000-0002-6695-7660](https://orcid.org/0000-0002-6695-7660) 

Salome Harris, ARDS Aboriginal Corporation. salome.harris@ards.com.au

River Tae Smith, river.smith@monash.edu, Monash University [0000-0002-2118-3147](https://orcid.org/0000-0002-2118-3147)

Annie Cameron, anniec@wangkamaya.org.au, Wangka Maya PALC [0009-0007-5522-7121](https://orcid.org/0009-0007-5522-7121) 

Mark Raadgever, m.raadgever@uq.edu.au, University of Queensland

Nick Thieberger, thien@unimelb.edu.au, University of Melbourne[0000-0001-8797-1018](https://orcid.org/0000-0001-8797-1018)

Ben Foley, b.foley@uq.edu.au, University of Queensland [0000-0003-0879-9251](https://orcid.org/0000-0003-0879-9251)

Adam Bell, adam.bell@aarnet.edu.au AARNet, [0000-0003-2129-4776](https://orcid.org/0000-0003-2129-4776)

Janet McDougall, janet.mcdougall@anu.edu.au, The Australian National University [0000-0002-2151-2190](https://orcid.org/0000-0002-2151-2190)

Michael Haugh, michael.haugh@uq.edu.au, University of Queensland, [0000-0003-4870-0850](https://orcid.org/0000-0003-4870-0850)

## Overview

This document sets out protocols for the design and implementation of sustainable [Archival Repository] services to achieve “CAREful FAIRness”; i.e. to support the CARE  (@carrollCAREPrinciplesIndigenous2020a)
 and FAIR (@wilkinsonFAIRGuidingPrinciples2016 principles). 

PILARS aims to guide the design and implementation of data storage services, referred to as Archival Repositories, for a range of purposes, including core use cases of:

-  supporting research that follows the FAIR (@wilkinsonFAIRGuidingPrinciples2016) principles in any discipline, and 

-  archiving cultural-heritage. 

These protocols are designed to work alongside the [CARE] principles (@carrollCAREPrinciplesIndigenous2020a))
 which operate at a governance level and the Reference Model for an Open Archival Information System (OAIS) (@OAISReferenceModel model.)

The high-level aims of these PILAR protocols are to:

-  Maximise autonomy for data custodians/stewards

-  Maximise return on investment in data and data infrastructure

-  Maximise long-term sustainability for data and for data systems and management

The technical goals to support the aims are:

-  Data is portable and not locked into a particular storage system.

-  Data can be stored and described in systems based on Open Specifications. 

-  Services such as authorised access interfaces, catalogues and finding aids can be built and rebuilt from data in a storage system using Open Source Software solutions, services and tools.

## Background

This set of protocols is inspired by the continuing success of the technical approach taken over two decades by the PARADISEC (Pacific and Regional Archive for Digital Sources in Endangered Cultures) (@harrisResearchRecordsResponsibility2015 which houses cultural heritage material from more than 1360 languages with standard metadata with data stored in commodity services (initially files on disk, now objects in a cloud storage service), with metadata adjacent to the data, and work with the Language Data Commons of Australia to generalise the PARADISEC approach to other disciplines.)

## Audience

These protocols are aimed at IT practitioners, archivists, librarians, researchers and infrastructure managers involved in long-term data management and are intended to be complementary to the existing practices and principles of those disciplines. 

## Rationale

In a research context it is important to be able to support the FAIR principles (@wilkinsonFAIRGuidingPrinciples2016, ensuring that data is well described by metadata, is identified with persistent identifiers and that shared services with good governance are in place to store interoperable data, to make it findable and provide appropriate access controls. )

These protocols could form the basis for design, evaluation or procurement of archival repository-services, but also allow for data custodians to begin organising data in a format ready for archiving and digital preservation as long as they have access to some kind of commodity storage, by using a range of tools.

## The Protocols


<dl> 

<dt id="1">1<dd >Data is Portable: assets are not locked-in to a particular mode of storage, interface or service
<dl>
<dt id="1.1">1.1<dd >Keep data in one or more general-purpose commodity IT storage systems
<dl>
<dt id="1.1.1">1.1.1<dd >The storage system has a method to store and retrieve [File]-like datastreams using hierarchical file-paths.</dd>
<dt id="1.1.2">1.1.2<dd >The storage system has a method to list all the File-paths in the storage system.</dd>
</dl>
</dd>

<dt id="1.2">1.2<dd >Divide up data files into [Storage Objects] that form meaningful units, of smallest practical size.
<dl>
<dt id="1.2.2">1.2.2<dd >Each Storage Object is a directory (or storage object equivalent) containing the files including metadata and administrative files such as checksums that make up an Object.

<dt id="1.2.3">1.2.3<dd >Storage Objects can be located by inspecting the contents of the storage hierarchy by listing the paths (1.1.2) for example by the presence of a file with a defined name in the hierarchy.

</dl>


<dt id="1.3">1.3<dd >Document and implement an ID resolution mapping system to map IDs to storage locations [FAIR-F1].

<dt id="1.4">1.4<dd >Store documentation about the conventions and standards such as (1.3) used in a data store within the root of the storage service itself.

<dt id="1.5">1.5<dd >Data storage of well described data objects is considered separately from the current uses to which the data is put.

<dt id="1.6">1.6<dd >Data files use open or standard formats where possible, independent of particular software [FAIR-I].

<dt id="1.7">1.7<dd >If data resides in systems, such as content management systems or database applications which do not inherently support all of the protocols 1 & 2  then put processes in place to export data to a system that does.
</dl>

<dt id="2">2<dd >Data is Annotated:  contents, structure, provenance and access and reuse permissions are comprehensively described with metadata and licenses
<dl>
<dt id="2.1">2.1<dd >For each Storage Object, store metadata that describes (annotates) the object and (optionally) the files that make up the object. The metadata should be stored in a file or files with the data files.
<dt id="2.2">2.2<dd >For [Protocol 2.1] use interoperable general-purpose linked-data metadata stored in a file format which has an Open Specification. This may be extended with domain-specific or ad hoc metadata (which may be in non linked-data formats) [FAIR-F1] [FAIR-F2] and may be stored in additional files.
<dt id="2.3">2.3<dd >For each Storage Object, include at least one license document linked from the metadata using the appropriate  property for a  ‘license’  from the core vocabulary (eg http://schema.org/license), setting out in plain language how data may be used and/or redistributed and by whom ([CARE] & [FAIR-R1.1]).
<dl>
<dt id="2.3.1">2.3.1<dd >Do not expose data, for example via a portal without access controls or disseminate confidential license or other governance information. Licensing may change, be withdrawn and new licenses added over time, note, however once data has been distributed under an Open Access license it may not be withdrawn from those who have downloaded it. 

<dt id="2.3.2">2.3.2<dd >Documentation about licenses for deposit and archive-wide accession policies may also be stored with an object

</dl>
<dt id="2.4">2.4<dd >Store checksum-metadata in a documented standard format alongside data files to help ensure data integrity.
<dt id="2.5">2.5<dd >Represent Repository Collections such as archival series or other organising entities as Storage Objects; either self-contained with their member data within the Storage Object or as metadata-only Storage Objects referencing or referenced by other Storage Objects.
</dl>




<dt id="3">3<dd >Governance is in place for each [Archival Repository]
<dl>
<dt id="3.1">3.1<dd >The purpose of the Archival Repository holding the data is articulated
<dt id="3.2">3.2<dd >Management systems are in place to sustain the Archival Repository
<dt id="3.3">3.3<dd >Deposit agreements are in place and documented setting out the rights needed for the Archival Repository as an organization to manage data
<dt id="3.3">3.3<dd >Processes are in place for ensuring data persistence for the defined periods that meet the repository purpose (including indefinitely) 
<dt id="3.4">3.4<dd >Processes are in place for disposal/deaccessioning if appropriate to the purpose.
</dl>

</dl>



# Definitions (glossary):
The following terms (used in capitalised form) are defined.


<a name="archival-repository"> </a>

[Archival Repository]: #archival-repository "Archival Repository"
### Archival Repository

Used to cover any system that is designed to keep data securely for a defined period of time (often forever) and to make it findable by and available to appropriate parties.  The terms Repository and Archive have different nuances and are used in a variety of ways in different communities, but here we want to emphasise the commonalities and focus on advice that is relevant to the audience of these protocols.

<a name="data-steward"> </a>

[Data Steward or Custodian]: #data-steward "Data Steward or Custodian"
### Data Steward or Custodian

An individual or organisation with the authority to make decisions regarding data under management. This decision making process is assumed to take place with good governance, in line with the CARE principles.

<a name="digital-preservation"> </a>

### Digital Preservation

The Digital Preservation Coalition page [What is digital preservation?](https://www.dpconline.org/digipres/what-is-digipres) defines Digital Preservation as:

The series of managed activities necessary to ensure continued access to digital materials for as long as necessary, refers to all of the actions required to maintain access to digital materials beyond the limits of media failure or technological and organisational change.



[Digital Preservation]: #digital-preservation "Data Steward or Custodian"

<a name="file"> </a>

[File]: #file "File"
### File

A computer file is an aggregation of data on a storage device, identified by a name.

(This definition comes from a discussion thread on wikidepdia (TalkComputerFile2024))

<a name="file-format"> </a>

[File Format]: #file-format "File Format"
### File Format

The organizational schema for a file – this may be formally defined in a specification or be ad-hoc. File formats may considered at various layers of specificity -- for example a text file may be plain text with a specific encoding such as UTF-8 and also be an XML file conforming to a particular schema  



<a name="linked-data-metadata"> </a>

[Linked data metadata]: #linked-data-metadata "Linked data metadata"
### Linked data metadata

Metadata is data that describes other metadata. Linked Data Metadata follows the principles set out by Tim Berners Lee for LInked data, so that all metedata and references to entities described are URIs (URLs). (@berners-leeLinkedData2006)




<a name="open-specification"> </a>

[Open Specification]: #open-specification "Open Specification"
### Open Specification

A versioned, published, openly available description of a set of precise requirements (e.g., for a format, system or protocol) which may or may not be endorsed by a standards authority. .


<a name="open-source-software"> </a>

[Open Source Software]: #open-source-software "Open Source Software"
### Open Source Software

Freely distributable software according to the definition of the Open Software Foundation (OSF).




<a name="license"> </a>

[License]: #license "License"
### License

The term License is used here inclusively to refer to a document which captures the terms under which data in an Archival-Repository may be shared, used, reused or deposited. This includes documents such as Data Sharing Agreements or other contracts which may be negotiated at various times which  give certain parties licence to use data in defined ways. 


<a name="repository-collection"> </a>

[Repository Collection]: #repository-collection "Repository Collection"
### Repository Collection

The term Repository Collection is used here to reference the Collection class from the Portland Common Data model[5] which was conceived as an interchange format for repository and digital library interchange definition for a collection includes this:


A Collection is a group of resources. Collections have descriptive metadata, access metadata, and may links (sic) to works and/or collections. 
<a name="repository-object"> </a>

[Repository Object]: #repository-object "Repository Object"
### Repository Object

The term Repository Object is used here in line with the Portland Common Data mode definition [5] which is refers to an abstract object.


An Object is an intellectual entity, sometimes called a "work", "digital object", etc. Objects have descriptive metadata, access metadata, may contain files and other Objects as member "components". Each level of a work is therefore represented by an Object instance, and is capable of standing on its own, being linked to from Collections and other Objects.

<a name="standard"> </a>

[Standard]: #standard "Standard"
### Standard

A Specification published by a recognized standards body such as the ISO or W3C. Standards are not always Open Access, so may have barriers to adoption.


<a name="storage-object"> </a>

[Storage Object]: #storage-object "Storage Object"
### Storage Object

A discrete unit in a physical storage service. This may represent, for example, a Repository Object or a Repository Collection which are abstract structural concepts. This concept is similar to an OCFL Object, and the concept of a Package in OAIS. 



See the [notes](implementation-and-guidance.html) for more detail about implementing PILARS.









