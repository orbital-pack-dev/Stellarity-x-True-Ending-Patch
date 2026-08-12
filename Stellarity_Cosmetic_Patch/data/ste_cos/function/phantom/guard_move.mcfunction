# =====================================================================
# ste_cos:phantom/guard_move
# AS marker AT маркера. Обработка одного стража.
#   Кристалл-хозяин умер → убрать стража.
#   Кристалл жив → агро/орбита (ищет ТОЛЬКО СВОЕГО фантома: радиус 6).
# =====================================================================

# Кристалл-хозяин умер → убрать фантома и маркер
execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_current

# Кристалл жив → управление фантомом
execute if entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/guard_act
