#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=50g
#SBATCH --time=24:00:00
#SBATCH --job-name=EDTA_hap2
#SBATCH --output=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurm-%x-%j.out
#SBATCH --error=/gpfs01/share/BioinfMSc/rot3_group3/TE_annotation/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate EDTA2

mkdir -p /share/BioinfMSc/rot3_group3/TE_annotation/C087_203_mapq_hap2_8.fa.mod.EDTA.raw/
touch /share/BioinfMSc/rot3_group3/TE_annotation/C087_203_mapq_hap2_8.fa.mod.EDTA.raw/C087_203_mapq_hap2_8.fa.mod.SINE.raw.fa

perl /share/BioinfMSc/rot3_group3/TE_annotation/EDTA/test/EDTA/EDTA.pl --genome /share/BioinfMSc/rot3_group3/TE_annotation/C087_203_mapq_hap2_8.fa \
    --cds /share/BioinfMSc/rot3_group3/TE_annotation/Dip2.cds.fasta \
    --overwrite 1 \
    --sensitive 1 \
    --anno 1 \
    --threads 64

conda deactivate
