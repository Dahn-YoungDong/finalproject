# Phylogenetic Biology - Final Project

## Guidelines - you can delete this section before submission

This repository is a stub for your final project. Fork it, develop your project, and submit it as a pull request. Edit/ delete the text in this readme as needed.

Some guidelines and tips:

- Use the stubs below to write up your final project. Alternatively, if you would like the writeup to be an executable document (with [knitr](http://yihui.name/knitr/), [jupytr](http://jupyter.org/), or other tools), you can create it as a separate file and put a link to it here in the readme.

- For information on formatting text files with markdown, see https://guides.github.com/features/mastering-markdown/ . You can use markdown to include images in this document by linking to files in the repository, eg `![GitHub Logo](/images/logo.png)`.

- The project must be entirely reproducible. In addition to the results, the repository must include all the data (or links to data) and code needed to reproduce the results.

- If you are working with unpublished data that you would prefer not to publicly share at this time, please contact me to discuss options. In most cases, the data can be anonymized in a way that putting them in a public repo does not compromise your other goals.

- Paste references (including urls) into the reference section, and cite them with the general format (Smith at al. 2003).

- Commit and push often as you work.

OK, here we go.

# Population tree construction and spatially-explicit admixture mapping

## Introduction and Goals

Yale Myer’s Forests (YMF) in northeastern Connecticut has distributions of populations of wood frogs (*Rana sylvatica*), and Skelly's lab has been recording long-term population dynamics, phenotypic and abiotic environment data that show rapid evolution is occurring (Freidenburg and Skelly, 2004; Skelly, 2004; Ligon and Skelly, 2009). That is, the populations are diverging in their physiological and morphological traits based on the local environments over generations. What requires to substantiate this ecological observation further is to explore the genetics. Previous effort to study microsatellite markers have not been successful in showing the population divergence or clustering at such microgeographical scale. 


With the availability of genome-wide SNPs for a few dozens of populations of *Rana sylvatica* from the year of 2018, and the understanding of presumably genetic-based and non-plastic local adaptations for populations that are physically in proximity to each other, few questions arise:
1. how are these populations related to each other phylogenetically, 
2. which groups are older lineages and which groups are later colonized (admixture),
3. what is the spatial pattern of current population distribution and colonial history, and is there a clear narrative?

My collaborator A. Z. Andis Arietta did the collection, filter and processing of the genomic data. And a VCF file with post-processed genomic data is available for use. The dataset contains 277 individual SNP sequences from 41 populations at focal site, YMF, and then three outgroup populations from New Haven Co. and Guilford Co. Connecticut. The are a few things and related methods I will need to approach my questions.

1. Use program TreeMix to make inference of patterns of population splitting and mixing from genomewide allele frequency data 
2. Spatially visualizing genetic clusters with maps of population admixture coefficients

Completion of 1 would be satisfactory for my final project; inclusion of successful analysis for 2 would be well done

## Methods

The tools I used were... See analysis files at (links to analysis files).

## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

Freidenburg, L. K., and Skelly, D. K. (2004). Microgeographical variation in thermal preference by an amphibian. Ecol. Lett. 7, 369–373. doi:10.1111/j.1461-0248.2004.00587.x.

Ligon, N. F., and Skelly, D. K. (2009). Cryptic divergence: countergradient variation in the wood frog. Evol. Ecol. Res. 11, 1099–1109. http://www.evolutionary-ecology.com/issues/v11/n07/jjar2510.pdf

Skelly, D. K. (2004). Microgeographic countergradient variation in the wood frog, Rana sylvatica. Evolution 58, 160–165. doi:10.1111/j.0014-3820.2004.tb01582.x.

Narasimhan, V., Danecek, P., Scally, A., Xue, Y., Tyler-Smith, C., & Durbin, R. (2016). BCFtools/RoH: a hidden Markov model approach for detecting autozygosity from next-generation sequencing data. Bioinformatics, 32(11), 1749-1751.

Team, R. C. (2017). R: a language and environment for statistical computing. R Foundation for Statistical Computing, Vienna. http s. www. R-proje ct. org.

Purcell, S., Neale, B., Todd-Brown, K., Thomas, L., Ferreira, M. A., Bender, D., ... & Sham, P. C. (2007). PLINK: a tool set for whole-genome association and population-based linkage analyses. The American journal of human genetics, 81(3), 559-575.

Pickrell, J. K., & Pritchard, J. K. (2012). Supplementary Material for: Inference of population splits and mixtures from genome-wide allele frequency data.