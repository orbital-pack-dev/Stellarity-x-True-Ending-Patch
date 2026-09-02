# ste_cos:egg/egg_tick
# Управляет отслеживанием яйца дракона.
# Спавним маркер один раз на всё время игры (флаг в скорборде)
execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run summon marker 0 66 0 {Tags:["ste_cos_egg_tracker"]}
execute in minecraft:the_end unless score #egg_tracker_spawned ste_cos.flags matches 1 run scoreboard players set #egg_tracker_spawned ste_cos.flags 1

# Если маркер уже стоит на яйце — гоним эффект свечения
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_glow

# Яйцо пропало с позиции маркера: накапливаем таймер ожидания
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg run scoreboard players add @s ste_cos.egg_timer 1

# Сбрасываем таймер когда яйцо снова на месте (игрок вернул яйцо)
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s if block ~ ~ ~ minecraft:dragon_egg run scoreboard players set @s ste_cos.egg_timer 0

# Запускаем поиск только через 3 секунды после исчезновения яйца (60 тиков),
# потом каждые 30 тиков до нахождения. Максимум 800 блоков за вызов.
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg if score @s ste_cos.egg_timer matches 60 run function ste_cos:egg/egg_find
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s unless block ~ ~ ~ minecraft:dragon_egg if score @s ste_cos.egg_timer matches 60 run scoreboard players set @s ste_cos.egg_timer 30
