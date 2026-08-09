# Увеличиваем общий счетчик ID
scoreboard players add #guard_id ste_cos.flags 1

# Случайный начальный поворот маркера (0..359)
execute store result score #ry ste_cos.flags run random value 0..359

# Маркер привязки в позиции кристалла
summon marker ~ ~ ~ {Tags:["ste_cos_guard_marker","ste_cos_guard_marker_new"]}
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags

# Устанавливаем начальный угол
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] run scoreboard players operation @s ste_cos.ry = #ry ste_cos.flags

# Случайная высота (0.5 - 3.5)
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] at @s run tp @s ~ ~0.5 ~
execute store result score #rh ste_cos.flags run random value 0..3
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..5,limit=1] at @s if score #rh ste_cos.flags matches 1.. run tp @s ~ ~1 ~
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..5,limit=1] at @s if score #rh ste_cos.flags matches 2.. run tp @s ~ ~1 ~
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..5,limit=1] at @s if score #rh ste_cos.flags matches 3.. run tp @s ~ ~1 ~

# Случайный радиус (4 - 8)
execute store result score #rr ste_cos.flags run random value 4..8
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..5,limit=1] run scoreboard players operation @s ste_cos.radius = #rr ste_cos.flags

tag @e[type=marker,tag=ste_cos_guard_marker_new] remove ste_cos_guard_marker_new

# Фантом-страж
execute positioned ~4 ~3 ~ run summon phantom ~ ~ ~ {Tags:["ste_cos_guard","ste_cos_guard_new"],NoAI:1b,Silent:1b,Health:50.0f,Attributes:[{Name:"generic.max_health",Base:50.0}],PersistenceRequired:1b}
execute as @e[type=phantom,tag=ste_cos_guard_new,distance=..8,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags
tag @e[type=phantom,tag=ste_cos_guard_new] remove ste_cos_guard_new

