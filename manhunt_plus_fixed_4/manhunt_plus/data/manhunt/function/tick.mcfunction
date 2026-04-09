# ============================================================
#  MANHUNT+ | tick.mcfunction
#  Runs every game tick. Routes to the correct phase handler.
# ============================================================

execute if score $game mh_phase matches 1 run function manhunt:grace_tick
execute if score $game mh_phase matches 2 run function manhunt:hunt_tick
