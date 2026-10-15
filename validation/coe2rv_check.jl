#checks for coe2rv
include("../src/two_body_eom.jl")
include("../src/elements_conversion.jl")

#test 1 flat orbit w all angles=0 must start at perigree on +x
#moving in +y, same as eccentric orbit test 

rp, ra = 7000.0, 20000.0
a = (rp +ra) / 2
e = (ra - rp) / (ra + rp)
r, v = coe2rv(a, e, 0.0, 0.0, 0.0, 0.0; mu=MU_EARTH)
println("Test 1 r: ", r, "   expected [7000, 0, 0]")
println("Test 1 v: ", v, "   expected [0, ", sqrt(MU_EARTH * (2/rp - 1/a)), ", 0]")

#test two tilted orbit to check physics holds for any angles 
i, Ω, ω, ν = deg2rad(30), deg2rad(40), deg2rad(60), deg2rad(100)
r, v = coe2rv(a, e, i, Ω, ω, ν; mu=MU_EARTH)
h_expected = sqrt(MU_EARTH * a * (1 - e^2))
println("Test 2 |h|: ", norm(cross(r, v)), "   expected ", h_expected)
println("Test 2 energy: ", norm(v)^2/2 - MU_EARTH/norm(r), "   expected ", -MU_EARTH/(2a))
println("Test 2 |r|: ", norm(r), "   expected ", a*(1 - e^2)/(1 + e*cos(ν)))
println("Test 2 inclination: ", rad2deg(acos(cross(r, v)[3] / norm(cross(r, v)))), "   expected 30")
