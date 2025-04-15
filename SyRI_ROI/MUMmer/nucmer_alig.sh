#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=nucmer_hap1scaf5_vs_hap2scaf2
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/nucmer.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/nucmer.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk
 
# Load Conda Environment
source $HOME/.bash_profile
conda activate mummer_env
 
# Define input/output directories
INPUT_DIR="/share/BioinfMSc/rot3_group3/alignment"
OUTPUT_DIR="/share/BioinfMSc/rot3_group3/alignment"
 
# Align the two scaffold sequences
nucmer -t 32 --prefix="$OUTPUT_DIR/hap_compare" \
    "$INPUT_DIR/hap1scaf5.fa" "$INPUT_DIR/hap2scaf2.fa"
 
conda deactivate
