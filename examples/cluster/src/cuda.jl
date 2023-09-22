using CUDA

A = rand(2^9, 2^9)
A_d = CuArray(A)
B_d = $A_d * $A_d
