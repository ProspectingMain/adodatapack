# ============================================================
#  MANHUNT+ | load.mcfunction
#  Runs once on world load or /reload
# ============================================================

# -- Game state --
scoreboard objectives add mh_phase    dummy  "MH: Phase"
scoreboard objectives add mh_timer    dummy  "MH: Timer"

# -- Cooldowns (in ticks) --
scoreboard objectives add mh_revealCD  dummy  "MH: Revealer CD"
scoreboard objectives add mh_deceiveCD dummy  "MH: Deceive CD"
scoreboard objectives add mh_sabotCD   dummy  "MH: Sabotage CD"

# -- Item use tracking --
scoreboard objectives add mh_revealUse  minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add mh_deceiveUse minecraft.used:minecraft.warped_fungus_on_a_stick

# -- Lives --
scoreboard objectives add mh_lives dummy "MH: Lives"

# -- Deaths (for death detection) --
scoreboard objectives add mh_deaths minecraft.custom:minecraft.deaths

# -- Dragon kill (win condition) --
scoreboard objectives add mh_dragon minecraft.killed:minecraft.ender_dragon

# -- Spectator sabotage trigger --
scoreboard objectives add mh_sabotage trigger "Sabotage"

# -- Set initial phase to 0 (pre-game) --
scoreboard players set $game mh_phase 0

tellraw @a [{"text":"\n[","color":"dark_gray"},{"text":"Manhunt+","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Loaded! To start the game:\n","color":"green"},{"text":"  1) ","color":"yellow"},{"text":"/tag Stefan add hunter\n","color":"white"},{"text":"  2) ","color":"yellow"},{"text":"/tag AdrijanAdo add speedrunner\n","color":"white"},{"text":"  3) ","color":"yellow"},{"text":"/function manhunt:start_hunt","color":"aqua","bold":true},{"text":"  ← THIS one. Not begin_hunt.\n","color":"red"}]
