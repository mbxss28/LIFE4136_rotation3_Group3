#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=gff_gtf
#SBATCH --output=/share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.out
#SBATCH --error=//share/BioinfMSc/rot3_group3/slurm_output/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

conda activate gffread

#gffread -T  hap1region.gff >  hap1region.gtf

#gffread -T  hap2region.gff >  hap2region.gtf

gffread -T  Dip1.gff >  hap1.gtf

gffread -T  Dip2.gff >  hap2.gtf

conda deactivate
