
# ste_cos:mechanics/vortex_trigger
# Механика боя


scoreboard players set @s ste_cos.still_timer 100

# Механика боя
summon area_effect_cloud ~ ~ ~ {Duration:80,Radius:0.0f,WaitTime:0,Tags:["ste_cos_vortex","ste_cos_vortex_new"]}
execute as @e[type=area_effect_cloud,tag=ste_cos_vortex_new,distance=..1,limit=1] run scoreboard players set @s ste_cos.timer 0
tag @e[type=area_effect_cloud,tag=ste_cos_vortex_new] remove ste_cos_vortex_new

# Механика боя
playsound minecraft:entity.wither.ambient hostile @a[distance=..64] ~ ~ ~ 2.0 0.5
playsound minecraft:block.respawn_anchor.charge hostile @a[distance=..64] ~ ~ ~ 2.0 0.7
