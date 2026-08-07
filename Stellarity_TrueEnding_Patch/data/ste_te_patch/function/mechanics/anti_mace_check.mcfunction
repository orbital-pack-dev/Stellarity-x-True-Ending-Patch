# =====================================================================
# ste_te_patch:mechanics/anti_mace_check
# Контекст: AS ender_dragon AT дракона, in the_end.
# =====================================================================

# Проверяем булаву в руке у ближайшего игрока (1.21: if items entity)
# Этот файл выполняется AS дракона (enderm.dragon) AT дракона.
execute as @a[distance=..20] if items entity @s weapon.mainhand minecraft:mace run tag @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,sort=nearest] add ste_te_trigger_mace

# 25% шанс RNG даже без булавы
execute store result score @s ste_te_misc run random value 1..4
execute if score @s ste_te_misc matches 1 run tag @s add ste_te_trigger_mace

# Активация (не в кулдауне)
execute if entity @s[tag=ste_te_trigger_mace,tag=!ste_te_mace_cooldown] run function ste_te_patch:mechanics/anti_mace_blast
