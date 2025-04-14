#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=centrominer_hap1
#SBATCH --output=/share/BioinfMSc/rot3_group3/centrominer_logs/centrominer_hap1.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/centrominer_logs/centrominer_hap1.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile

conda activate quartet_env

cd /share/BioinfMSc/rot3_group3/quarTeT

# Set variables



GENOME="/share/BioinfMSc/rot3_group3"   # Input genome file
OUTPUT_PREFIX="C087_centromere"     # Prefix for output files
THREADS=8                           # Number of threads to use

# Run CentroMiner
python -m  quartet CentroMiner -i $GENOME/C087_203_mapq_hap1_8.fa -t $THREADS -p $OUTPUT_PREFIX --overwrite

conda deactivate 
