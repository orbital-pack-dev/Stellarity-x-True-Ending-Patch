# =====================================================================
# ste_cos:phantom/orbit_guard
# AS маркер AT маркера. Кружим СВОЕГО фантома по орбите радиус R.
#
# Метод: берём поворот маркера (rotated as @s), ищем фантома-страж рядом
# с тем же id, телепортируем его в ^ ^ ^R (позиция маркера + R вперёд
# по взгляду маркера = орбита). Поворачиваем маркер на ~3°/тик.
# =====================================================================

# Сохраняем id маркера
scoreboard players operation #orbit_id ste_cos.flags = @s ste_cos.id

# РАДИУС 4..8 — ставим фантома на орбиту (все подряд, сработает только нужный radius)
execute rotated as @s if score @s ste_cos.radius matches 4 as @e[type=phantom,tag=ste_cos_guard,distance=..10] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^4
execute rotated as @s if score @s ste_cos.radius matches 5 as @e[type=phantom,tag=ste_cos_guard,distance=..10] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^5
execute rotated as @s if score @s ste_cos.radius matches 6 as @e[type=phantom,tag=ste_cos_guard,distance=..10] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^6
execute rotated as @s if score @s ste_cos.radius matches 7 as @e[type=phantom,tag=ste_cos_guard,distance=..10] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^7
execute rotated as @s if score @s ste_cos.radius matches 8 as @e[type=phantom,tag=ste_cos_guard,distance=..10] if score @s ste_cos.id = #orbit_id ste_cos.flags run tp @s ^ ^ ^8

# Поворачиваем маркер (для следующего тика) — этим вращается орбита
tp @s ~ ~ ~ ~3 ~
