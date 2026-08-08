# =====================================================================
# ste_cos:phantom/guard_move
# AS marker AT маркера. Обработка одного стража.
#
#   - Если кристалл-хозяин умер (нет end_crystal рядом) → убить фантома и маркер.
#   - Если кристалл жив:
#       * игрок в радиусе 20 → фантому NoAI:0b (сам атакует игрока)
#       * нет игрока        → фантому NoAI:1b и кружит по орбите радиус 4
# =====================================================================

# Кристалл-хозяин умер → убираем стража
execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_current

# Кристалл жив → обрабатываем фантома
execute if entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/guard_act
