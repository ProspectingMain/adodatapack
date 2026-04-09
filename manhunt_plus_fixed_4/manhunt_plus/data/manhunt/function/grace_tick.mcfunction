# ============================================================
#  MANHUNT+ | grace_tick.mcfunction
#  Runs every tick during Phase 1 (Grace Period)
#  Duration: 30000 ticks = 25 minutes
# ============================================================

scoreboard players add $game mh_timer 1

# ---- Timed announcements ----

# 20 min remaining (6000 ticks in) - "5 min elapsed"
execute if score $game mh_timer matches 6000 run tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"text":"20 minutes remain in grace period.","color":"green"}]

# 10 min remaining (18000 ticks)
execute if score $game mh_timer matches 18000 run tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"text":"10 minutes until the hunt begins!","color":"yellow"}]
execute if score $game mh_timer matches 18000 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 1

# 5 min remaining (24000 ticks)
execute if score $game mh_timer matches 24000 run tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"text":"5 MINUTES until the hunt begins!","color":"red"}]
execute if score $game mh_timer matches 24000 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 0.8

# 2 min remaining (27600 ticks)
execute if score $game mh_timer matches 27600 run tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"text":"2 MINUTES! Start heading toward safety!","color":"red","bold":true}]

# 1 min remaining (28800 ticks)
execute if score $game mh_timer matches 28800 run title @a title {"text":"1 MINUTE!","color":"red","bold":true}
execute if score $game mh_timer matches 28800 run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 2 0.5

# 30 sec (29400)
execute if score $game mh_timer matches 29400 run tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"text":"30 seconds!","color":"red","bold":true}]

# 10-second countdown (29980 to 29990)
execute if score $game mh_timer matches 29990 run title @a title {"text":"10","color":"red","bold":true}
execute if score $game mh_timer matches 29991 run title @a title {"text":"9","color":"red","bold":true}
execute if score $game mh_timer matches 29992 run title @a title {"text":"8","color":"red","bold":true}
execute if score $game mh_timer matches 29993 run title @a title {"text":"7","color":"red","bold":true}
execute if score $game mh_timer matches 29994 run title @a title {"text":"6","color":"red","bold":true}
execute if score $game mh_timer matches 29995 run title @a title {"text":"5","color":"yellow","bold":true}
execute if score $game mh_timer matches 29996 run title @a title {"text":"4","color":"yellow","bold":true}
execute if score $game mh_timer matches 29997 run title @a title {"text":"3","color":"yellow","bold":true}
execute if score $game mh_timer matches 29998 run title @a title {"text":"2","color":"yellow","bold":true}
execute if score $game mh_timer matches 29999 run title @a title {"text":"1","color":"yellow","bold":true}

# ---- Trigger hunt start at 30000 ticks (25 min) ----
execute if score $game mh_timer matches 30000.. run function manhunt:begin_hunt
