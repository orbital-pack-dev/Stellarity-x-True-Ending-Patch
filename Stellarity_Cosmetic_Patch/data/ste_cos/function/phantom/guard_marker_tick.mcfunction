# =====================================================================
# ste_cos:phantom/guard_marker_tick
# AS marker (ste_cos_guard_marker) AT маркера. Обработка одного стража.
#
# 1) Если кристалл-хозяин умер (нет end_crystal в радиусе 6) — убить.
# 2) Найти привязанного фантома (nearest ste_cos_guard в 6 блоках).
# 3) Если в радиусе 20 есть живой игрок (не spectator/creative):
#       фантому NoAI:0b (сам агрится на игрока).
#    Иначе:
#       фантому NoAI:1b и кружим его по орбите радиуса 4 вокруг маркера.
# =====================================================================

# -- 1. Если кристалл-хозяин исчез — убираем стража и маркер --
execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_guard

# -- 2. Если ещё живы — двигаем/обрабатываем фантома --
execute if entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/guard_move
