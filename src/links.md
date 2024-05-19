


[Protocol 1]: ./#1 "Data is Portable: assets are not locked-in to a particular mode of storage, interface or service"



[Protocol 1.1]: ./#1.1 "Keep data in one or more general-purpose commodity IT storage systems"



[Protocol 1.1.1]: ./#1.1.1 "The storage system has a method to store and retrieve [File]-like datastreams using hierarchical file-paths.</dd>"


[Protocol 1.1.2]: ./#1.1.2 "The storage system has a method to list all the File-paths in the storage system.</dd>"


[Protocol 1.2]: ./#1.2 "Divide up data files into [Storage Objects] that form meaningful units, of smallest practical size."


[Protocol 1.2.2]: ./#1.2.2 "Each Storage Object is a directory (or storage object equivalent) containing the files including metadata and administrative files such as checksums that make up an Object."


[Protocol 1.2.3]: ./#1.2.3 "Storage Objects can be located by inspecting the contents of the storage hierarchy by listing the paths (1.1.2) for example by the presence of a file with a defined name in the hierarchy."


[Protocol 1.3]: ./#1.3 "Document and implement an ID resolution mapping system to map IDs to storage locations (FAIR-F1)."


[Protocol 1.4]: ./#1.4 "Store documentation about the conventions and standards such as (1.3) used in a data store within the root of the storage service itself."


[Protocol 1.5]: ./#1.5 "Data storage of well described data objects is considered separately from the current uses to which the data is put."


[Protocol 1.6]: ./#1.6 "Data files use open or standard formats where possible, independent of particular software (FAIR-I)."


[Protocol 1.7]: ./#1.7 "If data resides in systems, such as content management systems or database applications which do not inherently support all of the protocols 1 & 2  then put processes in place to export data to a system that does."


[Protocol 2]: ./#2 "Data is Annotated:  contents, structure, provenance and access and reuse permissions are comprehensively described with metadata and licenses"


[Protocol 2.1]: ./#2.1 "For each Storage Object, store metadata that describes (annotates) the object and (optionally) the files that make up the object. The metadata should be stored in a file or files with the data files."


[Protocol 2.2]: ./#2.2 "For 2.1 use interoperable general-purpose linked-data metadata stored in a file format which has an Open Specification. This may be extended with domain-specific or ad hoc metadata (which may be in non linked-data formats) (FAIR-F1,2) and may be stored in additional files."


[Protocol 2.3]: ./#2.3 "For each Storage Object, include at least one license document linked from the metadata using the appropriate  property for a  ‘license’  from the core vocabulary (eg http://schema.org/license), setting out in plain language how data may be used and/or redistributed and by whom (CARE (all) & FAIR-R1.1.)."


[Protocol 2.3.1]: ./#2.3.1 "It is critical that data that does not have an Open Access or public domain license is not exposed via a portal without access controls and that confidential licenses themselves are not disseminated. Licensing may change, be withdrawn and new licenses added over time."


[Protocol 2.3.2]: ./#2.3.2 "Documentation about licenses for deposit and archive-wide accession policies may also be stored with an object"


[Protocol 2.4]: ./#2.4 "Store checksum-metadata in a documented standard format alongside data files to help ensure data integrity."


[Protocol 2.5]: ./#2.5 "Represent Repository Collections such as archival series or other organising entities as Storage Objects; either self-contained with their member data within the Storage Object or as metadata-only Storage Objects referencing or referenced by other Storage Objects."


[Protocol 3]: ./#3 "Governance is in place for each [Archival Repository]"


[Protocol 3.1]: ./#3.1 "The purpose of the Archival Repository holding the data is articulated"


[Protocol 3.2]: ./#3.2 "Management systems are in place to sustain the Archival Repository"


[Protocol 3.3]: ./#3.3 "Deposit agreements are in place and documented setting out the rights needed for the Archival Repository as an organization to manage data"

[Protocol 3.4]: ./#3.4 "Processes are in place for disposal/deaccessioning if appropriate to the purpose."



[CARE]: ./principles.html#CARE "CARE Principles"


[CARE-C]: ./principles.html#CARE-C "Collective Benefit"

[CARE-C1]: 	./principles.html#CARE-C1 "For inclusive development and innovation" 

[CARE-C2]: 	./principles.html#CARE-C2 	"For improved governance and citizen engagement"


[CARE-C3]: 	./principles.html#CARE-C3  "For equitable outcomes" 

[CARE-A]: ./principles.html#CARE-A "Authority to Control"

[CARE-A1]: ./principles.html#CARE-A1 "Recognizing rights and interests"

[CARE-A2]: ./principles.html#CARE-A2 "Data for governance Indigenous "

[CARE-A3]: ./principles.html#CARE-A3 "Governance of data "

[CARE-R]: ./principles.html#CARE-R "Responsibility "

[CARE-R1]: ./principles.html#CARE-R1 "For positive relationships"

[CARE-R2]: ./principles.html#CARE-R2 "For expanding capability and capacity "

[CARE-R3]: ./principles.html#CARE-R3 "For Indigenous languages and worldviews"

[CARE-E]: ./principles.html#CARE-E "Ethics"

[CARE-E1]: ./principles.html#CARE-E1 "For minimizing harm and maximizing benefit "

[CARE-E2]: ./principles.html#CARE-E2 "For justice "

[CARE-E3]: ./principles.html#CARE-E3 "For future use"


[FAIR]: ./principles.html#FAIR "FAIR Principles"

[FAIR-F]: ./principles.html#FAIR-F "Findable"

[FAIR-F1]: ./principles.html#FAIR-F1 "(meta)data are assigned a globally unique and *persistent* identifier"

[FAIR-F2]: ./principles.html#FAIR-F2 "data are described with rich metadata (defined by R1 below)"

[FAIR-F3]: ./principles.html#FAIR-F3 "metadata clearly and explicitly include the identifier of the data it describes"

[FAIR-F4]: ./principles.html#FAIR-F4 "(meta)data are registered or indexed in a searchable resource"

[FAIR-A]: ./principles.html#FAIR-A "Accessible"

[FAIR-A1]: ./principles.html#FAIR-A1 "(meta)data are retrievable by their identifier using a standardized communications protocol"

[FAIR-A2]: ./principles.html#FAIR-A2 "metadata are accessible, even when the data are no longer available"

[FAIR-I]: ./principles.html#FAIR-I "Interoperable"

[FAIR-I1]: ./principles.html#FAIR-I1 "(meta)data use a formal, accessible, shared, and broadly applicable language for knowledge representation. (See )"

[FAIR-I2]: ./principles.html#FAIR-I2 "(meta)data use vocabularies that follow FAIR principles"

[FAIR-I3]: ./principles.html#FAIR-I3 "(meta)data include qualified references to other (meta)data"

[FAIR-R1]: ./principles.html#FAIR-R1 "meta(data) are richly described with a plurality of accurate and relevant attributes"

[FAIR-R1.1]: ./principles.html#FAIR-R1:1 "(meta)data are released with a clear and accessible data usage license"

[FAIR-R1.2]: ./principles.html#FAIR-R1:2 "(meta)data are associated with detailed provenance"

[FAIR-R1.3]: ./principles.html#FAIR-R1:3 "(meta)data meet domain-relevant community standards"

[BagIt]: https://en.wikipedia.org/wiki/BagIt