# =====================================================================
# ste_cos:phantom/orbit_guard
# AS marker AT маркера. Кружим СВОЕГО фантома по орбите радиус 4.
#   - поворачиваем маркер (Yaw +4°)
#   - ставим фантома в ^ ^ ^4 (горизонталь, высота та же — не падает)
# Радиус поиска маленький (6): работаем только со своим фантомом.
# =====================================================================

# Сохраняем ID маркера
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Поворот маркера (~4°/тик)
tp @s ~ ~ ~ ~4 ~

# Фантом на орбиту (горизонталь, высота маркера сохраняется)
execute at @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^4

# Зафиксировать взгляд фантома к несчастию (смотрит на кристалл)
execute at @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ~ ~ ~ ~ ~
