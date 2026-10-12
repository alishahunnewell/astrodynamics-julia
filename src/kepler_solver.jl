"""
    solve_kepler(M, e; tol=1e-10, max_iter=100)

Solve Kepler's equation M = E - e*sin(E) for the eccentric anomaly E,
given mean anomaly M (radians) and eccentricity e, via Newton-Raphson.

Reference: Curtis, Orbital Mechanics for Engineering Students, ch. 3.
Validate against a worked example from the text before trusting this.
"""
#defines function with M and e as inputs, 
function solve_kepler(M::Float64, e::Float64; tol::Float64=1e-10, max_iter::Int=100)
    # Newton-Raphson iteration
    # E_{n+1} = E_n - (E_n - e*sin(E_n) - M) / (1 - e*cos(E_n))
    M = mod2pi(M) #wraps M into 0 to 2pi as it continues to grow with time
    
    #if M < pi, use M + e/2, otherwise use M - e/2
    E = M < pi ? M + e/2 : M - e/2

    #iterate over newtons root finding method function
    for i in 1:max_iter
        #kepler equation plugged into newtonian correction f(E)/f'(E) where
        #top of the fraction f(E) is current guess and bottom is slope f'(E)
        dE = (E - e*sin(E) - M) / (1 - e*cos(E))
        
        #applying the correction
        E = E - dE

        #if correction is smaller than tolerance, answer has settled
        if abs(dE) < tol
            return E
        end
    end
    error("Kepler solver did not converge")
end


