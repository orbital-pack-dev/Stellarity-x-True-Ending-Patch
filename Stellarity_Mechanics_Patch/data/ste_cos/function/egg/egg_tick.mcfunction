# ste_cos:egg/egg_tick
# Яйцо дракона

# Спавним маркер только один раз (флаг в скорборде)
execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run summon marker 0 66 0 {Tags:["ste_cos_egg_tracker"]}
execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run scoreboard players set #egg_tracker_spawned ste_cos.flags 1

# Яйцо дракона
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_glow

# Яйцо дракона
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_find
