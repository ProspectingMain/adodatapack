# ============================================================
#  MANHUNT+ | give_hunter_items.mcfunction
# ============================================================

# -- LOCATION REVEALER (carrot_on_a_stick, right-click detectable) --
give @a[tag=hunter] minecraft:carrot_on_a_stick[minecraft:custom_name={text:"✦ Location Revealer",color:"gold",bold:true,italic:false},minecraft:lore=[{text:"Right-click to reveal all runner locations.",color:"gray",italic:false},{text:"Glows runners + plays beacon sound at their position.",color:"gray",italic:false},{text:"",italic:false},{text:"Duration: ",color:"dark_gray",italic:false,extra:[{text:"10 seconds",color:"gold",italic:false}]},{text:"Cooldown: ",color:"dark_gray",italic:false,extra:[{text:"2 minutes",color:"gold",italic:false}]},{text:"",italic:false},{text:"► Hunter only",color:"dark_red",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={tool:"mh_revealer"}]

# -- HUNTER COMPASS --
give @a[tag=hunter] minecraft:compass[minecraft:custom_name={text:"✦ Hunter's Instinct",color:"red",bold:true,italic:false},minecraft:lore=[{text:"Points toward the nearest runner.",color:"gray",italic:false},{text:"Run /function manhunt:point_compass to refresh.",color:"dark_gray",italic:false},{text:"",italic:false},{text:"► Hunter only",color:"dark_red",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={tool:"mh_compass"}]
