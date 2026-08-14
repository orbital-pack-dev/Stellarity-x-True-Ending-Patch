# =====================================================================
# ste_cos:mechanics/tick
# Главный тикер всех боевых механик. Вызывается из main_tick
# ТОЛЬКО внутри измерения the_end (execute in minecraft:the_end run ...).
# =====================================================================

# Мех.1 — Вихрь (stillness check)
execute as @a[gamemode=survival] run function ste_cos:mechanics/still_check
execute as @a[gamemode=adventure] run function ste_cos:mechanics/still_check

# Мех.1 — Тик активных вихрей
execute if entity @e[type=marker,tag=ste_cos_vortex,limit=1] as @e[type=marker,tag=ste_cos_vortex] at @s run function ste_cos:mechanics/vortex_tick

# Мех.2 — Отключение Элитры во время боя
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/elytra_disable

# Мех.3 — Баланс Булавы
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/mace_balance

# Мех.4 — Опасная зона портала (спавн драконьего дыхания у портала пока дракон далеко)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/portal_danger

# Мех.4 — Очистка зоны портала если дракон мёртв
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_portal_danger]
