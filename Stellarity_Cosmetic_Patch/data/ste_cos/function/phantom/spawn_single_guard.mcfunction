# Увеличиваем общий счетчик ID
scoreboard players add #guard_id ste_cos.flags 1

# Случайный начальный поворот маркера (0..359)
execute store result score #ry ste_cos.flags run random value 0..359

# Маркер привязки в позиции кристалла
summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["ste_cos_guard_marker","ste_cos_guard_marker_new"]}
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags

# Устанавливаем начальный угол
execute store result storage ste_cos:macro ry int 1 run scoreboard players get #ry ste_cos.flags
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] run function ste_cos:phantom/set_yaw_macro with storage ste_cos:macro

# Случайная высота (0.5 - 3.5)
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] at @s run tp @s ~ ~0.5 ~
execute store result score #rh ste_cos.flags run random value 0..3
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] at @s if score #rh ste_cos.flags matches 1.. run tp @s ~ ~1 ~
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] at @s if score #rh ste_cos.flags matches 2.. run tp @s ~ ~1 ~
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] at @s if score #rh ste_cos.flags matches 3.. run tp @s ~ ~1 ~

# Случайный радиус (4 - 8)
execute store result score #rr ste_cos.flags run random value 4..8
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] run scoreboard players operation @s ste_cos.radius = #rr ste_cos.flags

tag @e[type=armor_stand,tag=ste_cos_guard_marker_new] remove ste_cos_guard_marker_new

# Фантом-страж
execute positioned ~4 ~3 ~ run summon phantom ~ ~ ~ {Tags:["ste_cos_guard","ste_cos_guard_new"],NoAI:1b,Silent:1b,Health:50.0f,Attributes:[{id:"minecraft:generic.max_health",base:50.0}],PersistenceRequired:1b}
execute as @e[type=phantom,tag=ste_cos_guard_new,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags
tag @e[type=phantom,tag=ste_cos_guard_new] remove ste_cos_guard_new

# Убираем тег с кристалла, чтобы он больше не спавнил фантомов
tag @s remove ste_cos_needs_phantom
