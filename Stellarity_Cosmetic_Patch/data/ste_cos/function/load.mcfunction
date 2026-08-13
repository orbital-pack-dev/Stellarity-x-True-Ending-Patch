# =====================================================================
# ste_cos:load
# Косметический Патч совместимости — инициализация.
# =====================================================================

# П.1 — поднимаем лимит блоков, чтобы fill-очистка хоруса работала
gamerule max_block_modifications 1999999999

# Объектив-счётчик
scoreboard objectives add ste_cos.flags dummy "STE-COS Flags"

# Таймер уборки хоруса (~30 сек)
scoreboard players set $pull_timer ste_cos.flags 0

# ID для привязки маркеров к фантомам
scoreboard objectives add ste_cos.id dummy "STE-COS IDs"

# Здоровье для неуязвимости дракона
scoreboard objectives add ste_cos.health dummy "STE-COS Health"
scoreboard objectives add ste_cos.max_health dummy "STE-COS Max Health"

# Стадия поиска яйца-дракона (0=tier1, 1=tier2 scheduled)
scoreboard objectives add ste_cos.search_stage dummy "STE-COS Search Stage"

# Радиус орбиты фантома-стража (хранится на маркере, 4..8)
scoreboard objectives add ste_cos.radius dummy "STE-COS Orbit Radius"

# Высота орбиты фантома (x10 от блока, хранится на маркере: 5=0.5, 10=1.0, 15=1.5, 25=2.5, 35=3.5)
scoreboard objectives add ste_cos.orbit_y dummy "STE-COS Orbit Y"

# RNG-тикер для рандомайзера (глобальный счётчик)
scoreboard players set #rng_ticker ste_cos.flags 0scoreboard objectives add ste_cos.timer dummy "STE-COS Timer"
kill @e[type=interaction,tag=ste_cos_crystal_shield]
