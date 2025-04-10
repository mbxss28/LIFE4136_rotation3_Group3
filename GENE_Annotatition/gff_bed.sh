#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=gtf_bed
#SBATCH --output=/share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.out
#SBATCH --error=//share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

conda activate gtf2bed

convert2bed --input=gtf --output=bed <hap1.gtf>  Hap1.bed

convert2bed --input=gtf --output=bed <hap2.gtf>  Hap2.bed

convert2bed --input=gtf --output=bed <hap1region.gtf>  Hap1region.bed

convert2bed --input=gtf --output=bed <hap2region.gtf>  Hap2region.bed

conda deactivate
