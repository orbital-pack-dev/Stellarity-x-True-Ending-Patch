# ste_cos:phantom/orbit_guard
# AS маркер, AT маркера.
# Каждый тик: двигаем фантома-стража на орбиту вокруг маркера.
#
# МЕХАНИЗМ ОРБИТЫ:
#   "execute if score @s(=маркер) ste_cos.radius matches N
#           rotated as @s(=маркер) positioned ^ ^ ^N
#           as @e[phantom, distance=..N+2] if score @s(=фантом) ste_cos.id = #orbit_id
#           run tp @s(=фантом) ~ ~ ~(=позиция контекста=маркер+N вперёд)"
#
#   positioned ^ ^ ^N использует маркерный поворот и даёт точку орбиты.
#   tp @s ~ ~ ~ телепортирует фантома в эту точку.
#   Маркер поворачивается на 3°/тик → полный круг за ~120 тиков.

scoreboard players operation #orbit_id ste_cos.flags = @s ste_cos.id

# Проверяем radius У МАРКЕРА (@s=маркер) ДО переключения as @e
execute if score @s ste_cos.radius matches 4 rotated as @s positioned ^ ^ ^4 as @e[type=phantom,tag=ste_cos_guard,distance=..12] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ~ ~ ~
execute if score @s ste_cos.radius matches 5 rotated as @s positioned ^ ^ ^5 as @e[type=phantom,tag=ste_cos_guard,distance=..13] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ~ ~ ~
execute if score @s ste_cos.radius matches 6 rotated as @s positioned ^ ^ ^6 as @e[type=phantom,tag=ste_cos_guard,distance=..14] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ~ ~ ~
execute if score @s ste_cos.radius matches 7 rotated as @s positioned ^ ^ ^7 as @e[type=phantom,tag=ste_cos_guard,distance=..15] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ~ ~ ~
execute if score @s ste_cos.radius matches 8 rotated as @s positioned ^ ^ ^8 as @e[type=phantom,tag=ste_cos_guard,distance=..16] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ~ ~ ~

# Поворачиваем маркер на 3°/тик
tp @s ~ ~ ~ ~3 ~