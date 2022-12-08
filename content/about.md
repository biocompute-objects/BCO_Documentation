---
title: "About"
menu: "main"
---

<div class="col-lg-6 offset-lg-3 text-center">
<img src="/images/logo.about.png" class="img-fluid mx-auto d-block" width="75%" alt="BioCompute Logo">
</div>

<br>

### What is BioCompute?

Tremendous insights can be found in genome data, and many of these insights are being used to drive personalized medicine. But the hundreds of millions of reads that come from a gene sequencer represent small, nearly random fragments of the genome that's being sequenced, and there are countless ways in which that data can be transformed to yield insights into cancer, ancestry, microbiome dynamics, metagenomics, and many other areas of interest.

Because there are so many different platforms and so many different scripts and tools to analyze genome data, there is a great need to standardize the way in which these steps are communicated. The more analysis steps and the more complicated a pipeline, the greater the need for a standardized mechanism of communication. The BioCompute standard brings clarity to an analysis, making it clear and reproducible.

<div class="col-lg-10 offset-lg-1 text-center">
<img src="/images/about.3.png" class="img-fluid mx-auto d-block" alt="">
</div>

<br>

A BioCompute Object (BCO) is an instance of the BioCompute standard, and is a computational record of a bioinformatics pipeline. A BCO is not an analysis, but is a record of which analyses were executed and in exactly which ways. In this way, a BCO acts as an interface for existing standards. A BCO contains all of the necessary information to repeat an entire pipeline from FASTQ to result, and includes additional metadata to identify provenance and usage.

### WiFi Analogy

