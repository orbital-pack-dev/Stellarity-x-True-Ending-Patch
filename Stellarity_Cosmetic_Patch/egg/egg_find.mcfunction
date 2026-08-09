# ste_cos:egg/egg_find
# Двухуровневый поиск яйца:
#   tier1 — быстрый локальный поиск вокруг ТЕКУЩЕЙ позиции маркера (радиус <=10, один тик).
#   tier2 — широкий пейсуемый (800 блоков/тик) поиск от центра портала 0 66 0,
#           запускается только если tier1 не нашёл яйцо рядом.
# Пока search_stage=1 — идёт цепочка scheduled-страниц tier2, здесь ничего не трогаем.

execute unless score @s ste_cos.search_stage matches 1 run function ste_cos:egg/egg_find_tier1
