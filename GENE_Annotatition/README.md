## Gene annotation

For gene annotation two different gene annotation software where used Augustus and the web based version of helixer. The input for these software was pre-provided .fa files C087_203_mapq_hap1_8.fa and C087_203_mapq_hap2_8.fa corrasponding to the the different haploids used. 

Gene annotation was performed on both the whole genome and specific regions of interest within the two haploid samples (hap1 RL_5 and hap2 RL_2) which were identifed via seperate analysis. The output of these files was gff files though due to issues extracting protein sequence information from these gff files, they were converted using the gffread package into GTF files.

Using these GTF files CDS, protein and exon fasta files where generated though only the protein fasta files are necessary for further analysis. 

## Blast

blastp specifically was used for the purposes of this analysis looking at the specific regions of interest, hap1 RL_5 and hap2 RL_2 with these regoins being highly homologous to one another, with the blast search being down to look for any potential difference between them, specifically looking at differences in potein products. For this the non-redundant protein database(nr) was used for the search, however due to the size of the query sequences being used the search had to be done locally.

The nr database was downloaded from [https://ftp.ncbi.nlm.nih.gov/blast/db/] using the get_nr.sh script and downloaded into a directory named nr. Once downloaded the blastp was used with the output of the blast search being .txt files. It should be mentioned that the blast searches for the different haploid regions was done separtly to allow searches to be done at the same time.


## GENESPACE
Genespace is tool used to compare the synteny and orthology of genomic samples. For this part of the analysis protein fa files and bed files of the entire hap1 and hap2 genomes where used. 

### Protein .fa files 
This step is rather simple since it these files have already been generated, the change with these files was that the "_" was removed from the gene ids to make sure no issues arose during the genespace analysis. This was done with the command 

cat proteins.fasta | tr -d "." > proteins.fa

Once produced both the fa files where copied into the the peptide directory with the genespace working directory that is designated within GENESPACE.R. 

### bed
For the generation of the bed files, the previously made gtf files where first filtered to remove special characters such as "_" , ";" and to remove rows only containing transcript information is present since GENESPACE can sometimes have issues when CDS or exon data is present. This was done with this command

cat example.gtf | tr -d \" | tr -d ";" | tr -d "."| tr -d "_" | grep -v "exon" | grep -v "CDS" > example.gff

Within the script that was used to convert the filter the gtf files they are converted into gff files, because GENESPACE does have an in built function (parse_annotatin) to convert GFF and fasta files into .fa and .bed files. If that does not work however you can instead make the .bed files manually by removing columns so only chr,start,end and transcript_id columns are left using this command

cat example.gff | awk '{print $1,$2,$3,$9}' > example.bed

the column with the transcript id is kept rather than the gene ids since the transcript ids match those in the .fa files which is necessary for genespace to function.

Once the bed files are made they need to be copied into the bed directory in the genespace working directory designated within GENESPACE.R.

### Running genespace
To run genespace a conda env was created in which orthofinder, MSX and R where installed into and for the purposes of this analysis this command

R

was used to activate R on the command line and then GENESPACE was installed through their. Exact specific will be shown in the 



### Links 
Augustus v.3.2.3 - [https://github.com/Gaius-Augustus/Augustus]

BLAST 2.16.0+

GENESPACE v.1.3.1 - [https://github.com/jtlovell/GENESPACE/blob/master/]

gffread v.0.12.7 - [https://ccb.jhu.edu/software/stringtie/gff.shtml#gffread]

helixer - [https://www.plabipd.de/helixer_main.html]

MCScanX = [https://github.com/wyp1125/MCScanX]

Orthofinder v.2.5.5 = [https://github.com/davidemms/OrthoFinder]
