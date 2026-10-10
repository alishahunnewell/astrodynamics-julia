"""
Two-body equation of motion and propagation.

    r_ddot = -mu * r / |r|^3

where r is the spacecraft position relative to the central body and mu is the
central body's gravitational parameter.

Reference: Curtis, Orbital Mechanics for Engineering Students, ch. 2.
"""

using DifferentialEquations
using LinearAlgebra

const MU_EARTH = 398600.4418  # km^3/s^2

"""
    two_body_eom!(du, u, p, t)

In-place ODE function for DifferentialEquations.jl.
State u = [rx, ry, rz, vx, vy, vz]. Parameter p = mu.
"""
function two_body_eom!(du, u, p, t)
    r = u[1:3]
    v = u[4:6]
    mu = p
    du[1:3] = v
    du[4:6] = -mu * r / norm(r)^3

end

"""
    propagate_two_body(r0, v0, tspan; mu=MU_EARTH)

Propagate an orbit from initial position r0 (km) and velocity v0 (km/s)
over tspan = (t0, tf) seconds.
"""
function propagate_two_body(r0, v0, tspan; mu=MU_EARTH)
    u0 = [r0; v0]
    prob = ODEProblem(two_body_eom!, u0, tspan, mu)
    return solve(prob, Vern9(), reltol=1e-12, abstol=1e-12)
end
