# Telomere and Centromere annotation

### Requirments
To run quarTeT the packages from [Requirments](https://github.com/mbxss28/LIFE4136_rotation3_Group3/blob/main/Repeats_Annotation/requirements.txt) need to be install in a env using this command conda create -n example --channel conda-forge --channel bioconda python=3.11.4. After installing this command :

git clone https://github.com/aaranyue/quarTeT 

into the working directory being used rather than installing it into the conda env that was created. The instructions for this pipeline come from the [quarTeT](https://github.com/aaranyue/quarTeT) page.


From the quarTeT page specifically CentroMiner and TeloExplorer where used to identify centromere and teleomere canidates with the -c plant clade option being used for the run. The output of TeloExplorer is a: 

.txt - contains information of what teleomere repeat was found and if .info and .png files are created.

.info file which contains information on what repeat was found, which chromosome the repeat was found and whether the repeat was found on both teleomeres, one or none.

.png - files showing the plots of the teleomeres.

For CentroMiner the only requirement is the C087_203_mapq_hap1_8.fa and C087_203_mapq_hap2_8.fa files with the output being the creation of two directorys one called "Canidates" which contains:

.canidate - contains information on the chromosome, start, end, length, TR length TR coverage. With this file telling you which centromere canidates there are with files for each chromosome. 


### Links to tools

[quarTeT](https://github.com/aaranyue/quarTeT)

### References 

quarTET - Lin, Y., Ye, C., Li, X., Chen, Q., Wu, Y., Zhang, F., Pan, R., Zhang, S., Chen, S., Wang, X. and Cao, S., 2023. quarTeT: a telomere-to-telomere toolkit for gap-free genome assembly and centromeric repeat identification. Horticulture research, 10(8), p.uhad127.
