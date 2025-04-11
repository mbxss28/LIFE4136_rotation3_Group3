## Gene annotation

For gene annotation two different gene annotation software where used Augustus and the web based version of helixer. The input for these software was pre-provided .fa files C087_203_mapq_hap1_8.fa and C087_203_mapq_hap2_8.fa corrasponding to the the different haploids used. 

Gene annotation was performed on both the whole genome and specific regions of interest within the two haploid samples (hap1 RL_5 and hap2 RL_2) which were identifed via seperate analysis. The output of these files was gff files though due to issues extracting protein sequence information from these gff files, they were converted using the gffread package into GTF files.

Using these GTF files CDS, protein and exon fasta files where generated though only the protein fasta files are necessary for further analysis. 

## Blast

blastp specifically was used for the purposes of this analysis looking at the specific regions of interest, hap1 RL_5 and hap2 RL_2 with these regoins being highly homologous to one another, with the blast search being down to look for any potential difference between them, specifically looking at differences in potein products. For this the non-redundant protein database(nr) was used for the search, however due to the size of the query sequences being used the search had to be done locally.

The nr database was downloaded from [https://ftp.ncbi.nlm.nih.gov/blast/db/] using the get_nr.sh script and downloaded into a directory named nr. Once downloaded the blastp was used with the output of the blast search being .txt files.





### References
Augustus v.3.2.3 - [https://github.com/Gaius-Augustus/Augustus]

 BLAST 2.16.0+

gffread v.0.12.7 - [https://ccb.jhu.edu/software/stringtie/gff.shtml#gffread]

helixer - [https://www.plabipd.de/helixer_main.html]
