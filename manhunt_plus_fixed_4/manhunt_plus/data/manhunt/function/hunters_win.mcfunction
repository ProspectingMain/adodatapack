# ============================================================
#  MANHUNT+ | hunters_win.mcfunction
#  Triggered when all runners have been eliminated.
# ============================================================

# -- Stop the game --
scoreboard players set $game mh_phase 3

# -- Fireworks for hunter --
execute as @a[tag=hunter] at @s run summon minecraft:firework_rocket ~ ~2 ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:2,colors:[I;16711680,16711680],fade_colors:[I;0],has_twinkle:1b,has_trail:1b}],flight_duration:3}}}}
execute as @a[tag=hunter] at @s run summon minecraft:firework_rocket ~2 ~3 ~2 {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:4,colors:[I;16711680,8388608],has_trail:1b}],flight_duration:2}}}}

effect give @a[tag=hunter] minecraft:regeneration 30 4 true
effect give @a[tag=hunter] minecraft:saturation   30 5 true

# -- Put everyone in adventure to freeze the game --
gamemode adventure @a

# -- Win titles --
title @a[tag=hunter] title    {"text":"YOU WIN!","color":"red","bold":true}
title @a[tag=hunter] subtitle {"text":"All runners have been eliminated!","color":"white"}

title @a[tag=speedrunner]    title    {"text":"YOU LOSE","color":"dark_red","bold":true}
title @a[tag=speedrunner]    subtitle {"text":"Ice hunted you all down...","color":"red"}
title @a[tag=mh_spectator] title    {"text":"HUNTER WINS","color":"red","bold":true}
title @a[tag=mh_spectator] subtitle {"text":"Ice eliminated all runners!","color":"white"}

# -- Sounds --
playsound minecraft:entity.wither.spawn   master @a ~ ~ ~ 5 0.8
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 3 0.6

# -- Chat --
tellraw @a [{"text":"\n████████████████████████████████\n","color":"red"},{"text":"    HUNTER WINS!\n","color":"red","bold":true},{"text":"    Ice eliminated all runners!\n","color":"yellow"},{"text":"    The Ender Dragon lives on...\n","color":"white"},{"text":"████████████████████████████████\n","color":"red"}]
