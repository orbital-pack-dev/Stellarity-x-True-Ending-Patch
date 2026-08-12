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

# Радиус орбиты фантома-стража (на маркере)
scoreboard objectives add ste_cos.radius dummy "STE-COS Orbit Radius"

# Таймер визуала щита дракона
scoreboard objectives add ste_cos.heal_timer dummy "STE-COS Shield Timer"

# Здоровье для неуязвимости дракона
scoreboard objectives add ste_cos.health dummy "STE-COS Health"
scoreboard objectives add ste_cos.max_health dummy "STE-COS Max Health"

# Стадия поиска яйца-дракона (0=tier1, 1=tier2 scheduled)
scoreboard objectives add ste_cos.search_stage dummy "STE-COS Search Stage"

# Счётчик ID стражей
scoreboard players set #guard_id ste_cos.flags 0

# Флаги очистки кристаллов при заходе в Энд
scoreboard players set #crystal_cleaned ste_cos.flags 0
scoreboard players set #markers_ready ste_cos.flags 0
scoreboard players set #phantoms_spawned ste_cos.flags 0

# Инициализируем трекер яйца: search_stage ставим через маркер если он уже есть
# (при перезагрузке он сохраняется — принудительно сбрасываем stage)
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker] run scoreboard players set @s ste_cos.search_stage 0
