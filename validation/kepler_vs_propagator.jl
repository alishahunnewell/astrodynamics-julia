#kepler solver checks 
#test 1; round trip, pick E build M from it, solve and recover E
#test 2; closed form position from kepler equations vs numerical propagation

include("../src/two_body_eom.jl")
include("../src/kepler_solver.jl")

#test 1 round trip, chosing E, computes M that goes with it from Kepler eqn to see
#if we get 2 in return, easy check
println("Test 1: round trip (true E = 2.0)")
for e in (0.1, 0.5, 0.9)
    E_true = 2.0
    M = E_true - e * sin(E_true)
    println(" e= ", e, " recovered E = ", solve_kepler(M, e))
end

#test 2 against propagator, eccentric orbit starting at perigee on +x
rp = 7000.0
ra = 20000.0
a  = (rp + ra) / 2
e  = (ra - rp) / (ra + rp)
T  = 2pi * sqrt(a^3 / MU_EARTH)
vp = sqrt(MU_EARTH * (2 / rp - 1 / a))

sol = propagate_two_body([rp, 0.0, 0.0], [0.0, vp, 0.0], (0.0, T))

println("Test 2: Kepler Solver vs Propagator")
for t in range(0, T, length=9)
    M = 2pi * t / T
    E = solve_kepler(M,e)
    x = a * (cos(E)-e)
    y = a * sqrt(1 - e^2) * sin(E)
    err = norm(sol(t)[1:2]- [x,y])
    println(" t = ", round(t, digits=1), " s position error (km): ", err)
end
