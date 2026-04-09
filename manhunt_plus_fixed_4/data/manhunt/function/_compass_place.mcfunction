# ============================================================
#  MANHUNT+ | _compass_place.mcfunction
#  Internal helper - runs AT the nearest runner's position.
#  Stores their coords in storage, then calls macro to give compass.
# ============================================================

# Place lodestone at runner's feet
setblock ~ ~ ~ minecraft:lodestone

# Store integer block coordinates into storage
execute store result storage manhunt:tmp px int 1 run data get entity @s Pos[0]
execute store result storage manhunt:tmp py int 1 run data get entity @s Pos[1]
execute store result storage manhunt:tmp pz int 1 run data get entity @s Pos[2]

# Call macro function with the stored coordinates
function manhunt:_compass_give with storage manhunt:tmp
