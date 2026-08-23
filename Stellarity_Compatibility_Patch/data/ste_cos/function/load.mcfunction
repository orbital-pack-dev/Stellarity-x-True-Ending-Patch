# =====================================================================
# ste_cos:load
# Compatibility & Cosmetic Patch — initialization.
# =====================================================================

# TODO: Implement settings system (ste_settings) and safe island regeneration before release!
# function ste_settings:init

# П.1 — raise block modification limit for chorus cleaner
gamerule max_block_modifications 1999999999

# Объектив-счётчик
scoreboard objectives add ste_cos.flags dummy '{"text":"STE-COS Flags"}'

# Таймер уборки хоруса (~30 сек)
scoreboard players set $pull_timer ste_cos.flags 0

# Таймер фикса дефолтного портала (выполнится 1 раз за мир)
execute unless score #portal_fix_done ste_cos.flags matches 1 run scoreboard players set #portal_fix_done ste_cos.flags 0
execute unless score #portal_fix ste_cos.timer matches 1.. run scoreboard players set #portal_fix ste_cos.timer 0

# ID для привязки маркеров к фантомам
scoreboard objectives add ste_cos.id dummy '{"text":"STE-COS IDs"}'

scoreboard objectives add ste_cos.timer dummy '{"text":"STE-COS Timer"}'


# Стадия поиска яйца-дракона (0=tier1, 1=tier2 scheduled)
scoreboard objectives add ste_cos.search_stage dummy '{"text":"STE-COS Search Stage"}'

# Радиус орбиты фантома-стража (хранится на маркере, 4..8)
scoreboard objectives add ste_cos.radius dummy '{"text":"STE-COS Orbit Radius"}'

# Высота орбиты фантома (x10 от блока, хранится на маркере: 5=0.5, 10=1.0, 15=1.5, 25=2.5, 35=3.5)
scoreboard objectives add ste_cos.orbit_y dummy '{"text":"STE-COS Orbit Y"}'

# RNG-тикер для рандомайзера (глобальный счётчик)
scoreboard players set #rng_ticker ste_cos.flags 0 

# Форслоад центрального острова Энда (для предотвращения выгрузки кристаллов и сброса боя)
execute unless score #forceloaded ste_cos.flags matches 1.. run execute in minecraft:the_end run forceload add -112 -112 112 112
execute unless score #forceloaded ste_cos.flags matches 1.. run scoreboard players set #forceloaded ste_cos.flags 1
