# =====================================================================
# ste_cos:phantom/orbit_guard
# AS marker AT маркера. Кружим СВОЕГО фантома по орбите радиус 7.
# =====================================================================

# Сохраняем ID маркера
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Поворот маркера (~2°/тик - медленнее)
tp @s ~ ~ ~ ~2 ~

# Фантом на орбиту (горизонталь, высота на 1.5 блока выше кристалла, радиус 7)
execute at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7

# Зафиксировать взгляд фантома (чтобы смотрел на кристалл)
execute at @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run tp @s ~ ~ ~ facing ^ ^ ^-1


