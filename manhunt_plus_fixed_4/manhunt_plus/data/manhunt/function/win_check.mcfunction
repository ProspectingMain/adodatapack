# ============================================================
#  MANHUNT+ | win_check.mcfunction
#  Checks both win conditions each tick during Phase 2.
# ============================================================

# ---- RUNNERS WIN: Any runner killed the Ender Dragon ----
execute if score $game mh_phase matches 2 if entity @a[tag=speedrunner,scores={mh_dragon=1..}] run function manhunt:runners_win

# ---- HUNTER WINS: No alive runners remain ----
execute if score $game mh_phase matches 2 unless entity @a[tag=mh_alive] run function manhunt:hunters_win
