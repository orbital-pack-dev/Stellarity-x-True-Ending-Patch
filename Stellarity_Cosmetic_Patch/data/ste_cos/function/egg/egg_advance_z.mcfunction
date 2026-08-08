# =====================================================================
# ste_cos:egg/egg_advance_z
# AS сканер. Переход на следующий ряд Z (+1).
# При Z>6 (zpx 13) → возврат к Z=-6 (замкнутый цикл).
# =====================================================================

scoreboard players add $zpx ste_cos.egg 1
execute at @s run tp @s ~ ~ ~1

# Край по Z → вернуться к Z=-6
execute if score $zpx ste_cos.egg matches 13.. run tp @s ~ ~ ~-13
execute if score $zpx ste_cos.egg matches 13.. run scoreboard players set $zpx ste_cos.egg 0
