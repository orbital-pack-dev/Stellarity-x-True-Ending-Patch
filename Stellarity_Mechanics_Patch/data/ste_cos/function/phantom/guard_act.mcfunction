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

# Спавним частицы-хвост и ареа-эффект (урон) для фантома в любом состоянии
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle soul_fire_flame ~ ~0.5 ~ 0.2 0.2 0.2 0.01 5 force
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle dragon_breath ~ ~0.5 ~ 1.5 1.5 1.5 0.01 10 force

# Прямой урон и иссушение игрокам в радиусе 4 блоков
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run damage @s 2 minecraft:magic
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run effect give @a[distance=..4,gamemode=!spectator,gamemode=!creative] minecraft:wither 5 1 true
