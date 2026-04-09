# ============================================================
#  MANHUNT+ | point_compass.mcfunction
#  Admin can run this any time, or hook into hunt_tick
#  to update automatically.
#  Makes the hunter's compass point toward the nearest alive runner
#  by placing a lodestone at that runner's location.
# ============================================================

# -- Place a lodestone at the nearest alive runner's feet --
execute as @a[tag=hunter] at @s run execute as @a[tag=speedrunner,tag=mh_alive,limit=1,sort=nearest] at @s run setblock ~ ~ ~ minecraft:lodestone

# -- Give updated Lodestone Compass to hunter pointing at that block --
execute as @a[tag=hunter] at @s run execute as @a[tag=speedrunner,tag=mh_alive,limit=1,sort=nearest] at @s run give @a[tag=hunter] minecraft:compass[
  minecraft:lodestone_tracker={target:{pos:[I;~0,~0,~0],dimension:"minecraft:overworld"},tracked:1b},
  minecraft:custom_name='{"text":"✦ Hunter\'s Instinct","color":"red","bold":true,"italic":false}',
  minecraft:lore=[
    '{"text":"Points toward the nearest runner.","color":"gray","italic":false}',
    '{"text":"(Run /function manhunt:point_compass to refresh)","color":"dark_gray","italic":false}',
    '{"text":"","italic":false}',
    '{"text":"► Only usable by Ice (The Hunter)","color":"dark_red","italic":false}'
  ],
  minecraft:enchantment_glint_override=true,
  minecraft:custom_data={tool:"mh_compass"}
]

tellraw @a[tag=hunter] [{"text":"[Compass] ","color":"red"},{"text":"Compass updated! Pointing to nearest runner.","color":"yellow"}]
