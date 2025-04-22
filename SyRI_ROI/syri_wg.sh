#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=syri_WG
#SBATCH --output=/share/BioinfMSc/rot3_group3/alignment/syri.out
#SBATCH --error=/share/BioinfMSc/rot3_group3/alignment/syri.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@nottingham.ac.uk

# Load Conda Environment
source $HOME/.bash_profile
conda activate syri

cd /share/BioinfMSc/rot3_group3/alignment

# Run syri command to perform the comparison

syri -c WG_compare.filtered.coords -d WG_compare.filtered.delta \
     -r /share/BioinfMSc/rot3_group3/alignment/C087_203_mapq_hap1_8.fa \
     -q /share/BioinfMSc/rot3_group3/alignment/C087_203_mapq_hap2_8.fa \
     --nc 64 \
     --prefix wg_syri 

conda deactivate
