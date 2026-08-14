# =====================================================================
# ste_cos:mechanics/vortex_tick
# AS vortex marker AT его позиции. Активный вихрь (80 тиков = 4 сек).
# Засасывает игроков, наносит wither + 1.5 сердца урона.
# =====================================================================

# Декремент таймера
scoreboard players remove @s ste_cos.timer 1

# Уничтожаем маркер когда таймер истёк
execute if score @s ste_cos.timer matches ..0 run kill @s

# Визуал — спираль из dragon_breath
particle minecraft:dragon_breath ~ ~0.5 ~ 4 0.1 4 0.15 30 force @a[distance=..64]
particle minecraft:dragon_breath ~ ~2.0 ~ 2.5 0.1 2.5 0.05 20 force @a[distance=..64]
particle minecraft:dragon_breath ~ ~3.5 ~ 1.0 0.1 1.0 0.02 10 force @a[distance=..64]
particle minecraft:enchanted_hit ~ ~1 ~ 3 3 3 0.1 15 force @a[distance=..64]
particle minecraft:end_rod ~ ~1 ~ 3 3 3 0.05 10 force @a[distance=..64]

# =====================================================================
# Засасываем игроков (Адаптировано под маркер ste_cos_vortex)
# =====================================================================

# 1. Разворачиваем камеру игрока спиной назад для дезориентации
execute as @a[distance=..8,gamemode=!spectator,gamemode=!creative] at @s facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~

# 2. Притягиваем игрока, заставляя его пятиться назад (-0.6) строго к ближайшему маркеру вихря
execute as @a[distance=..8,gamemode=!spectator,gamemode=!creative] at @s facing entity @e[type=marker,tag=ste_cos_vortex,limit=1,sort=nearest] eyes run tp @s ^-0.6 ^0 ^0


# Урон и эффекты для игроков в радиусе 5 блоков
execute as @a[distance=..5,gamemode=!spectator,gamemode=!creative] run damage @s 3 minecraft:magic
execute as @a[distance=..5,gamemode=!spectator,gamemode=!creative] run effect give @s minecraft:wither 2 1 true
