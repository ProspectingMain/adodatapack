# ============================================================
#  MANHUNT+ | hunt_tick.mcfunction
#  Runs every tick during Phase 2 (The Hunt)
# ============================================================

# ---- COOLDOWN COUNTDOWNS ----

# Hunter revealer cooldown (counts down to 0)
execute as @a[tag=hunter,scores={mh_revealCD=1..}] run scoreboard players remove @s mh_revealCD 1

# Runner deceive cooldown
execute as @a[tag=speedrunner,scores={mh_deceiveCD=1..}] run scoreboard players remove @s mh_deceiveCD 1

# Spectator sabotage cooldown
execute as @a[tag=mh_spectator,scores={mh_sabotCD=1..}] run scoreboard players remove @s mh_sabotCD 1

# Re-enable sabotage trigger when cooldown expires
execute as @a[tag=mh_spectator,scores={mh_sabotCD=0}] run scoreboard players enable @s mh_sabotage

# ---- ITEM USE DETECTION ----

# Hunter used the Location Revealer (carrot_on_a_stick)
execute as @a[tag=hunter,scores={mh_revealUse=1..}] run function manhunt:try_activate_revealer

# Runner used the Deceive Tool (warped_fungus_on_a_stick)
execute as @a[tag=speedrunner,tag=mh_alive,scores={mh_deceiveUse=1..}] run function manhunt:try_deceive

# ---- SPECTATOR SABOTAGE ----
execute as @a[tag=mh_spectator,scores={mh_sabotage=1..}] run function manhunt:spectator_sabotage

# ---- DEATH DETECTION ----
# Check if a runner has died (death count increased)
execute as @a[tag=speedrunner,tag=mh_alive,scores={mh_deaths=1..}] run function manhunt:death_handler

# ---- WIN CONDITION ----
function manhunt:win_check
