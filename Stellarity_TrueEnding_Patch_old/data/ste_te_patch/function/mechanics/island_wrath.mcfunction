# =====================================================================
# ste_te_patch:mechanics/island_wrath
# =====================================================================

execute run scoreboard players add @s ste_te_m3 5
execute if score @s ste_te_m3 matches 400.. run scoreboard players set @s ste_te_m3 0

# Проверка: HP < 50%
execute store result score @s temp_health run data get entity @s Health 1
execute if score @s temp_health matches ..512 if score @s ste_te_m3 matches 0 run function ste_te_patch:mechanics/island_wrath_fire
