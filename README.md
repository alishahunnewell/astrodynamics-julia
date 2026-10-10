# Astrodynamics from Scratch (Julia)

A public learning log and code repo: I'm building core astrodynamics tools in Julia from first principles and validating each one against SpaceAGORA, the aerobraking simulator from the Space-FALCON Lab at the University of Michigan. This is an independent self-study project and is not affiliated with or part of SpaceAGORA.

## Goal

Build real fluency in orbital mechanics (two-body motion, orbital elements, perturbations, drag and aerobraking, relative motion) by implementing each concept in code and checking it against a known answer, rather than only reading. Every piece is validated against a textbook worked example or a SpaceAGORA run with matching initial conditions.

## Approach

Read a little, implement a small piece, validate it, commit it. Dated notes on what I did and what got me stuck live in [LOG.md](LOG.md), and cleaned-up chapter notes live in `docs/notes/`.

## Resources

- Curtis, *Orbital Mechanics for Engineering Students*
- Bate, Mueller & White, *Fundamentals of Astrodynamics*
- Kochenderfer, Wheeler & Wray, [*Algorithms for Decision Making*](https://algorithmsbook.com/decisionmaking/)
- [SpaceAGORA](REPLACE_WITH_SPACEAGORA_REPO_URL) and its Python predecessor, the [Aerobraking Trajectory Simulator](https://github.com/gfalcon2/Aerobraking-Trajectory-Simulator)

## Repo structure

```
src/
  kepler_solver.jl         Kepler's equation solver (Newton-Raphson)
  two_body_eom.jl          Two-body equation of motion and ODE propagation
  elements_conversion.jl   State vector <-> classical orbital elements
validation/
  compare_to_spaceagora.jl Cross-check against SpaceAGORA in pure two-body mode
docs/notes/                Chapter notes
plots/                     Validation plots
LOG.md                     Dated learning log
```

## Roadmap

- [ ] Two-body propagator with energy and angular momentum conservation checks
- [ ] Kepler's equation solver
- [ ] State vector <-> orbital element conversion
- [ ] Validation against SpaceAGORA (perturbations off)
- [ ] Perturbation study: J2, drag, third-body, SRP
- [ ] Aerobraking scenario analysis
- [ ] Relative motion (Clohessy-Wiltshire) and differential drag
- [ ] Decision-making under uncertainty applied to aerobraking

## Running the code

Requires Julia 1.10 or newer.

```
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

Usage examples will be added as each piece is implemented.

## Background

I previously built [Starfall](https://github.com/alishahunnewell/starfall-GNC), a 6-DOF rocket landing simulator, so the numerical integration and state propagation carry over. The new material here is the orbital force models and reference frames.

## Author

Alisha Hunnewell
