#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=wg_mummer
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/mummer/logs/mummer_WG.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/mummer/logs/mummer_WG.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile
conda activate mummer4
 
# Define input/output directories
INPUT_DIR="/share/BioinfMSc/rot3_group3/alignment/mummer"
OUTPUT_DIR="/share/BioinfMSc/rot3_group3/alignment/mummer"
 
# Align the two scaffold sequences
nucmer --prefix="$OUTPUT_DIR/hap_compare" \
    "$INPUT_DIR/hap1scaf5.fa" "$INPUT_DIR/hap2scaf2.fa"
 
# Generate delta file (alignment differences)
delta-filter -r -q "$OUTPUT_DIR/hap_compare.delta" > "$OUTPUT_DIR/hap_compare.filtered.delta"
 
# Create a dot plot
mummerplot --png --layout --filter --large \
    --title "Hap1 vs Hap2 Structural Comparison" "$OUTPUT_DIR/hap_compare.filtered.delta" \
    -p "$OUTPUT_DIR/hap_compare"
 
echo "Dot plot generated successfully!"
 
conda deactivate
