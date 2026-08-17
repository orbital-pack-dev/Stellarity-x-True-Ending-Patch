# =====================================================================
# ste_cos:mechanics/tick
# Главный тикер всех боевых механик. Вызывается из main_tick
# ТОЛЬКО внутри измерения the_end (execute in minecraft:the_end run ...).
# =====================================================================

# Мех.1 — Вихрь (stillness check - только в Энде, только во время битвы, радиус 400 от Дракона)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s as @a[distance=..400,gamemode=survival] run function ste_cos:mechanics/still_check
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s as @a[distance=..400,gamemode=adventure] run function ste_cos:mechanics/still_check

# Мех.1 — Очистка активных вихрей если дракон мёртв
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=marker,tag=ste_cos_vortex]

# Мех.1 — Тик активных вихрей
execute if entity @e[type=marker,tag=ste_cos_vortex,limit=1] as @e[type=marker,tag=ste_cos_vortex] at @s run function ste_cos:mechanics/vortex_tick

# Мех.2 — Отключение Элитры во время боя
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/elytra_disable

# Мех.3 — Баланс Булавы
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/mace_balance

# Мех.4 — Опасная зона портала (спавн драконьего дыхания у портала пока дракон далеко)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/portal_danger

# Мех.4 — Тик волн портала
execute as @e[type=marker,tag=ste_cos_portal_wave] at @s run function ste_cos:mechanics/portal_wave_tick

# Мех.4 — Очистка волн если дракон мёртв
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run scoreboard players set #wave_timer ste_cos.flags 0
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=marker,tag=ste_cos_portal_wave]
