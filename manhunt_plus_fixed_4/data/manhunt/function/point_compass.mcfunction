# ============================================================
#  MANHUNT+ | point_compass.mcfunction
#  Updates hunter's compass to track nearest alive runner.
#  Uses macros to pass real coordinates into the lodestone item.
# ============================================================

# -- Clear old tracking compass from hunter --
execute as @a[tag=hunter] run clear @s minecraft:compass[minecraft:custom_data~{tool:"mh_compass"}]

# -- For each hunter, find nearest runner and set up tracking --
execute as @a[tag=hunter] at @s as @a[tag=speedrunner,tag=mh_alive,limit=1,sort=nearest] at @s run function manhunt:_compass_place

tellraw @a[tag=hunter] [{"text":"[Compass] ","color":"red"},{"text":"Compass updated — pointing to nearest runner.","color":"yellow"}]
