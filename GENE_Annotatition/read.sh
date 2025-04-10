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

conda activate gffread

Dip1=/share/BioinfMSc/rot3_group3/C087_203_mapq_hap1_8.fa
Dip2=/share/BioinfMSc/rot3_group3/C087_203_mapq_hap2_8.fa

#exstract gff information for Dip1.gff file
#gffread -x hap1cds.fasta -g  $Dip1  Dip1.sorted.gff

#gffread -y hap1prot.fasta -g $Dip1  Dip1.sorted.gff

#gffread -w hap1exon.fasta -g $Dip1  Dip1.sorted.gff


#exstracts gff information for Dip2.gff file
gffread -x hap2cds.fasta -g  $Dip2  Dip2.sorted.gff

gffread -y hap2prot.fasta -g $Dip2  Dip2.sorted.gff

gffread -w hap2exon.fasta -g $Dip2 Dip2.sorted.gff


conda deactivate
