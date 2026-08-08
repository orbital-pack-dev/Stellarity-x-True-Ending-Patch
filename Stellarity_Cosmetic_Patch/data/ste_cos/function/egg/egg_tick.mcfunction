# =====================================================================
# ste_cos:egg/egg_tick
# Фича C. Подсветка Яйца-Дракона.
#
# Просто и надёжно: на центральном портале (где появляется яйцо после
# победы) держим маркер с заметными частицами. Играющий всегда видит,
# где искать яйцо. Никакого сканирования и ходячих маркеров.
# =====================================================================

# Создаём маркер на месте портала, если его нет
execute in minecraft:the_end unless entity @e[type=marker,tag=ste_cos_egg_marker] run summon marker 0 69 0 {Tags:["ste_cos_egg_marker"]}

# Частицы вокруг маркера (световой столб, хорошо видно)
execute in minecraft:the_end at @e[type=marker,tag=ste_cos_egg_marker,limit=1] run particle end_rod ~ ~0.5 ~ 0.5 1 0.5 0 20 force
execute in minecraft:the_end at @e[type=marker,tag=ste_cos_egg_marker,limit=1] run particle portal ~ ~1 ~ 0.2 2 0.2 0.02 20 force
