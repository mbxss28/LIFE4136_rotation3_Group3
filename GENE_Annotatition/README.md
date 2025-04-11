For gene annotation two different gene annotation software where used Augustus and the web based version of helixer. The input for these software was pre-provided .fa files C087_203_mapq_hap1_8.fa and C087_203_mapq_hap2_8.fa corrasponding to the the different haploids used. 

Gene annotation was performed on both the whole genome and specific regions of interest within the two haploid samples (hap1 RL_5 and hap2 RL_2) which were identifed via seperate analysis. The output of these files was gff files though due to issues extracting protein sequence information from these gff files, they were converted using the gffread package into GTF files.













Augustus - [https://github.com/Gaius-Augustus/Augustus]

gffread - [https://ccb.jhu.edu/software/stringtie/gff.shtml#gffread]

helixer - [https://www.plabipd.de/helixer_main.html]
