# =====================================================================
# ste_te_patch:mechanics/anti_mace_perch
# =====================================================================

# Проверяем: дракон сидит на портале (DragonPhase:5 = perch)
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if data entity @s {DragonPhase:5} run function ste_te_patch:mechanics/anti_mace_check

# Убираем флаги при вылете с портала
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=ste_te_trigger_mace] at @s unless data entity @s {DragonPhase:5} run tag @s remove ste_te_trigger_mace
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=ste_te_mace_cooldown] at @s unless data entity @s {DragonPhase:5} run tag @s remove ste_te_mace_cooldown
