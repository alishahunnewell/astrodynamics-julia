"""Conversions between Cartesian state vectors and classical orbital elements
(a, e, i, Omega, omega, nu).
Reference: Curtis, Orbital Mechanics for Engineering Students, ch. 4.
Not implemented yet; this comes after the ch. 4 reading."""

""" rv2coe(r, v; mu=398600.4418)
Convert position/velocity vectors to classical orbital elements.
"""
function rv2coe(r, v; mu=398600.4418)
    r_mag = norm(r)
    v_mag = norm(v)
    vr = dot(r, v) / r_mag

    h_vec = cross(r,v)
    h = norm(h_vec)

    i = acos(clamp(h_vec[3] / h , -1, 1))

    N_vec = cross([0.0, 0.0, 1.0], h_vec)
    N = norm(N_vec)

    Omega = acos(clamp(N_vec[1] / N, -1, 1))
    if N_vec[2] <0
        Omega = 2pi - Omega
    end

    e_vec = ((v_mag^2 - mu / r_mag) * r - r_mag * vr * v) / mu
    e = norm(e_vec)

    omega = acos(clamp(dot(N_vec, e_vec) / (N * e), -1, 1))
    if e_vec[3] < 0
        omega = 2pi - omega
    end

    nu = acos(clamp(dot(e_vec, r) / (e * r_mag), -1, 1))
    if vr < 0
        nu = 2pi - nu
    end

    a = h^2 / (mu * (1 - e^2))

    return a , e, i, Omega, omega, nu

end

#rotation helpers
R1(phi) = [1 0 0; 0 cos(phi) sin(phi); 0 -sin(phi) cos(phi)]
R3(phi) = [cos(phi) sin(phi) 0; -sin(phi) cos(phi) 0; 0 0 1]

"""coe2rv(a, e, i, Omega, omega, nu; mu=398600.4418)
Convert classical orbital elements to position/velocity vectors.
"""
function coe2rv(a, e, i, Omega, omega, nu; mu=398600.4418)
    #angular momentum 
    h = sqrt(mu * a * (1 - e^2))

    #position in perifocal frame
    r_pf = (h^2 / mu ) / (1 + e*cos(nu)) * [cos(nu), sin(nu), 0.0] 

    #velocity in perifocal frame 
    v_pf = (mu / h) * [-sin(nu), e + cos(nu), 0.0]

    #inertial frame to perifocal frame 
    Q = R3(omega) * R1(i) * R3(Omega)

    #transpose perifocal to inertial 
    return Q' * r_pf, Q' * v_pf
end
