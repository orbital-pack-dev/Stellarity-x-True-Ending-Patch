# =====================================================================
# ste_cos:mechanics/tick
# Главный тикер всех боевых механик. Вызывается из main_tick
# ТОЛЬКО внутри измерения the_end (execute in minecraft:the_end run ...).
# =====================================================================

# Мех.1 — Вихрь (stillness check - только в Энде, только во время битвы, радиус 400 от Дракона)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s as @a[distance=..400,gamemode=survival] run function ste_cos:mechanics/still_check
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s as @a[distance=..400,gamemode=adventure] run function ste_cos:mechanics/still_check

# Мех.1 — Удаляем активный вихрь (теперь это area_effect_cloud), если бой закончился
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_vortex]

# Мех.1 — Выполняем тик вихря (вместо маркера используется area_effect_cloud)
execute if entity @e[type=area_effect_cloud,tag=ste_cos_vortex,limit=1] as @e[type=area_effect_cloud,tag=ste_cos_vortex] at @s run function ste_cos:mechanics/vortex_tick

# Мех.2 — Отключение Элитры во время боя
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/elytra_disable

# Мех.3 — Баланс Булавы (Простая выдача слабости во время боя)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run effect give @a[distance=..400] weakness 2 0 true

# Мех.4 — Опасная зона портала (спавн драконьего дыхания у портала пока дракон далеко)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/portal_danger

# Мех.4 — Если есть волна от портала -> тикаем
execute as @e[type=area_effect_cloud,tag=ste_cos_portal_wave] at @s run function ste_cos:mechanics/portal_wave_tick

# Мех.4 — Очистка волн если дракон мёртв
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run scoreboard players set #wave_timer ste_cos.flags 0
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_portal_wave]
