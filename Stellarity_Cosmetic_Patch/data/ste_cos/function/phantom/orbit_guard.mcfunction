# Контекст: AS маркер, AT маркера.
# Цепочка execute:
#   at @s = позиция маркера
#   rotated as @s = поворот маркера (до tp!)
#   as @e[phantom, нет limit] + if score = выбираем нашего фантома по ID
#   run tp @s ^ ^ ^R = tp фантома вперёд R блоков относительно поворота маркера из позиции маркера

scoreboard players operation #orbit_id ste_cos.flags = @s ste_cos.id

execute at @s rotated as @s if score @s ste_cos.radius matches 4 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^4
execute at @s rotated as @s if score @s ste_cos.radius matches 5 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^5
execute at @s rotated as @s if score @s ste_cos.radius matches 6 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^6
execute at @s rotated as @s if score @s ste_cos.radius matches 7 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^7
execute at @s rotated as @s if score @s ste_cos.radius matches 8 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^8

# Поворачиваем маркер ПОСЛЕ того как фантом двинулся
tp @s ~ ~ ~ ~3 ~