# Run interactive bash on Puhti
srun --account="project_<id>" --partition=test --nodes=2 --ntasks-per-node=1 --cpus-per-task=2 --mem-per-cpu=1000 --time="00:15:00" --pty  bash

# Show number of CPUs
echo "$SLURM_CPUS_PER_TASK"

# Show allocated nodes
scontrol show hostnames "$SLURM_JOB_NODELIST"

# SSH to other node
ssh "<name>"

# Show Julia module
module show julia/1.9

# Load Julia module
module load julia/1.9

# Run the Julia REPL
julia

# Instantiate Julia project
julia --project=. -e 'using Pkg; Pkg.instantiate()'

# Run the Julia script
julia --project=. src/serial.jl
