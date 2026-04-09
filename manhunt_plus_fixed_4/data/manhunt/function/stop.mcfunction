# ============================================================
#  MANHUNT+ | stop.mcfunction
#  Force-stops the game. Run with /function manhunt:stop
# ============================================================

scoreboard players set $game mh_phase 0

gamemode survival @a

effect clear @a

title @a title  {"text":"GAME STOPPED","color":"gray","bold":true}
title @a subtitle {"text":"An admin ended the game.","color":"white"}

tellraw @a [{"text":"[Manhunt+] ","color":"gold"},{"text":"The game has been forcefully stopped by an admin.","color":"gray"}]

# -- Clean up tags --
tag @a remove mh_alive
