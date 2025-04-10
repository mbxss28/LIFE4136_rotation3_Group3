#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=filter
#SBATCH --output=/share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.out
#SBATCH --error=//share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

cat hap1.gtf | tr -d \" | tr -d ";" | tr -d "."| tr -d "_" | grep -v "exon" | grep -v "CDS" > hap1.gff

cat hap2.gtf | tr -d \" | tr -d ";" | tr -d "." | tr -d "_" |grep -v "exon" | grep -v "CDS" > hap2.gff

cat  hap1prot.fasta | tr -d "." > hap1.fa

cat  hap2prot.fasta | tr -d "." > hap2.fa
