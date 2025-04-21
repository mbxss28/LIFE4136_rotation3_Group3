# Telomere and Centromere annotation

### Requirments
To run quarTeT the packages from [Requirments](https://github.com/mbxss28/LIFE4136_rotation3_Group3/blob/main/Repeats_Annotation/requirements.txt) need to be install in a env using this command conda create -n example --channel conda-forge --channel bioconda python=3.11.4. After installing this command :

git clone https://github.com/aaranyue/quarTeT 

into the working directory being used rather than installing it into the conda env that was created. The instructions for this pipeline come from the [quarTeT](https://github.com/aaranyue/quarTeT) page.


From the quarTeT page specifically CentroMiner and TeloExplorer where used to identify centromere and teleomere canidates with the -c plant clade option being used for the run. The output of TeloExplorer is a a .txt file containing information on what repeat was found, a .info file which contains information on what repeat was found, which chromosome the repeat was found and whether the repeat was found on both teleomeres, one or none.

Fr CentroMiner 






### Links to tools

[quarTeT](https://github.com/aaranyue/quarTeT)
