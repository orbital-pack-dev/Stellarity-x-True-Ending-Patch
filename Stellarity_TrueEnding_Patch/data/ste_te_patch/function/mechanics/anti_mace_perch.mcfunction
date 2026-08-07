# =====================================================================
# ste_te_patch:mechanics/anti_mace_perch
# Мини-кольцо против булавы при посадке дракона на портал.
# Вызывается из main_tick на тике 25.
# =====================================================================

# Проверяем: дракон сидит на портале (под ним bedrock)
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] at @s if block ~ ~-1 ~ bedrock run function ste_te_patch:mechanics/anti_mace_check

# Убираем флаги при вылете с портала
execute as @e[type=ender_dragon,tag=ste_te_trigger_mace] at @s unless block ~ ~-1 ~ bedrock run tag @s remove ste_te_trigger_mace
execute as @e[type=ender_dragon,tag=ste_te_mace_cooldown] at @s unless block ~ ~-1 ~ bedrock run tag @s remove ste_te_mace_cooldown
