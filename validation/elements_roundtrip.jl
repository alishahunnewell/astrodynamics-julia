#round trips between orbital elements and state vectors

include("../src/two_body_eom.jl")
include("../src/elements_conversion.jl")

#test 1 going from orbital elements to r and v then back to elements
a, e = 13500.0, 0.48
i, Om, om, nu = deg2rad(30), deg2rad(40), deg2rad(60), deg2rad(100)
r, v = coe2rv(a, e, i, Om, om, nu; mu=MU_EARTH)
a2, e2, i2, Om2, om2, nu2 = rv2coe(r, v; mu=MU_EARTH)
println("Test 1: elements -> r,v -> elements")
println("  a:     ", a2, "   expected ", a)
println("  e:     ", e2, "   expected ", e)
println("  i:     ", rad2deg(i2), "   expected 30")
println("  Omega: ", rad2deg(Om2), "   expected 40")
println("  omega: ", rad2deg(om2), "   expected 60")
println("  nu:    ", rad2deg(nu2), "   expected 100")

#test 2 going from r v to orbital elements back to r v 
r0 = [-6045.0, -3490.0, 2500.0]
v0 = [-3.457, 6.618, 2.533]
els = rv2coe(r0, v0; mu=MU_EARTH)
r3, v3 = coe2rv(els...; mu=MU_EARTH)
println("Test 2: r,v -> elements -> r,v")
println("  position error (km):   ", norm(r3 - r0))
println("  velocity error (km/s): ", norm(v3 - v0))
println("  elements (deg): i = ", rad2deg(els[3]), ", Omega = ", rad2deg(els[4]),
        ", e = ", els[2], ", omega = ", rad2deg(els[5]), ", nu = ", rad2deg(els[6]))