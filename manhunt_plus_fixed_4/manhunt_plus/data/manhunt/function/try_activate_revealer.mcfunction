# ============================================================
#  MANHUNT+ | try_activate_revealer.mcfunction
#  Called when hunter right-clicks the Location Revealer.
#  Runs as the hunter player.
# ============================================================

# Reset the use counter first
scoreboard players set @s mh_revealUse 0

# If on cooldown: show message
execute if score @s mh_revealCD matches 1.. run tellraw @s [{"text":"[Revealer] ","color":"gold"},{"text":"Still on cooldown! ","color":"red"},{"score":{"name":"@s","objective":"mh_revealCD"}},{"text":" ticks remaining.","color":"red"}]

# If ready: activate
execute if score @s mh_revealCD matches 0 run function manhunt:revealer_activate
