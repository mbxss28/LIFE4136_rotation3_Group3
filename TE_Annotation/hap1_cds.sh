#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=150g
#SBATCH --time=24:00:00
#SBATCH --job-name=cds_hap1
#SBATCH --output=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurmslurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate BRAKER

cd /share/BioinfMSc/rot3_group3/

augustus --species=arabidopsis  C087_203_mapq_hap1_8.fa > hap1.gff

conda deactivate 
