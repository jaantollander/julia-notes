# Singleton is struct without fields
struct Singleton end

# We can use singleton for dispatch
f(::Type{Singleton}) = "hello"
f(Singleton)

# We can use a singleton as a value
const singleton = Singleton()
f(::Singleton) = "singleton"
f(singleton)


# We can use singletons for multiple dispatch
abstract type S end
struct S1 <: S end
struct S2 <: S end

f(::Type{S1}) = "dispatch S1"
f(::Type{S2}) = "dispatch S2"

f(S1)
f(S2)


# Value types are also singletons
struct Value{T} end
Value(T) = Value{T}()

f(::Value{T}) where T = T
f(Value(1))

