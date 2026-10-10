"""
    solve_kepler(M, e; tol=1e-10, max_iter=100)

Solve Kepler's equation M = E - e*sin(E) for the eccentric anomaly E,
given mean anomaly M (radians) and eccentricity e, via Newton-Raphson.

Reference: Curtis, Orbital Mechanics for Engineering Students, ch. 3.
Validate against a worked example from the text before trusting this.
"""
function solve_kepler(M::Float64, e::Float64; tol::Float64=1e-10, max_iter::Int=100)
    # TODO: Newton-Raphson iteration
    # E_{n+1} = E_n - (E_n - e*sin(E_n) - M) / (1 - e*cos(E_n))
    error("not yet implemented")
end
