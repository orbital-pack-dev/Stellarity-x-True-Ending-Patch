# =====================================================================
# ste_cos:phantom/guard_act
# AS marker AT маркера. Кристалл жив. Управление фантомом-стражем.
#
#   - Игрок в радиусе 20 → NoAI:0b (фантом сам атакует игрока).
#   - Нет игрока        → NoAI:1b и кружит по орбите радиус 4.
# =====================================================================

# Игрок рядом → включаем AI
execute if entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run \
  data modify entity @e[type=phantom,tag=ste_cos_guard,distance=..40,limit=1] NoAI set value 0b

# Игрока нет → AI выключен + орбита
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run \
  data modify entity @e[type=phantom,tag=ste_cos_guard,distance=..40,limit=1] NoAI set value 1b
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run function ste_cos:phantom/orbit_guard