The [802.11 standard](https://en.wikipedia.org/wiki/IEEE_802.11) (more commonly called "WiFi") is a way of standardizing communication between vastly different products on a wireless network. If a product manufacturer wants a product to be able to communicate on a wireless internet network, they can configure the device to use the WiFi standard and it will be able to communicate with most commercial routers, regardless of whether the product is a Mac, a PC, a cell phone, or a smart toaster.

<div class="col-lg-8 offset-lg-2 text-center">
<img src="/images/about.4.png" class="img-fluid mx-auto d-block" alt="">
</div>

<br>

BioCompute fills a similar need. BioCompute is not an automation or a new programming language, it is a way of collecting and communicating information between two entities. Rather than a latop and a router, it may be between a pharmaceutical company and the FDA, or between two clinicians, or between a clinician and a researcher. In much the same way that WiFi does not standardize the data that's being transmitted -- allowing you to use Apple's Facetime, Microsoft's Internet Explorer, or your favorite cell phone app -- BioCompute does not standardize the platforms or tools that are used for genome analysis. You continue to use your favorite platforms and tools, whether it's [HIVE](https://hive.biochemistry.gwu.edu/dna.cgi?cmd=main), [Galaxy](https://galaxyproject.org/), [Seven Bridges](https://www.sevenbridges.com/), [DNAnexus](https://www.dnanexus.com/), or others. Also like WiFi, BioCompute can be layered with other privacy or security protocols depending on usage. So clinical trial data can be secured and HIPAA-compliant, while government-funded data sets shared between researchers can be completely open access.

Because BioCompute acts like an envelope for an entire analysis pipeline, it is compatible with other existing standards, including [FHIR Genomics](https://www.hl7.org/fhir/genomics.html) and [GA4GH](https://www.ga4gh.org/).

### BioCompute Description

BioCompute is written in [Javascript Object Notation (JSON)](https://json.org/example.html), which is simply a set of key:value pairs (meaning that raw files can be read without any knowledge of programming). Information within the BCO is organized into "domains." The domains within a BCO record are Provenance, Usability, Extension, Description, Execution, Input/Output, and Parametric Domains. For more information on the domains, please see the [BioCompute Schema](https://gitlab.com/IEEE-SA/2791/ieee-2791-schema).

BioCompute was built through a collaboration between The George Washington University and the FDA to improve communication of bioinformatics pipelines, and has since been expanded and refined through the participation or collaboration of hundreds of participants from throughout the public and private sectors. While we welcome interest and membership from anyone, most users will fall into one of three categories:

- Research Community <br>
  The Biocompute standard can help substantially improve replicability, making it possible to repeat a pipeline on a different sample with high fidelity and high confidence.

- Clinical Community <br>
  As BioCompute Objects become tested and validated, they can be applied in the clinic to identify risk factors, flag pharmakogenetic information, and much more.

- Pharma, Biotech and Regulatory Pipeline <br>
  Protracted communications with the FDA can extend the review process by months. A standardized method of communicating HTS data may help repeat results more quickly and without the need for additional communication.

Research, clinical, and regulatory groups are key drivers of personalized medicine that is based on next generation sequencing, but there are barriers between these groups. BioCompute reduces these hurdles and brings transparency to the workflow, making it more clear what was done, and clearly delineating expectations for data sharing. The BioCompute specification can be layered with other privacy and security protocols to guard sensitive data, or be made open source depending on the needs of the user.

The BioCompute project has generated two publications, three workshops, FDA funding, contributions from over 300 participants, and FDA submissions. The project has worked with individuals from NIH, Harvard, several biotech and pharma companies, EMBL-EBI, Galaxy Project, and many more, and can be integrated with any existing standard for HTS data. The project is expected to be both an IEEE and ISO recognized standard within 8-10 months.

More information about The current BioCompute standard can be found on the [Open Science Foundation website](https://osf.io/h59uh/) (where the standard is developed and maintained), the [HIVE](https://hive.biochemistry.gwu.edu/htscsrs/biocompute) website, and the [Research Objects discussion of BioCompute](http://www.researchobject.org/2017-11-27-biocompute-objects/).

<div class="col-lg-12 text-center">
<img src="/images/about.2.png" class="img-fluid mx-auto d-block" alt="">
</div>

<br>

<div class="alert alert-primary" role="alert">

**Milestones in the BioCompute Program**

The major milestones of the BioCompute Partnership and future goals are paving the way for a consensus-driven, widely adopted standard. The FDA's Genomics Working Group (GWG) originally articulated the challenges of communicating genomic analysis pipelines in a regulatory context in 2013. Since then, the project has accumulated tremendous momentum, a testament to the GWG's efforts in describing communication challenges. More recently, the second BioCompute publication has recently been published, the 4th Workshop is scheduled, and the next major goal is the formal launch of the BioCompute Public Private Partnership. The [Executive Committee](https://www.biocomputeobject.org/leadership.html) will formalize the future roadmap beyond these goals.

</div>

### GWU Members
<div class="row">

<div class="col-sm-3">
	
<div class="text-center">

<img src="/images/Mazumder.png" class="mx-auto d-block" width="80%" alt="Raja Mazumder">
<br>
Raja Mazumder<br>
<span class=leadershipsubtitlecn>
<b>Co-Founder</b><br>
</span>
<span>
<small>
<i>The George Washington University, DC</i><br>
</small>
</span>
</div>
<br>

</div>


<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Keeney.png" class="mx-auto d-block" width="80%" alt="">
<br>
Jonathon Keeney<br>
<span class=leadershipsubtitlecn>
<b>Project Lead</b><br>
</span>

<span>
<small>
<i>The George Washington University, DC</i><br>
</small>
<br>
</div>
</div>


<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/King.png" class="mx-auto d-block" width="80%" alt="">
<br>
Charles Hadley King<br>
<span class=leadershipsubtitlecn>
<b>Technical Lead</b><br>
</span>
<i>The George Washington University, DC</i><br>
<br>
</div>
</div>

<div class="col-sm-3">
<div class="text-center">
<img src="/images/Wang.jpg" class="mx-auto d-block" width="65%" alt="">
<br>
Tianyi Wang<br>
<span class=leadershipsubtitlecn>
<b>Outreach Lead</b><br>
</span>
<i>The George Washington University, DC</i><br>
</div>
</div>

### External Collaborator
<div class="row">
<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Dean.png" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Dennis Dean</b><br>
<span>
<small>
<i>Seven Bridges Genomics, MA</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Goecks.png" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Jeremy Goecks</b><br>
<span>
<small>
<i>Georgia Institute of Technology, GA</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Goble.png" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Carole Goble</b><br>
<span>
<small>
<i>University of Manchester, UK</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Alterovitz.png" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Gil Alterovitz</b><br>
<span>
<small>
<i>US Despt of Veterans Affairs, DC</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Simonyan.png" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Vahan Simonyan</b><br>
<span>
<small>
<i>CRISPR Therapeutics, DC</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Almeida.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Jonas Almeida</b><br>
<span>
<small>
<i>National Cancer Institute, MD</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Taylor.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Dan Taylor</b><br>
<span>
<small>
<i>Internet2</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Golikov.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Anton Golikov</b><br>
<span>
<small>
<i>Food and Drug Administration, MD</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Krampis.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Ntino Krampis</b><br>
<span>
<small>
<i>The City University of New York, NYC</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Crusoe.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Michael Crusoe</b><br>
<span>
<small>
<i>Common Workflow Language</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Soiland-Reyes.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Stian Soiland-Reyes</b><br>
<span>
<small>
<i>University of Manchester, UK</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/Karagiannis.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Konstantinos Karagiannis</b><br>
<span>
<small>
<i>Food and Drug Administration, MD</i><br>
</small>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
<div class="text-center">
<img src="/images/Thompson.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Elaine Thompson</b><br>
<span>
<i>Henry M Jackson Foundation for the Advancement of Military Medicine, MD</i><br>
</span>
<br>
</div>
</div>

<div class="col-sm-3">
<div class="text-center">
<img src="/images/Soranzo.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Nicola Soranzo</b><br>
<span>
<i>Galaxy Platform, UK</i><br>
<br>
</span>
</div>
</div>

<div>

### Former GWU Members
<div class="col-sm-3">
	
<div class="text-center">
<img src="/images/Patel.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Janisha Patel</b><br>
<span class=leadershipsubtitlecn>
George Washington University, DC<br>
<br>
</span>
</div>
</div>


### Former Collaborators

<div class="row">
<div class="col-sm-2">	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Ogan Abaan</b><br>
<span class=leadershipsubtitlecn>
Illumina<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Payal Banerjee</b><br>
<span class=leadershipsubtitlecn>
National Human Genome Research Institute<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Amanda Bell</b><br>
<span class=leadershipsubtitlecn>
Frederick National Laboratory for Cancer Research<br>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Surajit Bhatta-charya</b><br>
<span class=leadershipsubtitlecn>
Children's National Hospital<br>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Lee Black</b><br>
<span class=leadershipsubtitlecn>
-<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Ben Busby</b><br>
<span class=leadershipsubtitlecn>
DNAnexus<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Kristy Cloyd-Warwick</b><br>
<span class=leadershipsubtitlecn>
DNAnexus<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Ryan Connor</b><br>
<span class=leadershipsubtitlecn>
National Center for Biotechnology Information <br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Paul Duncan</b><br>
<span class=leadershipsubtitlecn>
The Janssen Pharmaceutical Companies of Johnson & Johnson<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Josep Gelpi</b><br>
<span class=leadershipsubtitlecn>
University of Barcelona<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Jeremy Goecks</b><br>
<span class=leadershipsubtitlecn>
Oregon Health and Science University<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Jonathan Jacobs</b><br>
<span class=leadershipsubtitlecn>
ATCC<br>
</span>
</div>
</div>

<div class="col-sm-2">
	
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Xiandong Meng</b><br>
<span class=leadershipsubtitlecn>
University of Science and Technology<br>
</span>
</div>
</div>


<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>David Michaels</b><br>
<span class=leadershipsubtitlecn>
George Washington University<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Hiroki Morizono</b><br>
<span class=leadershipsubtitlecn>
Children's National Medical Center<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Rahi Navelkar</b><br>
<span class=leadershipsubtitlecn>
Harcard Medical School<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Asa Oudes</b><br>
<span class=leadershipsubtitlecn>
Benchling<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Jason Travis</b><br>
<span class=leadershipsubtitlecn>
TGen<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Paul Walsh</b><br>
<span class=leadershipsubtitlecn>
Accenture<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Jianchao Yao</b><br>
<span class=leadershipsubtitlecn>
Merck<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>John Penn</b><br>
<span class=leadershipsubtitlecn>
DNAnexus<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br><b>Megan PotterSbusch</b><br>
<span class=leadershipsubtitlecn>
-<br>
</span>
</div>
</div>

<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Jonathan Pryke</b><br>
<span class=leadershipsubtitlecn>
AstraZeneca<br>
</span>
</div>
</div>


<div class="col-sm-2">
<div class="text-center">
<img src="/images/Anonymous.jpg" class="mx-auto d-block" width="80%" alt="">
<br>
<b>Dan Taylor</b><br>
<span class=leadershipsubtitlecn>
Internet2<br>
</span>
</div>
</div>

</div>

<!-- <div class="row">
<div class="col-sm-3">	
<div class="text-center">
<img src="/images/internet2.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/hjf.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/gwu.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/embleema.jpg" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/cuny.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/US_Department_of_Veterans_Affairs_vertical_logo.svg.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/NCI.jpg" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/FDA.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/Earlham_Institute.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/CWL.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div>

<div class="col-sm-3">	
<div class="text-center">
<img src="/images/manchester.png" class="mx-auto d-block" width="60%" alt="">
</span>
</div>
</div> -->
