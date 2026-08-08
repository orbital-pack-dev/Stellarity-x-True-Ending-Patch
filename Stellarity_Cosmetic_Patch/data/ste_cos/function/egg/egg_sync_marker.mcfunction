# =====================================================================
# ste_cos:egg/egg_sync_marker
# AS scaner AT scaner. Яйцо найдено в клетке сканера.
# Маркер-указатель размещается на 1 блок выше яйца.
# =====================================================================

# Создаём маркер-указатель, если его нет, поверх яйца (scanner = яйцо, +1)
execute unless entity @e[type=marker,tag=ste_cos_egg_marker] run summon marker ~ ~1 ~ {Tags:["ste_cos_egg_marker"]}

# Переносим существующий маркер-указатель на позицию сканера (+1 вверх)
execute at @s run tp @e[type=marker,tag=ste_cos_egg_marker,limit=1] ~ ~ ~
