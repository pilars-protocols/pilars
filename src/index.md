<style>
dl { 
 
}
dt {
    float: left;
  

}
dt,
dd {

}


</style>

# Protocols for Implementing Long-term Archival Repositories Services (PILARS)


Editor: Peter Sefton p.sefton@uq.edu.au University of Queensland https://orcid.org/0000-0002-3545-944X 

Contributors: 

Moises Sacal Bonequi -University of Queensland- m.sacalbonequi@uq.edu.au https://orcid.org/0000-0002-4438-2755

Alex Ip alex.ip@aarnet.edu.au AARNet https://orcid.org/0000-0001-8937-8904 

Michael Lynch m.lynch@sydney.edu.au University of Sydney https://orcid.org/0000-0001-5152-5307

Amanda Lawrence, ADM+S/RMIT, amanda.lawrence@rmit.edu.au, Orcid 0000-0003-2194-8178 

Julia Colleen Miller julia.miller@anu.edu.au PARADISEC | LDaCA, The Australian National University http://orcid.org/0000-0002-8827-3825 

Sam Hames s.hames@uq.edu.au, University of Queensland | LDaCA, https://orcid.org/0000-0002-1824-2361 

Marissa Takahashi marissa.takahashi@qut.edu.au Queensland University of Technology, Australian Digital Observatory (ADO), https://orcid.org/0000-0002-6695-7660 

Salome Harris (ARDS Aboriginal Corporation) salome.harris@ards.com.au

River Tae Smith river.smith@monash.edu Monash University https://orcid.org/0000-0002-2118-3147

Annie Cameron, anniec@wangkamaya.org.au Wangka Maya PALC https://orcid.org/0009-0007-5522-7121 

Mark Raadgever m.raadgever@uq.edu.au University of Queensland

Nick Thieberger thien@unimelb.edu.au University of Melbourne ORCID ID: 0000-0001-8797-1018

Ben Foley b.foley@uq.edu.au University of Queensland, ORCID 0000-0003-0879-9251

Adam Bell adam.bell@aarnet.edu.au AARNet, ORCID 0000-0003-2129-4776

Janet McDougall janet.mcdougall@anu.edu.au Australian Data Archive, ANU /0000-0002-2151-2190

## Overview

This document sets out protocols for the design and implementation of sustainable Archival Repository services to achieve “CAREful FAIRness”; i.e. to support the CARE  [1] and FAIR [2] principles. 

PILAR aims to guide the design and implementation of data storage services, referred to as Archival Repositories, for a range of purposes, including core use cases of:

-  supporting research that follows the FAIR [2] principles in any discipline, and 

-  archiving cultural-heritage. 

These protocols are designed to work alongside the CARE principles [1] which operate at a governance level and the Reference Model for an Open Archival Information System (OAIS) [3] model.

The high-level aims of these PILAR protocols are to:

-  Maximise autonomy for data custodians/stewards

-  Maximise return on investment in data and data infrastructure

-  Maximise long-term sustainability for data and for data systems and management

The technical goals to support the aims are:

-  Data is portable and not locked into a particular storage system.

-  Data can be stored and described in systems based on Open Specifications. 

-  Services such as authorised access interfaces, catalogues and finding aids can be built and rebuilt from data in a storage system using Open Source Software solutions, services and tools.

## Background

This set of protocols is inspired by the continuing success of the technical approach taken over two decades by the PARADISEC (Pacific and Regional Archive for Digital Sources in Endangered Cultures) [4] which houses cultural heritage material from more than 1360 languages with standard metadata with data stored in commodity services (initially files on disk, now objects in a cloud storage service), with metadata adjacent to the data, and work with the Language Data Commons of Australia to generalise the PARADISEC approach to other disciplines.

## Audience

These protocols are aimed at IT practitioners, archivists, librarians, researchers and infrastructure managers involved in long-term data management and are intended to be complementary to the existing practices and principles of those disciplines. 

## Rationale

In a research context it is important to be able to support the FAIR principles [2], ensuring that data is well described by metadata, is identified with persistent identifiers and that shared services with good governance are in place to store interoperable data, to make it findable and provide appropriate access controls. 

