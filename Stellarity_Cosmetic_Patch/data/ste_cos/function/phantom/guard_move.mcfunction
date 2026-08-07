# =====================================================================
# ste_cos:phantom/guard_move
# AS marker AT маркера. Кристалл-хозяин жив. Двигаем/агрим фантома.
#
#   - Игрок в радиусе 20 (не spectator/creative) → NoAI:0b (сам атакует).
#   - Нет игрока → NoAI:1b и по орбите радиус 4 вокруг маркера.
# =====================================================================

# Игрок рядом → включаем AI фантому
execute if entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run \
  data modify entity @e[type=phantom,tag=ste_cos_guard,distance=..8,limit=1] NoAI set value 0b

# Игрока нет → фантом мирно кружит (AI выключен)
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run \
  data modify entity @e[type=phantom,tag=ste_cos_guard,distance=..8,limit=1] NoAI set value 1b

# Если AI выключен (нет игрока) — крутим по орбите
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run function ste_cos:phantom/orbit_guard
