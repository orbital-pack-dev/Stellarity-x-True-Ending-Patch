# ste_cos:egg/egg_tick
# слежение за яйцом дракона

execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run summon marker 0 67 0 {Tags:["ste_cos_egg_tracker"]}
execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run scoreboard players set #egg_tracker_spawned ste_cos.flags 1

# эффекты
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_glow

# таймер
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg run scoreboard players add @s ste_cos.egg_timer 1

# сброс таймера
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run scoreboard players set @s ste_cos.egg_timer 0

# поиск
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg if score @s ste_cos.egg_timer matches 60 run function ste_cos:egg/egg_find
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg if score @s ste_cos.egg_timer matches 60 run scoreboard players set @s ste_cos.egg_timer 30
