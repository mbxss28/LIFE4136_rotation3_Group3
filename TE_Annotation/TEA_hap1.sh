#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=50g
#SBATCH --time=24:00:00
#SBATCH --job-name=TE_hap1
#SBATCH --output=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurmslurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate RepeatMasker

cd /share/BioinfMSc/rot3_group3

RepeatMasker -pa 4 -species "Arabidopsis thaliana" -gff C087_203_mapq_hap1_8.fa

conda deactivate
