# Cross-check the from-scratch propagator against SpaceAGORA.
#
# Plan:
#   1. Run SpaceAGORA with all perturbations off (pure two-body) from a chosen
#      initial state, and export its position/velocity history.
#   2. Propagate the same initial state with propagate_two_body.
#   3. Plot position error vs time and save the figure to plots/.
#
# TODO: fill in once propagate_two_body works.
