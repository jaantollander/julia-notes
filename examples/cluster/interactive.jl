# Depot path
DEPOT_PATH

# Load path
LOAD_PATH

# Expanded load path
Base.load_path()

# Active project
Base.active_project()

# Changing active project
using Pkg
Pkg.activate(pwd())
Base.active_project()
Base.load_path()
