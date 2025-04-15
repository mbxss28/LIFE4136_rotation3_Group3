#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=nucmer_hap1scaf5_vs_hap2scaf2
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/syri.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/syri.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile
conda activate syri

cd /share/BioinfMSc/rot3_group3/alignment

# Run syri command to perform the comparison

syri -c hap_compare.filtered.coords -d hap_compare.filtered.delta \
     -r /share/BioinfMSc/rot3_group3/alignment/hap1scaf5.fa \
     -q /share/BioinfMSc/rot3_group3/alignment/hap2scaf2.fa


conda deactivate

