# =====================================================================
# ste_cos:portal/chorus_step
# AS scanner AT сканера. Переход на следующий столбец (шаг 2).
#   X+2; при X>20 → X=-20 и Z+2; при Z>20 → Z=-20 (замкнутый цикл).
# =====================================================================

scoreboard players add $cxn ste_cos.flags 1
execute at @s run tp @s ~2 ~ ~

# Край по X → вернуть X=-20 и сдвинуть Z+2
execute if score $cxn ste_cos.flags matches 11.. run tp @s ~-22 ~ ~
execute if score $cxn ste_cos.flags matches 11.. run scoreboard players set $cxn ste_cos.flags 0
execute if score $cxn ste_cos.flags matches 0 run scoreboard players add $czn ste_cos.flags 1
execute if score $cxn ste_cos.flags matches 0 run function ste_cos:portal/chorus_advance_z
