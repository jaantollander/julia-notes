#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --time=00:15:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --gres=gpu:v100:1
#SBATCH --mem-per-cpu=8000

module load julia/1.9
julia --project=. -e 'using Pkg; Pkg.instantiate()'
julia --project=. src/cuda.jl
