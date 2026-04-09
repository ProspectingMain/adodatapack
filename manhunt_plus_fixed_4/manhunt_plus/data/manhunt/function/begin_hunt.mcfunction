# ============================================================
#  MANHUNT+ | begin_hunt.mcfunction
#  Called INTERNALLY when the grace timer expires (30000 ticks).
#  DO NOT run this manually — run /function manhunt:start_hunt instead.
# ============================================================

# -- Safety guard: only works if phase is currently 1 (grace period) --
execute unless score $game mh_phase matches 1 run tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"text":"ERROR: begin_hunt requires the game to be in grace period (phase 1).","color":"red"},{"text":" Did you mean: ","color":"yellow"},{"text":"/function manhunt:start_hunt","color":"white"},{"text":"?","color":"yellow"}]
execute unless score $game mh_phase matches 1 run return 0

# -- Switch to Phase 2 --
scoreboard players set $game mh_phase 2
scoreboard players set $game mh_timer 0

# -- Release hunter into survival --
gamemode survival @a[tag=hunter]

# -- Give hunter the Raid Boss buffs (permanent via hunt_tick) --
effect give @a[tag=hunter] minecraft:speed 99999 1 true
effect give @a[tag=hunter] minecraft:resistance 99999 0 true

# -- Reset use counters before hunt starts --
scoreboard players reset @a[tag=hunter] mh_revealUse

# -- Dramatic announcement --
title @a title  {"text":"THE HUNT BEGINS","color":"red","bold":true}
title @a subtitle {"text":"Ice has been released!","color":"white"}
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 5 1
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 3 0.5

tellraw @a [{"text":"\n[","color":"dark_gray"},{"text":"Manhunt+","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"THE HUNT HAS BEGUN! ","color":"red","bold":true},{"text":"Ice is now hunting you. RUN!","color":"yellow"},{"text":"\n  Runners: use your ","color":"white"},{"text":"Deceive Tool","color":"aqua"},{"text":" to escape!","color":"white"},{"text":"\n  Hunter: use your ","color":"white"},{"text":"Location Revealer","color":"gold"},{"text":" to find them!\n","color":"white"}]
