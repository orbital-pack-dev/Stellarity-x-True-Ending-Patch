# =====================================================================
# BRIDGE 1: entity_sync.mcfunction
# Синхронизация идентификации сущности Дракона между пакаами.
#
# ЛОГИКА:
#   - True Ending проверяет у Дракона: tag=!trueEnding_mirrordragon
#     и tag=!trueEnding_dragon_noAI (см. tick.mcfunction TE).
#     Дракон вводится в TE-логику через инициализацию в boss/init/init,
#     которая добавляет тег trueEnding_dragon_particlechecked.
#
#   - Stellarity проверяет у Дракона: tag=stellarity.ender_dragon
#     (см. entity/main.mcfunction Stellarity, строка 10).
#
# МОСТ: Если Дракон от Stellarity ещё не инициализирован в True Ending
#   (нет тега trueEnding_dragon_particlechecked), то True Ending запустит
#   boss/init/init сам при следующем тике. Но для гарантии — если Дракон
#   stellarity.ender_dragon уже есть но НЕТ mirrordragon и dragon_noAI, 
#   он уже будет виден TE без дополнительных тегов.
#
#   Дополнительно: если TE создал зеркального дракона (trueEnding_mirrordragon),
#   убедимся, что он НЕ получает stellarity.ender_dragon,
#   иначе Stellarity тоже будет его обрабатывать.
# =====================================================================

# Главный дракон: убедиться, что у него нет тегов, мешающих TE
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=!trueEnding_mirrordragon] run tag @s remove trueEnding_dragon_noAI

# Зеркальный дракон (только для атаки Dive в TE): должен быть НЕВИДИМ для Stellarity
# Убираем тег stellarity.ender_dragon у зеркального дракона, если он туда попал
execute as @e[type=ender_dragon,tag=trueEnding_mirrordragon] run tag @s remove stellarity.ender_dragon
