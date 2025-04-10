#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=gene_ann_region
#SBATCH --output=/share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.out
#SBATCH --error=//share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

conda activate gffread
fasta1=/share/BioinfMSc/rot3_group3/gene_annotation/hap1_region.fasta
fasta2=/share/BioinfMSc/rot3_group3/gene_annotation/hap2_region.fasta
Hap1=/share/BioinfMSc/rot3_group3/gene_annotation/hap1region.gtf
Hap2=/share/BioinfMSc/rot3_group3/gene_annotation/hap2region.gtf

#exstract gff information for Hap1.gff file

gffread -x hap1_regioncds.fasta -g $fasta1 $Hap1 

gffread -y hap1_regionprot.fasta -g $fasta1 $Hap1 

gffread -w hap1_regionexon.fasta -g $fasta1 $Hap1 


#exstracts gff information for Hap2.gff file
gffread -x hap2_regioncds.fasta -g $fasta2 $Hap2 

gffread -y hap2_regionprot.fasta -g $fasta2 $Hap2 

gffread -w hap2_regionexon.fasta -g $fasta2 $Hap2 


conda deactivate
