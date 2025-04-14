#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=10g
#SBATCH --time=02:15:00
#SBATCH --job-name=EDTA_hap2
#SBATCH --output=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate samtools

cd /share/BioinfMSc/rot3_group3/TE_annotation

samtools faidx C087_203_mapq_hap1_8.fa RL_5:16000000-23979000 > hap1testing_scaf5.fasta

conda deactivate 
