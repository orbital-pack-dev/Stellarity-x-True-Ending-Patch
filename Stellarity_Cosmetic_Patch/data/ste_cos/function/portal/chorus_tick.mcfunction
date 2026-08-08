# =====================================================================
# ste_cos:portal/chorus_tick
# Фича A. Уборка хоруса возле портала + аккуратный дроп плодов.
#
# Два механизма:
#   1) Быстрый bulk-сброс хоруса раз в 30 сек через fill replace
#      (снимает нагрузку на мир). Запускается таймером из main_tick.
#   2) Аккуратный дроп: маркер ste_cos_chorus_scanner "топает" по сетке
#      X/Z (шаг 2, 0..20 в 4 стороны) и у каждой клетки проходит по Y 50..75;
#      найдя chorus_plant/chorus_flower — дропает chorus_fruit и убирает блок
#      Точечно (не трогает обсидиан/структуры).
#
# Вызывается каждый тик из main_tick.
# =====================================================================

# --- если сканера нет — создать на старте (X=-20, Z=-20) ---
execute in minecraft:the_end unless entity @e[type=marker,tag=ste_cos_chorus_scanner] run summon marker -20 50 -20 {Tags:["ste_cos_chorus_scanner"]}

# --- обрабатываем текущий столбец (XZ) -> пройти Y с дропом ---
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_chorus_scanner] at @s run function ste_cos:portal/chorus_col

# --- маркер переходит на следующий столбец (X, затем Z) ---
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_chorus_scanner] at @s run function ste_cos:portal/chorus_step
