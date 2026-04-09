# ============================================================
#  MANHUNT+ | spectator_sabotage.mcfunction
#  A spectator/eliminated runner uses /trigger mh_sabotage
#  Picks a random effect to unleash on the hunter!
#  Runs as the spectator player.
# ============================================================

# -- Reset trigger and set cooldown (3600 ticks = 3 minutes) --
scoreboard players set @s mh_sabotage 0
scoreboard players set @s mh_sabotCD 3600

# -- Pick a random sabotage (1-5) using random command --
execute store result score $rand mh_timer run random value 1..5

# ---- SABOTAGE 1: Blindness Bomb ----
# Hunter goes blind + nauseous for 12 seconds
execute if score $rand mh_timer matches 1 run effect give @a[tag=hunter] minecraft:blindness 12 0 false
execute if score $rand mh_timer matches 1 run effect give @a[tag=hunter] minecraft:nausea 12 0 false
execute if score $rand mh_timer matches 1 run tellraw @a [{"text":"[SABOTAGE] ","color":"dark_purple","bold":true},{"selector":"@s","color":"light_purple"},{"text":" cast a ","color":"yellow"},{"text":"Blindness Bomb","color":"red"},{"text":" on Ice!","color":"yellow"}]
execute if score $rand mh_timer matches 1 run title @a[tag=hunter] title {"text":"SABOTAGED!","color":"dark_purple","bold":true}
execute if score $rand mh_timer matches 1 run title @a[tag=hunter] subtitle {"text":"Blindness Bomb — you can't see!","color":"white"}

# ---- SABOTAGE 2: Phantom Swarm ----
# Spawn 3 phantoms around the hunter
execute if score $rand mh_timer matches 2 as @a[tag=hunter] at @s run summon minecraft:phantom ~5 ~3 ~0
execute if score $rand mh_timer matches 2 as @a[tag=hunter] at @s run summon minecraft:phantom ~-5 ~3 ~0
execute if score $rand mh_timer matches 2 as @a[tag=hunter] at @s run summon minecraft:phantom ~0 ~3 ~5
execute if score $rand mh_timer matches 2 run tellraw @a [{"text":"[SABOTAGE] ","color":"dark_purple","bold":true},{"selector":"@s","color":"light_purple"},{"text":" unleashed a ","color":"yellow"},{"text":"Phantom Swarm","color":"dark_aqua"},{"text":" on Ice!","color":"yellow"}]
execute if score $rand mh_timer matches 2 run title @a[tag=hunter] title {"text":"PHANTOM SWARM!","color":"dark_aqua","bold":true}

# ---- SABOTAGE 3: Wither Curse ----
# Hunter gets Wither II + Weakness II for 8 seconds
execute if score $rand mh_timer matches 3 run effect give @a[tag=hunter] minecraft:wither 8 1 false
execute if score $rand mh_timer matches 3 run effect give @a[tag=hunter] minecraft:weakness 8 1 false
execute if score $rand mh_timer matches 3 run tellraw @a [{"text":"[SABOTAGE] ","color":"dark_purple","bold":true},{"selector":"@s","color":"light_purple"},{"text":" put a ","color":"yellow"},{"text":"Wither Curse","color":"dark_green"},{"text":" on Ice!","color":"yellow"}]
execute if score $rand mh_timer matches 3 run title @a[tag=hunter] title {"text":"WITHER CURSE!","color":"dark_green","bold":true}

# ---- SABOTAGE 4: Lightning Hex ----
# Strike lightning at the hunter (does not set fire in rain, but damages)
execute if score $rand mh_timer matches 4 as @a[tag=hunter] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute if score $rand mh_timer matches 4 as @a[tag=hunter] at @s run summon minecraft:lightning_bolt ~3 ~ ~3
execute if score $rand mh_timer matches 4 run tellraw @a [{"text":"[SABOTAGE] ","color":"dark_purple","bold":true},{"selector":"@s","color":"light_purple"},{"text":" called down a ","color":"yellow"},{"text":"Lightning Hex","color":"yellow"},{"text":" on Ice!","color":"yellow"}]
execute if score $rand mh_timer matches 4 run title @a[tag=hunter] title {"text":"LIGHTNING HEX!","color":"yellow","bold":true}

# ---- SABOTAGE 5: Slowness Trap ----
# Hunter gets Slowness III + Mining Fatigue III for 15 seconds
execute if score $rand mh_timer matches 5 run effect give @a[tag=hunter] minecraft:slowness 15 2 false
execute if score $rand mh_timer matches 5 run effect give @a[tag=hunter] minecraft:mining_fatigue 15 2 false
execute if score $rand mh_timer matches 5 run tellraw @a [{"text":"[SABOTAGE] ","color":"dark_purple","bold":true},{"selector":"@s","color":"light_purple"},{"text":" activated a ","color":"yellow"},{"text":"Slowness Trap","color":"blue"},{"text":" on Ice!","color":"yellow"}]
execute if score $rand mh_timer matches 5 run title @a[tag=hunter] title {"text":"SLOWNESS TRAP!","color":"blue","bold":true}

# -- Cooldown reminder to spectator --
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 2 2
tellraw @s [{"text":"[Sabotage] ","color":"dark_purple"},{"text":"Sabotage activated! Cooldown: 3 minutes.","color":"light_purple"}]
