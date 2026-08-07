# =====================================================================
# ste_cos:phantom/spawn_guard
# Спавнит стража у текущего кристалла (AS end_crystal AT кристалла).
#
# Создаёт:
#   - marker ste_cos_guard_marker (точка привязки на кристалле)
#   - phantom ste_cos_guard с NoAI:1b, спавн в 4 блоках от кристалла
#
# Вызывается из guard_tick.
# =====================================================================

# Маркер привязки в позиции кристалла
summon marker ~ ~ ~ {Tags:["ste_cos_guard_marker"]}

# Фантом-страж в ~4 блоках (горизонтально), NoAI выключен до появления игрока
execute positioned ~4 ~ ~ run summon phantom ~ ~ ~ {Tags:["ste_cos_guard"],NoAI:1b,Silent:1b,Health:20.0f,PersistenceRequired:1b}
