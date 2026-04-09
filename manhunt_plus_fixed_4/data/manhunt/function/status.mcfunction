# ============================================================
#  MANHUNT+ | status.mcfunction
#  Shows the current game state to ALL players.
#  Run with /function manhunt:status
# ============================================================

tellraw @a [{"text":"\n--- ","color":"dark_gray"},{"text":"Manhunt+ Status","color":"gold","bold":true},{"text":" ---","color":"dark_gray"}]
tellraw @a [{"text":"  Phase: ","color":"yellow"},{"score":{"name":"$game","objective":"mh_phase"},"color":"white"},{"text":" (0=lobby 1=grace 2=hunt 3=ended)","color":"dark_gray"}]
tellraw @a [{"text":"  Timer: ","color":"yellow"},{"score":{"name":"$game","objective":"mh_timer"},"color":"white"},{"text":" ticks","color":"dark_gray"}]

# ---- Alive Runners ----
tellraw @a [{"text":"  Alive Runners: ","color":"green","bold":true}]
# execute AS each alive runner so @s = that runner, but tellraw goes to @a (everyone)
execute as @a[tag=speedrunner,tag=mh_alive] run tellraw @a [{"text":"    ► ","color":"dark_green"},{"selector":"@s"},{"text":"  (Lives: ","color":"dark_gray"},{"score":{"name":"@s","objective":"mh_lives"},"color":"yellow"},{"text":")","color":"dark_gray"}]
execute unless entity @a[tag=speedrunner,tag=mh_alive] run tellraw @a [{"text":"    (none)","color":"dark_gray"}]

# ---- Hunter ----
tellraw @a [{"text":"  Hunter: ","color":"red","bold":true}]
execute as @a[tag=hunter] run tellraw @a [{"text":"    ► ","color":"dark_red"},{"selector":"@s"},{"text":"  (Revealer CD: ","color":"dark_gray"},{"score":{"name":"@s","objective":"mh_revealCD"},"color":"yellow"},{"text":" ticks)","color":"dark_gray"}]
execute unless entity @a[tag=hunter] run tellraw @a [{"text":"    (not assigned — tag someone with: /tag <name> add hunter)","color":"dark_gray"}]

# ---- Spectators/Saboteurs ----
tellraw @a [{"text":"  Saboteurs: ","color":"light_purple","bold":true}]
execute as @a[tag=mh_spectator] run tellraw @a [{"text":"    ► ","color":"dark_purple"},{"selector":"@s"},{"text":"  (Sabotage CD: ","color":"dark_gray"},{"score":{"name":"@s","objective":"mh_sabotCD"},"color":"yellow"},{"text":" ticks)","color":"dark_gray"}]
execute unless entity @a[tag=mh_spectator] run tellraw @a [{"text":"    (none)","color":"dark_gray"}]

tellraw @a [{"text":"----------------------------\n","color":"dark_gray"}]
