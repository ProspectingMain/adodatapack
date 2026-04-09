# ============================================================
#  MANHUNT+ | death_handler.mcfunction
#  Handles a runner's death. Runs as the dead runner.
#  2 lives system: lose 1 life, become spectator permanently at 0.
# ============================================================

# -- Reset death counter --
scoreboard players set @s mh_deaths 0

# -- Remove 1 life --
scoreboard players remove @s mh_lives 1

# ---- CASE: Still has lives remaining (lives >= 1) ----
execute if score @s mh_lives matches 1.. run function manhunt:respawn_runner

# ---- CASE: No lives left (lives <= 0) ----
execute if score @s mh_lives matches ..0 run function manhunt:to_spectator
