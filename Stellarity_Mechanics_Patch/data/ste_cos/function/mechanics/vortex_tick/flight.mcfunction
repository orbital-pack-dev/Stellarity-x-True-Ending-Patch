# ste_cos:mechanics/vortex_tick/flight
# Механика боя

execute if score @s ste_cos.was_flying matches 0 run function ste_cos:mechanics/vortex_tick/takeoff

# Механика боя
execute unless entity @e[type=area_effect_cloud,tag=ste_cos_vortex_boost,distance=..2] run summon area_effect_cloud ~ ~ ~ {Duration:1000000,Radius:0f,Tags:["ste_cos_vortex_boost"]}

# Механика боя
execute as @e[type=area_effect_cloud,tag=ste_cos_vortex_boost,distance=..5,limit=1,sort=nearest] at @s run function ste_cos:mechanics/vortex_tick/aec_tick
