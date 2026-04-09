# ============================================================
#  MANHUNT+ | revealer_activate.mcfunction
#  Reveals all alive runners via glowing + sound beacon.
#  Runs as the hunter player.
# ============================================================

# -- Apply Glowing effect to all alive runners (10 seconds) --
effect give @a[tag=speedrunner,tag=mh_alive] minecraft:glowing 10 0 true

# -- Play a loud beacon sound AT each runner's location --
#    (The hunter will hear the direction of the sound!)
execute as @a[tag=speedrunner,tag=mh_alive] at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 8 1.5
execute as @a[tag=speedrunner,tag=mh_alive] at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 8 1.5

# -- Particle burst at each runner so hunter can spot them --
execute as @a[tag=speedrunner,tag=mh_alive] at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.05 50

# -- Set cooldown: 2400 ticks = 2 minutes --
scoreboard players set @s mh_revealCD 2400

# -- Notify hunter --
title @s title  {"text":"RUNNERS REVEALED!","color":"gold","bold":true}
title @s subtitle {"text":"10 seconds of visibility | 2 min cooldown","color":"white"}
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 2 2

# -- Warn runners --
title @a[tag=speedrunner,tag=mh_alive] title  {"text":"YOU HAVE BEEN REVEALED!","color":"red","bold":true}
title @a[tag=speedrunner,tag=mh_alive] subtitle {"text":"Ice knows where you are! MOVE!","color":"yellow"}
playsound minecraft:entity.elder_guardian.curse master @a[tag=speedrunner,tag=mh_alive] ~ ~ ~ 2 1

tellraw @a [{"text":"[Revealer] ","color":"gold"},{"text":"Ice has activated the Location Revealer!","color":"red"},{"text":" Runners are glowing for 10 seconds!","color":"yellow"}]
