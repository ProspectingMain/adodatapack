# ============================================================
#  MANHUNT+ | start_hunt.mcfunction
#  Admin command: /function manhunt:start_hunt
#  Run AFTER tagging all players (speedrunner / hunter).
#  Sets up the game, scatters players, gives tools, starts grace.
# ============================================================

# -- Phase 1: Grace Period --
scoreboard players set $game mh_phase 1
scoreboard players set $game mh_timer 0

# -- World Border (6000 diameter = 3000 radius) --
worldborder set 6000
worldborder center 0 0
worldborder damage amount 0.5
worldborder damage buffer 10
worldborder warning distance 200
worldborder warning time 15

# -- Reset use counters --
scoreboard players reset @a mh_revealUse
scoreboard players reset @a mh_deceiveUse
scoreboard players reset @a mh_deaths
scoreboard players reset @a mh_dragon

# -- Lives (2 lives per runner) --
scoreboard players set @a[tag=speedrunner] mh_lives 2

# -- Cooldowns to 0 --
scoreboard players set @a[tag=hunter] mh_revealCD 0
scoreboard players set @a[tag=speedrunner] mh_deceiveCD 0
scoreboard players set @a[tag=mh_spectator] mh_sabotCD 0

# -- Tag all runners as alive --
tag @a[tag=speedrunner] add mh_alive

# -- Gamemodes --
gamemode survival @a[tag=speedrunner]
# Hunter is spectator during grace period
gamemode spectator @a[tag=hunter]

# ============================================================
#  SCATTER PLAYERS to random locations
#  spreadplayers: min 300 blocks apart, within 800 blocks of 0,0
#  Big enough to loot up, not so far the world is unloaded.
# ============================================================
spreadplayers 0 0 300 800 false @a[tag=speedrunner]
spreadplayers 0 0 300 800 false @a[tag=hunter]

# -- Scatter announcement --
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"Manhunt+","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You have been scattered across the world! ","color":"aqua"},{"text":"Use this time to loot up.","color":"yellow"}]

# -- Titles --
title @a[tag=hunter] title  {"text":"YOU ARE THE HUNTER","color":"red","bold":true}
title @a[tag=hunter] subtitle {"text":"You will be released after the grace period","color":"white"}
title @a[tag=speedrunner] title  {"text":"GRACE PERIOD","color":"green","bold":true}
title @a[tag=speedrunner] subtitle {"text":"25 minutes to prepare - then the hunt begins!","color":"yellow"}

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 5 1

# -- Give items --
function manhunt:give_runner_items
function manhunt:give_hunter_items

# -- Announce --
tellraw @a [{"text":"\n[","color":"dark_gray"},{"text":"Manhunt+","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Grace period has started!","color":"green"},{"text":"\n  Runners: gather resources, find loot, reach the End.","color":"yellow"},{"text":"\n  Hunter: you will be released in 25 minutes.","color":"red"},{"text":"\n  Goal: KILL THE ENDER DRAGON to win!\n","color":"aqua","bold":true}]
