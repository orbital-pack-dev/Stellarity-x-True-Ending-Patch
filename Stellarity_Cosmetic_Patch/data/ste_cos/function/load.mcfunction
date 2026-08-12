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
