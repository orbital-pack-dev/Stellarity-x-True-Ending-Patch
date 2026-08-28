# ste_cos:egg/egg_tick
# Яйцо дракона
#
# Механика боя
# Яйцо дракона
# Механика боя
# Яйцо дракона

# Механика боя
execute in minecraft:the_end unless entity @e[type=marker,tag=ste_cos_egg_tracker] run summon marker 0 66 0 {Tags:["ste_cos_egg_tracker"]}

execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_glow

execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_find
