# Depot path
println(DEPOT_PATH)

# Load path
println(LOAD_PATH)

# Expanded load path
println(Base.load_path())

# Active project
println(Base.active_project())

# Changing active project
using Pkg
Pkg.activate(pwd())
println(Base.active_project())
println(Base.load_path())
