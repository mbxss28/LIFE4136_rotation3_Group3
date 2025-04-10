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

#Dip1=/share/BioinfMSc/rot3_group3/C087_203_mapq_hap1_8.fa
#Dip2=/share/BioinfMSc/rot3_group3/C087_203_mapq_hap2_8.fa

#augustus --gff3=on --species=arabidopsis $Dip1 > /share/BioinfMSc/rot3_group3/gene_annotation/Dip1.gff
#augustus --gff3=on --species=arabidopsis $Dip2 > /share/BioinfMSc/rot3_group3/gene_annotation/Dip2.gff

#augustus --species=arabidopsis hap1_region.fasta > /share/BioinfMSc/rot3_group3/gene_annotation/hap1region.gff
augustus --species=arabidopsis hap2_region.fasta > /share/BioinfMSc/rot3_group3/gene_annotation/hap2region.gff

conda deactivate
