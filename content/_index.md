---
title: "Home"
menu: "main"
---

<script>
  ((window.gitter = {}).chat = {}).options = {
    room: 'biocompute-objects/BCO_Specification'
  };
</script>
<script src="https://sidecar.gitter.im/dist/sidecar.v1.js" async defer></script>

<div class="col-lg-6 offset-lg-3 text-center">
<img src="/images/logo.about.png" class="img-fluid mx-auto d-block" width="75%" alt="BioCompute Logo">
</div>

<br>

### The BioCompute Standard

IEEE 2791-2020 (colloquially "BioCompute") is a descriptive standard for documenting workflows with very strong data provenance, descriptive metadata, and user attribution. The standard is supported by large genomics and bioinformatics platforms (like Velsera's [Seven Bridges Genomics](https://www.sevenbridges.com/) platform, [DNAnexus](https://www.dnanexus.com/), [Galaxy](https://usegalaxy.org/), and [HIVE](https://dnahive.fda.gov/dna.cgi?cmd=login&follow=home)), and can be used in combination with workflow languages for better portability of execution, such as [Common Workflow Language](https://www.commonwl.org/) and [Nextflow](https://www.nextflow.io/).

The standard, officially known as IEEE 2791-2020, has two parts: the standards document and the schema, the latter of which is maintained in an open source repository:

- **The current version of the standard can be found [here](https://standards.ieee.org/standard/2791-2020.html)**.
- **The schema can be found [here](https://opensource.ieee.org/2791-object/ieee-2791-schema)**.

Since the base BioCompute schema is maintained as an open source repository, it can be cloned and integrated into an organization in unique ways, which allows organizations to build off of this schema to create dependent standards for specific applications. This is similar to the different versions of WiFi based on usage, such as the 802.11a standard for fast speed, but high cost and shorter range, or the 802.11b for slower top speed, but lower cost, etc. --- all of which are built on the 802.11 base standard. It can also be used to further extend the schema, such as for handling proprietary, internal content, while still being compatible with the base standard. The open source schema also enables individuals or organizations to suggest changes to be incorporated into future versions the standard.

### Background
The idea was originally conceived of in 2012 during NCBI planning meetings for what would ultimately become the [BioProject](https://www.ncbi.nlm.nih.gov/books/NBK169438/). It was proposed that a model also be generated for structured metadata that could be computed on. This would enable better traceability, statistics gathering, identification of common errors, and, most importantly, would give a recipient a sense of where a particular piece of data came from or how some particular assertion was arrived at -- particularly useful for repositories and knowledgebases. The idea was not well-formed enough to make it into BioProject, but the seed for the idea was planted.

The FDA began grappling with a need for better workflow documentation around the same time. FDA reviewers and industry sponsors wanted a way to formalize exactly what information needed to be present in a regulatory submission in order to make an informed scientific decision, and in what way it needed to be represented. In 2014, what was then known as the Genomics Working Group convened special sessions to address the issue. The idea originally proposed in 2012 at NCBI -- which by now was being called "BioCompute" --  was proposed and accepted.

After several planning meetings to articulate the problem statement and project goals, workshops, discussion groups, publications, collaborations and partnerships, testing, and input from hundreds of individuals across dozens of institutions, the final data model for the project was agreed on and officially standardized through IEEE in 2020. Within months, it was adopted by the FDA for regulatory submissions, and remains the only data framework standard ever to have been adopted by the FDA's data standards catalog.

Since then, the focus has shifted to building an ecosystem of tools, packages, and plugins for working with the standard, including support in the aforementioned bioinformatics platforms. This includes our own open source tool, the [BioCompute Portal](https://biocomputeobject.org/), for creating, editing, sharing, publishing, and viewing BioCompute Objects (BCOs; a BCO is an instance of a workflow written in conformance with the standard), including support for working with BCOs programmitically via API. One of the strongest original use cases was for medical devices, but the project has largely been used in high-throughput sequencing-based workflows, and for knowledgebase documentation (for example, the NIH Common Fund [GlyGen](https://www.glygen.org/) knowledgebase of glycans and glycoconjugates, and the FDA sponsored [Argos](https://data.argosdb.org/) repository of regulatory-grade infectious disease genomes).

### Citation
This standard was originaly prepared by The BioCompute Object working group during preparation for the [2017 HTS Computational Standards for Regulatory Sciences Workshop](https://hive.biochemistry.gwu.edu/htscsrs/workshop_2017).

To reference the BCO standards, please use the following
citations inclusive of the DOI:

Simonyan, V., Goecks, J., & Mazumder, R. (2017). ***Biocompute Objects — A Step towards Evaluation and Validation of Biomedical Scientific Computations.*** PDA Journal of Pharmaceutical Science and Technology, 71(2), 136–146. doi: [10.5731/pdajpst.2016.006734](http://doi.org/10.5731/pdajpst.2016.006734).

Alterovitz et al. (2018). ***Enabling precision medicine via standard communication of HTS provenance, analysis, and results.*** PLoS Biology, 16(12), e3000099. doi: [10.1371/journal.pbio.3000099](http://doi.org/10.1371/journal.pbio.3000099).

## Support, Community and Contributing

To suggest changes to [this repository](https://github.com/biocompute-objects/BCO_Specification) we welcome contributions as a [pull request](https://github.com/biocompute-objects/BCO_Specification/pulls) or [issue](https://github.com/biocompute-objects/BCO_Specification/issues) submission.

BCO_Specification is licensed under the [BSD 3-Clause "New" or "Revised" License](https://github.com/biocompute-objects/BCO_Specification/blob/main/LICENSE.md)

>A permissive license similar to the BSD 2-Clause License, but with a 3rd clause that prohibits others from using the name of the project or its contributors to promote derived products without written consent.
