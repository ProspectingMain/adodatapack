# ============================================================
#  MANHUNT+ | respawn_runner.mcfunction
#  Runner died but still has lives. Respawns them with items.
#  Runs as the runner player.
# ============================================================

# -- Wait for natural respawn to happen (they respawn normally in survival) --
# -- Re-give their Deceive Tool after respawn --
function manhunt:give_runner_items

# -- Give a brief grace from hunter: Speed II + Resistance I for 15s --
effect give @s minecraft:speed 15 1 true
effect give @s minecraft:resistance 15 0 true

# -- Show remaining lives --
title @s title  {"text":"LIFE LOST!","color":"red","bold":true}
title @s subtitle [{"text":"Lives remaining: ","color":"white"},{"score":{"name":"@s","objective":"mh_lives"},"color":"yellow","bold":true}]
playsound minecraft:entity.totem_of_undying.use master @s ~ ~ ~ 2 1

# -- Notify everyone --
tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"selector":"@s","color":"red"},{"text":" lost a life! ","color":"yellow"},{"text":"Lives left: ","color":"white"},{"score":{"name":"@s","objective":"mh_lives"},"color":"yellow","bold":true}]
