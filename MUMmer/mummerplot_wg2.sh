#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=80G
#SBATCH --time=24:00:00
#SBATCH --job-name=wg_mummerplot
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/mummer/logs/mummerplot_WG2.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/mummer/logs/mummerplot_WG2.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile

conda activate mummer4

OUTPUT_DIR="/share/BioinfMSc/rot3_group3/alignment/mummer"

mummerplot --png --layout --filter --large \
    --title "Hap1 vs Hap2 Structural Comparison" "$OUTPUT_DIR/WG_compare.filtered.delta" \
    -p "$OUTPUT_DIR/WG_compare"

conda deactivate 
