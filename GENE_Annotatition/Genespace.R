#load library
library(GENESPACE)
#library(gridExtra)
#library(ggplot2)

wd <- "/share/BioinfMSc/rot3_group3/gene_annotation/genespace"

path2mcscanx <- "/gpfs01/home/mbxss28/miniconda3/envs/genespace/bin"   
              
options(datatable.allow.cartesian = TRUE)
options(datatable.verbose = TRUE)

gpar <- init_genespace(
  genomeIDs = c("hap1","hap2"),
  wd = wd,
  pepString = "fa",
  nCores = 1,
  path2mcscanx = path2mcscanx)
  


#str(gpar$params)

out <- run_genespace(gsParam = gpar) 

#plot_riparian(gpar, syntenyWeight = 1)
