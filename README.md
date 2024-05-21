# Protocols for Implementing Long-term Archival Repositories Services (PILARS)

This respository is for the management of the PILARS Protocols.

## Audience

This repository is for the use of the PILARS collaborators to maintain the Protocols document and a few supporting documents. 

Others may comment or contribute using Github Issues

## Repository Layout

The organization of the is repository is as follows:

- [`src/`](./src) contains the source from which the repository is generated
  - `src/index.md` -- the protocols document -- this has a persistent identifier <https://w3id.org/ldac/pilars>
  - `src/principles.md` 
  - `src/implementation-and-guidance.md`
  - `src/PILARS.bib` -- Refernces in bibtex format (Peter Sefton has a)
- [`doc/`](./doc) COntains HTML files with names corresponding

## How to publish this website

To edit this website you will need:

- An operating system that supports Unix-like commands such as `Make` 

### Getting set up

- Install Pandoc if you don't already have it (on MacOS) type:
  `brew install pandoc`


### Editing

The source documents use Pandoc Markdown format. 

To add a reference, add it to the bibtex file `src/PILARS.bib` and use an @referene

- To build the documents, type: `make doc`

  This will run pandoc and prduce the HTML website in `docs` from the markdown source files

-  To preview the site view it from your local file system in a web browser


- To Publish, do a pull request [TODO: Not sure how to describe this process properly]
