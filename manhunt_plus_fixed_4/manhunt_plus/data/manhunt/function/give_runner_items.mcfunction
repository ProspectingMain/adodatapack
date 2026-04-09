# ============================================================
#  MANHUNT+ | give_runner_items.mcfunction
# ============================================================

# -- DECEIVE TOOL (warped_fungus_on_a_stick, right-click detectable) --
give @a[tag=speedrunner,tag=mh_alive] minecraft:warped_fungus_on_a_stick[minecraft:custom_name={text:"✦ Deceive",color:"aqua",bold:true,italic:false},minecraft:lore=[{text:"Right-click to vanish to a random nearby location.",color:"gray",italic:false},{text:"",italic:false},{text:"Cooldown: ",color:"dark_gray",italic:false,extra:[{text:"10 minutes",color:"aqua",italic:false}]},{text:"",italic:false},{text:"► Runner only",color:"dark_aqua",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={tool:"mh_deceive"}]
