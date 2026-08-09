# =====================================================================
# ste_cos:phantom/orbit_guard
# AS marker AT маркера. Кружим СВОЕГО фантома по орбите.
# =====================================================================

# Сохраняем ID маркера
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Поворот маркера (~2°/тик)
tp @s ~ ~ ~ ~2 ~

# Фантом на орбиту (используем разный радиус 4-8 через scoreboard)
execute if score @s ste_cos.radius matches 4 at @s rotated as @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^4
execute if score @s ste_cos.radius matches 5 at @s rotated as @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^5
execute if score @s ste_cos.radius matches 6 at @s rotated as @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^6
execute if score @s ste_cos.radius matches 7 at @s rotated as @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7
execute if score @s ste_cos.radius matches 8 at @s rotated as @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^8

# Зафиксировать взгляд фантома (чтобы смотрел на кристалл)
execute at @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run tp @s ~ ~ ~ facing ^ ^ ^-1
