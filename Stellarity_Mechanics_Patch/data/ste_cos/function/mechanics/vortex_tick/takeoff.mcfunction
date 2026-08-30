# ste_cos:mechanics/vortex_tick/takeoff
# Механика боя

execute at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 normal
execute at @s run particle minecraft:cloud ~ ~1 ~ 1 0.2 1 0.2 50 normal
execute at @s run particle minecraft:poof ~ ~1 ~ 1 0.2 1 0.2 50 normal
execute at @s run particle minecraft:large_smoke ~ ~1 ~ 1 0.2 1 0.1 20 normal

# Механика боя
execute at @s run playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 2.0 1.5

# Механика боя
execute at @s run summon firework_rocket ~ ~ ~ {LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:2}}}}
