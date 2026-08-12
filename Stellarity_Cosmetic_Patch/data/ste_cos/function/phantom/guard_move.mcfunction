# ste_cos:phantom/guard_move
# AS marker AT маркера. Управляет фантомом-стражем.
#
# Инвариант: у каждого маркера ровно 1 фантом с тем же ste_cos.id.
# Cleanup: если кристалл уничтожен - убиваем маркер и фантом.
# Движение: если кристалл жив - крутим фантома по орбите.

scoreboard players operation #gm_id ste_cos.flags = @s ste_cos.id

# Инвариант: убиваем лишние дубли (sort=furthest оставляет ближайшего)
execute as @e[type=phantom,tag=ste_cos_guard,distance=..200,sort=furthest] if score @s ste_cos.id = #gm_id ste_cos.flags run scoreboard players add #gm_dupe ste_cos.flags 1
execute if score #gm_dupe ste_cos.flags matches 2.. as @e[type=phantom,tag=ste_cos_guard,distance=..200,sort=furthest] if score @s ste_cos.id = #gm_id ste_cos.flags run kill @s
scoreboard players reset #gm_dupe ste_cos.flags

# Cleanup: нет кристалла - убираем всё
execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_current

# Движение: кристалл жив
execute if entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/guard_act