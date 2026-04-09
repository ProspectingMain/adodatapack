# ============================================================
#  MANHUNT+ | try_deceive.mcfunction
#  Called when a runner right-clicks the Deceive Tool.
#  Runs as the runner player.
# ============================================================

# Reset use counter
scoreboard players set @s mh_deceiveUse 0

# If on cooldown: show message
execute if score @s mh_deceiveCD matches 1.. run tellraw @s [{"text":"[Deceive] ","color":"aqua"},{"text":"Still on cooldown! ","color":"red"},{"score":{"name":"@s","objective":"mh_deceiveCD"}},{"text":" ticks remaining.","color":"red"}]

# If ready: activate
execute if score @s mh_deceiveCD matches 0 run function manhunt:deceive_activate
