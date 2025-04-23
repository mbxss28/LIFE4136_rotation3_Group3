# Synteny plots
workflow of SyRI analysis
 
## MUMmer
SyRI is a tool used to measure synteny between two different chromosome alignments. because of this MUMmer was used to generate alignments to be used for synteny analysis.Alignments where done between the whole genomes as well as the regions of interest hap1(RL_5) and hap2(RL_2). To produce the RL_5 and RL_2 files samtools was used using these commands.

samtools faidx C087_203_mapq_hap2_8.fa 
samtools faidx C087_203_mapq_hap2_8.fa

producing .fa.fai files which where used to make the scaffolds:

samtools faidx C087_203_mapq_hap1_8.fa.fai scaffold5:16000000-23979000 > hap1scaf5.fa
samtools faidx C087_203_mapq_hap2_8.fa.fai scaffold2:8923000-19004000 > hap2scaf2.fa

once these files where created MUMmer was used to create these files:

.delta - alignment files

.filtered.delta - filtered alignment files

these files are created when plotting alingiments:

.rplot - reverse hits

.fplot - forward hits

.png - image of plots

## Syri
Once the MUMer .filtered.delta files are produced they are used along side accompanying  C087_203_mapq_hap1_8.fa and C087_203_mapq_hap2_8.fa whiles for the whole genome synteny analysis, and for the comparisons for the regions of interest hap1scaf5.fa/hap2scaf2.fa.

Syri produces .vcf file

syri.out
syri.err

To plot the Syri results these commands where used.

cut -f1,2 hap1scaf5.fa > hap1scaf5.txt







### Link to tools

[SyRI](https://github.com/schneebergerlab/syri)

[mummer](https://github.com/mummer4/mummer)

### References

SyRI - Goel, M., Sun, H., Jiao, W. et al. SyRI: finding genomic rearrangements and local sequence differences from whole-genome assemblies. Genome Biol 20, 277 (2019) doi:10.1186/s13059-019-1911-0

MUMmer - Marçais, G., Delcher, A.L., Phillippy, A.M., Coston, R., Salzberg, S.L. and Zimin, A., 2018. MUMmer4: A fast and versatile genome alignment system. PLoS computational biology, 14(1), p.e1005944.
