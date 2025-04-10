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

conda activate Augustus

augustus --gff3=on --species=arabidopsis hap1_region.fasta > /share/BioinfMSc/rot3_group3/gene_annotation/hap1region.gff
augustus --gff3=on --species=arabidopsis hap1_region.fasta > /share/BioinfMSc/rot3_group3/gene_annotation/hap2region.gff

conda deactivate
