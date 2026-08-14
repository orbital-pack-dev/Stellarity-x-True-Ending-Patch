# =====================================================================
# ste_cos:mechanics/portal_danger_spawn
# Positioned 0 64 0 (у портала). Дракон дальше 25 блоков.
# Спавним облако под размер портала Stellarity (Радиус 18).
# =====================================================================

# Спавним широкое облако, если в радиусе 20 блоков его ещё нет
execute unless entity @e[type=area_effect_cloud,tag=ste_cos_portal_danger,distance=..20,limit=1] run summon area_effect_cloud 0 62 0 {Tags:["ste_cos_portal_danger"],custom_particle:{type:"minecraft:dragon_breath"},Radius:18.0f,RadiusOnUse:0.0f,RadiusPerTick:0.0f,Duration:5,WaitTime:0,potion_contents:{custom_effects:[{id:"minecraft:instant_damage",duration:1,amplifier:0},{id:"minecraft:wither",duration:60,amplifier:1}]}}

# Если облако уже есть — сбрасываем Duration (refresh)
execute as @e[type=area_effect_cloud,tag=ste_cos_portal_danger,distance=..20,limit=1] run data modify entity @s Duration set value 5
