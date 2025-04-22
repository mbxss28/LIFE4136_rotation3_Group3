# Synteny plots
workflow of SyRI analysis
 
## MUMmer
SyRI is a tool used to measure synteny between two different chromosome alignments. because of this MUMmer was used to generate alignments to be used for synteny analysis.Alignments where done between the whole genomes as well as the regions of interest hap1(RL_5) and hap2(RL_2) The output files are.

.delta - alignment files

.filtered.delta - filtered alignment files

these files are created when plotting alingiments
.rplot - reverse hits

.fplot - forward hits

.png - image of plots

## Syri
Once the MUMer .filtered.delta files are produced 



### Link to tools

[SyRI](https://github.com/schneebergerlab/syri)

[mummer](https://github.com/mummer4/mummer)

### References

SyRI - Goel, M., Sun, H., Jiao, W. et al. SyRI: finding genomic rearrangements and local sequence differences from whole-genome assemblies. Genome Biol 20, 277 (2019) doi:10.1186/s13059-019-1911-0

MUMmer - Marçais, G., Delcher, A.L., Phillippy, A.M., Coston, R., Salzberg, S.L. and Zimin, A., 2018. MUMmer4: A fast and versatile genome alignment system. PLoS computational biology, 14(1), p.e1005944.
