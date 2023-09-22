using MPI
const mpiprog = joinpath(@__DIR__, "mpiprog.jl")
mpiexec(mpirun -> run(`$mpirun julia --project=. $mpiprog`))
