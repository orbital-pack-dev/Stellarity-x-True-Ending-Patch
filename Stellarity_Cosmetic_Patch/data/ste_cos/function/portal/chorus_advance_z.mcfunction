# =====================================================================
# ste_cos:portal/chorus_advance_z
# AS scanner AT сканера. Переход на следующий ряд Z (+2).
# При Z>20 → вернуть Z=-20 (замкнутый цикл).
# =====================================================================

scoreboard players add $czn ste_cos.flags 1
execute at @s run tp @s ~ ~ ~2

# Край по Z → вернуть Z=-20
execute if score $czn ste_cos.flags matches 11.. run tp @s ~ ~ ~-22
execute if score $czn ste_cos.flags matches 11.. run scoreboard players set $czn ste_cos.flags 0
