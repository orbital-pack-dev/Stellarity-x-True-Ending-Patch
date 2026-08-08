# =====================================================================
# ste_cos:egg/egg_next_x
# AS сканер. Переход на следующий столбец X (+1) в текущем ряду.
# Ряд (Z) фиксирован. При достижении края по X (xpx 12 → 13):
#   возвращаемся на X=-6 (tp -13) и сдвигаемся на следующий ряд Z+1.
# Когда и Z исчерпан (zpx 12 → 13) — Z=-6, повторный цикл (маркер вернётся
# в старт: сканер продолжит крутиться, яйцо мониторится постоянно).
# =====================================================================

# X+1
scoreboard players add $xpx ste_cos.egg 1
execute at @s run tp @s ~1 ~ ~

# Край по X → вернуться к X=-6 и перейти на следующий ряд Z
execute if score $xpx ste_cos.egg matches 13.. run tp @s ~-13 ~ ~
execute if score $xpx ste_cos.egg matches 13.. run scoreboard players set $xpx ste_cos.egg 0
execute if score $xpx ste_cos.egg matches 0 run scoreboard players add $zpx ste_cos.egg 1
execute if score $xpx ste_cos.egg matches 0 run function ste_cos:egg/egg_advance_z
