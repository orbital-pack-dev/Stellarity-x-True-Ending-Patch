# =====================================================================
# ste_cos:egg/egg_tick
# Фича C. Помогает найти Яйцо-Дракона.
#
# Маркер ste_cos_egg_scanner буквально "топает" по кубу вокруг центра:
#   поднимается вверх по столбцу, затем переходит на следующий (X), затем
#   на следующий ряд (Z). Каждый шаг проверяет, не стоит ли в его позиции
#   блок dragon_egg — если да, ставит маркер-указатель над яйцом.
#
# Маркер двигается относительными tp (надёжно, без score-подстановки в tp).
# Счётчики (управление шагом) — в scoreboard ste_cos.egg.
#
# Вызывается каждый тик из main_tick.
# =====================================================================

# --- если сканера нет — создать на старте (X=-6, Z=-6, Y=58) ---
execute in minecraft:the_end unless entity @e[type=marker,tag=ste_cos_egg_scanner] run summon marker -6 58 -6 {Tags:["ste_cos_egg_scanner"]}

# --- обрабатываем текущую клетку (маркер в позиции сканирования) ---
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_scanner] at @s run function ste_cos:egg/egg_check_cell

# --- продвигаем сканер (вызываем на маркере) ---
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_scanner] at @s run function ste_cos:egg/egg_step

# --- визуал вокруг найденного яйца ---
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_marker] at @s run function ste_cos:egg/egg_marker_fx
