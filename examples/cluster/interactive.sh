# Run interactive session on Puhti
srun --account="project_<id>" --partition=test --nodes=2 --ntasks-per-node=1 --cpus-per-task=2 --mem-per-cpu=1000 --time="00:15:00" --pty  bash

# Run interactive session on Mahti
srun --account="project_<id>" --partition=test --nodes=2 --ntasks-per-node=1 --cpus-per-task=128 --mem-per-cpu=0 --time="00:30:00" --pty  bash

# Run interactive session on LUMI
srun --account="<account>" --partition=bebug --nodes=2 --ntasks-per-node=1 --cpus-per-task=2 --mem-per-cpu=1000 --time="00:30:00" --pty  bash

module use /appl/local/csc/modulefiles  # LUMI only

# Show Slurm environment variables
printenv | grep SLURM | less

# Show number of CPUs
echo "$SLURM_CPUS_PER_TASK"

# Show allocated nodes
scontrol show hostnames "$SLURM_JOB_NODELIST"

# SSH to other node
ssh "<name>"

# Show Julia module environment
module show julia/1.9

# Load Julia module environment
module load julia/1.9

# Instantiate Julia project
julia --project=. -e 'using Pkg; Pkg.instantiate()'

# Run the Julia REPL with current project active
julia --project=.

# Run the Julia scripts
julia --project=. src/serial.jl
julia --project=. src/threads.jl
julia --project=. src/distributed.jl
julia --project=. src/mpirun.jl
julia --project=. src/cuda.jl
