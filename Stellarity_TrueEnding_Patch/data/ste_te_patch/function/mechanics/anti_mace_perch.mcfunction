# =====================================================================
# ste_te_patch:mechanics/anti_mace_perch
# Мини-кольцо против булавы при посадке дракона на портал.
# Вызывается in minecraft:the_end из main_tick на тике 25.
# =====================================================================

# Проверяем: дракон сидит на портале (DragonPhase:5 = perch)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] at @s if data entity @s {DragonPhase:5} run function ste_te_patch:mechanics/anti_mace_check

# Убираем флаги при вылете с портала
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,tag=ste_te_trigger_mace] at @s unless data entity @s {DragonPhase:5} run tag @s remove ste_te_trigger_mace
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,tag=ste_te_mace_cooldown] at @s unless data entity @s {DragonPhase:5} run tag @s remove ste_te_mace_cooldown
