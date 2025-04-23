## Gene annotation

For gene annotation two different gene annotation software where used Augustus and the web based version of helixer. The input for these software was pre-provided .fa files C087_203_mapq_hap1_8.fa and C087_203_mapq_hap2_8.fa corrasponding to the the different haploids used. 

Gene annotation was performed on both the whole genome and specific regions of interest within the two haploid samples (hap1 RL_5 and hap2 RL_2) which were identifed via seperate analysis.To extract these files samtools where used. The output of these files was gff files though due to issues extracting protein sequence information from these gff files, they were converted using the gffread package into GTF files.

Using these GTF files CDS, protein and exon fasta files where generated though only the protein fasta files are necessary for further analysis. 

## Blast

blastp specifically was used for the purposes of this analysis looking at the specific regions of interest, hap1 RL_5 and hap2 RL_2 with these regoins being highly homologous to one another, with the blast search being down to look for any potential difference between them, specifically looking at differences in potein products. For this the non-redundant protein database(nr) was used for the search, however due to the size of the query sequences being used the search had to be done locally.

The nr database was downloaded from [nr](https://ftp.ncbi.nlm.nih.gov/blast/db/) using the get_nr.sh script and downloaded into a directory named nr. Once downloaded blastp was used with the output of the blast search being .txt files. The blast searches for the different haploid regions was done separtly to allow searches to be done simultaneously.


## GENESPACE
Genespace is tool used to compare the synteny and orthology of genomic samples. For this part of the analysis protein fa files and bed files of the entire hap1 and hap2 genomes where used. 

### Protein .fa files 
This step is rather simple since it these files have already been generated, the change with these files was that the "_" was removed from the gene ids to make sure no issues arose during the genespace analysis. This was done with the command 

cat proteins.fasta | tr -d "." > proteins.fa

Once produced both the fa files where copied into the the peptide directory with the genespace working directory that is designated within GENESPACE.R. 

### bed
For the generation of the bed files, the previously made gtf files where first filtered to remove special characters such as "_" , ";" and to remove rows only containing transcript information is present since GENESPACE can sometimes have issues when CDS or exon data is present. This was done with this command:

cat example.gtf | tr -d \" | tr -d ";" | tr -d "."| tr -d "_" | grep -v "exon" | grep -v "CDS" > example.gff

Within the script that was used to convert the filter the gtf files they are converted into gff files, because GENESPACE does have an in built function (parse_annotatin) to convert GFF and fasta files into .fa and .bed files. If that does not work however you can instead make the .bed files manually by removing columns so only chr,start,end and transcript_id columns are left using this command:

cat example.gff | awk '{print $1,$2,$3,$9}' > example.bed

the column with the transcript id is kept rather than the gene ids since the transcript ids match those in the .fa files which is necessary for genespace to function.

Once the bed files are made they need to be copied into the bed directory in the genespace working directory designated within GENESPACE.R.

### Running genespace
To run genespace a conda env was created in which orthofinder, MSX and R where installed into and for the purposes of this analysis this command:

R

Was used to activate R via the command line and then used to install GENESPACE using: 
devtools::install_github("jtlovell/GENESPACE")
BiocManager::install("rtracklayer")


Once installed the run_r.sh script was used to activate the genespace env that contained all the necessary packages and then used to run the GENESPACE.R script within that env. During the process of running genespace several directories should automatically be created with the necessary data produced via genespace being automatically placed within those directoies, such as specific information produced from orthofinder, synteny analysis and blast being put into .txt.gz files. Along side this pdfs of the riparian plots and dotplots are also produced.



### Workflow of scripts 

gene_ann.sh

region.sh

samtools.sh

read.sh

read_region.sh

getnr.sh

blast.sh/blast2.sh

whole_extract.sh

run_r.sh

### installation

Exact installation steps for all the packages used in this analyisis will be shown in 
[requiments](https://github.com/mbxss28/LIFE4136_rotation3_Group3/blob/main/GENE_Annotatition/requirements.txt).



### Link to tools
[Augustus](https://github.com/Gaius-Augustus/Augustus)

[Blast](https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html)

[GENESPACE](https://github.com/jtlovell/GENESPACE/blob/master/)

[gffread](https://ccb.jhu.edu/software/stringtie/gff.shtml#gffread)

[helixer](https://www.plabipd.de/helixer_main.html)

[MCScanX](https://github.com/wyp1125/MCScanX)

[Orthofinder](https://github.com/davidemms/OrthoFinder)

[Samtools](https://www.htslib.org/doc/samtools-faidx.html)

### References 

Camacho, C., Coulouris, G., Avagyan, V., Ma, N., Papadopoulos, J., Bealer, K., and Madden, T.L. 2009. BLAST+: architecture and applications. BMC Bioinformatics, 10, 421.

Danecek, P., Bonfield, J.K., Liddle, J., Marshall, J., Ohan, V., Pollard, M.O., Whitwham, A., Keane, T., McCarthy, S.A., Davies, R.M. and Li, H., 2021. Twelve years of SAMtools and BCFtools. Gigascience, 10(2), p.giab008.

Emms, D.M. and Kelly, S., 2019. OrthoFinder: phylogenetic orthology inference for comparative genomics. Genome biology, 20, pp.1-14.

Lovell, J.T., Sreedasyam, A., Schranz, M.E., Wilson, M., Carlson, J.W., Harkess, A., Emms, D., Goodstein, D.M. and Schmutz, J., 2022. GENESPACE tracks regions of interest and gene copy number variation across multiple genomes. elife, 11, p.e78526.

Mario Stanke, Mark Diekhans, Robert Baertsch, David Haussler (2008). Using native and syntenically mapped cDNA alignments to improve de novo gene finding. Bioinformatics, 24(5), pages 637–644, doi: 10.1093/bioinformatics/btn013.

Pertea, G. and Pertea, M., 2020. GFF utilities: GffRead and GffCompare. F1000Research, 9, pp.ISCB-Comm.

Stiehler, F., Steinborn, M., Scholz, S., Dey, D., Weber, A.P. and Denton, A.K., 2020. Helixer: cross-species gene annotation of large eukaryotic genomes using deep learning. Bioinformatics, 36(22-23), pp.5291-5298.

Yupeng, W., Haibao, T., Debarry, J.D., Xu, T., Jingping, L., Xiyin, W., Tae-Ho, L., Huizhe, J., Barry, M. and Hui, G., 2012. MCScanX: a toolkit for detection and evolutionary analysis of gene synteny and collinearity. Nucleic Acids Res, 40(7), p.e49.
