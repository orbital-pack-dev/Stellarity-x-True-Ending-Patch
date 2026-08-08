# =====================================================================
# ste_cos:phantom/guard_act
# AS marker AT маркера. Кристалл жив. Управление СВОИМ фантомом (радиус 6).
#   - Игрок в радиусе 20 → NoAI:0b (фантом сам атакует игрока).
#   - Нет игрока → NoAI:1b + орбита радиус 4 вокруг маркера.
# =====================================================================

# Сохраняем ID текущего маркера в #current_id
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Игрок рядом → AI включаем (для СВОЕГО фантома)
execute if entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run data modify entity @s NoAI set value 0b

# Игрока нет → AI выкл + орбита
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run data modify entity @s NoAI set value 1b
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run function ste_cos:phantom/orbit_guard
