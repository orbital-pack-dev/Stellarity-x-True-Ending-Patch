# Контекст: AS маркер, AT маркера.
# В execute, "rotated as @s" берёт ПОВОРОТ маркера.
# "as @e[phantom]" меняет EXECUTOR но НЕ меняет позиционный контекст и поворот.
# Поэтому "run tp @s ^ ^ ^R" - "@s" = фантом, "^" = по МАРКЕРНОМУ повороту, позиция = маркера.
# Итог: фантом телепортируется в точку "позиция маркера + R блоков в направлении маркера" - ЭТО ОРБИТА.

scoreboard players operation #orbit_id ste_cos.flags = @s ste_cos.id

execute rotated as @s if score @s ste_cos.radius matches 4 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^4
execute rotated as @s if score @s ste_cos.radius matches 5 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^5
execute rotated as @s if score @s ste_cos.radius matches 6 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^6
execute rotated as @s if score @s ste_cos.radius matches 7 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^7
execute rotated as @s if score @s ste_cos.radius matches 8 as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^8

# Поворачиваем маркер на 3 градуса (для следующего тика)
tp @s ~ ~ ~ ~3 ~