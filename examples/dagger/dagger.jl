using Distributed
addprocs(2; exeflags="--threads=2")

@everywhere function task()
    return (getpid(), Threads.threadid())
end

using Dagger
t = [Dagger.@spawn task() for _ in 1:10]
x = fetch.(t)

# We can see that Dagger will run the tasks on available workers and threads
println("Main process run with pid $(getpid()) on thread 1.")
println("Dagger processes:")
println("pid | threadid")
for (pid, tid) in unique(x)
    println("$pid | $tid")
end

# Directed acyclic graph
a = Dagger.@spawn rand(100, 100)
b = Dagger.@spawn sum(a)
c = Dagger.@spawn prod(a)
d = Dagger.@spawn b+c
println(fetch(d))

rmprocs(workers())
