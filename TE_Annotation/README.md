# Transposable element annotation

## EDTA
Before running a curated library was created to help with the EDTA search and maintaing of TE familes such as SINEs.

EDTA used the 087_203_mapq_hap1_8.fa and 087_203_mapq_hap2_8.fa files and accompning fasta files containing information of the CDS sequences for the search with output files being gff files of the TE annotations for the seperate genomes as well as pdfs of TE density and divergence of TEs.

## Repeat masker

This tool is generally used for repeat sequences in general, however due to the fact that many TEs are repeats it can be used for TE annotation as well, with "Arabidopsis thaliana" being used for the species since it is closly related to "Cardamine Amara". The output of repeat masker is:

.gff - contains information of motifs found at specific genomic locations.

.out - columns are SW score, perc.div, perc.del, perc.in, query sequence, start position, end position, reapeat, repeat family.
perc.div - percentage divergence
perc.del - percentage deletion
perc.in - percentage insertion

.tbl - shows summary of different retro transposon elements measuring: Number of elements, length occupied and percentage of sequence. Outside of this information of the percentage of sequences that do not fit into any retro transposon element family. 


### Link to tools
[EDTA](https://github.com/oushujun/EDTA)

[RepeatMasker](https://github.com/Dfam-consortium/RepeatMasker)

### References

EDTA - Ou, S., Su, W., Liao, Y., Chougule, K., Agda, J.R., Hellinga, A.J., Lugo, C.S.B., Elliott, T.A., Ware, D., Peterson, T. and Jiang, N., 2019. Benchmarking transposable element annotation methods for creation of a streamlined, comprehensive pipeline. Genome biology, 20, pp.1-18.

RepeatMasker - Chen, N., 2004. Using Repeat Masker to identify repetitive elements in genomic sequences. Current protocols in bioinformatics, 5(1), pp.4-10.
