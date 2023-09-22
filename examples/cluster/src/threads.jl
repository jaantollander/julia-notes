# Number of threads
n = Threads.nthreads()
println(n)

ids = zeros(Int, n)
@sync for i in eachindex(ids)
    Threads.@spawn ids[i] = Threads.threadid()
end
println(ids)
