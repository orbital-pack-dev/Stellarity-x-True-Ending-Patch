# =====================================================================
# ste_cos:egg/egg_tick
# Фича C. Подсветка Яйца-Дракона (только когда яйцо реально существует).
#
# Логика (по схеме):
#   - маркер egg_tracker стоит на яйце (спавнится на 0 66 0).
#   - каждый тик: если в позиции маркера/вокруг есть блок dragon_egg —
#     держим маркер там и пускаем частицы ВОКРУГ яйца.
#   - если яйца в текущем месте нет (игрок кликнул — оно телепортнулось) —
#     ищем новый блок яйца в радиусе X±15 / Y±7 вокруг 0 66 0 и
#     перепривязываем маркер на найденное.
#   - если яйца вообще нет (дракон ещё не побеждён) — частиц нет.
# =====================================================================

# Создаём маркер на алтаре, если его нет
execute in minecraft:the_end unless entity @e[type=marker,tag=ste_cos_egg_tracker] run summon marker 0 66 0 {Tags:["ste_cos_egg_tracker"]}

# --- 1. Если яйцо прямо под/в маркере — держим и светим ---
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s align xyz if block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_glow

# --- 2. Если под маркером яйца НЕТ — искать его и перепривязать ---
execute in minecraft:the_end as @e[type=marker,tag=ste_cos_egg_tracker,limit=1] at @s align xyz unless block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_find
