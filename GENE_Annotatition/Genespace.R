#load library
library(GENESPACE)

#setting necessary directories 
wd <- "/share/BioinfMSc/rot3_group3/gene_annotation/genespace"
path2mcscanx <- "/gpfs01/home/mbxss28/miniconda3/envs/genespace/bin"   


options(datatable.allow.cartesian = TRUE)
options(datatable.verbose = TRUE)

#setting of parameters for the genespace analysis, when not specified all the values are the default options
gpar <- init_genespace(
  genomeIDs = c("hap1","hap2"),
  wd = wd,
  pepString = "fa",
  nCores = 1,
  path2mcscanx = path2mcscanx)
  
#runs genespace
out <- run_genespace(gsParam = gpar) 

