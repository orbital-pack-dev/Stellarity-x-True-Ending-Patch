# =====================================================================
# ste_cos:phantom/guard_tick
# Пункт 2. Фантомы-стражи вокруг живых кристаллов края.
#
# Логика:
#   - Для каждого живого кристалла (ShowBottom:1b) если рядом нет
#     маркера-стража (ste_cos_guard_marker) — спавним фантома в 4 блоках
#     и привязываем его через маркер (armor_stand-стиль, но marker компактнее).
#   - Каждый тик: пока нет игрока в радиусе 20 блоков от фантома —
#     держим фантому NoAI:1b и двигаем её по орбите вокруг маркера.
#   - Если игрок в радиусе 20 — включаем AI (NoAI:0b), фантом сам атакует.
#   - Когда кристалл умер — маркер и фантом убиваются.
#
# Вызывается каждый тик из main_tick (контекст уже in the_end).
# =====================================================================

# ---- 1. Спавн маркеров-стражей у живых кристаллов без стража ----
execute as @e[type=end_crystal,distance=..200,nbt={ShowBottom:1b}] at @s unless entity @e[type=marker,tag=ste_cos_guard_marker,distance=..6,limit=1] run function ste_cos:phantom/spawn_guard

# ---- 2. Орбита / агро для существующих стражей ----
execute as @e[type=marker,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_marker_tick
