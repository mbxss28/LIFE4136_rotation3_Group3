#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=gene_ann
#SBATCH --output=/share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.out
#SBATCH --error=//share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

#activating env in which samtools is installed
conda activate samtools

#setting paths of original .fa files
Dip1=/share/BioinfMSc/rot3_group3/C087_203_mapq_hap1_8.fa
Dip2=/share/BioinfMSc/rot3_group3/C087_203_mapq_hap2_8.fa

#running samtools to extract regions of interest
samtools faidx $Dip1 RL_5:16000000-23979000 > hap1_region.fasta
samtools faidx $Dip2 RL_2:8923000-19004000 > hap2_region.fasta

conda deactivate 
