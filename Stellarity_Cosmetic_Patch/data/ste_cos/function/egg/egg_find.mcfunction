# ste_cos:egg/egg_find
# Вызывается если маркер не стоит на яйце.
# Запускает tier1 (локальный поиск вокруг маркера, до 10 блоков).
# Если tier1 ничего не нашёл - запускает tier2 (глобальный по всему острову).
# Tier2 уже использует абсолютные координаты с "in minecraft:the_end", 
# поэтому её нужно запускать только если tier1 не сработал.

# Если уже идёт tier2 (search_stage=1) - не запускаем tier1, ждём
execute if score @s ste_cos.search_stage matches 1 run return 0

# Запускаем быстрый локальный поиск tier1
function ste_cos:egg/egg_find_tier1

# Если tier1 нашёл яйцо - маркер переместился, search_stage сбросится в egg_glow
# Если tier1 НЕ нашёл (маркер всё ещё не на яйце) - запускаем глобальный tier2
execute unless block ~ ~ ~ minecraft:dragon_egg run scoreboard players set @s ste_cos.search_stage 1
execute if score @s ste_cos.search_stage matches 1 run schedule function ste_cos:egg/egg_find_tier2_page000 1t replace
