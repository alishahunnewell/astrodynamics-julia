"""
Conversions between Cartesian state vectors and classical orbital elements
(a, e, i, Omega, omega, nu).

Reference: Curtis, Orbital Mechanics for Engineering Students, ch. 4.
Not implemented yet; this comes after the ch. 4 reading.
"""

"""
    rv2coe(r, v; mu=398600.4418)

Convert position/velocity vectors to classical orbital elements.
"""
function rv2coe(r, v; mu=398600.4418)
    error("not yet implemented")
end

"""
    coe2rv(a, e, i, Omega, omega, nu; mu=398600.4418)

Convert classical orbital elements to position/velocity vectors.
"""
function coe2rv(a, e, i, Omega, omega, nu; mu=398600.4418)
    error("not yet implemented")
end
