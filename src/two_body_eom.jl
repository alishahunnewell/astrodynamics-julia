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
    # TODO: unpack position/velocity from u
    # TODO: r_norm = norm(position)
    # TODO: du[1:3] = velocity
    # TODO: du[4:6] = -mu * position / r_norm^3
    error("not yet implemented")
end

"""
    propagate_two_body(r0, v0, tspan; mu=MU_EARTH)

Propagate an orbit from initial position r0 (km) and velocity v0 (km/s)
over tspan = (t0, tf) seconds.
"""
function propagate_two_body(r0, v0, tspan; mu=MU_EARTH)
    # TODO: build ODEProblem with two_body_eom!, u0 = [r0; v0], tspan, mu
    # TODO: solve with tight tolerances (reltol=1e-12, abstol=1e-12)
    error("not yet implemented")
end
