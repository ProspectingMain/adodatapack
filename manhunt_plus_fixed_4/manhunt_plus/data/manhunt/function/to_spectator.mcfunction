# ============================================================
#  MANHUNT+ | to_spectator.mcfunction
#  Runner ran out of lives. They become a spectator who can
#  sabotage the hunter with /trigger mh_sabotage
#  Runs as the eliminated runner.
# ============================================================

# -- Remove alive tag, add spectator tag --
tag @s remove mh_alive
tag @s add mh_spectator

# -- Set to spectator mode --
gamemode spectator @s

# -- Enable their sabotage trigger --
scoreboard players set @s mh_sabotCD 0
scoreboard players enable @s mh_sabotage

# -- Title screen --
title @s title  {"text":"ELIMINATED","color":"dark_red","bold":true}
title @s subtitle {"text":"Use /trigger mh_sabotage to mess with Ice!","color":"yellow"}
playsound minecraft:entity.wither.death master @s ~ ~ ~ 2 1

# -- Instructions in chat --
tellraw @s [{"text":"[Manhunt+] ","color":"gold"},{"text":"You've been eliminated! But the game isn't over for you.\n","color":"red"},{"text":"  Type ","color":"yellow"},{"text":"/trigger mh_sabotage","color":"white"},{"text":" to sabotage the hunter!\n","color":"yellow"},{"text":"  (3 minute cooldown between uses)","color":"gray"}]

# -- Announce to everyone --
tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"selector":"@s","color":"dark_red"},{"text":" has been eliminated and joined the saboteurs!","color":"red"}]

# -- Check if ALL runners are now eliminated (hunter wins) --
function manhunt:win_check
