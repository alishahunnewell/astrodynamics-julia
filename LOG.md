# Learning Log

Short dated entries: what I read, what I built, what got me stuck.

## 2026-10-10

- Finished notes on Curtis ch. 1-2 and Bate ch. 1-2.
- Key idea from ch. 2: gravity is a central force, so specific angular momentum h = r x v is constant and the orbit stays in one plane.
- Learned that Lagrange f and g coefficients (Curtis 2.11) are an alternative to numerical integration, not needed for the ODE propagator.
- Implemented two_body_eom! and propagate_two_body in Julia
-Circular LEO test at r = 7000 km: after one period of 5828.5 s the position returns to within 1e-10 km of the start.