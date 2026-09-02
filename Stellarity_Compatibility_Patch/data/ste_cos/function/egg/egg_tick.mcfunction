# ste_cos:egg/egg_tick
# слежение за яйцом дракона

# создаем маркер один раз
execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run summon marker 0 66 0 {Tags:["ste_cos_egg_tracker"]}
execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run scoreboard players set #egg_tracker_spawned ste_cos.flags 1

# эффекты когда яйцо на месте
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_glow

# таймер когда яйцо пропало
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg run scoreboard players add @s ste_cos.egg_timer 1

# сброс таймера если яйцо вернулось
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run scoreboard players set @s ste_cos.egg_timer 0

# запуск поиска через три секунды и далее каждые тридцать тиков
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg if score @s ste_cos.egg_timer matches 60 run function ste_cos:egg/egg_find
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg if score @s ste_cos.egg_timer matches 60 run scoreboard players set @s ste_cos.egg_timer 30
