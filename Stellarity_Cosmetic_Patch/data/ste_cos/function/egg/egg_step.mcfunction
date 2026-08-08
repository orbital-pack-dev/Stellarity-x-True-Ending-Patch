# =====================================================================
# ste_cos:egg/egg_step
# AS ste_cos_egg_scanner AT сканера. Продвигает скан на 1 клетку.
#
# Алгоритм (куб X -6..6, Y 58..90, Z -6..6), длина столбца = 33 ячейки:
#   - счётчик $tall ste_cos.egg: сколько шагов уже сделано вверх (0..32)
#   - если ещё не дошли до верха ($tall < 32): y+1, $tall+1
#   - иначе: вернуться на низ столбца (y-32), $tall=0, и сдвинуть X:
#       x+1; если x>6 → x=-6 и z+1; если z>6 → z=-6 (начать сначала)
# =====================================================================

# --- двигаемся вверх ---
execute if score $tall ste_cos.egg matches ..31 run tp @s ~ ~1 ~
execute if score $tall ste_cos.egg matches ..31 run scoreboard players add $tall ste_cos.egg 1

# --- достигли верха столбца: переход на следующий столбец ---
execute unless score $tall ste_cos.egg matches ..31 run tp @s ~ ~-32 ~
execute unless score $tall ste_cos.egg matches ..31 run scoreboard players set $tall ste_cos.egg 0
execute unless score $tall ste_cos.egg matches ..31 run function ste_cos:egg/egg_next_x
