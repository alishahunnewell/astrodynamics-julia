include("../src/two_body_eom.jl")

r0 = [7000.0, 0.0, 0.0]
v0 = [0.0, sqrt(MU_EARTH / 7000.0), 0.0]  #circular orbit speed
T = 2pi * sqrt(7000.0^3 / MU_EARTH)       #orbital period ab 5828 s

sol = propagate_two_body(r0, v0, (0.0, 10 * T))

println("period (s): ", T)
println("start: ", sol.u[1][1:3])
println("end:  ", sol.u[end][1:3])

#specific energy, v^2/2-mu/r
energy(u) = norm(u[4:6])^2 / 2 - MU_EARTH / norm(u[1:3])
#size of angular momentum h= r x v
hmag(u)   = norm(cross(u[1:3], u[4:6]))

#lists of the above values at every step the solver took from sol.u
E = [energy(u) for u in sol.u]
H = [hmag(u) for u in sol.u]


#printing how far each value drifted from its starting value as a fraction of initial
println("energy drift (relative):           ", maximum(abs.(E .- E[1])) / abs(E[1]))
println("angular momentum drift (relative): ", maximum(abs.(H .- H[1])) / H[1])

