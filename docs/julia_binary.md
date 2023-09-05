# Motivation
We don't want the Julia software to seem like a black box.
We should understand some basics about the Julia source and binaries.


# Source
https://github.com/JuliaLang/julia

Some important directories

- `src` : source for C and C++ components
- `cli` : the julia command line client (in C), that is, executable
- `base` : base library written in Julia
- `stdlib` : standard libraries written in Julia
- `Makefile` : julia is built using GNU Make


# Binaries
https://julialang.org/downloads/

Download Julia binary for Linux

```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.3-linux-x86_64.tar.gz
```

Extract the archive

```bash
tar xf julia-1.9.3-linux-x86_64.tar.gz
```

Some important files and directories

- `bin/julia` : julia executable
- `lib` : linked libraries (`.so` share object)
- `share/julia/base` : base library
- `share/julia/stdlib` : standard libraries (julia packages that are shipped with julia)

What shared libraries are used by the julia executable?

```bash
libtree -p bin/julia
```

```bash
libtree -p lib/julia/libjulia-codegen.so
```

What files are opened (and read) when we run the julia executable?

```bash
strace -e 'open,openat' -o open.out bin/julia -e ''
```

```bash
less open.out
```