These protocols could form the basis for design, evaluation or procurement of archival repository-services, but also allow for data custodians to begin organising data in a format ready for archiving and preservation as long as they have access to some kind of commodity storage, by using a range of tools.

## The Protocols


<dl> 

<dt name ="p-1">1</dt>

<dd>Data is Portable: assets are not locked-in to a particular mode of storage, interface or service
<dl>
<dt>1.1</dt>
<dd>
Keep data in one or more general-purpose commodity IT storage systems
<dl>
<dt>1.1.1</dt><dd>The storage system has a method to store and retrieve file-like datastreams using hierarchical file-paths.</dd>
<dt>1.1.2</dt><dd>The storage system has a method to list all the file-paths in the storage system.</dd>
</dl>
</dd>

<dt>1.2</dt><dd>Divide up data files into Storage Objects that form meaningful units, of smallest practical size.
<dl>
<dt>1.2.2</dt><dd>Each Storage Object is a directory (or storage object equivalent) containing the files including metadata and administrative files such as checksums that make up an Object.

<dt>1.2.3</dt><dd>Storage Objects can be located by inspecting the contents of the storage hierarchy by listing the paths (1.1.2) for example by the presence of a file with a defined name in the hierarchy.

</dl>


<dt>1.3</dt><dd>Document and implement an ID resolution mapping system to map IDs to storage locations (FAIR-F1).

<dt>1.4</dt><dd>Store documentation about the conventions and standards such as (1.3) used in a data store within the root of the storage service itself.

<dt>1.5</dt><dd>Data storage of well described data objects is considered separately from the current uses to which the data is put.

<dt>1.6</dt><dd>Data files use open or standard formats where possible, independent of particular software (FAIR-I).

<dt>1.7</dt><dd>If data resides in systems, such as content management systems or database applications which do not inherently support all of the protocols 1 & 2  then put processes in place to export data to a system that does.
</dl>

