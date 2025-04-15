
library(GENESPACE)

# Set up working dir and path to MCScanX
wd <- "/share/BioinfMSc/rot3_group3/GENESPACE/hap1_2genespace/"
path2mcscanx <- "~/miniconda3/envs/genespace4/bin/" 

# Initialise GENESPACE


genomeIDs = c("hap1","hap2")
gpar <- init_genespace(
  wd = wd,
  path2mcscanx = path2mcscanx,
  genomeIDs = genomeIDs
)

#Run¡
out <- run_genespace(gpar, overwrite = TRUE)

