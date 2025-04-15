#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=80G
#SBATCH --time=24:00:00
#SBATCH --job-name=wg_mummer2
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/mummer/logs/mummer_WG2.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/mummer/logs/mummer_WG2.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile
conda activate mummer_env_new

# Define input/output directories
INPUT_DIR="/share/BioinfMSc/rot3_group3/alignment/mummer"
OUTPUT_DIR="/share/BioinfMSc/rot3_group3/alignment/mummer"

# Align the two scaffold sequences
nucmer --prefix="$OUTPUT_DIR/WG_compare" \
    "$INPUT_DIR/C087_203_mapq_hap1_8.fa" "$INPUT_DIR/C087_203_mapq_hap2_8.fa"

# Generate delta file (alignment differences)
delta-filter -r -q "$OUTPUT_DIR/WG_compare.delta" > "$OUTPUT_DIR/WG_compare.filtered.delta"

conda deactivate 

                                     