<dt>2<dd> Data is Annotated:  contents, structure, provenance and access and reuse permissions are comprehensively described with metadata and licenses
<dl>
<dt>2.1<dd>For each Storage Object, store metadata that describes (annotates) the object and (optionally) the files that make up the object. The metadata should be stored in a file or files with the data files.
<dt>2.2<dd>For 2.1 use interoperable general-purpose linked-data metadata stored in a file format which has an Open Specification. This may be extended with domain-specific or ad hoc metadata (which may be in non linked-data formats) (FAIR-F1,2) and may be stored in additional files.
<dt>2.3<dd>For each Storage Object, include at least one license document linked from the metadata using the appropriate  property for a  ‘license’  from the core vocabulary (eg http://schema.org/license), setting out in plain language how data may be used and/or redistributed and by whom (CARE (all) & FAIR-R1.1.).
<dl>
<dt>2.3.1<dd>It is critical that data that does not have an Open Access or public domain license is not exposed via a portal without access controls and that confidential licenses themselves are not disseminated.Licensing may change, be withdrawn and new licenses added over time.

<dt>2.3.2<dd>Documentation about licenses for deposit and archive-wide accession policies may also be stored with an object

</dl>
<dt>2.4</dt><dd>Store checksum-metadata in a documented standard format alongside data files to help ensure data integrity.
<dt>2.5</dt><dd>Represent Repository Collections such as archival series or other organising entities as Storage Objects; either self-contained with their member data within the Storage Object or as metadata-only Storage Objects referencing or referenced by other Storage Objects.
</dl>




<dt>3<dd> Governance is in place for each Archival Repository
<dl>
<dt>3.1</dt><dd>The purpose of the Archival Repository holding the data is articulated
<dt>3.2</dt><dd>Management systems are in place to sustain the Archival Repository
<dt>3.3</dt><dd>Deposit agreements are in place and documented setting out the rights needed for the Archival Repository as an organization to manage data
<dt>3.3</dt><dd>Processes are in place for ensuring data persistence for the defined periods that meet the repository purpose (including indefinitely) 
<dt>3.4</dt><dd>Processes are in place for disposal/deaccessioning if appropriate to the purpose.
</dl>

</dl>



# Definitions (glossary):
The following terms (used in capitalised form) are defined.


<a name="archival-repository" />

### Archival Repository

Used to cover any system that is designed to keep data securely for a defined period of time (often forever) and to make it findable by and available to appropriate parties.  The terms Repository and Archive have different nuances and are used in a variety of ways in different communities, but here we want to emphasise the commonalities and focus on advice that is relevant to the audience of these protocols.


<a name="standard" />

### Standard

A Specification published by a recognized standards body such as the ISO or W3C. Standards are not always Open Access, so may have barriers to adoption.


<a name="open-specification" />

### Open Specification

A versioned, published, openly available description of a set of precise requirements (e.g., for a format, system or protocol) which may or may not be endorsed by a standards authority. .


<a name="open-source-software" />

### Open Source Software

Freely distributable software according to the definition of the Open Software Foundation (OSF).


<a name="license" />

### License

The term License is used here inclusively to refer to a document which captures the terms under which data in an Archival-Repository may be shared, used, reused or deposited. This includes documents such as Data Sharing Agreements or other contracts which may be negotiated at various times which  give certain parties licence to use data in defined ways. 


<a name="repository-collection" />

### Repository Collection

The term Repository Collection is used here to reference the Collection class from the Portland Common Data model[5] which was conceived as an interchange format for repository and digital library interchange definition for a collection includes this:


A Collection is a group of resources. Collections have descriptive metadata, access metadata, and may links (sic) to works and/or collections. 
<a name="repository-object" />

### Repository Object

The term Repository Object is used here in line with the Portland Common Data mode definition [5] which is refers to an abstract object.


An Object is an intellectual entity, sometimes called a "work", "digital object", etc. Objects have descriptive metadata, access metadata, may contain files and other Objects as member "components". Each level of a work is therefore represented by an Object instance, and is capable of standing on its own, being linked to from Collections and other Objects.
<a name="storage-object" />

### Storage Object

A discrete unit in a physical storage service. This may represent, for example, a Repository Object or a Repository Collection which are abstract structural concepts. This concept is similar to an OCFL Object, and the concept of a Package in OAIS. 


<a name="linked-data-metadata" />

### Linked data metadata

Metadata is data that describes other metadata. Linked Data Metadata follows the principles set out by Tim Berners Lee for LInked data, so that all metedata and references to entities described are URIs (URLs). [6] 


<a name="data-steward" />

### Data Steward or Custodian

An individual or organisation with the authority to make decisions regarding data under management. This decision making process is assumed to take place with good governance, in line with the CARE principles.


<a name="file" />

### File

A datastream which is addressable by name and a path within a filesystem (eg conforming to POSIX)  


<a name="file-format" />

### File Format

The organizational schema for a file – this may be formally defined in a specification or be ad-hoc. File formats may considered at various layers of specificity -- for example a text file may be plain text with a specific encoding such as UTF-8 and also be an XML file conforming to a particular schema  


</dl>





References

[1]	S. R. Carroll et al., “The CARE Principles for Indigenous Data Governance.,” 2020, doi: 10.5334/dsj-2020-043.
[2]	M. D. Wilkinson et al., “The FAIR Guiding Principles for scientific data management and stewardship,” Sci. Data, vol. 3, p. 160018, Mar. 2016.
[3]	“OAIS Reference Model (ISO 14721),” OAIS Reference Model (ISO 14721). Accessed: Apr. 17, 2024. [Online]. Available: http://www.oais.info/
[4]	A. Harris, N. Thieberger, and L. Barwick, Research, Records and Responsibility: Ten years of PARADISEC. Sydney University Press, 2015.
[5]	“duraspace/pcdm,” GitHub. Accessed: May 17, 2016. [Online]. Available: https://github.com/duraspace/pcdm
[6]	T. Berners-Lee, Linked data, 2006. [Online]. Available: http://www.w3.org/DesignIssues/LinkedData.html
[7]	S. Soiland-Reyes et al., “Packaging research artefacts with RO-Crate,” Data Sci., vol. 5, no. 2, pp. 97–138, Jan. 2022, doi: 10.3233/DS-210053.
[8]	Digital Preservation Coalition, “Digital Preservation Handbook.” [Online]. Available: https://www.dpconline.org/handbook


