# ============================================================
#  MANHUNT+ | solo_test.mcfunction
#  For testing alone. Tags you as both speedrunner and hunter,
#  teleports you, gives all tools, skips straight to hunt phase.
#  Command: /function manhunt:solo_test
# ============================================================

# -- Reset everything first --
tag @a remove speedrunner
tag @a remove hunter
tag @a remove mh_alive
tag @a remove mh_spectator

scoreboard players reset @a mh_revealUse
scoreboard players reset @a mh_deceiveUse
scoreboard players reset @a mh_deaths
scoreboard players reset @a mh_dragon

# -- Tag yourself as both roles --
tag @s add speedrunner
tag @s add hunter
tag @s add mh_alive

# -- Reset scores --
scoreboard players set @s mh_lives 2
scoreboard players set @s mh_revealCD 0
scoreboard players set @s mh_deceiveCD 0

# -- Jump straight to hunt phase --
scoreboard players set $game mh_phase 2
scoreboard players set $game mh_timer 0

# -- Set gamemode to survival --
gamemode survival @s

# -- Teleport to a random location to test scatter --
spreadplayers 0 0 100 500 false @s

# -- Give all tools --
function manhunt:give_runner_items
function manhunt:give_hunter_items

# -- Hunter buffs --
effect give @s minecraft:speed 99999 1 true
effect give @s minecraft:resistance 99999 0 true

# -- Announce --
title @s title  {"text":"SOLO TEST MODE","color":"gold","bold":true}
title @s subtitle {"text":"You have both tools. Phase = 2 (hunt active).","color":"yellow"}

tellraw @s [{"text":"\n[Manhunt+] ","color":"gold"},{"text":"Solo test started!\n","color":"green"},{"text":"  ✔ Teleported to random location\n","color":"aqua"},{"text":"  ✔ Given Deceive Tool (warped fungus on a stick)\n","color":"aqua"},{"text":"  ✔ Given Location Revealer (carrot on a stick)\n","color":"aqua"},{"text":"  ✔ Hunt phase active (phase 2)\n","color":"aqua"},{"text":"  Right-click the carrot-on-a-stick to test the Revealer.\n","color":"yellow"},{"text":"  Right-click the warped-fungus-on-a-stick to test Deceive.\n","color":"yellow"}]
