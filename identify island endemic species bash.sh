#!/bin/bash
#SBATCH -p regular
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --job-name=island_all_fix
#SBATCH --output=island_all_fix_%A_%a.out
#SBATCH --error=island_all_fix_%A_%a.err
#SBATCH --array=17-150%5
#SBATCH --mem=32GB

cd ~/island_bird_project

module --force purge

RSCRIPT="/cvmfs/hpc.rug.nl/versions/2023.01/rocky8/x86_64/amd/zen3/software/R/4.2.1-foss-2022a/bin/Rscript"

export SPECIES_PER_JOB=100

$RSCRIPT island_area_all_species_recalc.R
