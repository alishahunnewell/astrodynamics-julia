#Eccentric orbit check: perigee 7000 km, apogee 20000 km.
#Same conservation tests as circular, plus a check that orbit 
#reaches desired radii designed 

include("../src/two_body_eom.jl")

rp = 7000.0
ra = 20000.0
a = (rp + ra) / 2

vp = sqrt(MU_EARTH * (2 / rp - 1 / a))  #vis-viva at perigee
T = 2pi * sqrt(a^3 / MU_EARTH)          #orbital period 

r0 = [rp, 0.0, 0.0]
v0 = [0.0, vp, 0.0]

sol = propagate_two_body(r0, v0, (0.0, 10 * T))

energy(u) = norm(u[4:6])^2 / 2 - MU_EARTH / norm(u[1:3])
hmag(u)   = norm(cross(u[1:3], u[4:6]))

E = [energy(u) for u in sol.u]
H = [hmag(u) for u in sol.u]
radii = [norm(u[1:3]) for u in sol.u]

println("eccentric orbit, 10 periods")
println("period (s):        ", T)
println("min radius (km):   ", minimum(radii), "   (expected ", rp, ")")
println("max radius (km):   ", maximum(radii), "   (expected ", ra, ")")
println("energy drift (relative):           ", maximum(abs.(E .- E[1])) / abs(E[1]))
println("angular momentum drift (relative): ", maximum(abs.(H .- H[1])) / H[1])

#why it matters: radius check confirms orbit has shape that equations predict
