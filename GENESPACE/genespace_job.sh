#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=genespace
#SBATCH --output=/share/BioinfMSc/rot3_group3/GENESPACE/GENESPACE_logs/GENESPACE.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/GENESPACE/GENESPACE_logs/GENESPACE.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile

conda activate genespace4

Rscript /share/BioinfMSc/rot3_group3/GENESPACE/run_genespace.R

conda deactivate 
