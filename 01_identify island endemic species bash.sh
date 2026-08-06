#!/bin/bash
#SBATCH --job-name=global_is
#SBATCH --partition=regularmedium
#SBATCH --time=56:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --array=1-120%8
#SBATCH --output=logs/global_island_%A_%a.out
#SBATCH --error=logs/global_island_%A_%a.err

set -euo pipefail

cd "$HOME/island_bird_project"
mkdir -p logs

export SPECIES_PER_JOB=100
export CHUNK_SIZE=10

RSCRIPT="/cvmfs/hpc.rug.nl/versions/2023.01/rocky8/x86_64/amd/zen3/software/R/4.2.1-foss-2022a/bin/Rscript"

"$RSCRIPT" island_bird_global_island_filter_stratified.R
