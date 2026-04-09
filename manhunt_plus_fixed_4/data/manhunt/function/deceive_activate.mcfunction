# ============================================================
#  MANHUNT+ | deceive_activate.mcfunction
#  Teleports the runner to a random safe surface location nearby.
#  Uses /spreadplayers which always finds a safe landing spot.
#  Runs as the runner player.
# ============================================================

# -- Smoke + flash particles at current position (fake-out for hunter) --
execute at @s run particle minecraft:cloud ~ ~1 ~ 0.5 0.5 0.5 0.1 60
execute at @s run particle minecraft:poof ~ ~1 ~ 0.5 0.5 0.5 0.1 30
playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 4 1

# -- Teleport to a random safe surface location --
#    spreadplayers: center=current pos, minDist=20, maxRange=80 blocks,
#    under Y=200, respectTeams=false, target=self
#    This always lands on a solid, non-water surface.
spreadplayers ~ ~ 20 80 under 200 false @s

# -- Arrival particles at new location --
execute at @s run particle minecraft:portal ~ ~1 ~ 0.5 1 0.5 0.1 80
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.3 0.5 0.3 0.05 40
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 2 1.2

# -- Set cooldown: 12000 ticks = 10 minutes --
scoreboard players set @s mh_deceiveCD 12000

# -- Notify runner --
title @s title  {"text":"DECEIVED!","color":"aqua","bold":true}
title @s subtitle {"text":"Teleported away! 10 min cooldown.","color":"white"}

# -- Notify others (but not exact location) --
tellraw @a [{"text":"[Deceive] ","color":"aqua"},{"selector":"@s"},{"text":" used the Deceive Tool and vanished!","color":"yellow"}]
