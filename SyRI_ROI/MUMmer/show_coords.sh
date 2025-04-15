#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=show_coords
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/logs/show_coords.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/logs/show_coords.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile
conda activate mummer_env

# Define input/output directories
INPUT_DIR="/share/BioinfMSc/rot3_group3/alignment"
OUTPUT_DIR="/share/BioinfMSc/rot3_group3/alignment"

show-coords -T -H -r -d "$OUTPUT_DIR/hap_compare.filtered.delta" > "$OUTPUT_DIR/hap_compare.filtered.coords"
