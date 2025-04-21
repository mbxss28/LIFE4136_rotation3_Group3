getwd()

library(Biostrings)

# Set working directory to where the files are
setwd("C:/Users/44794/OneDrive - The University of Nottingham/Documents/Thomas R")

# Load the CDS FASTA files
dip1_cds <- readDNAStringSet("Dip1.cds.fasta")
dip2_cds <- readDNAStringSet("Dip2.cds.fasta")

# Translate 
dip1_proteins <- translate(dip1_cds)
dip2_proteins <- translate(dip2_cds)

# Clean up the FASTA headers
names(dip1_proteins) <- gsub(" .*", "", names(dip1_proteins))
names(dip2_proteins) <- gsub(" .*", "", names(dip2_proteins))

# Write the protein FASTA files
writeXStringSet(dip1_proteins, "hap1.proteins.fasta")
writeXStringSet(dip2_proteins, "hap2.proteins.fasta")

getwd()

load("C:/Users/44794/OneDrive - The University of Nottingham/Documents/Thomas R/gsParams.rda")

invchr <- data.frame(
  genome = c("hap1", "hap2"), 
  chr = c("RL_1", "RL_2", "RL_3", "RL_4", "RL_5", "RL_6", "RL_7", "RL_8") 
)

library(GENESPACE)

install.packages("devtools")

ripDat <- plot_riparian(
  gsParam = gsParam,
  pdfFile = paste(gsParam$paths$riparian, "/MyOrder_SmlChrs.rip.pdf", sep = ""),
  refGenome = "hap1", 
  syntenyWeight = 1,
  minChrLen2plot = 0,
  invertTheseChrs = invchr,
  chrLabFun = function(x) gsub("^0", "", tolower(x)),
  genomeIDs = c("hap1", "hap2") # Modify with your plant species
)


# Change temp directory for package installation
Sys.setenv(TMPDIR = "C:/temp")
install.packages("devtools")
