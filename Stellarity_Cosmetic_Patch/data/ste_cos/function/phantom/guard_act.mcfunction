# =====================================================================
# ste_cos:phantom/guard_act
# AS marker AT маркера. Кристалл жив. Управление СВОИМ фантомом (радиус 6).
#   - Игрок в радиусе 20 → NoAI:0b (фантом сам атакует игрока).
#   - Нет игрока → NoAI:1b + орбита радиус 4 вокруг маркера.
# =====================================================================

# Игрок рядом → AI включаем
execute if entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run data modify entity @e[type=phantom,tag=ste_cos_guard,distance=..32,limit=1,sort=nearest] NoAI set value 0b

# Игрока нет → AI выкл + орбита
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run data modify entity @e[type=phantom,tag=ste_cos_guard,distance=..32,limit=1,sort=nearest] NoAI set value 1b
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run function ste_cos:phantom/orbit_guard
