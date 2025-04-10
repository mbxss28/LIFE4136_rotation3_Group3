#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=100g
#SBATCH --time=7-00:00:00
#SBATCH --job-name=blast1
#SBATCH --output=/share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.out
#SBATCH --error=//share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

conda activate blast1

blastp -query hap2_regionprot.fasta -db nr/nr -out proteinsregion2_blastp.txt -evalue 1e-30

conda deactivate
