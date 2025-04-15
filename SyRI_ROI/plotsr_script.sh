#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=plotsr
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/plotsr.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/plotsr.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile

conda activate plotsr

INPUT="/share/BioinfMSc/rot3_group3/alignment"

plotsr --sr $INPUT/syri.out \
       --genomes $INPUT/genomes.txt \
       -o synteny_plot.png

conda deactivate 
