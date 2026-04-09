# ============================================================
#  MANHUNT+ | runners_win.mcfunction
#  Triggered when a runner kills the Ender Dragon.
# ============================================================

# -- Stop the game --
scoreboard players set $game mh_phase 3

# -- Fireworks + effects for runners --
execute as @a[tag=speedrunner] at @s run summon minecraft:firework_rocket ~ ~2 ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:2,colors:[I;16711680,16776960],fade_colors:[I;16777215],has_twinkle:1b}],flight_duration:2}}}}
execute as @a[tag=speedrunner] at @s run summon minecraft:firework_rocket ~1 ~3 ~1 {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:4,colors:[I;65280,16776960],has_trail:1b,has_twinkle:1b}],flight_duration:2}}}}
execute as @a[tag=speedrunner] at @s run summon minecraft:firework_rocket ~-1 ~4 ~-1 {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:1,colors:[I;255,16711935],has_trail:1b}],flight_duration:3}}}}

effect give @a[tag=speedrunner] minecraft:regeneration 30 4 true
effect give @a[tag=speedrunner] minecraft:saturation 30 5 true

# -- Put everyone in adventure to freeze the game --
gamemode adventure @a

# -- Win titles --
title @a[tag=speedrunner] title    {"text":"YOU WIN!","color":"green","bold":true}
title @a[tag=speedrunner] subtitle {"text":"The Ender Dragon is dead!","color":"yellow"}

title @a[tag=hunter] title    {"text":"YOU LOSE","color":"dark_red","bold":true}
title @a[tag=hunter] subtitle {"text":"The runners slew the Ender Dragon...","color":"red"}

title @a[tag=mh_spectator] title    {"text":"RUNNERS WIN","color":"green","bold":true}
title @a[tag=mh_spectator] subtitle {"text":"The dragon has been defeated!","color":"yellow"}

# -- Sounds --
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 5 1
playsound minecraft:entity.ender_dragon.death master @a ~ ~ ~ 5 0.8

# -- Chat announcement --
tellraw @a [{"text":"\n████████████████████████████████\n","color":"green"},{"text":"    RUNNERS WIN!\n","color":"green","bold":true},{"text":"    The Ender Dragon has been slain!\n","color":"yellow"},{"text":"    Ice couldn't stop them in time.\n","color":"white"},{"text":"████████████████████████████████\n","color":"green"}]
