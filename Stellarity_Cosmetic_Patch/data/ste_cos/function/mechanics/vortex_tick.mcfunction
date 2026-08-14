# =====================================================================
# ste_cos:mechanics/vortex_tick
# AS vortex marker AT его позиции. Активный вихрь (80 тиков = 4 сек).
# Засасывает игроков, наносит wither + 1.5 сердца урона.
# Использует кастомные кадры анимации вихря.
# =====================================================================

# Вызываем кадры анимации вихря (раз в 4 тика)
execute if score @s ste_cos.timer matches 0 run function ste_cos:vfx/dragon_vortex/frame_0
execute if score @s ste_cos.timer matches 4 run function ste_cos:vfx/dragon_vortex/frame_4
execute if score @s ste_cos.timer matches 8 run function ste_cos:vfx/dragon_vortex/frame_8
execute if score @s ste_cos.timer matches 12 run function ste_cos:vfx/dragon_vortex/frame_12
execute if score @s ste_cos.timer matches 16 run function ste_cos:vfx/dragon_vortex/frame_16
execute if score @s ste_cos.timer matches 20 run function ste_cos:vfx/dragon_vortex/frame_20
execute if score @s ste_cos.timer matches 24 run function ste_cos:vfx/dragon_vortex/frame_24
execute if score @s ste_cos.timer matches 28 run function ste_cos:vfx/dragon_vortex/frame_28
execute if score @s ste_cos.timer matches 32 run function ste_cos:vfx/dragon_vortex/frame_32
execute if score @s ste_cos.timer matches 36 run function ste_cos:vfx/dragon_vortex/frame_36
execute if score @s ste_cos.timer matches 40 run function ste_cos:vfx/dragon_vortex/frame_40
execute if score @s ste_cos.timer matches 44 run function ste_cos:vfx/dragon_vortex/frame_44
execute if score @s ste_cos.timer matches 48 run function ste_cos:vfx/dragon_vortex/frame_48
execute if score @s ste_cos.timer matches 52 run function ste_cos:vfx/dragon_vortex/frame_52
execute if score @s ste_cos.timer matches 56 run function ste_cos:vfx/dragon_vortex/frame_56
execute if score @s ste_cos.timer matches 60 run function ste_cos:vfx/dragon_vortex/frame_60
execute if score @s ste_cos.timer matches 64 run function ste_cos:vfx/dragon_vortex/frame_64
execute if score @s ste_cos.timer matches 68 run function ste_cos:vfx/dragon_vortex/frame_68
execute if score @s ste_cos.timer matches 72 run function ste_cos:vfx/dragon_vortex/frame_72
execute if score @s ste_cos.timer matches 76 run function ste_cos:vfx/dragon_vortex/frame_76

# Инкремент таймера
scoreboard players add @s ste_cos.timer 1

# Уничтожаем маркер когда таймер достиг 80
execute if score @s ste_cos.timer matches 80.. run kill @s

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
