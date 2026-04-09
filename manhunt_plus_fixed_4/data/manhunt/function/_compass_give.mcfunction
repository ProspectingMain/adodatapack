# ============================================================
#  MANHUNT+ | _compass_give.mcfunction  (MACRO FUNCTION)
#  Gives the hunter a lodestone compass pointing to $(px) $(py) $(pz)
#  Called via: function manhunt:_compass_give with storage manhunt:tmp
# ============================================================
$give @a[tag=hunter] minecraft:compass[minecraft:lodestone_tracker={target:{pos:[I;$(px),$(py),$(pz)],dimension:"minecraft:overworld"},tracked:1b},minecraft:custom_name={text:"✦ Hunter's Instinct",color:"red",bold:true,italic:false},minecraft:lore=[{text:"Points toward the nearest runner.",color:"gray",italic:false},{text:"",italic:false},{text:"► Hunter only",color:"dark_red",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={tool:"mh_compass"}]
