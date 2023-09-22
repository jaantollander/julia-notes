using Distributed
addprocs(2; exeflags="--threads=2")

@everywhere function task()
    return (myid(), Threads.threadid())
end

using Dagger
t = [Dagger.@spawn task() for _ in 1:10]
x = fetch.(t)

# We can see that Dagger will run the tasks on available workers and threads
println("worker id | thread id")
println("Main process:")
println(task())
println("Dagger processes:")
println.(unique(x))

# Directed acyclic graph
a = Dagger.spawn(rand, 100, 100)
b = [Dagger.spawn(x -> sum(n.*x), a) for n in 1:5]
c = Dagger.spawn((x...) -> sum(x), b...)
println(fetch(c))

#rmprocs(workers())
