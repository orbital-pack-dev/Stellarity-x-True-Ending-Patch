# =====================================================================
# ste_te_patch:mechanics/meteor_rain
# =====================================================================

execute run scoreboard players add @s ste_te_m1 5
execute if score @s ste_te_m1 matches 600.. run scoreboard players set @s ste_te_m1 0

# Проверка: HP < 20%
execute store result score @s temp_health run data get entity @s Health 1
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 run function ste_te_patch:mechanics/meteor_rain_trigger
