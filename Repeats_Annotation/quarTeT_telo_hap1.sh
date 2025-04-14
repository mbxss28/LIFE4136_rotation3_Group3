#!/bin/bash                                                                                                                                         
                                                                                                                                                    
#SBATCH --partition=defq                                                                                                                            
#SBATCH --nodes=1                                                                                                                                   
#SBATCH --ntasks=1                                                                                                                                  
#SBATCH --cpus-per-task=12                                                                                                                           
#SBATCH --mem=100g                                                                                                                                   
#SBATCH --time=00:01:00                                                                                                                             
#SBATCH --job-name=quarTeT_telo_hap1_3                                                                                                      
#SBATCH --output=/share/BioinfMSc/rot3_group3/telomere_annotation/slurm-%x-%j.out                                                                                  
#SBATCH --error=/share/BioinfMSc/rot3_group3/telomere_annotation/slurm-%x-%j.err                                                                                   
#SBATCH --mail-type=ALL                                                                                                                             
#SBATCH --mail-user=alyzx23@nottingham.ac.uk                                                                                                  
                                                                                                                                                    
source $HOME/.bash_profile                                                                                                                    
conda activate quarTeTdependencies                                                                                                                              
                                                                                                                                                    
cd /share/BioinfMSc/rot3_group3/telomere_annotation/quarTeT                                                                                                     
python3 quartet.py TeloExplorer -i /share/BioinfMSc/rotation3/cardamine_amara_v0.9/C087_203_mapq_hap1_8.fa -c plant -m 80 -p hap1_8_telo > hap1_8_telo.txt            
                                                                                                                                                    
conda deactivate                                                                                                                                    

