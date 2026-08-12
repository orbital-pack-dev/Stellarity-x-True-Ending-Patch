# =====================================================================
# ste_cos:phantom/spawn_guard
# Спавнит стража у текущего кристалла (AS end_crystal AT кристалла).
#
# Маркер привязки ставится НА позицию кристалла.
# Фантом-страж спавнится сразу на своей орбите (4 блока от маркера),
# чтобы он был всегда рядом со СВОИМ маркером (маленький радиус поиска).
# =====================================================================

# Увеличиваем общий счетчик ID
scoreboard players add #guard_id ste_cos.flags 1

# Маркер привязки в позиции кристалла
summon marker ~ ~ ~ {Tags:["ste_cos_guard_marker","ste_cos_guard_marker_new"]}
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags
tag @e[type=marker,tag=ste_cos_guard_marker_new] remove ste_cos_guard_marker_new

# Фантом-страж на орбите (4 вперёд, 3 ВВЕРХ от кристалла, чтобы не спавнился в огне)
execute positioned ~4 ~3 ~ run summon phantom ~ ~ ~ {Tags:["ste_cos_guard","ste_cos_guard_new"],NoAI:1b,Silent:1b,Health:20.0f,PersistenceRequired:1b}
execute as @e[type=phantom,tag=ste_cos_guard_new,distance=..6,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags
tag @e[type=phantom,tag=ste_cos_guard_new] remove ste_cos_guard_new
